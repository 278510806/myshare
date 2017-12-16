<%@page import="java.util.Date,cn.shch.myshare.domain.FileDataCustom"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!-- 开发阶段取消浏览器缓存，正式使用时需要去掉 -->
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="expires" content="0"/>
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
	<div class="grid_2">
		<div class="box round first grid">
			<h2>共查找到${fn:length(list) }条记录</h2>
			<div class="block">



				<table class="data display datatable" id="example">
					<thead>
						<tr>
							<th>文件名称</th>
							<th>文件/文件夹</th>
							<th>文件大小</th>
							<th>创建时间</th>
							<th>最后修改时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="fileDataCustom">
							<tr class="odd gradeX">

								<td><a class="file_name"
									<c:if test="${not empty kind and kind=='picture'  }">
								 onmouseover="_dispPic(this,${fileDataCustom.id }) " onmouseout="_hidePic();" 
								</c:if>
									href="javascript:_down(${fileDataCustom.id });"
									title="${fileDataCustom.filePath }">${fileDataCustom.fileName }</a>

								</td>
								<td><c:if test="${!fileDataCustom.directory }" var="result">
										<span style="color: green; font-weight: bold">文件</span>
									</c:if> <c:if test="${!result }">
										<span style="color: blue; font-weight: bold">文件夹</span>
									</c:if></td>
								<td class="center">${fileDataCustom.fileSize}</td>
								<%
									FileDataCustom fdc = (FileDataCustom) (pageContext.getAttribute("fileDataCustom"));
								%>
								<c:set var="createTime"
									value="<%=new Date(fdc.getCreateTime())%>"></c:set>
								<c:set var="lastModified"
									value="<%=new Date(fdc.getLastModified())%>"></c:set>
								<td class="center"><fmt:formatDate value="${createTime }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="center"><fmt:formatDate value="${lastModified }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	function _dispPic(a, id) {
		var offset = $(a).offset();
		var date = new Date();
		var wid=500;
		$("#pic",parent.document).empty().css({
			"position" : "absolute",
			"left" : offset.left+$(a).parent().width()+$("#grid_2",parent.document).width()+40+"px",
			"top":$("#pic",parent.document).offset().top+"px",
			"width":wid+"px",
			"border":"1px solid black"
		})
		.append(
				"<img onclick='_dispInDiv(this);' border='1px solid black' style='width:"+wid+"px' src='dispPic.action?" + date.getTime()
						+ "&id=" + id + "'/>").show();
	}


	function _hidePic() {
		
		//$("#pic",parent.document).hide().html();
	}
	// 	var json = {
	// 		picType : [ "bmp", "gif", "jpeg", "jpg", "png", "svg", "psd" ]
	// 	};

	// 	$(".file_name").each(function(idx, element) {
	// 		if (idx <= 3) {
	// 			var filename = $.trim($(element).text());
	// 			var dot = filename.lastIndexOf(".");
	// 			var suffix = filename.substring(dot+1);
	// 			alert(idx+"  "+suffix);
	// 			var list = json.picType;
	// 			var bool=false;
	// 			for(var i=0;i<list.length;i++){
	// 				if(suffix==list[i]){
	// 					bool=true;
	// 					break;
	// 				}
	// 			}

	// 		}
	// 	});

	function _down(id) {
		window.location.href = "${pageContext.servletContext.contextPath }/download.action?id="
				+ id;
	}
</script>
</html>