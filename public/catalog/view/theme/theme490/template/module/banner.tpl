<div id="banner<?php echo $module; ?>" class="banner row">
	<?php $i=0;?>
	<?php foreach ($banners as $banner) { $i++; 
		$perLine = 3;
		$total = count($banners);
		$totModule = $total%$perLine;
		if ($i%$perLine==1) {
			$a='first-in-line';
		}
		elseif ($i%$perLine==0) {
			$a='last-in-line';
		}
		else {
			$a='';
		}
	?>
	<?php if ($banner['link']) { ?>
	<div class="col-sm-4 <?php echo$a;?>">
		<div>
			<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
			<div class="s-desc"><?php echo $banner['description']; ?></div>
			<a href="<?php echo $banner['link']; ?>"></a>
		</div>		
	</div>
	<?php } else { ?>
	<div class="col-sm-4 <?php echo$a;?>">
		<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" />
		<div class="s-desc"><?php echo $banner['description']; ?></div>
	</div>
	<?php } ?>
	<?php } ?>
</div>
