<?php echo $header; ?>
<div id="content">
      <div class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
            <?php } ?>
      </div>
      <?php if ($error_warning) { ?>
            <div class="warning"><?php echo $error_warning; ?></div>
      <?php } ?>
      <div class="box">
            <div class="heading">
                  <h1><img src="view/image/total.png" alt="" /> <?php echo $heading_title; ?></h1>
                  <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
            </div>
            <div class="content">
                  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                        <table class="form">
                              <tr>
                                    <td><span class="required">*</span> <?php echo $entry_email_subject; ?></td>
                                    <td><input type="text" name="aviseme_email_subject" value="<?php echo $aviseme_email_subject; ?>" />
                                          <?php if ($error_aviseme_email_subject) { ?>
                                                <span class="error"><?php echo $error_aviseme_email_subject; ?></span>
                                          <?php } ?></td>
                              </tr>
                              <tr>
                                    <td><span class="required">*</span> <?php echo $entry_email_content; ?></td>
                                    <td><textarea name="aviseme_email_content" id="aviseme_email_content"><?php echo $aviseme_email_content; ?></textarea>
                                          <?php if ($error_aviseme_email_content) { ?>
                                                <span class="error"><?php echo $error_aviseme_email_content; ?></span>
                                          <?php } ?></td>
                              </tr>
                              <tr>
                                    <td><?php echo $entry_export_format; ?></td>
                                    <td><select name="aviseme_export_format">
                                                <?php if ($aviseme_export_format == 'xls') { ?>
                                                      <option value="xls" selected="selected"><?php echo $text_format_xls; ?></option>
                                                <?php } else { ?>
                                                      <option value="xls"><?php echo $text_format_xls; ?></option>
                                                <?php } ?>
                                                <?php if ($aviseme_export_format == 'csv') { ?>
                                                      <option value="csv" selected="selected"><?php echo $text_format_csv; ?></option>
                                                <?php } else { ?>
                                                      <option value="csv"><?php echo $text_format_csv; ?></option>
                                                <?php } ?>
                                          </select></td>
                              </tr>
                              <tr>
                                <td><?php echo $entry_options_allow; ?></td>
                                <td><select name="aviseme_options_allow">
                                    <?php if ($aviseme_options_allow) { ?>
                                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                    <option value="0"><?php echo $text_no; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_yes; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_no; ?></option>
                                    <?php } ?>
                                  </select></td>
                              </tr>
                              <tr>
                                <td><?php echo $entry_status; ?></td>
                                <td><select name="aviseme_status">
                                    <?php if ($aviseme_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                  </select></td>
                              </tr>
                        </table>
                  </form>
            </div>
      </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>
<script type="text/javascript"><!--
CKEDITOR.replace('aviseme_email_content', {
	filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
	filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
});
//--></script>
<?php echo $footer; ?>