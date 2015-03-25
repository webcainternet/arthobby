<!-- Barra de newsletter -->
<style type="text/css">
	.divnews {
		float: left;
		width: 33%;
		padding: 5px;
		  color: #FFF;
  	font-size: 22px;
    font-family: 'Roboto', sans-serif;
    font-style: italic;
    padding: 10px;
	}

</style>

<div style="background-color: #ed3237; height: 80px; border-radius: 5px; margin-bottom: 30px;">
	<div class="divnews" style="margin-top: 10px;">
		<div style="float: left; font-size: 48px; padding: 11px; padding-top: 0px; padding-right: 0px; "><img src="/image/data/news-card1.png" height="40"></div>
		<div style="float: left; font-size: 48px; padding: 11px; ">6x</div>
		<div style="float: left; font-size: 18px; line-height: 20px; text-transform: uppercase; font-weight: bold;
 ">Sem juros<br>No cartão</div>
 		<div style="float: left; width: 100%; height: 10px; font-size: 10px; margin-top: -10px;"><a href="/index.php?route=information/information&information_id=5" style="text-decoration: none; color: #FFF;">* Confira as regras</a></div>
	</div>
	<div class="divnews" style="margin-top: 10px;">
		<div style="float: left; font-size: 48px; padding: 0px; padding-top: 0px; padding-right: 0px; "><img src="/image/data/news-boleto.png" height="40"></div>
		<div style="float: left; font-size: 48px; padding: 11px; ">5%</div>
		<div style="float: left; font-size: 18px; line-height: 20px; text-transform: uppercase; font-weight: bold;
 ">De desconto<br>No boleto</div>
	</div>
	<div class="divnews" style="font-size: 14px;">Cadastre-se e receba as novidades<br>
		<input type="search" name="search" value="" placeholder="Digite seu e-mail" style="border-radius: 5px; border: 0px; margin-top: 5px; width: 225px;"><input type="submit" value="OK" style="  border: 0px; color: #FFF; background-color: #ed3237; border-radius: 5px;   margin: 6px; margin-left: 0px; margin-top: 4px; font-size: 12px; height: 33px; float: right; height: 29px;"></div>
</div>
<!-- FIM Barra de newsletter -->




<script type="text/javascript">
	if ($('body').width() > 767) {
		(function($){$.fn.equalHeights=function(minHeight,maxHeight){tallest=(minHeight)?minHeight:0;this.each(function(){if($(this).height()>tallest){tallest=$(this).height()}});if((maxHeight)&&tallest>maxHeight)tallest=maxHeight;return this.each(function(){$(this).height(tallest)})}})(jQuery)
	$(window).load(function(){
		if($(".maxheight-feat").length){
		$(".maxheight-feat").equalHeights()}
	});
	};
