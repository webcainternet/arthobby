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
		<div class="footerbanner" style="margin-right: 10px;"><a href="index.php?route=product/product&amp;product_id=28"><img style="width: 100%;" src="http://livedemo00.template-help.com/opencart_45568/image/cache/data/banner-4-506x151.jpg" alt="" title=""></a></div>
		<div class="footerbanner" style="margin-left: 10px;"><a href="index.php?route=product/product&amp;product_id=29"><img style="width: 100%;" src="http://livedemo00.template-help.com/opencart_45568/image/cache/data/banner-5-506x151.jpg" alt="" title=""></a></div>
</div>

<div class="container">
	<div class="clear"></div>
	<div class="wrapper">   
		<div id="carousel<?php echo $module; ?>">
			<ul class="jcarousel-skin-opencart">
				<?php foreach ($banners as $banner) { ?>
				<li><a href="<?php echo $banner['link']; ?>" target="_blank"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" width="<?php echo $img_width; ?>" height="<?php echo $img_height; ?>" /></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<script type="text/javascript"><!--
	$('#carousel<?php echo $module; ?> ul').jcarousel({
		vertical: false,
		visible: <?php echo $limit; ?>,
		
  scroll: <?php echo $scroll; ?>,
	wrap:  '<?php echo $cwrap; ?>',
  animation: 500, // 1600 (rol:3)
	auto: <?php echo $auto; ?>,
  /* Pause scrolling when mousesove and restart scrolling when mouseout. */ 
  initCallback: function(jc, state) { 
    if (state == 'init') {  
      jc.startAutoOrig = jc.startAuto; 
      jc.startAuto = function() { 
        if (!jc.paused) { 
          jc.startAutoOrig(); 
        } 
      } 
      jc.pause = function() { 
        jc.paused = true; 
        jc.stopAuto(); 
      }; 
      jc.play = function() { 
        jc.paused = false; 
        jc.startAuto(); 
      }; 
      $('li.jcarousel-item').mouseover(function() { 
          jc.pause(); 
      }); 
      $('li.jcarousel-item').mouseout(function() { 
          jc.play(); 
      }); 
    } 
    jc.play(); 
  } // initCallback
	
	});
	//--></script>
</div>



<div><div><div>