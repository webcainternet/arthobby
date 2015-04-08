<style type="text/css">
    .box-unavailable{width:340px;display: inline-block;background:#fff;margin-bottom:30px;margin-top:0;}
    .box-unavailable-heading{color:#f00;text-transform:uppercase;background:#fafafa;padding:5px 10px;margin:0;}
    .box-unavailable-content{padding:10px;}
    .unavailable-field{float:left;width:100%;}
    .unavailable-field input{width:95%;}
    .unavailable-submit{padding-top:20px;}
    .unavailable-submit a{color:#fff !important;}
</style>
<div class="box box-unavailable">
    <h3 class="box-unavailable-heading"><?php echo $text_product_unavailable; ?></h3>
    <div class="box-unavailable-content">
        <strong><?php echo $text_aviseme_info; ?></strong><br />
        <div id="aviseme-message">&nbsp;</div>
        <form id="avisem-form" method="post">
            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
            <div class="unavailable-field">
                <label><?php echo $entry_name; ?></label><br />
                <input type="text" name="aviseme_nome" value="" />
            </div>
            <div class="unavailable-field">
                <label><?php echo $entry_email; ?></label><br />
                <input type="text" name="aviseme_email" value="" />
            </div>
            <?php if ($options) { ?>
                <div class="options">
                    <br>
                    <h2><?php echo $text_option; ?></h2>
                    <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'select') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <select name="option[<?php echo $option['product_option_id']; ?>]">
                                    <option value=""><?php echo $text_select; ?></option>
                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                        <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                            <?php if ($option_value['price']) { ?>
                                                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                            <?php } ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'radio') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                    <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                    </label>
                                    <br />
                                <?php } ?>
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                    <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                        <?php if ($option_value['price']) { ?>
                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                        <?php } ?>
                                    </label>
                                    <br />
                                <?php } ?>
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'image') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <table class="option-image">
                                    <?php foreach ($option['option_value'] as $option_value) { ?>
                                        <tr>
                                            <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                                            <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                                            <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                        (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                    <?php } ?>
                                                </label></td>
                                        </tr>
                                    <?php } ?>
                                </table>
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'text') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'textarea') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'file') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
                                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'date') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'datetime') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
                            </div>
                            <br />
                        <?php } ?>
                        <?php if ($option['type'] == 'time') { ?>
                            <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                <?php if ($option['required']) { ?>
                                    <span class="required">*</span>
                                <?php } ?>
                                <b><?php echo $option['name']; ?>:</b><br />
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
                            </div>
                            <br />
                        <?php } ?>
                    <?php } ?>
                </div>
            <?php } ?>
            <div class="unavailable-field unavailable-submit">
                <a class="button button-continue" id="submitaviseme"><?php echo $text_submit; ?></a>
            </div>
        </form>
    </div>
</div>
<br>
<script type="text/javascript">
    $(function(){
        $('#submitaviseme').click(function(){
            $('.loading').remove();
            $('#aviseme-message').empty();
            $(this).after('<img class="loading" src="catalog/view/theme/default/image/loading.gif" alt="<?php echo $text_processing; ?>">');

            $.post('<?php echo $action; ?>', {form_data : $('#avisem-form').serialize()}, function(response){
                $('.loading').remove();

                if(response.status) {
                    $('#aviseme-message').append('<p class="success">'+ response.message +'</p>');
                    $('.box-unavailable form').hide();
                } else {
                    $('#aviseme-message').append('<p class="warning">'+ response.message +'</p>');
                }

            },'json');
        });
    });
</script>