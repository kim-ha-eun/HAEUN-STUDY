<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<%@ include file="/WEB-INF/jsp/include/include-header.jspf" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>hnBlog</title>
		<script type="text/javascript">
			const _contextPath = '<c:out value="${contextPath}" />';

			function moveMenu(menuUrl) {
				url = _contextPath +menuUrl;
				submitPost('leftMenuForm', url);
			}

			$(document).ready(function() {
			    $(".dropdown-toggle").dropdown();
			    $(".custom-dropdown").dropdown();
			    //$().dropdown('hide')
			});
		</script>
	</head>
	<body>
		<form id="leftMenuForm" name="leftMenuForm" action="#" method="post">
			<input type="hidden" name="moveUrl" id="moveUrl" value=""/>
		</form>
		<!--*******************Preloader start********************-->
		<div id="preloader">
		    <div class="loader">
		        <svg class="circular" viewBox="25 25 50 50">
		            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
		        </svg>
		    </div>
		</div>
		<!--*******************Preloader end********************-->

		<!--**********************************Main wrapper start***********************************-->
		<div id="main-wrapper">
			<tiles:insertAttribute name="header"/>
			<tiles:insertAttribute name="sideBar"/>
			<div class="content-body">
				<tiles:insertAttribute name="body" />
			</div>
			<tiles:insertAttribute name="footer" />
		</div>
	</body>
</html>

<%@ include file="/WEB-INF/jsp/include/include-body.jspf" %>