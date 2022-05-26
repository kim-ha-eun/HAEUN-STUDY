<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/include-taglib.jspf" %>
<%@ include file="/WEB-INF/jsp/include/include-header.jspf" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
		<title>first</title>
		<tiles:insertAttribute name="header"/>
	</head>
	<body>
	<div class="container">
		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />
	</div>
	</body>
</html>

<%@ include file="/WEB-INF/jsp/include/include-body.jspf" %>