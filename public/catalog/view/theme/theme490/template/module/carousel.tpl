<!-- Footer -->
<div class="clear"></div>
</div>
</div>
</div>
<div class="clear"></div>
</section>
<!-- Continua Footer -->





<div class="container">
	<div class="clear"></div>
	<div class="wrapper">   
		<div id="carousel<?php echo $module; ?>">
			<ul class="jcarousel-skin-opencart">
				<?php foreach ($banners as $banner) { ?>
				<li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<script type="text/javascript"><!--
	$('#carousel<?php echo $module; ?> ul').jcarousel({
		vertical: false,
		visible: <?php echo $limit; ?>,
		scroll: <?php echo $scroll; ?>
	});
	//--></script>
</div>



<div><div><div>