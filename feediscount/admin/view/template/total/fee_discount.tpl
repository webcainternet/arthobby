<style type="text/css">

.version
{
	display: block;
    line-height: 16px;
    padding-left: 20px;
}

.version.latest
{
	color: #479401;
	background: url("http://thekrotek.com/images/latest.png") no-repeat;
}

.version.update
{
	color: #ca3510;
	background: url("http://thekrotek.com/images/update.png") no-repeat;
}

</style>
<?php echo $header;?>
<div id="content">
	<div class="breadcrumb">
    	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
    		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    	<?php } ?>
  	</div>
	<?php if ($errors) { ?>
		<?php foreach ($errors as $error) { ?>
			<div class="warning"><?php echo $error; ?></div>
		<?php } ?>
	<?php } elseif ($success) { ?>
		<div class="success"><?php echo $success; ?></div>
	<?php } ?>
  	<div class="box">
    	<div class="heading">
      		<h1><img src="view/image/total.png" alt="" /> <?php echo $heading_title; ?></h1>
      		<div class="buttons">
      			<a onclick="$('#apply').attr('value', '0'); $('#form').submit();" class="button"><?php echo $button_save; ?></a>
      			<a onclick="$('#apply').attr('value', '1'); $('#form').submit();" class="button"><?php echo $button_apply; ?></a>
      			<a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
      		</div>
    	</div>
    	<div class="content">
      		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      			<input type="hidden" name="apply" id="apply" value="0">
        		<table class="form">
                	<tr>
          				<td colspan="2"><?php echo $version ?></td>
        			</tr>        
          			<tr>
            			<td colspan="2">
        					<h3><?php echo $entry_payments; ?></h3>
        					<span class="help"><?php echo $entry_payments_help; ?></span>
        				</td>
     	  			</tr>
     	  			<?php if (!empty($payments)) { ?>
     					<?php foreach ($payments as $payment) { ?>
     	  					<tr>				
			  					<td><?php echo $payment['title']; ?></td>
            					<td><input type="text" name="fee_discount_payments[<?php echo $payment['code']; ?>]" value="<?php echo $payment['fee']; ?>" size="3" /></td>
          					</tr>            		
 						<?php } ?>
 					<?php } ?>
          			<tr>
            			<td colspan="2">
        					<h3><?php echo $entry_settings; ?></h3>
        				</td>
     	  			</tr> 						
            		<tr>
              			<td><?php echo $entry_groups; ?></td>
              			<td>
              				<div class="scrollbox">
                  				<?php
                  				$class = 'odd';
                  				
                  				foreach ($customer_groups as $customer_group) {
                  					$class = ($class == 'even' ? 'odd' : 'even'); ?>
                  					<div class="<?php echo $class; ?>">
                    					<?php if (in_array($customer_group['customer_group_id'], $fee_discount_groups)) { ?>
                    						<input type="checkbox" name="fee_discount_groups[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                    						<?php echo $customer_group['name']; ?>
                    					<?php } else { ?>
                    						<input type="checkbox" name="fee_discount_groups[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                    						<?php echo $customer_group['name']; ?>
                    					<?php } ?>
                  					</div>
                  				<?php } ?>
                			</div>
                			<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
                		</td>
            		</tr>
					<tr>
            			<td><?php echo $entry_total_fee; ?></td>
            			<td><input type="text" name="fee_discount_total_fee" value="<?php echo $fee_discount_total_fee; ?>" /></td>
          			</tr>
					<tr>
            			<td><?php echo $entry_total_discount; ?></td>
            			<td><input type="text" name="fee_discount_total_discount" value="<?php echo $fee_discount_total_discount; ?>" /></td>
          			</tr>          							
		  			<tr>
            			<td><?php echo $entry_round; ?></td>
            			<td><input type="text" name="fee_discount_round" value="<?php echo $fee_discount_round; ?>" /></td>
          			</tr>
        			<tr>
          				<td><?php echo $entry_title; ?></td>
          				<td><input type="checkbox" name="fee_discount_title" <?php echo ($fee_discount_title ? 'checked' : '') ?> /></td>
        			</tr>
        			<tr>
          				<td><?php echo $entry_value; ?></td>
          				<td><input type="checkbox" name="fee_discount_value" <?php echo ($fee_discount_value ? 'checked' : '') ?> /></td>
        			</tr>        						      							
          			<tr>
            			<td><?php echo $entry_tax_class; ?></td>
            			<td>
            				<select name="fee_discount_tax_class">
                				<option value="0"><?php echo $text_none; ?></option>
                				<?php foreach ($tax_classes as $tax_class) { ?>
                					<?php if ($tax_class['tax_class_id'] == $fee_discount_tax_class) { ?>
                						<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                					<?php } else { ?>
                						<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                					<?php } ?>
                				<?php } ?>
              				</select>
              			</td>
          			</tr>
          			<tr>
            			<td><?php echo $entry_geo_zone_type; ?></td>
            			<td>
	            			<select name="fee_discount_zone_type">
        	        			<?php foreach ($geo_zone_types as $geo_zone_type) { ?>
        	        				<?php if ($geo_zone_type['type'] == $fee_discount_zone_type) { ?>
	                					<option value="<?php echo $geo_zone_type['type']; ?>" selected="selected"><?php echo $geo_zone_type['name']; ?></option>
    	            				<?php } else { ?>
                						<option value="<?php echo $geo_zone_type['type']; ?>"><?php echo $geo_zone_type['name']; ?></option>
	                				<?php } ?>
        	        			<?php } ?>
              				</select>
              			</td>
          			</tr>           							    
          			<tr>
            			<td><?php echo $entry_geo_zone; ?></td>
            			<td>
	            			<select name="fee_discount_zone_id">
    	            			<option value="0"><?php echo $text_all_zones; ?></option>
        	        			<?php foreach ($geo_zones as $geo_zone) { ?>
                					<?php if ($geo_zone['geo_zone_id'] == $fee_discount_zone_id) { ?>
	                					<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
    	            				<?php } else { ?>
                						<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
	                				<?php } ?>
        	        			<?php } ?>
              				</select>
              			</td>
          			</tr>
          			<tr>
            			<td><?php echo $entry_status; ?></td>
            			<td>
            				<select name="fee_discount_status">
                				<?php if ($fee_discount_status) { ?>
                					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                					<option value="0"><?php echo $text_disabled; ?></option>
                				<?php } else { ?>
                					<option value="1"><?php echo $text_enabled; ?></option>
                					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                				<?php } ?>
              				</select>
              			</td>
          			</tr>
          			<tr>
            			<td><?php echo $entry_sort_order; ?></td>
            			<td><input type="text" name="fee_discount_sort_order" value="<?php echo $fee_discount_sort_order; ?>" size="1" /></td>
          			</tr>
          			<tr>
            			<td colspan="2" style="background: #555555; color: #ffffff; font-size: 125%">Get more OpenCart extensions from The Krotek for lower price on <a href="http://thekrotek.com" style="color: yellow;" title="Visit The Krotek site">The Krotek site</a>!</td>
            		</tr>
        		</table>
      		</form>
		</div>
	</div>
</div>									
<?php echo $footer; ?>