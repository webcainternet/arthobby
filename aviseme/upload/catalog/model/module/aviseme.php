<?php

class ModelModuleAviseme extends Model {

      public function avisemeExists($data = array()) {
            $customer = $this->db->query("SELECT aviseme_id FROM " . DB_PREFIX . "aviseme WHERE product_id = '" . (int) $data['product_id'] . "' AND email = '" . $this->db->escape(trim($data['aviseme_email'])) . "' AND status = '1' LIMIT 1");

            if (isset($customer->row['aviseme_id']) && $customer->row['aviseme_id']) {
                  return true;
            } else {
                  return false;
            }
      }

      public function setAviseme($data = array()) {

            $config_store_id = $this->config->get('config_store_id');

            $this->db->query("INSERT INTO " . DB_PREFIX . "aviseme SET product_id = '" . (int) $data['product_id'] . "', store_id = '" . (int) $config_store_id . "', name = '" . $this->db->escape(trim($data['aviseme_nome'])) . "', email = '" . $this->db->escape(trim($data['aviseme_email'])) . "', `option` = '" . $this->db->escape(trim($data['option'])) . "', `status` = '1', `date_added` = NOW()");
      }

}

?>
