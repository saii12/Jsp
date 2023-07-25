<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String age = request.getParameter("age"); // get~ 는 리턴값 존재, getParameter에 커서 대면 리턴값 전부 String
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>userProc</title>
	</head>
	<body>
		<h3>사용자 데이터 수신</h3>
		<p>
			아이디 : <%= uid %><br> <!-- 데이터 수신한 값 출력 -->
			이름 : <%= name %><br>
			나이 : <%= age %><br>
		</p>
		
		<a href="../1_request.jsp">뒤로가기</a>
	</body>
</html>