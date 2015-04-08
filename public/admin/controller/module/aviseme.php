<?php
//AVISEME 3.0
class ControllerModuleAviseme extends Controller {
    private $error = array();

    private $vqmod_file = 'aviseme.xml';
    private $vqmod_disabled_file = 'aviseme.xml-disabled';

    public function index() {

        $this->language->load('module/aviseme');
        $this->load->model('module/aviseme');
        $this->load->model('catalog/product');

        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else {
            $page = 1;
        }

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/aviseme', 'token=' . $this->session->data['token'] . $url, 'SSL'),
            'separator' => ' :: '
        );

        $this->data['results'] = array();

        $results = $this->model_module_aviseme->getAviseme();

        foreach ($results as $result) {
            $action = array();

            $action[] = array(
                'text' => $this->language->get('text_notification'),
                'href' => $this->url->link('module/aviseme/notification', 'token=' . $this->session->data['token'] . '&product_id=' . $result['product_id'] . $url, 'SSL')
            );

            $action[] = array(
                'text' => $this->language->get('text_export'),
                'href' => $this->url->link('module/aviseme/export_emails', 'token=' . $this->session->data['token'] . '&file=xls&product_id=' . $result['product_id'] . $url, 'SSL')
            );

            $option_data = '';

            if ($this->config->get('aviseme_options_allow')) {
                $option = unserialize(base64_decode($result['option']));

                $product_options = $this->model_catalog_product->getProductOptions($result['product_id']);

                $option_data .= '<br>';

                foreach ($product_options as $product_option) {
                    if (isset($option[$product_option['product_option_id']])) {
                        foreach ($product_option['product_option_value'] as $product_option_value) {
                            if ($product_option_value['product_option_value_id'] == $option[$product_option['product_option_id']]) {
                                $option_data .= ' - <small>' . $product_option['name'] . ': ' . $product_option_value['name'] . '</small>';
                            }
                        }
                    }
                }
            }

            $this->data['results'][] = array(
                'product_name' => $result['product_name'] . $option_data,
                'emails' => $result['emails'],
                'action' => $action
            );
        }

        $this->data['config'] = $this->url->link('module/aviseme/config', 'token=' . $this->session->data['token'] . $url, 'SSL');

        $this->document->setTitle($this->language->get('heading_title'));
        $this->data['heading_title'] = $this->language->get('heading_title');

        $this->data['text_no_results'] = $this->language->get('text_no_results');

