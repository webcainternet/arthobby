<?php
class ModelTotalDescontoBancoSantander extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {

		if ($this->config->get('descontobancosantander_status') && isset($this->session->data['payment_method']['code']) && $this->session->data['payment_method']['code']=='bancosantander') {
			$this->language->load('total/credit');
		 
			$total_pedido = $this->cart->getSubTotal();
			$desconto = (float)$this->config->get('descontobancosantander_desconto');
			
			if ((float)$total_pedido && $desconto>0) {
				
				$credit = ($total_pedido/100)*$desconto;
				
				if ($credit > 0) {
					$total_data[] = array(
						'code'       => 'descontobancosantander',
						'title'      => "Desconto de ".$desconto."% no Boleto",
						'text'       => $this->currency->format(-$credit),
						'value'      => -$credit,
						'sort_order' => $this->config->get('descontobancosantander_sort_order')
					);
					
					$total -= $credit;
				}
			}
		}
	}
	
	public function confirm($order_info, $order_total) {
		return true;
	}	
}
?>