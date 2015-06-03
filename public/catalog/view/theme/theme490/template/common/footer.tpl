<!-- Footer -->
<div class="clear"></div>
</div>
</div>
</div>
<div class="clear"></div>
</section>
<!-- Continua Footer -->






<!-- Footer -->
<div style="background-color: #FFF; padding-top: 30px;">
	<div class="container">
		<div class="fb-like-box" data-href="https://www.facebook.com/pages/Art-Hobby-Modelismo/218368541586705" data-width="1200" data-height="258" data-colorscheme="light" data-show-faces="true" data-header="false" data-stream="false" data-show-border="false"></div>
	</div>
</div>

<footer>
	<div class="container">
		<div class="row">
			<?php if ($informations) { ?>
			<div class="col-sm-2" style="width: 19%;">
				<div class="block">
					<div class="block-heading">
						<?php echo $text_information; ?>
					</div>
					<div class="block-content">
						<ul>
							<?php foreach ($informations as $information) { ?>
							<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
							<?php } ?>
						</ul>
					</div>
				</div>
			</div>
			<?php } ?>
			<div class="col-sm-2" style="width: 16%;">
				<div class="block">
					<div class="block-heading">
						<?php echo $text_service; ?>
					</div>
					<div class="block-content">
						<ul>
							<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
							<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
							<li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-2" style="width: 16%;">
				<div class="block">
					<div class="block-heading">
						<?php echo $text_extra; ?>
					</div>
					<div class="block-content">
						<ul>
							<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
							<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
							<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-sm-3" style="width: 17%;">
				<div class="block">
					<div class="block-heading">
						<?php echo $text_account; ?>
					</div>
					<div class="block-content">
						<ul>
							<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
							<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
							<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
							<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
						</ul>
					</div>
				</div>
			</div>			
			<div class="col-sm-3" style="width: 27%;">
				<div class="block">
					<div class="block-content">
						<div class="foot-phone">
							<?php echo $tx_phone; ?><br>
							<span><?php echo $telephone; ?></span>
						</div>
						<div>
							<img src="/image/data/pagseguro_logo.png" style="margin-top: -5px;" >
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- copyright -->
	<div class="container">
		<div class="row">
			&nbsp;
		</div>
	</div>
</footer>

<div>
	<div class="container" style="margin-top: 10px;">

		<div style="text-align: center;">
			<div style="float: left; width: 100px;">
				<p><script type="text/javascript">TrustLogo("/image/comodo_secure_100x85_transp.png", "SC5", "none");</script><a href="javascript:if(window.open('https://secure.comodo.com/ttb_searcher/trustlogo?v_querytype=W&amp;v_shortname=SC5&amp;v_search=https://arthobby.com.br/&amp;x=6&amp;y=5','tl_wnd_credentials'+(new Date()).getTime(),'toolbar=0,scrollbars=1,location=1,status=1,menubar=1,resizable=1,width=374,height=660,left=60,top=120')){};tLlB(tLTB);" onmouseover="tLeB(event,'https://secure.comodo.com/ttb_searcher/trustlogo?v_querytype=C&amp;v_shortname=SC5&amp;v_search=https://arthobby.com.br/&amp;x=6&amp;y=5','tl_popupSC5')" onmousemove="tLXB(event)" onmouseout="tLTC('tl_popupSC5')" ondragstart="return false;"><img src="/image/comodo_secure_100x85_transp.png" border="0" onmousedown="return tLKB(event,'https://secure.comodo.com/ttb_searcher/trustlogo?v_querytype=W&amp;v_shortname=SC5&amp;v_search=https://arthobby.com.br/&amp;x=6&amp;y=5');" oncontextmenu="return tLLB(event);"></a><!----></p>
			</div>


			<div id="copyright" style="margin-bottom: 10px;">
				<div>Art hobby modelismo Ltda | CNPJ 09.499.182/0001-61 | IE 278170820118 | Estrada da Aldeia,186 - Granja Viana - Cotia - SP</div>
				<div>Todos os preços e condições do site são validos apenas para compras on line e não se aplicam para nossas lojas físicas</div>
				<div><?php echo $powered; ?><!-- [[%FOOTER_LINK]] --></div>
			</div>
			<br>
		</div>


	</div>
</div>


<script type="text/javascript" 	src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/livesearch.js"></script>
</div>
</div>
</div>

</body></html>