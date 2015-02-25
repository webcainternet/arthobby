<div class="clear"></div>
</div>
</div>
</div>
<div class="clear"></div>
</section>
<!-- Footer -->
<div>
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
							<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
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
							<img src="/image/data/pagseguro_transp.png" >
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
		<div style="background-image: url('/image/data/logofooter.png'); width: 100%; float: right; background-size: 110px;
height: 105px; background-repeat: no-repeat; background-position: center; text-align: center;">&nbsp;</div>

		<div style="text-align: center;">
			<div id="copyright" style="margin-top: 60px; margin-bottom: 0px;">
				<?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
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