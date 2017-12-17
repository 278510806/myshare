<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- 开发阶段取消浏览器缓存，正式使用时需要去掉 -->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="expires" content="0">
<title>Typography | BlueWhale Admin</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/reset.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/text.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/grid.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/layout.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/nav.css"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/imageflow.css"
	media="screen" />

<!--[if IE 6]><link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/css/ie6.css" media="screen" /><![endif]-->
<!--[if IE 7]><link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/css/ie.css" media="screen" /><![endif]-->
<link
	href="${pageContext.servletContext.contextPath }/css/table/demo_page.css"
	rel="stylesheet" type="text/css" />
<!-- BEGIN: load jquery -->
<script
	src="${pageContext.servletContext.contextPath }/js/jquery-1.6.4.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery-ui/jquery.ui.core.min.js"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/jquery-ui/jquery.ui.widget.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/jquery-ui/jquery.ui.accordion.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/jquery-ui/jquery.effects.core.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/jquery-ui/jquery.effects.slide.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/jquery-ui/jquery.ui.mouse.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/jquery-ui/jquery.ui.sortable.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.servletContext.contextPath }/js/table/jquery.dataTables.min.js"
	type="text/javascript"></script>
<!-- END: load jquery -->
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/table/table.js"></script>
<script src="${pageContext.servletContext.contextPath }/js/setup.js"
	type="text/javascript"></script>
<style type="text/css">
body {
	margin: 0px;
	padding: 0px
}
</style>
<script type="text/javascript">
	function setIframeHeight(iframe) {
		if (iframe) {
			var iframeWin = iframe.contentWindow
					|| iframe.contentDocument.parentWindow;
			if (iframeWin.document.body) {
				iframe.height = iframeWin.document.documentElement.scrollHeight
						|| iframeWin.document.body.scrollHeight;
			}
		}
	};
	function changeFrameHeight() {
		var ifm = document.getElementById("external-frame");
		ifm.height = document.documentElement.clientHeight;
	}
	window.onresize = function() {
		changeFrameHeight();
	}
	$(document).ready(function() {
		setupLeftMenu();
		//setIframeHeight(document.getElementById('external-frame'));
		var ifm = document.getElementById("external-frame");
		ifm.height = document.documentElement.clientHeight - 200;
	});
