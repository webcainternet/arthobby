<?php

class ControllerTotalFeeDiscount extends Controller
{
	private $error = array();

	public function index()
	{
		$this->data = array_merge($this->data, $this->language->load('total/fee_discount'));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('fee_discount', $this->request->post);
			
			if ($this->request->post['apply']) {
				$this->session->data['success'] = $this->language->get('text_success');
				$this->redirect($this->url->link('total/fee_discount', 'token='.$this->session->data['token'], 'SSL'));
			} else {
				$this->redirect($this->url->link('extension/total', 'token='.$this->session->data['token'], 'SSL'));
			}			
		}
		
		if (isset($this->session->data['success'])) $this->data['success'] = $this->session->data['success'];
		else $this->data['success'] = "";
		
		$this->session->data['success'] = "";

		$this->data['heading_title'] = $this->language->get('heading_title');

        $xml = simplexml_load_file("http://thekrotek.com/updates.xml");
		$latest = $xml->feediscount->version;
		$current = $this->language->get('heading_version');

		if (version_compare($current, $latest, '>=')) {
			$version = sprintf($this->language->get('heading_latest'), $latest);
		} else {
			$version = sprintf($this->language->get('heading_update'), $this->language->get('heading_title'), $latest);
		}

		$this->data['version'] = "<span class='version".(version_compare($current, $latest, '>=') ? ' latest' : ' update')."'>".$version."</span>";
		
		$this->data['entry_payments'] = $this->language->get('entry_payments');
		$this->data['entry_payments_help'] = $this->language->get('entry_payments_help');
		$this->data['entry_settings'] = $this->language->get('entry_settings');
		$this->data['entry_groups'] = $this->language->get('entry_groups');
		$this->data['entry_total_fee'] = $this->language->get('entry_total_fee');
		$this->data['entry_total_discount'] = $this->language->get('entry_total_discount');
		$this->data['entry_round'] = $this->language->get('entry_round');
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_value'] = $this->language->get('entry_value');
		$this->data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$this->data['entry_geo_zone_type'] = $this->language->get('entry_geo_zone_type');		
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_apply'] = $this->language->get('button_apply');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),      		
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_total'),
			'href'      => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('total/fee_discount', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('total/fee_discount', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('setting/extension');

		$payments = $this->model_setting_extension->getInstalled('payment');

		if ($payments) {
			$this->data['payments'] = array();
			$items = $this->config->get('fee_discount_payments');
			
			foreach ($payments as $key => $payment) {
				$this->language->load('payment/'.$payment);
				$this->data['payments'][$key]['code'] = $payment;
				$this->data['payments'][$key]['title'] = $this->language->get('heading_title');

				if (isset($this->request->post['fee_discount_payments'][$payment])) {
					$this->data['payments'][$key]['fee'] = $this->request->post['fee_discount_payments'][$payment];
				} elseif (isset($items[$payment])) {
					$this->data['payments'][$key]['fee'] = $items[$payment];
				} else {
					$this->data['payments'][$key]['fee'] = "";
				}			
			}
		}

		if (isset($this->request->post['fee_discount_groups'])) {
			$this->data['fee_discount_groups'] = $this->request->post['fee_discount_groups'];
		} elseif ($this->config->get('fee_discount_groups')) {
			$this->data['fee_discount_groups'] = $this->config->get('fee_discount_groups');
		} else {
			$this->data['fee_discount_groups'] = array();
		}

		$this->load->model('sale/customer_group');
		
		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
		
		$this->data['geo_zone_types'] = array(
			array('type' => 'auto', 'name' => $this->language->get('text_type_auto')),
			array('type' => 'payment', 'name' => $this->language->get('text_type_payment')),
			array('type' => 'shipping', 'name' => $this->language->get('text_type_shipping')));
		
		if (isset($this->request->post['fee_discount_tax_class'])) {
			$this->data['fee_discount_tax_class'] = $this->request->post['fee_discount_tax_class'];
		} else {
			$this->data['fee_discount_tax_class'] = $this->config->get('fee_discount_tax_class');
		}
		
		$this->load->model('localisation/tax_class');
		
		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();		

		if (isset($this->request->post['fee_discount_total_fee'])) {
			$this->data['fee_discount_total_fee'] = $this->request->post['fee_discount_total_fee'];
		} else {
			$this->data['fee_discount_total_fee'] = $this->config->get('fee_discount_total_fee'); 
		} 

		if (isset($this->request->post['fee_discount_total_discount'])) {
			$this->data['fee_discount_total_discount'] = $this->request->post['fee_discount_total_discount'];
		} else {
			$this->data['fee_discount_total_discount'] = $this->config->get('fee_discount_total_discount'); 
		} 
			
		if (isset($this->request->post['fee_discount_round'])) {
			$this->data['fee_discount_round'] = $this->request->post['fee_discount_round'];
		} else {
			$this->data['fee_discount_round'] = $this->config->get('fee_discount_round'); 
		}
		
		if (isset($this->request->post['fee_discount_title'])) {
			$this->data['fee_discount_title'] = $this->request->post['fee_discount_title'];
		} else {
			$this->data['fee_discount_title'] = $this->config->get('fee_discount_title'); 
		} 	
		
		if (isset($this->request->post['fee_discount_value'])) {
			$this->data['fee_discount_value'] = $this->request->post['fee_discount_value'];
		} else {
			$this->data['fee_discount_value'] = $this->config->get('fee_discount_value'); 
		}

		if (isset($this->request->post['fee_discount_zone_type'])) {
			$this->data['fee_discount_zone_type'] = $this->request->post['fee_discount_zone_type'];
		} else {
			$this->data['fee_discount_zone_type'] = $this->config->get('fee_discount_zone_type');
		}
				
		if (isset($this->request->post['fee_discount_zone_id'])) {
			$this->data['fee_discount_zone_id'] = $this->request->post['fee_discount_zone_id'];
		} else {
			$this->data['fee_discount_zone_id'] = $this->config->get('fee_discount_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['fee_discount_status'])) {
			$this->data['fee_discount_status'] = $this->request->post['fee_discount_status'];
		} else {
			$this->data['fee_discount_status'] = $this->config->get('fee_discount_status');
		}
		
		if (isset($this->request->post['fee_discount_sort_order'])) {
			$this->data['fee_discount_sort_order'] = $this->request->post['fee_discount_sort_order'];
		} else {
			$this->data['fee_discount_sort_order'] = $this->config->get('fee_discount_sort_order');
		}

		if (!empty($this->error)) {
			$this->data['errors'] = $this->error;
		} else {
			$this->data['errors'] = '';
		}

		$this->template = 'total/fee_discount.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
        $this->response->setoutput($this->render(true));
	}

	private function validate($errors = array())
	{
		if (!$this->user->hasPermission('modify', 'total/fee_discount')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		foreach ($this->request->post['fee_discount_payments'] as $key => $payment) {
			if (strpos($payment, "%")) $payment = str_replace("%", "", $payment);
			
        	if (!empty($payment) && !is_numeric($payment)) {
        		$this->language->load('payment/'.$key);
           		$this->error[] = sprintf($this->language->get('error_bad_value'), $this->language->get('heading_title'));
           	}
        }
        
        $this->language->load('total/fee_discount');

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>