
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
	</head>
	<body>
		<h3>User1 목록</h3>
		<a href="/Ch10">처음으로</a>
		<a href="/Ch10/user1/register.jsp">User1 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<c:forEach var="user" items="${requestScope.users}"></c:forEach>
			<tr>
				<td>${user.getUid()}</td>
				<td>${user.getName()}</td>
				<td>${user.getHp()}</td>
				<td>${user.getAge()}</td>
				<td>
					<a href="/Ch10/user1/modify.do?uid=${user.getUid()}">수정</a> <!-- ?(파라미터)를 기점으로 '주소?전송데이터' 형식임. uid=A101 을 서버로 전송하고 그걸 request.getparameter 하는 것 -->
					<a href="/Ch10/user1/delete.do?uid=${user.getUid()}">삭제</a> <!-- ?(파라미터)를 이용하는 건 전송데이터를 getparameter 할 게 없기 때문 ex) request.getParameter("uid") 하려면 name값 있어야지 -->
				</td>
			</tr>
		
		</table>
		
	</body>
</html>