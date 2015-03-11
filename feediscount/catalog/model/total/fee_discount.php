<?php

class ModelTotalFeeDiscount extends Model
{
	public function getTotal(&$total_data, &$total, &$taxes)
	{
		$subtotal = 0;
		
		if ($this->config->get('fee_discount_zone_type') != "auto") {
			$type = $this->config->get('fee_discount_zone_type');
		} else {
			if (isset($this->session->data['payment_method'])) $type = "payment";
			else $type = "shipping";
		}
				
		if (isset($this->session->data[$type.'_method']['country_id']) && isset($this->session->data[$type.'_method']['zone_id']))
		{
			$country_id = $this->session->data[$type.'_method']['country_id'];
			$zone_id = $this->session->data[$type.'_method']['zone_id'];
		}

		foreach ($total_data as $item) {
			if (isset($item['code']) && ($item['code'] == 'sub_total')) $subtotal = $item['value'];
		}
		
		if ($subtotal == 0) $subtotal = $this->cart->getSubTotal();
					
		if ($this->config->get('fee_discount_status') && ($subtotal != 0)) {
		    $address = array();

			if (isset($this->session->data[$type.'_address_id']) && $this->session->data[$type.'_address_id']) {
				$this->load->model('account/address');
				$address = $this->model_account_address->getAddress($this->session->data[$type.'_address_id']);
			} else {
				$address = (isset($this->session->data['guest'])) ? $this->session->data['guest'] : array();
			}
			
			if (isset($address[$type]['country_id'])) {
				$country_id	= $address[$type]['country_id'];
				$zone_id = $address[$type]['zone_id'];
			} elseif (isset($address['country_id'])) {
				$country_id	= $address['country_id'];
				$zone_id = $address['zone_id'];
			} elseif (!isset($country_id)) {
				$country_id	= 0;
				$zone_id = 0;
			}

			$query = $this->db->query("SELECT * FROM ".DB_PREFIX."zone_to_geo_zone WHERE geo_zone_id = '".(int)$this->config->get('fee_discount_zone_id')."' AND country_id = '".(int)$country_id."' AND (zone_id = '".(int)$zone_id."' OR zone_id = '0')");
				
			if (!$this->config->get('fee_discount_zone_id')) $status = true;
      		elseif ($query->num_rows) $status = true;
      		else $status = false;
			
			if (!isset($this->session->data[$type.'_method'])) $status = false;
			
			if (!is_array($this->config->get('fee_discount_groups')) || (is_array($this->config->get('fee_discount_groups')) && !in_array($this->customer->getCustomerGroupId(), $this->config->get('fee_discount_groups')))) $status = false;

		 	if (!$status) return;
			
		 	if (!$total) $total = $this->cart->getSubTotal();

		 	$this->language->load('total/fee_discount');
		
			$this->load->model('localisation/currency');

			$query = $this->db->query("SELECT `value` FROM ".DB_PREFIX."setting WHERE `group` = 'fee_discount' AND `key` = 'fee_discount_payments'");
			
			$fees = unserialize($query->row['value']);
			
			if (is_array($fees) && isset($fees[$this->session->data[$type.'_method']['code']])) {
				$dbvalue = $fees[$this->session->data[$type.'_method']['code']];
				if (strpos($dbvalue, '%')) $fee = trim($dbvalue, '%');
				else $fee = $dbvalue;				
			} else {
				$fee = 0;
			}
			
			if ((($fee > 0) && ($subtotal < $this->config->get('fee_discount_total_fee'))) || (($fee < 0) && ($subtotal > $this->config->get('fee_discount_total_discount')))) {
				if (strpos($dbvalue, '%')) {
					$value = $total * (trim($dbvalue, '%'))/100;
					$roundby = $this->config->get('fee_discount_round');
					if ($this->config->get('fee_discount_round') > 0) $value = ceil($value/$roundby) * $roundby;
				} else {
					$value = $dbvalue;
				}
								
				if ($value > 0) $title = $this->language->get('text_payment_fee');
				else $title = $this->language->get('text_payment_discount');

				if ($this->config->get('fee_discount_title') || $this->config->get('fee_discount_value')) {
					$title .= " (";
					
					if ($this->config->get('fee_discount_title')) $title .= $this->session->data[$type.'_method']['title'];
					
					if (strpos($dbvalue, '%')) {
						if ($this->config->get('fee_discount_title') && $this->config->get('fee_discount_value')) $title .= ", ";
						if ($this->config->get('fee_discount_value')) $title .= $dbvalue;
					}
					
					$title .= ")";
				}

				$total_data[] = array(
					'code'		 => 'fee_discount',
	        		'title'      => $title,
    	    		'text'       => ($value < 0 ? "-" : "").$this->currency->format(abs($value)),
        			'value'      => $value,
					'sort_order' => $this->config->get('fee_discount_sort_order')
				);

				if ($this->config->get('fee_discount_tax_class')) {
					$tax_rates = $this->tax->getRates($value, $this->config->get('fee_discount_tax_class'));
	
					foreach ($tax_rates as $tax_rate) {
						if (!isset($taxes[$tax_rate['tax_rate_id']])) $taxes[$tax_rate['tax_rate_id']] = $tax_rate['amount'];
						else $taxes[$tax_rate['tax_rate_id']] += $tax_rate['amount'];

					}
				}

				$total += $value;
			}
		}
	}
}

?>