        $this->data['column_product'] = $this->language->get('column_product');
        $this->data['column_emails'] = $this->language->get('column_emails');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_config'] = $this->language->get('button_config');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        $this->template = 'module/aviseme.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }
    public function config() {
        $this->language->load('module/aviseme');
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

            $this->model_setting_setting->editSetting('aviseme', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');

            $this->redirect($this->url->link('module/aviseme', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/aviseme', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title_config'),
            'href' => $this->url->link('module/aviseme/config', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $this->data['action'] = $this->url->link('module/aviseme/config', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['cancel'] = $this->url->link('module/aviseme', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['token'] = $this->session->data['token'];

        $this->document->setTitle($this->language->get('heading_title_config'));
        $this->data['heading_title'] = $this->language->get('heading_title_config');

        $this->data['text_no_results'] = $this->language->get('text_no_results');
        $this->data['text_enabled'] = $this->language->get('text_enabled');
        $this->data['text_disabled'] = $this->language->get('text_disabled');
        $this->data['text_yes'] = $this->language->get('text_yes');
        $this->data['text_no'] = $this->language->get('text_no');
        $this->data['text_format_xls'] = $this->language->get('text_format_xls');
        $this->data['text_format_csv'] = $this->language->get('text_format_csv');

        $this->data['entry_email_subject'] = $this->language->get('entry_email_subject');
        $this->data['entry_email_content'] = $this->language->get('entry_email_content');
        $this->data['entry_export_format'] = $this->language->get('entry_export_format');
        $this->data['entry_options_allow'] = $this->language->get('entry_options_allow');
        $this->data['entry_status'] = $this->language->get('entry_status');

        $this->data['column_product'] = $this->language->get('column_product');
        $this->data['column_emails'] = $this->language->get('column_emails');
        $this->data['column_action'] = $this->language->get('column_action');

        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }

        if (isset($this->error['aviseme_email_subject'])) {
            $this->data['error_aviseme_email_subject'] = $this->error['aviseme_email_subject'];
        } else {
            $this->data['error_aviseme_email_subject'] = array();
        }

        if (isset($this->error['aviseme_email_content'])) {
            $this->data['error_aviseme_email_content'] = $this->error['aviseme_email_content'];
        } else {
            $this->data['error_aviseme_email_content'] = array();
        }

        if (isset($this->session->data['success'])) {
            $this->data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $this->data['success'] = '';
        }

        if (isset($this->request->post['aviseme_email_subject'])) {
            $this->data['aviseme_email_subject'] = $this->request->post['aviseme_email_subject'];
        } elseif ($this->config->get('aviseme_email_subject')) {
            $this->data['aviseme_email_subject'] = $this->config->get('aviseme_email_subject');
        } else {
            $this->data['aviseme_email_subject'] = $this->language->get('text_subject');
        }

        if (isset($this->request->post['aviseme_email_content'])) {
            $this->data['aviseme_email_content'] = $this->request->post['aviseme_email_content'];
        } elseif ($this->config->get('aviseme_email_content')) {
            $this->data['aviseme_email_content'] = $this->config->get('aviseme_email_content');
        } else {
            $this->data['aviseme_email_content'] = $this->language->get('text_html');
        }

        if (isset($this->request->post['aviseme_export_format'])) {
            $this->data['aviseme_export_format'] = $this->request->post['aviseme_export_format'];
        } else {
            $this->data['aviseme_export_format'] = $this->config->get('aviseme_export_format');
        }

        if (isset($this->request->post['aviseme_options_allow'])) {
            $this->data['aviseme_options_allow'] = $this->request->post['aviseme_options_allow'];
        } else {
            $this->data['aviseme_options_allow'] = $this->config->get('aviseme_options_allow');
        }

        if (isset($this->request->post['aviseme_status'])) {
            $this->data['aviseme_status'] = $this->request->post['aviseme_status'];
        } else {
            $this->data['aviseme_status'] = $this->config->get('aviseme_status');
        }

        $this->template = 'module/aviseme_config.tpl';
        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }
    public function notification() {

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['product_id'])) {
            $this->load->model('setting/store');
            $this->load->model('module/aviseme');
            $this->load->model('catalog/product');
            $this->language->load('module/aviseme');

            $avisemes = $this->model_module_aviseme->getEmailsToAviseme($this->request->get['product_id']);

            if ($avisemes) {
                foreach ($avisemes as $aviseme) {

                    if ($this->config->get('aviseme_email_content')) {
                        $text_html = $this->config->get('aviseme_email_content');
                    } else {
                        $text_html = $this->language->get('text_html');
                    }

                    if ($this->config->get('aviseme_email_subject')) {
                        $subject = $this->config->get('aviseme_email_subject');
                    } else {
                        $subject = $this->language->get('text_subject');
                    }

                    $store_info = $this->model_setting_store->getStore($aviseme['store_id']);

                    if ($store_info) {
                        $store_name = $store_info['name'];
                    } else {
                        $store_name = $this->config->get('config_name');
                    }

                    $product_link = '<a href="' . HTTP_CATALOG . 'index.php?route=product/product&product_id=' . $aviseme['product_id'] . '">' . $aviseme['product_name'] . '</a>';

                    $option_data = '';

                    if ($this->config->get('aviseme_options_allow')) {
                        $option = unserialize(base64_decode($aviseme['option']));

                        $product_options = $this->model_catalog_product->getProductOptions($aviseme['product_id']);



                        foreach ($product_options as $product_option) {
                            if (isset($option[$product_option['product_option_id']])) {
                                foreach ($product_option['product_option_value'] as $product_option_value) {
                                    if ($product_option_value['product_option_value_id'] == $option[$product_option['product_option_id']]) {
                                        $option_data .= '<br>- <small>' . $product_option['name'] . ': ' . $product_option_value['name'] . '</small>';
                                    }
                                }
                            }
                        }
                    }

                    $text_html = str_replace("[PRODUTO]", ($aviseme['product_name'] . $option_data), $text_html);
                    $text_html = str_replace("[LINK]", $product_link, $text_html);
                    $text_html = str_replace("[LOJA]", $store_name, $text_html);

                    $mail = new Mail();
                    $mail->protocol = $this->config->get('config_mail_protocol');
                    $mail->parameter = $this->config->get('config_mail_parameter');
                    $mail->hostname = $this->config->get('config_smtp_host');
                    $mail->username = $this->config->get('config_smtp_username');
                    $mail->password = $this->config->get('config_smtp_password');
                    $mail->port = $this->config->get('config_smtp_port');
                    $mail->timeout = $this->config->get('config_smtp_timeout');
                    $mail->setTo($aviseme['email']);
                    $mail->setFrom($this->config->get('config_email'));
                    $mail->setSender($this->config->get('config_name'));
                    $mail->setSubject($subject);
                    $mail->setHtml(html_entity_decode($text_html));
                    $mail->send();

                    $this->model_module_aviseme->setEmailToProductAviseme($aviseme['aviseme_id']);
                }
            }
        }

        $this->redirect($this->url->link('module/aviseme', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    }
    public function export_emails() {

        $url = '';

        if (isset($this->request->get['page'])) {
            $url .= '&page=' . $this->request->get['page'];
        }

        if (isset($this->request->get['product_id'])) {
            $this->load->model('module/aviseme');

            $results = $this->model_module_aviseme->getEmailsToAviseme($this->request->get['product_id']);

            $output_emails = '';

            if ($this->config->get('aviseme_export_format') == 'xls' || $this->config->get('aviseme_export_format') == '') {
                $extension = 'xls';
                $aplication = 'application/ms-excel';

                $xls = '<table border="1">';
                $xls .= '<tr><th>Nome</th><th>E-mail</th></tr>';
                if ($results) {
                    foreach ($results as $result) {
                        $xls .= '<tr><td>' . utf8_decode($result["name"]) . '</td><td>' . $result["email"] . '</td></tr>';
                    }
                }
                $xls .= '</table>';

                $output_emails = $xls;
            } elseif ($this->config->get('aviseme_export_format') == 'csv') {
                $extension = 'csv';
                $aplication = 'application/octet-stream';

                $i = 0;
                $line[$i] = 'Nome,E-mail'; //header

                if ($results) {
                    foreach ($results as $result) {
                        $line[++$i] = utf8_decode($result["name"]) . ',' . $result["email"];
                    }
                }
                $output_emails = implode("\r\n", $line);
            } else {
                $extension = 'txt';
                $aplication = 'application/octet-stream';

                $i = 0;
                $output_emails = '';

                if ($results) {
                    foreach ($results as $result) {
                        $output_emails .= $result["email"] . ';';
                    }
                }
            }

            $length = strlen($output_emails);

            header("Pragma: public");
            header("Expires: 0");
            header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
            header("Cache-Control: public");
            header("Content-Description: File Transfer");
            header("Content-Type: $aplication");
            header("Content-Disposition: attachment; filename=emails_list.$extension;");
            header("Content-Transfer-Encoding: binary");
            header("Content-Length: $length");

            echo trim($output_emails);
            exit;
        }

        $this->redirect($this->url->link('module/aviseme', 'token=' . $this->session->data['token'] . $url, 'SSL'));
    }
    public function install() {

        $this->load->model('module/aviseme');

        $this->model_module_aviseme->createTableAviseme();

        $DIR = str_replace('catalog/', '', DIR_CATALOG) . 'vqmod/xml/';

        if(file_exists($DIR . $this->vqmod_disabled_file)) {
            @rename($DIR . $this->vqmod_disabled_file, $DIR . $this->vqmod_file);
        }
    }
    public function uninstall() {
        $this->load->model('module/aviseme');

        $this->model_module_aviseme->dropTableAviseme();

        $DIR = str_replace('catalog/', '', DIR_CATALOG) . 'vqmod/xml/';

        @rename($DIR . $this->vqmod_file, $DIR . $this->vqmod_disabled_file);
    }
    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/aviseme')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (empty($this->request->post['aviseme_email_subject']) || (utf8_strlen($this->request->post['aviseme_email_subject']) < 3)) {
            $this->error['aviseme_email_subject'] = $this->language->get('error_email_subject');
        }

        if (empty($this->request->post['aviseme_email_content']) || (utf8_strlen($this->request->post['aviseme_email_content']) < 10)) {
            $this->error['aviseme_email_content'] = $this->language->get('error_email_content');
        }

        if (!$this->error) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}
?>