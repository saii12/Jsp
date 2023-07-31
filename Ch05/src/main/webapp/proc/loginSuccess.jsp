<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sessid = (String) session.getAttribute("sessid"); //object타입은 어떤 타입으로든 다운캐스팅 가능

	if(sessid == null){
		response.sendRedirect("./loginForm.jsp"); // 쿠키 유효기간 끝나서 sessid 없으면 다시 로그인화면
		return; // 리턴은 왜???w
	}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginSuccess</title>
	</head>
	<body>
		<h3>로그인 성공</h3>
		<p>
			<%= sessid %>님 반갑습니다.<br>
			<a href="./logout.jsp">로그아웃</a>
		</p>
	</body>
</html>