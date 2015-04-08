<?php
class ControllerModuleAviseme extends Controller {
    public function index() {
        if (isset($this->request->get['product_id'])) {
            $product_id = (int) $this->request->get['product_id'];
        } else {
            $product_id = 0;
        }

        $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);

        if ($product_info) {

            $stock = true;

            if ($product_info['subtract'] && (!$product_info['quantity'] || ($product_info['quantity'] < $product_info['minimum']))) {
                $stock = false;
            }

            if ($stock === false && $this->config->get('aviseme_status')) {
                $this->language->load('module/aviseme');

                $this->data['text_select'] = $this->language->get('text_select');
                $this->data['text_option'] = $this->language->get('text_option');
                $this->data['text_product_unavailable'] = $this->language->get('text_product_unavailable');
                $this->data['text_aviseme_info'] = $this->language->get('text_aviseme_info');
                $this->data['text_submit'] = $this->language->get('text_submit');
                $this->data['text_processing'] = $this->language->get('text_processing');

                $this->data['entry_name'] = $this->language->get('entry_name');
                $this->data['entry_email'] = $this->language->get('entry_email');

                $this->data['action'] = $this->url->link('module/aviseme/send');
                $this->data['product_id'] = $product_id;

                $this->data['options'] = array();

                if ($this->config->get('aviseme_options_allow')) {
                    $options = $this->model_catalog_product->getProductOptions($product_id);

                    foreach ($options as $option) {
                        if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
                            $option_value_data = array();

                            foreach ($option['option_value'] as $option_value) {
                                if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float) $option_value['price']) {
                                    $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                                } else {
                                    $price = false;
                                }

                                $option_value_data[] = array(
                                    'product_option_value_id' => $option_value['product_option_value_id'],
                                    'option_value_id' => $option_value['option_value_id'],
                                    'name' => $option_value['name'],
                                    'image' => $this->model_tool_image->resize($option_value['image'], 50, 50),
                                    'price' => $price,
                                    'price_prefix' => $option_value['price_prefix']
                                );
                            }

                            $this->data['options'][] = array(
                                'product_option_id' => $option['product_option_id'],
                                'option_id' => $option['option_id'],
                                'name' => $option['name'],
                                'type' => $option['type'],
                                'option_value' => $option_value_data,
                                'required' => $option['required']
                            );
                        } elseif ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
                            $this->data['options'][] = array(
                                'product_option_id' => $option['product_option_id'],
                                'option_id' => $option['option_id'],
                                'name' => $option['name'],
                                'type' => $option['type'],
                                'option_value' => $option['option_value'],
                                'required' => $option['required']
                            );
                        }
                    }
                }

                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/aviseme.tpl')) {
                    $this->template = $this->config->get('config_template') . '/template/module/aviseme.tpl';
                } else {
                    $this->template = 'default/template/module/aviseme.tpl';
                }

                $this->render();
            }
        }
    }
    public function send() {

        $json = array(
            'status' => false,
            'message' => ''
        );

        parse_str(str_replace('&amp;', '&', urldecode($this->request->post['form_data'])), $this->request->post);

        if (isset($this->request->post['product_id']) && $this->request->post['product_id']) {

            $this->language->load('module/aviseme');
            $this->load->model('catalog/product');

            if (isset($this->request->post['option'])) {
                $option = array_filter($this->request->post['option']);
            } else {
                $option = array();
            }

            if ($this->config->get('aviseme_options_allow')) {
                $product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

                foreach ($product_options as $product_option) {
                    if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
                        $json['message'] = sprintf($this->language->get('error_required'), $product_option['name']);
                        ;
                        break;
                    }
                }
            }

            if ((strlen(utf8_decode($this->request->post['aviseme_nome'])) < 3) || (strlen(utf8_decode($this->request->post['aviseme_nome'])) > 50)) {
                $json['message'] = $this->language->get('error_name');
            } elseif (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['aviseme_email'])) {
                $json['message'] = $this->language->get('error_email');
            }

            if (empty($json['message'])) {
                $this->load->model('module/aviseme');

                $aviseme_exists = $this->model_module_aviseme->avisemeExists($this->request->post);

                if (!$aviseme_exists) {

                    $this->request->post['option'] = base64_encode(serialize($option));

                    $this->model_module_aviseme->setAviseme($this->request->post);

                    $product = $this->model_catalog_product->getProduct($this->request->post['product_id']);

                    $option_data = '';

                    if ($this->config->get('aviseme_options_allow')) {
                        foreach ($product_options as $product_option) {
                            if (isset($option[$product_option['product_option_id']])) {
                                foreach ($product_option['option_value'] as $product_option_value) {
                                    if ($product_option_value['product_option_value_id'] == $option[$product_option['product_option_id']]) {
                                        $option_data .= '<br>- <small>' . $product_option['name'] . ': ' . $product_option_value['name'] . '</small>';
                                    }
                                }
                            }
                        }
                    }

                    $html = sprintf($this->language->get('text_email_html'), $this->language->get('text_email_subject'), $this->request->post['aviseme_nome'], $this->request->post['aviseme_email'], ($product['name'] . $option_data), $this->url->link('product/product', '&product_id=' . $product['product_id']), $product['name'], $this->config->get('config_name'));

                    $mail = new Mail();
                    $mail->protocol = $this->config->get('config_mail_protocol');
                    $mail->parameter = $this->config->get('config_mail_parameter');
                    $mail->hostname = $this->config->get('config_smtp_host');
                    $mail->username = $this->config->get('config_smtp_username');
                    $mail->password = $this->config->get('config_smtp_password');
                    $mail->port = $this->config->get('config_smtp_port');
                    $mail->timeout = $this->config->get('config_smtp_timeout');
                    $mail->setTo($this->config->get('config_email'));
                    $mail->setFrom($this->request->post['aviseme_email']);
                    $mail->setSender($this->request->post['aviseme_nome']);
                    $mail->setSubject($this->language->get('text_email_subject'));
                    $mail->setHtml($html);
                    $mail->send();
                }

                $json = array(
                    'status' => true,
                    'message' => $this->language->get('text_aviseme_success')
                );
            }
        }

        echo json_encode($json);
        exit;
    }
}
?>
