<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forward2</title>
	</head>
	<body>
		<h3>forward2 페이지</h3>
		<%
			// forward는 서버 자원 내에서 제어권 이동이기 때문에 타 서버 자원으로 이동 안됨
			pageContext.forward("https://naver.com"); //forward는 같은 서버 자원간의 이동만 가능, 네이버는 다른 서버라 오류
		%>
	</body>
</html>