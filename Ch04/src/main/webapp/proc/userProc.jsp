<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 데이터 수신
	
%>
<jsp:useBean id="ub" class="sub1.UserBean"> <!-- 의미 : user = new User Bean -->
	<jsp:setProperty property="uid" name="ub"/>
	<jsp:setProperty property="name" name="ub"/>
	<jsp:setProperty property="hp" name="ub"/>
	<jsp:setProperty property="age" name="ub"/>
</jsp:useBean> 

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>UserProc</title>
	</head>
	<body>
		<h3>전송 데이터 출력</h3>
		<p>
			아이디 : <%= ub.getUid() %><br>
			이름 : <%= ub.getName() %><br>
			휴대폰 : <%= ub.getHp() %><br>
			나이 : <%= ub.getAge() %><br>
		</p>
	</body>
</html>