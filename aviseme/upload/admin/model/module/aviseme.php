<?php

class ModelModuleAviseme extends Model {

      public function getAviseme() {

            $query = $this->db->query("SELECT DISTINCT p.product_id, pd.name AS product_name, COUNT(a.email) AS emails, a.aviseme_id, a.option FROM " . DB_PREFIX . "aviseme a INNER JOIN " . DB_PREFIX . "product p ON p.product_id = a.product_id LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE a.status = '1' AND pd.language_id = '".(int)$this->config->get('config_language_id')."' GROUP BY p.product_id");

            return $query->rows;
      }

      public function getTotalAviseme() {
            $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "aviseme a INNER JOIN " . DB_PREFIX . "product p ON p.product_id = a.product_id WHERE a.status = '1'");

            if(isset($query->row['total'])) {
                  return $query->row['total'];
            } else {
                  return 0;
            }
      }

      public function getEmailsToAviseme($product_id) {
            $query = $this->db->query("SELECT DISTINCT p.product_id, pd.name AS product_name, a.store_id, a.email, a.name, a.aviseme_id, a.option FROM " . DB_PREFIX . "aviseme a INNER JOIN " . DB_PREFIX . "product p ON p.product_id = a.product_id LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE a.status = '1' AND a.product_id = '" . (int) $product_id . "' AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "'");

            return $query->rows;
      }

      public function getTotalEmailsToAviseme($product_id) {
            $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "aviseme a INNER JOIN " . DB_PREFIX . "product p ON p.product_id = a.product_id LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE a.status = '1' AND a.product_id = '" . (int) $product_id . "' AND pd.language_id = '" . (int) $this->config->get('config_language_id') . "'");

            if (isset($query->row['total']) && $query->row['total']) {
                  return $query->row['total'];
            } else {
                  return 0;
            }
      }

      public function setEmailToProductAviseme($aviseme_id) {
            $this->db->query("UPDATE " . DB_PREFIX . "aviseme SET status = '0' WHERE aviseme_id = '" . (int) $aviseme_id . "'");
      }

      public function createTableAviseme() {
            $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "aviseme` (
              `aviseme_id` int(11) NOT NULL AUTO_INCREMENT,
              `store_id` int(11) NOT NULL DEFAULT '0',
              `product_id` int(11) NOT NULL,
              `name` varchar(150) NOT NULL,
              `email` varchar(150) NOT NULL,
              `option` varchar(255) NOT NULL,
              `date_added` datetime NOT NULL,
              `status` tinyint(4) NOT NULL,
              PRIMARY KEY (`aviseme_id`)
            ) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;");
      }

      public function dropTableAviseme() {
            $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "aviseme`;");
      }

}

?>