</script>
<div class="box featured">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
	<div class="box-product">
		<ul class="row">
		  <?php $i=0; foreach ($products as $product) { $i++ ?>
		  <?php 
			   $perLine = 3;
			   $spanLine = 3;
			   $last_line = "";
					$total = count($products);
					$totModule = $total%$perLine;
					if ($totModule == 0)  { $totModule = $perLine;}
					if ( $i > $total - $totModule) { $last_line = " last_line";}
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
			<li class="<?php echo $a. $last_line ;?> col-sm-<?php echo $spanLine ;?>">
				<script type="text/javascript">
				$(document).ready(function(){
					$("a.colorbox<?php echo $i?>").colorbox({
					rel: 'colorbox',
					inline:true,
					html: true,
					width:'58%',
					maxWidth:'780px',
					height:'70%',
					open:false,
					returnFocus:false,
					fixed: true,
					title: false,
					href:'.quick-view<?php echo $i;?>',
					current:'<?php echo $text_product; ?>'
					});
					});
				</script> 
				<div class="padding">
				<!-- Product image -->
				<div class="product_image image2">
					<a href="<?php echo $product['href']; ?>"><?php if ($product['thumb']) { ?><img id="img_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /><?php } else{ ?><img src="catalog/view/theme/theme490/image/no-image.png" alt="" /><?php } ?></a>
					
					<!-- Product raitng -->
					<div class="product_rating rating">
						<img src="catalog/view/theme/theme490/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
					</div>
					
				</div>
				<!-- Product quick view -->
				<div style="display:none;">
					<div  class="quick-view<?php echo $i;?> preview">
						<div class="wrapper marg row">
							<?php if ($product['thumb1']) { ?>
							<div class="left col-sm-4">
								<div class="product_image image3">
									<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb1']; ?>" alt="<?php echo $product['name']; ?>" /></a>
								</div>								
							</div>
							<div class="right col-sm-8"><?php } else { ?><div class="left col-sm-12"><?php } ?>
								<h2><?php echo $product['name']; ?></h2>
								<div class="inf">
									<?php if ($product['author']) {?>
										<span class="product_manufacture manufacture"><?php echo $text_manufacturer; ?> <a href="<?php echo $product['manufacturers'];?>"><?php echo $product['author']; ?></a></span>
									<?php }?>
									<?php if ($product['model']) {?>
										<span class="product_model model"><?php echo $text_model; ?><?php echo $product['model']; ?></span>
									<?php }?>
									<span class="product_stock prod-stock-2"><?php echo $text_availability; ?></span>
										
										<?php
										   if ($product['text_availability'] > 0) { ?>
										 <span class="product_stock prod-stock"><?php echo $text_instock; ?></span>
										<?php } else { ?>
											   <span class="product_stock prod-stock"><?php echo $text_outstock; ?></span>
										 <?php
										 }	
										 ?>
									<?php if ($product['price']) { ?>
										<div class="product_price price">
									  <span class="text-price"><?php echo $text_price; ?></span>
									  <?php if (!$product['special']) { ?>
									  <?php echo $product['price']; ?>
									  <?php } else { ?>
									  De: <span class="price-old"><?php echo $product['price']; ?></span>
									  Por: <span class="price-new"><?php echo $product['special']; ?></span>
									  <?php } ?>
									  
									</div>
									<?php } ?>
								</div>
								<div class="product_button">
									<div class="cart">
										<a data-id="<?php echo $product['product_id']; ?>;" class="button addToCart-1 ">
											<i class="fa fa-shopping-cart"></i>
											<span><?php echo $button_cart; ?></span>
										</a>
									</div>
								<div class="cart-button">
									<div class="wishlist_btn wishlist">
										<a onclick="addToWishList('<?php echo $product['product_id']; ?>');">
											<span><?php echo $button_wishlist; ?></span>
										</a>
									</div>
									<div class="compare_btn compare">
										<a onclick="addToCompare('<?php echo $product['product_id']; ?>');">
											<span><?php echo $button_compare; ?></span>
										</a>
									</div>
								</div>
									<span class="clear"></span>
								</div>
								<div class="clear"></div>
								<div class="product_rating rating">
									<img src="catalog/view/theme/theme490/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" />
								</div>
							</div>
						</div>
						<div class="product_description description">
							<?php echo $product['description'];?>
						</div>
						
					</div>
				</div>
				<a href="<?php echo $product['href']; ?>" class="colorbox<?php echo $i;?> quick-view-button"><i class=" fa fa-search "></i></a>
				<div class="inner">
					<div class="f-left">
						<!-- product name -->
						<div class="product_name name maxheight-feat"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
						<!-- Product price -->
						<?php if ($product['price']) { ?>
						<div class="product_price price">
							<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
							<?php
								$precoparc = $product['price']; 
								$precoparc = str_replace("R$", "", $precoparc);
								$precoparc = str_replace(" ", "", $precoparc);
								$precoparc = str_replace(".", "", $precoparc);
								$precoparc = number_format($precoparc/6,2);
							?>
							<div class="div-parc">6x de <span class="price-parc">R$ <?php echo $precoparc; ?></span></div>
							<?php } else { ?>
							<span class="price-old">De: <?php echo $product['price']; ?></span>
							<span class="price-new">Por: <?php echo $product['special']; ?></span>
							<?php
								$precoparc = $product['special']; 
								$precoparc = str_replace("R$", "", $precoparc);
								$precoparc = str_replace(" ", "", $precoparc);
								$precoparc = str_replace(".", "", $precoparc);
								$precoparc = number_format($precoparc/6,2);
							?>
							<div class="div-parc">6x de <span class="price-parc">R$ <?php echo $precoparc; ?></span></div>
							<?php } ?>
						</div>
						<?php } ?>						
					</div>
					<!-- Product buttons -->
					<div class="product_button">
						<div class="cart">
							<a data-id="<?php echo $product['product_id']; ?>;" class="button addToCart">
								<i class="fa fa-shopping-cart"></i>
								<span><?php echo $button_cart; ?></span>
							</a>
						</div>
					<div class="cart-button">
						<div class="wishlist_btn wishlist">
							<a onclick="addToWishList('<?php echo $product['product_id']; ?>');">
								<span><?php echo $button_wishlist; ?></span>
							</a>
						</div>
						<div class="compare_btn compare">
							<a onclick="addToCompare('<?php echo $product['product_id']; ?>');">
								<span><?php echo $button_compare; ?></span>
							</a>
						</div>
						<span class="clear"></span>
					</div>
					</div>
					<div class="clear"></div>					
				</div>
				<div class="clear"></div>
				</div>
			</li>
		  <?php } ?>
		</ul>
	</div>
	<div class="clear"></div>
  </div>
</div>
