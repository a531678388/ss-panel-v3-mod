







{include file='user/main.tpl'}


<script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>
<script src="//cdn.staticfile.org/jquery/2.2.1/jquery.min.js"></script>

<style>
  span#inline-yellow {
	display:inline;
	padding:.2em .6em .3em;
	font-size:80%;
	font-weight:bold;
	line-height:1;
	color:#fff;
	text-align:center;
	white-space:nowrap;
	vertical-align:baseline;
	border-radius:0;
	background-color: #f0ad4e;
}
// 颜色块-绿
span#inline-green {
	display:inline;
	padding:.2em .6em .3em;
	font-size:80%;
	font-weight:bold;
	line-height:1;
	color:#fff;
	text-align:center;
	white-space:nowrap;
	vertical-align:baseline;
	border-radius:0;
	background-color: #5cb85c;
}
// 颜色块-蓝
span#inline-blue {
	display:inline;
	padding:.2em .6em .3em;
	font-size:80%;
	font-weight:bold;
	line-height:1;
	color:#fff;
	text-align:center;
	white-space:nowrap;
	vertical-align:baseline;
	border-radius:0;
	background-color: #2780e3;
}
// 颜色块-紫
span#inline-purple {
	display:inline;
	padding:.2em .6em .3em;
	font-size:80%;
	font-weight:bold;
	line-height:1;
	color:#fff;
	text-align:center;
	white-space:nowrap;
	vertical-align:baseline;
	border-radius:0;
	background-color: #9954bb;
}
// 左侧边框红色块级
p#div-border-left-red {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-left-width: 5px;
	border-radius: 3px;
	border-left-color: #df3e3e;
}
// 左侧边框黄色块级
p#div-border-left-yellow {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-left-width: 5px;
	border-radius: 3px;
	border-left-color: #f0ad4e;
}
// 左侧边框绿色块级
p#div-border-left-green {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-left-width: 5px;
	border-radius: 3px;
	border-left-color: #5cb85c;
}
// 左侧边框蓝色块级
p#div-border-left-blue {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-left-width: 5px;
	border-radius: 3px;
	border-left-color: #2780e3;
}
// 左侧边框紫色块级
p#div-border-left-purple {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-left-width: 5px;
	border-radius: 3px;
	border-left-color: #9954bb;
}
// 右侧边框红色块级
p#div-border-right-red {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-right-width: 5px;
	border-radius: 3px;
	border-right-color: #df3e3e;
}
// 右侧边框黄色块级
p#div-border-right-yellow {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-right-width: 5px;
	border-radius: 3px;
	border-right-color: #f0ad4e;
}
// 右侧边框绿色块级
p#div-border-right-green {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-right-width: 5px;
	border-radius: 3px;
	border-right-color: #5cb85c;
}
// 右侧边框蓝色块级
p#div-border-right-blue {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-right-width: 5px;
	border-radius: 3px;
	border-right-color: #2780e3;
}
// 右侧边框紫色块级
p#div-border-right-purple {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-right-width: 5px;
	border-radius: 3px;
	border-right-color: #9954bb;
}
// 上侧边框红色
p#div-border-top-red {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-top-width: 5px;
	border-radius: 3px;
	border-top-color: #df3e3e;
}
// 上侧边框黄色
p#div-border-top-yellow {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-top-width: 5px;
	border-radius: 3px;
	border-top-color: #f0ad4e;
}
// 上侧边框绿色
p#div-border-top-green {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-top-width: 5px;
	border-radius: 3px;
	border-top-color: #5cb85c;
}
// 上侧边框蓝色
p#div-border-top-blue {
	display: block;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-top-width: 5px;
	border-radius: 3px;
	border-top-color: #2780e3;
}
  
  
</style>

	<main class="content">
		
			<section class="content-inner margin-top-no">

        {$id=0}
        {foreach $node_classes as $single_classes}
				<div class="ui-card-wrap">
					<div class="row">
						<div class="col-lg-12 col-sm-12">
							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
                                      <div class="card-heading {$single_classes['style']}">{$single_classes['desc']}</div>
										<div class="tile-wrap">
											{foreach $single_classes['nodes'] as $prefix => $nodes}
												{$id=$id+1}
													<div class="tile tile-collapse">
														<div data-toggle="tile" data-target="#heading{$node_order->$prefix}">
															<div class="tile-side pull-left" data-ignore="tile">
                                                                  <p class="node-header-title">
                                                                    <span class="tag {if $node_heartbeat[$prefix]=='在线'}is-success{else}is-danger{/if}">{if $node_heartbeat[$prefix]=='在线'}在线{else}维护{/if}</span>
                                                                  </p>
                                                                    <!--
																	<span class="icon {if $node_heartbeat[$prefix]=='在线'}text-green{else}{if $node_heartbeat[$prefix]=='暂无数据'}text-orange{else}text-red{/if}{/if}">{if $node_heartbeat[$prefix]=="在线"}backup{else}{if $node_heartbeat[$prefix]=='暂无数据'}report{else}warning{/if}{/if}</span>
                                                                    -->
															</div>
															<div class="tile-inner">
																{* <div class="node-header-title">{$speedssr}{$prefix} {if $user->id == 4} | <i class="icon icon-lg">person</i> {$node_alive[$prefix]} {/if} | <i class="icon icon-lg">cloud_download</i> {$node_method[$prefix]} | <i class="icon icon-lg">data_usage</i> {if isset($node_bandwidth[$prefix])==true}{$node_bandwidth[$prefix]}{else}N/A{/if}</div> *}
                                                              
                                                               <div class="node-header-title">{$speedssr}{$prefix} | <i class="icon icon-lg">person</i> {$node_alive[$prefix]} | <i class="icon icon-lg">cloud_download</i> {$node_method[$prefix]} | <i class="icon icon-lg">data_usage</i> {if isset($node_bandwidth[$prefix])==true}{$node_bandwidth[$prefix]}{else}N/A{/if}</div>
															</div>
														</div>
														<div class="collapsible-region collapse" id="heading{$node_order->$prefix}">
															<div class="tile-sub">

																<br>

																{foreach $nodes as $node}

																	{$relay_rule = null}
																	{if $node->sort == 10}
																		{$relay_rule = $tools->pick_out_relay_rule($node->id, $user->port, $relay_rules)}
																	{/if}

																	{if $node->mu_only != 1}
																	<div class="card">
																		<div class="card-main">
																			<div class="card-inner">

                                                                            {if $single_classes['access'] == 1}
                                                                                <p class="node-info-access" >
                                                                                    <a href="javascript:void(0);" onClick="urlChange('{$node->id}',0,{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">{$speedssr}{$node->name}{if $relay_rule != null} - {$relay_rule->dist_node()->name}{/if}</a>
                                                                                    <span class="label label-brand-accent">{$node->status}</span>
                                                                                </p>

                                                                                <div class="card-content">

                                                                                {if $node->sort > 2 && $node->sort != 5 && $node->sort != 10}
                                                                                    <p>地址：<span class="label" >
                                                                                    <a href="javascript:void(0);" onClick="urlChange('{$node->id}',0,0)">请点这里进入查看详细信息</a>
                                                                                {else}
                                                                                    <p>地址：<span class="label label-brand-accent">
                                                                                    {$node->server}
                                                                                {/if}

                                                                                    </span></p>

                                                                                {if $node->sort == 0||$node->sort==7||$node->sort==8||$node->sort==10}


                                                                                    <p>流量比例：<span class="label label-red">
                                                                                        {$node->traffic_rate}
                                                                                    </span></p>



                                                                                    {if ($node->sort==0||$node->sort==7||$node->sort==8||$node->sort==10)&&($node->node_speedlimit!=0||$user->node_speedlimit!=0)}
                                                                                       
                                                                                            {if $node->node_class == 0}
                                                                                         	 <p>用户限速：<span class="label label-green">{$user->bandwidth}Mbps
                                                                                            {elseif $node->node_speedlimit > 0}      
                                                                                             <p>节点限速：<span class="label label-green">{$node->node_speedlimit}Mbps
                                                                                            {else}
                                                                                             <p>用户限速：<span class="label label-green">{$user->bandwidth}Mbps
                                                                                            {/if}
                                                                                        </span></p>
                                                                                    {/if}
                                                                                {/if}

                                                                                <p>{$node->info}</p>
                                                                                </div>
                                                                             {else}
                                                                                <div class="node-info-access" >
                                                                                 <p>您的当前等级无法使用{$single_classes['desc']},请<a href="/user/shop">点击这里</a>购买相应套餐.</p>
                                                                                 </div>

                                                                             {/if}
                                                                              </div>

																		</div>
																	</div>
																	{/if}

																	{if ($single_classes['access'] == 1 && ($node->sort == 0 || $node->sort == 10))}
																		{$point_node=$node}
																	{/if}



																	{if ($node->sort == 0 || $node->sort == 10) && $node->custom_rss == 1 && $node->mu_only != -1 && $single_classes['access'] == 1}
																		{foreach $node_muport as $single_muport}

																			{if !($single_muport['server']->node_class <= $user->class && ($single_muport['server']->node_group == 0 || $single_muport['server']->node_group == $user->node_group))}
																				{continue}
																			{/if}

																			{if !($single_muport['user']->class >= $node->node_class && ($node->node_group == 0 || $single_muport['user']->node_group == $node->node_group))}
																				{continue}
																			{/if}

																			{$relay_rule = null}
																			{if $node->sort == 10 && $single_muport['user']['is_multi_user'] != 2}
																				{$relay_rule = $tools->pick_out_relay_rule($node->id, $single_muport['server']->server, $relay_rules)}
																			{/if}

																			<div class="card">
																				<div class="card-main">
																					<div class="card-inner">
																					<p  class="node-info-access"  >
																						<a href="javascript:void(0);" onClick="urlChange('{$node->id}',{$single_muport['server']->server},{if $relay_rule != null}{$relay_rule->id}{else}0{/if})">{$prefix} {if $relay_rule != null} - {$relay_rule->dist_node()->name}{/if} {$single_muport['server']->server} 端口</a>
																						<span class="label label-brand-accent">{$node->status}</span>
																					</p>


																					<p>地址：<span class="label label-brand-accent">
																					{$node->server}

																					</span></p>

																					<p>端口：<span class="label label-brand-red">
																						{$single_muport['user']['port']}
																					</span></p>

																					<p>加密方式：<span class="label label-brand">
																						{$single_muport['user']['method']}
																					</span></p>

																					<p>协议：<span class="label label-brand-accent">
																						{$single_muport['user']['protocol']}
																					</span></p>

																					{if $single_muport['user']['is_multi_user'] != 0}
																					<p>协议参数：<span class="label label-green">
																						{$user->id}:{$user->passwd}
																					</span></p>
																					{/if}

																					<p>混淆方式：<span class="label label-brand">
																						{$single_muport['user']['obfs']}
																					</span></p>

																					{if $single_muport['user']['is_multi_user'] == 1}
																					<p>混淆参数：<span class="label label-green">
																						{$single_muport['user']['obfs_param']}
																					</span></p>
																					{/if}

																					<p>流量比例：<span class="label label-red">
																						{$node->traffic_rate}
																					</span></p>

																					<p>{$node->info}</p>

																					 </div>

																				</div>
																			</div>
																		{/foreach}
																	{/if}
																{/foreach}



																{if isset($point_node)}
																	{if $point_node!=null}

																		<div class="card">
																			<div class="card-main">
																				<div class="card-inner" id="info{$id}">

																				</div>
																			</div>
																		</div>

																		<script>
																		$().ready(function(){
																			$('#heading{$node_order->$prefix}').on("shown.bs.tile", function() {

																				$("#info{$id}").load("/user/node/{$point_node->id}/ajax");

																			});
																		});
																		</script>
																	{/if}
																{/if}

																{$point_node=null}




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
                {/foreach}


						<div aria-hidden="true" class="modal modal-va-middle fade" id="nodeinfo" role="dialog" tabindex="-1">
							<div class="modal-dialog modal-full">
								<div class="modal-content">
									<iframe class="iframe-seamless" title="Modal with iFrame" id="infoifram"></iframe>
								</div>
							</div>
						</div>

			</section>
	</main>







{include file='user/footer.tpl'}


<script>
window.onload = function(e){ 
  document.getElementById('catcat').innerHTML="节点列表";
}

function urlChange(id,is_mu,rule_id) {
    var site = './node/'+id+'?ismu='+is_mu+'&relay_rule='+rule_id;
	if(id == 'guide')
	{
		var doc = document.getElementById('infoifram').contentWindow.document;
		doc.open();
		doc.write('<img src="https://www.zhaoj.in/wp-content/uploads/2016/07/1469595156fca44223cf8da9719e1d084439782b27.gif" style="width: 100%;height: 100%;background-color: (255,255,255,0.2);border: none;"/>');
		doc.close();
	}
	else
	{
		document.getElementById('infoifram').src = site;
	}
	$("#nodeinfo").modal();
}
</script>