</script>
</head>
<body>
	<div class="container_12">
		<div class="grid_12 header-repeat">
			<div id="branding">
				<div class="floatleft">
					<img src="img/logo.png" alt="Logo" />
				</div>
				<div class="floatright">
					<div class="floatleft">
						<img src="img/img-profile.jpg" alt="Profile Pic" />
					</div>
					<div class="floatleft marginleft10">
						<ul class="inline-ul floatleft">
							<li>${sessionScope.loginUser.loginname }</li>
							<li><a href="#">Config</a></li>
							<li><a href="logout.action">Logout</a></li>
						</ul>
						<br /> <span class="small grey">Last Login: 3 hours ago</span>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="grid_12">
			<ul class="nav main">

				<li class="ic-dashboard"><a
					href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=documents"
					target="external-frame"><span>文档</span></a>
					<ul>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=word"
							target="external-frame">word</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=excel"
							target="external-frame">excel</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=pdf"
							target="external-frame">pdf</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=documentOther"
							target="external-frame">其它</a></li>
					</ul></li>

				<li class="ic-grid-tables"><a
					href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=archive"
					target="external-frame"><span>压缩包</span></a>
					<ul>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=rar"
							target="external-frame">rar</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=zip"
							target="external-frame">zip</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=jar"
							target="external-frame">jar</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=gz"
							target="external-frame">gz</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=tar"
							target="external-frame">tar</a></li>
					</ul></li>
				<li class="ic-gallery dd "><a
					href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=picture"
					target="external-frame"><span>图片</span></a></li>
				<li class="ic-grid-tables"><a
					href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=video"
					target="external-frame"><span>视频</span></a></li>
				<li class="ic-dashboard"><a
					href="${pageContext.servletContext.contextPath }/fileKinds.action?kind=audio"
					target="external-frame"><span>音频</span></a>
					<ul>
						<li><a href="image-gallery.html"></a></li>
						<li><a href="gallery-with-filter.html"></a></li>
					</ul></li>
				<li class="ic-form-style"><a href="#" title="最近创建、访问或修改过的文件"
					target="external-frame"><span>最近文件</span></a>
					<ul>
						<li><a
							href="${pageContext.servletContext.contextPath }/findByTime.action?scope=week"
							target="external-frame">本周</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/findByTime.action?scope=month"
							target="external-frame">本月</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/findByTime.action?scope=threeMonth"
							target="external-frame">三个月</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/findByTime.action?scope=year"
							target="external-frame">一年</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/findByTime.action?scope=exceedYear"
							target="external-frame">一年以上</a></li>
						<li><a
							href="${pageContext.servletContext.contextPath }/findByTime.action?scope=custom"
							target="external-frame">自定义</a></li>
					</ul></li>
				<li class="ic-notifications"><a href="notifications.html"
					target="external-frame"><span>文件树</span></a></li>
				<li class="ic-notifications"><a href="notifications.html"
					target="external-frame"><span>精确查找</span></a></li>
			</ul>
		</div>
		<div class="clear"></div>
		<div id="grid_2" class="grid_2">
			<div class="box sidemenu">
				<div class="block" id="section-menu">
					<ul class="section menu">
						<li><a class="menuitem" target="external-frame">文档</a>
							<ul class="submenu">
								<li><a target="external-frame">word</a></li>
								<li><a target="external-frame">pdf</a></li>
								<li><a target="external-frame">其它</a></li>
							</ul></li>
						<li><a class="menuitem" target="external-frame">压缩包</a>
							<ul class="submenu">
								<li><a>Submenu 1</a></li>
								<li><a>Submenu 2</a></li>
								<li><a>Submenu 3</a></li>
								<li><a>Submenu 4</a></li>
								<li><a>Submenu 5</a></li>
							</ul></li>
						<li><a class="menuitem" target="external-frame">最近文件</a>
							<ul class="submenu">
								<li><a>Submenu 1</a></li>
								<li><a>Submenu 2</a></li>
								<li><a>Submenu 3</a></li>
								<li><a>Submenu 4</a></li>
								<li><a>Submenu 5</a></li>
							</ul></li>
						<li><a class="menuitem" target="external-frame">图片</a>
							<ul class="submenu">
								<li><a>Submenu 1</a></li>
								<li><a>Submenu 2</a></li>
								<li><a>Submenu 3</a></li>
								<li><a>Submenu 4</a></li>
								<li><a>Submenu 5</a></li>
							</ul></li>
						<li><a class="menuitem" target="external-frame">视频</a>
							<ul class="submenu">
								<li><a>Submenu 1</a></li>
								<li><a>Submenu 2</a></li>
								<li><a>Submenu 3</a></li>
								<li><a>Submenu 4</a></li>
								<li><a>Submenu 5</a></li>
							</ul></li>
						<li><a class="menuitem" target="external-frame">音频</a>
							<ul class="submenu">
								<li><a>Submenu 1</a></li>
								<li><a>Submenu 2</a></li>
								<li><a>Submenu 3</a></li>
								<li><a>Submenu 4</a></li>
								<li><a>Submenu 5</a></li>
							</ul></li>

						<li><a class="menuitem" target="external-frame">家庭（综合）</a>
							<ul class="submenu">
								<li><a>Submenu 1</a></li>
								<li><a>Submenu 2</a></li>
								<li><a>Submenu 3</a></li>
								<li><a>Submenu 4</a></li>
								<li><a>Submenu 5</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="table_parent" class="grid_10">
			<div id="pic" style="display: none; border: 1px solid"></div>
			<div id="LoopDiv" style="display: none">
				<span onclick="$('#LoopDiv').empty().hide();"
					style="border: 1px solid black; width: 50px; height: 50px; float: right; background: #E0E0E0; text-align: center; poline-height: 50px; color: white; font-weight: bold;cursor: pointer">CLOSE</span>
			</div>
			<iframe id="external-frame" name="external-frame"
				style="width: 100%; overflow: auto" onload="changeFrameHeight()"
				src="${pageContext.servletContext.contextPath }/notifications.action"></iframe>
		</div>
		<div class="clear"></div>
	</div>
	<div class="clear"></div>
	<div id="site_info">
		<p>
			Copyright <a href="#">BlueWhale Admin</a>. All Rights Reserved.More
			Templates <a href="http://www.cssmoban.com/" target="_blank"
				title="模板之家">模板之家</a> - Collect from <a
				href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
		</p>
	</div>
</body>
<script type="text/javascript">
	function _dispInDiv(img, path) {
		//alert("aaa");
		$
				.ajax({
					type : "POST",
					url : "${pageContext.servletContext.contextPath }/findDirectoryImageIds.action",
					data : "path=" + path,
					success : function(data) {
						//alert(data.length);
						var html = '\
				<input id="S_Num" type="hidden" value="8" />\
					<div id="starsIF" class="imageflow"> \
					';
						for (var i = 0; i < data.length; i++) {
							var map = data[i];
							html += "<img   src='dispPic.action?"
									+ new Date().getTime() + "&id=" + map.id
									+ "'/>";
						}
						html += "</div>";
						//alert(html);
						$("#LoopDiv").append(html).css({
							"position" : "absolute",
							"left" : 0,
							"top" : 0,
							"width" : "100%",
							"height":"100%",
							"border" : "1px solid black",
							"background":"#F0F0F0"
						}).show();
						$("#pic").hide();
						$
								.getScript("${pageContext.servletContext.contextPath }/js/imageflow.js");
					}
				});
	}
</script>
</html>
