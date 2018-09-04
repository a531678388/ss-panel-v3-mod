





{include file='user/main.tpl'}







	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">套餐列表</h1>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-sm-12">
				<section class="content-inner margin-top-no">
					
					<div class="card">
						<div class="card-main">
							<div class="card-inner">
								<p>套餐不可叠加，新购套餐会覆盖旧商品的到期时间</p>
								<p>购买新套餐时，如果旧套餐未关闭自动续费，则旧套餐的自动续费依然生效</p>
								<p>注：Try-out 体验套餐、Bronze 套餐不包含游戏节点、国内节点</p>
								<p>当前余额：{$user->money} 元</p>
							</div>
						</div>
					</div>
					
					<div class="ui-card-wrap">
						<div class="row">
							<div class="col-lg-12 col-sm-12">
								<div class="card">
									<div class="card-main">
										<div class="card-inner margin-bottom-no">
											<div class="tile-wrap">
												{foreach $shops as $shop}

														<div class="tile tile-collapse">
															<div data-toggle="tile" data-target="#heading{$shop->id}">
																<div class="tile-side pull-left" data-ignore="tile">
																	<div class="avatar avatar-sm">
																		<span class="icon">shop</span>
																	</div>
																</div>
																<div class="tile-inner">
																	<div class="text-overflow">{$shop->name} <span class="label label-brand">{$shop->price} 元</span></div>
																</div>
															</div>
															<div class="collapsible-region collapse" id="heading{$shop->id}">
																<div class="tile-sub" style="padding: 18px">

																	<p class="card-heading">{$shop->name}</p>
																	<hr>
																	
																	<h4 style="margin-top: 12px">商品内容</h4>
																	<p><ul>
																	{if $shop->group_limit() != ''}
																	<li>仅限 {$shop->group_limit()} 群组购买</li>
																	{/if}
																	{if $shop->class_limit_operator() != 'none'}
																	<li>仅限等级{if $shop->class_limit_operator() == 'equal'}等于
																			{elseif $shop->class_limit_operator() == 'greater'}大于
																			{elseif $shop->class_limit_operator() == 'greater_equal'}大于等于
																			{elseif $shop->class_limit_operator() == 'less'}小于
																			{elseif $shop->class_limit_operator() == 'less_equal'}小于等于
																			{elseif $shop->class_limit_operator() == 'not'}非{/if}
																			{$shop->class_limit_content()} 的用户购买</li>
																	{/if}
																	{if $shop->traffic_package() != 0}
																	<li>当前套餐节点</li>
																	{/if}
																	{if $shop->traffic_package() != 0}
																	<li>当前套餐速率</li>
																	{/if}
																	{if $shop->traffic_package() != 0}
																	<li>在月度将会被重置</li>
																	{/if}
																	{if $shop->traffic_package() != 0}
																	<li>流量与套餐同时失效</li>
																	{/if}
																	{if $shop->bandwidth() != 0}
																	<li>{if $shop->traffic_package() != 0}这个月将在套餐基础额外增加 {$shop->bandwidth()}G 流量{else}{$shop->bandwidth()}G 流量{/if}</li>
																	{/if}
																	{if $shop->node_speedlimit() != 0}
																	<li>{$shop->node_speedlimit()}mbps 速率</li>
																	{/if}
																	{if $shop->node_connector() != 0}
																	<li>最多支持 {$shop->node_connector()} IP 同时在线</li>
																	{/if}
																	{if $shop->expire() != 0}
																	<li>账号有效期添加 {$shop->expire()} 天</li>
																	{/if}
																	{if $shop->user_class() != 0}
																	<li>套餐有效期 {$shop->class_expire()} 天</li>
																	{/if}
																	{if $shop->reset() != 0}
																	<li>每 {$shop->reset()} 天重置一次流量</li>
																	{/if}
																	</ul></p>
																	
																	<h4 style="margin-top: 12px">自动续费</h4>
																	{if $shop->auto_renew==0}
																	<p><span class="label label-brand">不能自动续费</span></p>
																	{else}
																	<p>在 <span class="label label-brand">{$shop->auto_renew}</span> 天后自动续费（可选）</p>
																	{/if}
																	
																	<h4 style="margin-top: 12px">购买或续费时是否重置流量</h4>
																	{if $shop->auto_reset_bandwidth==0}
																	<p><span class="label label-brand">不重置</span></p>
																	{else}
																	<p><span class="label label-brand">重置</span></p>
																	{/if}
																	
																	<h4 style="margin-top: 12px">价格</h4>
																	<p><span class="label label-brand-accent">{$shop->price} 元</span></p>
																	
																	<hr>
																	<a class="btn btn-brand" style="background-color: #4cae4c; padding-right: 16px"
																			{if !$shop->canBuy($user)}disabled{else} href="javascript:void(0);" onClick="buy('{$shop->id}',{$shop->auto_renew},{$shop->auto_reset_bandwidth})"{/if}>
																		<span class="icon" style="margin-left: 8px; margin-right: 8px">local_grocery_store</span>立即购买</a>
																	<a class="btn btn-brand" style="background-color: #337ab7; padding-right: 16px; margin-left: 8px" href="/user/code">
																		<span class="icon" style="margin-left: 8px; margin-right: 8px">local_gas_station</span>充值</a>



																</div>



															</div>



													</div>

												{/foreach}
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<div aria-hidden="true" class="modal modal-va-middle fade" id="coupon_modal" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">您有优惠码吗？</h2>
								</div>
								<div class="modal-inner">
									<div class="form-group form-group-label">
										<label class="floating-label" for="coupon">有的话，请在这里输入。没有的话，请直接确定。</label>
										<input class="form-control" id="coupon" type="text">
									</div>
								</div>
								<div class="modal-footer">
									<p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" id="coupon_input" type="button">确定</button></p>
								</div>
							</div>
						</div>
					</div>
					
					
					<div aria-hidden="true" class="modal modal-va-middle fade" id="order_modal" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-xs">
							<div class="modal-content">
								<div class="modal-heading">
									<a class="modal-close" data-dismiss="modal">×</a>
									<h2 class="modal-title">订单确认</h2>
								</div>
								<div class="modal-inner">
									<p id="name">商品名称：</p>
									<p id="credit">优惠额度：</p>
									<p id="total">总金额：</p>
									<p id="auto_reset">在到期时自动续费</p>
									
									<div class="checkbox switch" id="autor">
										<label for="autorenew">
											<input checked class="access-hide" id="autorenew" type="checkbox"><span class="switch-toggle"></span>自动续费
										</label>
									</div>

								</div>
								
								<div class="modal-footer">
									<p class="text-right"><button class="btn btn-flat btn-brand waves-attach" data-dismiss="modal" id="order_input" type="button">确定</button></p>
								</div>
							</div>
						</div>
					</div>
					
					{include file='dialog.tpl'}
	
			</div>
			
			
			
		</div>
	</main>









