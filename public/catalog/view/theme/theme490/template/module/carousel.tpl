<!-- Footer -->
<div class="clear"></div>
</div>
</div>
</div>
<div class="clear"></div>
</section>
<!-- Continua Footer -->


<style type="text/css">
	.footerbanner {
		float: left;
		width: 575px;
		margin-bottom: 30px;
	}
	.footerbanner:hover img {
		opacity: 0.7;
	}
</style>
<div class="container">
		<div class="footerbanner" style="margin-right: 10px;"><a href="index.php?route=product/product&amp;product_id=28"><img style="width: 100%;" src="/image/data/banner-footer-1.jpg" alt="" title=""></a></div>
		<div class="footerbanner" style="margin-left: 10px;"><a href="index.php?route=product/product&amp;product_id=29"><img style="width: 100%;" src="/image/data/banner-footer-2.jpg" alt="" title=""></a></div>
</div>

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