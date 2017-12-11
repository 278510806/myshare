<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	<div class="box round first">
		<h2>Notifications</h2>
		<div class="block">

			<div class="message info">
				<h5>技术视频（综合）</h5>
				<p>This is an info message.</p>
			</div>
			<div class="message info">
				<h5>技术文档（综合）</h5>
				<p>This is a success message.</p>
			</div>
			<div class="message success">
				<h5>媒体文件</h5>
				<p>This is a warning message.</p>
			</div>
			<div class="message success">
				<h5>临时</h5>
				<p>This is an error message.</p>
			</div>
		</div>
	</div>
</body>
</html>