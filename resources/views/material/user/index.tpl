

{include file='user/main.tpl'}

{$ssr_prefer = URL::SSRCanConnect($user, 0)}


	<main class="content">
		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户中心</h1>
			</div>
		</div>
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">Dler CLoud</p>
										<p><a href="https://t.me/black_hole_talk" target="_blank">交流群组</a> | <a href="https://t.me/black_hole_channel" target="_blank">公告面板</a> | <a href="https://t.me/DlerCloud_bot" target="_blank">Telegram bot</a> | <a href="/client.html" target="_blank">软件中心</a> | <a href="https://docs.lhie1.com/black-hole" target="_blank">文档中心</a></p>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">动态公告（<a href="/user/announcement"/>更多</a>）</p>
										{if $ann != null}
										<p>{$ann->content}</p>
										{/if}
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">All-in-One</p>
										<p>为您提供订阅地址和托管地址，包含了所有节点信息，方便您在诸多的服务器中快速添加，快速切换！</p>
										<p>请前往<a href="/client.html" target="_blank">「软件中心」</a>获取客户端</p> 
										<p>请前往<a href="https://docs.lhie1.com/black-hole" target="_blank">「使用教程」</a>（<a href="https://github.com/lhie1/Document/blob/master/SUMMARY.md" target="_blank">备用地址</a>）观看使用教程</p> 
										<p>请前往<a href="https://docs.lhie1.com/black-hole/tong-yong" target="_blank">「通用」</a>获得帮助与指导</p> 
										<nav class="tab-nav margin-top-no">
											<ul class="nav nav-list">
												<li {if $ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ssr"><i class="icon icon-lg">airplanemode_active</i>&nbsp;ShadowsocksR</a>
												</li>
												<li {if !$ssr_prefer}class="active"{/if}>
													<a class="waves-attach" data-toggle="tab" href="#all_ss"><i class="icon icon-lg">flight_takeoff</i>&nbsp;Shadowsocks</a>
												</li>
										</nav>
										{if $user->class!=0}
										<div class="card-inner">
											<div class="tab-content">
												<div class="tab-pane fade {if $ssr_prefer}active in{/if}" id="all_ssr">
													{$pre_user = URL::cloneUser($user)}
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ssr_info"><i class="icon icon-lg">info_outline</i>&nbsp;</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ssr_info">
														{$user = URL::getSSRConnectInfo($pre_user)}
														{$ssr_url_all = URL::getAllUrl($pre_user, 0, 0, 1)}

														{$ssr_url_all_mu_123 = URL::getAllUrl($pre_user, 123, 0, 1)}
														{$ssr_url_all_mu_30000 = URL::getAllUrl($pre_user, 30000, 0, 1)}

														{if URL::SSRCanConnect($user)}
														<dl class="dl-horizontal">
															<p><a class="copy-text" data-clipboard-text="{$ssr_url_all}">复制普通端口节点信息配置</a></p>
															<p><a href="/user/getpcconf?is_mu=0&is_ss=0">下载普通端口节点信息配置</a></p>
															<p><a class="copy-text" data-clipboard-text="{$ssr_url_all_mu_123}">复制固定端口（123）节点信息配置</a></p>
															<p><a class="copy-text" data-clipboard-text="{$ssr_url_all_mu_30000}">复制固定端口（30000）节点信息配置</a></p>
															<p><a href="/user/getpcconf?is_mu=123&is_ss=0">下载固定端口（123）节点信息配置</a></p>
															<p><a href="/user/getpcconf?is_mu=30000&is_ss=0">下载固定端口（30000）节点信息配置</a></p><br>

															<button class="btn btn-flat waves-attach" id="mode-ss" ><span class="icon">check</span>&nbsp;修改为 SS 模式</button>
														</dl>
														{else}
															<p><a class="copy-text" data-clipboard-text="{$ssr_url_all_mu_123}">复制固定端口（123）节点信息配置</a></p>
															<p><a class="copy-text" data-clipboard-text="{$ssr_url_all_mu_30000}">复制固定端口（30000）节点信息配置</a></p>
															<p><a href="/user/getpcconf?is_mu=123&is_ss=0">下载固定端口（123）节点信息配置</a></p>
															<p><a href="/user/getpcconf?is_mu=30000&is_ss=0">下载固定端口（30000）节点信息配置</a></p>
														{/if}
													</div>
												</div>
												<div class="tab-pane fade {if !$ssr_prefer}active in{/if}" id="all_ss">
													<nav class="tab-nav margin-top-no">
														<ul class="nav nav-list">
															<li class="active">
																<a class="waves-attach" data-toggle="tab" href="#all_ss_info"><i class="icon icon-lg">info_outline</i>&nbsp;</a>
															</li>
														</ul>
													</nav>
													<div class="tab-pane fade active in" id="all_ss_info">
														{$user = URL::getSSConnectInfo($pre_user)}
														{$ss_url_all = URL::getAllUrl($pre_user, 0, 1, 1)}
														{$ss_url_all_mu = URL::getAllUrl($pre_user, 1, 1, 1)}
														{$ss_url_all_win = URL::getAllUrl($pre_user, 0, 2, 1)}

														{if URL::SSCanConnect($user)}
														<dl class="dl-horizontal">
															<p><a class="copy-text" data-clipboard-text="{$ss_url_all_win}">复制节点信息配置</a></p>
															<p><a href="/user/getpcconf?is_mu=0&is_ss=1">下载节点信息配置</a></p><br>

															<button class="btn btn-flat waves-attach" id="mode-ssr" ><span class="icon">check</span>&nbsp;修改为 SSR 模式（使用 SSR/SSRR 客户端）</button>
														</dl>
														{else}
															<p>您目前的加密方式、协议、混淆为 SSR 模式，推荐使用普通端口订阅地址</p><br>

															<button class="btn btn-flat waves-attach" id="mode-ss" ><span class="icon">check</span>&nbsp;修改为 SS 模式（使用 Surge/Surfboard 客户端）</button>
														{/if}
													</div>
												</div>
											</div>
										</div>

										<div class="card-action">
											<p class="card-heading">订阅地址（SSR 模式）</p>
											{if URL::SSRCanConnect($user)}
											<p>普通端口订阅地址</p>
											<p><code>{$apiUrl}/link/{$ssr_sub_token}?mu=0</code></p>
											<button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$apiUrl}/link/{$ssr_sub_token}?mu=0">点击拷贝</button>
											<p><a href="Shadowrocket://add/sub://{$shadowrocket_url_0}" target="_blank"><span class="icon">check</span>&nbsp;Shadwrocket：一键导入</a></button>
											{/if}
											<p>固定端口（123）订阅地址</p>
											<p><code>{$apiUrl}/link/{$ssr_sub_token}?mu=123</code></p>
											<button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$apiUrl}/link/{$ssr_sub_token}?mu=123">点击拷贝</button>
											<p><a href="Shadowrocket://add/sub://{$shadowrocket_url_123}" target="_blank"><span class="icon">check</span>&nbsp;Shadwrocket：一键导入</a></p>
											<p>固定端口（30000）订阅地址</p>
											<p><code>{$apiUrl}/link/{$ssr_sub_token}?mu=30000</code></p>
											<button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$apiUrl}/link/{$ssr_sub_token}?mu=30000">点击拷贝</button>
											<p><a href="Shadowrocket://add/sub://{$shadowrocket_url_30000}" target="_blank"><span class="icon">check</span>&nbsp;Shadwrocket：一键导入</a></p>
										</div>

										{if URL::SSCanConnect($user)}
										<div class="card-action">
											<p class="card-heading">托管地址（SS 模式）</p>
											<p>Surge / Surfboard 托管地址</p>
											<p><code>{$apiUrl}/link/{$ios_token}?is_ss=1</code></p>
											<button class="copy-text btn btn-subscription" type="button" data-clipboard-text="{$apiUrl}/link/{$ios_token}?is_ss=1">点击拷贝</button>
											<p><a href="surge:///install-config?url={$surge_url}" target="_blank"><span class="icon">check</span>&nbsp;Surge：一键导入</a></p>
										</div>
										{/if}
										
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<p><a class="reset-link btn btn-brand btn-flat waves-attach" ><span class="icon">autorenew</span>&nbsp;重置订阅链接</a></p>
											</div>
										</div>
										{else}
										<div class="card-action">
											<div class="card-action-btn pull-left">
												<a href="/user/shop">
													<i class="icon icon-lg">info</i>&nbsp;已到期或未购买
												</a>
											</div>
										</div>
										{/if}
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6 col-md-6">

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">账户信息</p>
										<dl class="dl-horizontal">
											<p><dt>用户名</dt>
											<dd>{$user->user_name}</dd></p>

											<p><dt>账号等级</dt>
											<dd>{$user->class}</dd></p>

											<p><dt>到期时间</dt>
											<dd>{$user->class_expire}</dd></p>

											<p><dt>余额</dt>
											<dd>{$user->money} 元</p></p>

											<p><dt>速度限制</dt>
											{if $user->node_speedlimit!=0}
											<dd>{$user->node_speedlimit}mbps</dd>
											{else}
											<dd>∞</dd>
											{/if}</p>

											<p><dt>在线 IP</dt>
											<dd>{$user->online_ip_count()} / {if $user->node_connector!=0}{$user->node_connector}{else}∞{/if}</dd></p>

											<p><dt>最近使用时间</dt>
											<dd>{$user->lastSsTime()}</dd></p>
										</dl>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">连接信息</p>
											<dl class="dl-horizontal">
												<p><dt>端口</dt>
												<dd>{$user->port}</dd></p>

												<p><dt>密码</dt>
												<dd>{$user->passwd}</dd></p>

												<p><dt>加密</dt>
												<dd>{$user->method}</dd></p>

												<p><dt>协议</dt>
												<dd>{$user->protocol}</dd></p>

												<p><dt>混淆</dt>
												<dd>{$user->obfs}</dd></p>
											</dl>
									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">

										<div id="traffic_chart" style="height: 300px; width: 100%;"></div>

										<script src="//cdn.staticfile.org/canvasjs/1.7.0/canvasjs.js"></script>
										<script type="text/javascript">
											var chart = new CanvasJS.Chart("traffic_chart",
											{
												title:{
													text: "流量使用情况",
													fontFamily: "Impact",
													fontWeight: "normal"
												},

												legend:{
													verticalAlign: "bottom",
													horizontalAlign: "center"
												},
												data: [
												{
													//startAngle: 45,
													indexLabelFontSize: 20,
													indexLabelFontFamily: "Garamond",
													indexLabelFontColor: "darkgrey",
													indexLabelLineColor: "darkgrey",
													indexLabelPlacement: "outside",
													type: "doughnut",
													showInLegend: true,
													dataPoints: [
														{if $user->transfer_enable != 0}
														{
															y: {$user->last_day_t/$user->transfer_enable*100}, legendText:"已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}", indexLabel: "已用 {number_format($user->last_day_t/$user->transfer_enable*100,2)}% {$user->LastusedTraffic()}"
														},
														{
															y: {($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100}, legendText:"今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}", indexLabel: "今日 {number_format(($user->u+$user->d-$user->last_day_t)/$user->transfer_enable*100,2)}% {$user->TodayusedTraffic()}"
														},
														{
															y: {($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100}, legendText:"剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}", indexLabel: "剩余 {number_format(($user->transfer_enable-($user->u+$user->d))/$user->transfer_enable*100,2)}% {$user->unusedTraffic()}"
														}
														{/if}
													]
												}
												]
											});

											chart.render();
										</script>

									</div>

								</div>
							</div>

							<div class="card">
								<div class="card-main">
									<div class="card-inner margin-bottom-no">
										<p class="card-heading">签到</p>
											<p>每次签到可能减少/增加流量（{$config['checkinMin']} ~ {$config['checkinMax']}MB）。</p>

											<p>您可以点击按钮或者摇动手机来签到。</p>

											<p>上次签到时间：<code>{$user->lastCheckInTime()}</code></p>

											<p id="checkin-msg"></p>

											{if $geetest_html != null}
												<div id="popup-captcha"></div>
											{/if}
									</div>

									<div class="card-action">
										<div class="card-action-btn pull-left">
											{if $user->isAbleToCheckin() }
											{if $user->class !=0}
												<p id="checkin-btn">
														<button id="checkin" class="btn btn-brand btn-flat waves-attach"><span class="icon">check</span>&nbsp;签到</button>
													</p>
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">close</span>&nbsp;未购买不能签到</a></p>
											{/if}
											{else}
												<p><a class="btn btn-brand disabled btn-flat waves-attach" href="#"><span class="icon">close</span>&nbsp;不能签到</a></p>
											{/if}
										</div>
									</div>

								</div>
							</div>

						{include file='dialog.tpl'}

				</div>


				</div>
			</section>
		</div>
	</main>







{include file='user/footer.tpl'}

<script src="/theme/material/js/shake.js/shake.js"></script>


<script>
    $(document).ready(function () {
        $("#mode-ssr").click(function () {
			
            $.ajax({
                type: "POST",
                url: "/user/method",
                dataType: "json",
                data: {
                    method: "chacha20"
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html("成功了");
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
			
           $.ajax({
                type: "POST",
                url: "/user/ssr",
                dataType: "json",
                data: {
                    protocol: "auth_aes128_md5",
                    obfs: "plain"
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>

<script>
    $(document).ready(function () {
        $("#mode-ss").click(function () {
        	
            $.ajax({
                type: "POST",
                url: "/user/method",
                dataType: "json",
                data: {
                    method: "chacha20-ietf-poly1305"
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html("成功了");
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
			
           $.ajax({
                type: "POST",
                url: "/user/ssr",
                dataType: "json",
                data: {
                    protocol: "origin",
                    obfs: "simple_obfs_http"
                },
                success: function (data) {
                    if (data.ret) {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    } else {
                        $("#result").modal();
                        $("#msg").html(data.msg);
                    }
                },
                error: function (jqXHR) {
                    $("#result").modal();
                    $("#msg").html(data.msg+"     出现了一些错误。");
                }
            })
        })
    })
</script>

<script>

$(function(){
	new Clipboard('.copy-text');
});

$(".copy-text").click(function () {
	$("#result").modal();
	$("#msg").html("已拷贝到您的剪贴板，请您继续接下来的操作。");
});

$(".reset-link").click(function () {
	$("#result").modal();
	$("#msg").html("已重置订阅链接，请您继续接下来的操作。");
	window.setTimeout("location.href='/user/url_reset'", {$config['jump_delay']});
});

{if $user->transfer_enable-($user->u+$user->d) == 0}	
window.onload = function() {	
    $("#result").modal();	
    $("#msg").html("您的流量已经用完或套餐已经过期");	
};
{/if}

{if $geetest_html == null}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        $.ajax({
                type: "POST",
                url: "/user/checkin",
                dataType: "json",
                success: function (data) {
                    $("#checkin-msg").html(data.msg);
                    $("#checkin-btn").hide();
					$("#result").modal();
                    $("#msg").html(data.msg);
                },
                error: function (jqXHR) {
					$("#result").modal();
                    $("#msg").html("发生错误：" + jqXHR.status);
                }
            });
    }
};


$(document).ready(function () {
	$("#checkin").click(function () {
		$.ajax({
			type: "POST",
			url: "/user/checkin",
			dataType: "json",
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		})
	})
})


{else}


window.onload = function() {
    var myShakeEvent = new Shake({
        threshold: 15
    });

    myShakeEvent.start();

    window.addEventListener('shake', shakeEventDidOccur, false);

    function shakeEventDidOccur () {
		if("vibrate" in navigator){
			navigator.vibrate(500);
		}

        c.show();
    }
};



var handlerPopup = function (captchaObj) {
	c = captchaObj;
	captchaObj.onSuccess(function () {
		var validate = captchaObj.getValidate();
		$.ajax({
			url: "/user/checkin", // 进行二次验证
			type: "post",
			dataType: "json",
			data: {
				// 二次验证所需的三个值
				geetest_challenge: validate.geetest_challenge,
				geetest_validate: validate.geetest_validate,
				geetest_seccode: validate.geetest_seccode
			},
			success: function (data) {
				$("#checkin-msg").html(data.msg);
				$("#checkin-btn").hide();
				$("#result").modal();
				$("#msg").html(data.msg);
			},
			error: function (jqXHR) {
				$("#result").modal();
				$("#msg").html("发生错误：" + jqXHR.status);
			}
		});
	});
	// 弹出式需要绑定触发验证码弹出按钮
	captchaObj.bindOn("#checkin");
	// 将验证码加到id为captcha的元素里
	captchaObj.appendTo("#popup-captcha");
	// 更多接口参考：http://www.geetest.com/install/sections/idx-client-sdk.html
};

initGeetest({
	gt: "{$geetest_html->gt}",
	challenge: "{$geetest_html->challenge}",
	product: "popup", // 产品形式，包括：float，embed，popup。注意只对PC版验证码有效
	offline: {if $geetest_html->success}0{else}1{/if} // 表示用户后台检测极验服务器是否宕机，与SDK配合，用户一般不需要关注
}, handlerPopup);



{/if}


</script>