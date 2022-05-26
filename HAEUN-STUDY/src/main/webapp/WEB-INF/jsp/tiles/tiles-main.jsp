<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>first</title>
	</head>

	<body>
		<div>
			<tiles:insertAttribute name="header"/>

			<div id="container">
				<div class="content">
					<div id="body"><tiles:insertAttribute name="body" /></div>
				</div>
			</div>
		</div>

		<tiles:insertAttribute name="footer" />
	</body>
</html>