<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<%@ include file="/WEB-INF/jsp/include/include-header.jspf" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<style>
.main-div{
	margin-top: 100px;
    display: flex;
    justify-content: center;
}
</style>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>hnBlog</title>
		<script type="text/javascript">
			const _contextPath = '<c:out value="${contextPath}" />';
		</script>
	</head>
	<body class="h-100">
		<div id="preloader">
	        <div class="loader">
	            <svg class="circular" viewBox="25 25 50 50">
	                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
	            </svg>
	        </div>
   	 	</div>
	    <div class="login-form-bg h-100">
	        <div class="container h-100">
	            <div class="row justify-content-center h-100">
	                <div class="col-xl-6">
	                    <div class="form-input-content">
	                        <div class="card login-form mb-0">
	                            <div class="card-body pt-5">
	                                <tiles:insertAttribute name="loginContent" />
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</body>
</html>

<%@ include file="/WEB-INF/jsp/include/include-body.jspf" %>