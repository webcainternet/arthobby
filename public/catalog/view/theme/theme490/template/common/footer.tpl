<div class="clear"></div>
</div>
</div>
</div>
<div class="clear"></div>
</section>
<!-- Footer -->
<footer>
	<div class="container">
		<div class="row">
			<?php if ($informations) { ?>
			<div class="col-sm-2">
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
			<div class="col-sm-2">
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
			<div class="col-sm-2">
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
			<div class="col-sm-3">
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
			<div class="col-sm-3">
				<div class="block">
					<div class="block-content">
						<div class="foot-phone">
							<?php echo $tx_phone; ?><br>
							<span><?php echo $telephone; ?></span>
						</div>
						<ul class="social">
							<li><a href="http://facebook.com">
								<i class="fa fa-facebook-square"></i>
								<span><?php echo $text_fb; ?></span>
							</a></li>
							<li><a href="http://twitter.com">
								<i class="fa fa-twitter-square"></i>
								<span><?php echo $text_twi; ?></span>
							</a></li>
							<li><a href="#">
								<i class="fa fa-rss-square"></i>
								<span><?php echo $text_rss; ?></span>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- copyright -->
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div id="copyright">
					<?php echo $powered; ?><!-- [[%FOOTER_LINK]] -->
				</div>
			</div>
		</div>
	</div>
</footer>
<script type="text/javascript" 	src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/livesearch.js"></script>
</div>
</div>
</div>
</body></html>