{include file='user/footer.tpl'}


<script>
function buy(id,auto,auto_reset) {
	auto_renew=auto;
	if(auto==0)
	{
		document.getElementById('autor').style.display="none";
	}
	else
	{
		document.getElementById('autor').style.display="";
	}
	
	if(auto_reset==0)
	{
		document.getElementById('auto_reset').style.display="none";
	}
	else
	{
		document.getElementById('auto_reset').style.display="";
	}
	
	shop=id;
	$("#coupon_modal").modal();
}


$("#coupon_input").click(function () {
		$.ajax({
			type: "POST",
			url: "coupon_check",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop
			},
			success: function (data) {
				if (data.ret) {
					$("#name").html("商品名称："+data.name);
					$("#credit").html("优惠额度："+data.credit);
					$("#total").html("总金额："+data.total);
					$("#order_modal").modal();
				} else {
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error: function (jqXHR) {
				$("#result").modal();
                $("#msg").html(data.msg+"  发生了错误。");
			}
		})
	});
	
$("#order_input").click(function () {

		if(document.getElementById('autorenew').checked)
		{
			var autorenew=1;
		}
		else
		{
			var autorenew=0;
		}
			
		$.ajax({
			type: "POST",
			url: "buy",
			dataType: "json",
			data: {
				coupon: $("#coupon").val(),
				shop: shop,
				autorenew: autorenew
			},
			success: function (data) {
				if (data.ret) {
					$("#result").modal();
					$("#msg").html(data.msg);
					window.setTimeout("location.href='/user/shop'", {$config['jump_delay']});
				} else {
					$("#result").modal();
					$("#msg").html(data.msg);
				}
			},
			error: function (jqXHR) {
				$("#result").modal();
                $("#msg").html(data.msg+"  发生了错误。");
			}
		})
	});

</script>