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