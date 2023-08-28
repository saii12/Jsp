<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>Member 목록</h3>
		<a href="/Ch11">처음으로</a>
		<a href="/Ch11/register.do">User1 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>직급</th>
				<th>부서</th>
				<th>날짜</th>
				<th>관리</th>
			</tr>
			<c:forEach var="member" items="${requestScope.members}">
				<tr>
					<td>${member.getUid()}</td>
					<td>${member.getName()}</td>
					<td>${member.getHp()}</td>
					<td>${member.getPos()}</td>
					<td>${member.getDep()}</td>
					<td>${member.getRdate()}</td>
					<td>
						<a href="/Ch11/modify.do?uid=${member.getUid()}">수정</a> <!-- ?(파라미터)를 기점으로 '주소?전송데이터' 형식임. uid=A101 을 서버로 전송하고 그걸 request.getparameter 하는 것 -->
						<a href="/Ch11/delete.do?uid=${member.getUid()}">삭제</a> <!-- ?(파라미터)를 이용하는 건 전송데이터를 getparameter 할 게 없기 때문 ex) request.getParameter("uid") 하려면 name값 있어야지 -->
					</td>
				</tr>
			</c:forEach> <!-- forEach 주의 -->
		</table>
	</body>
</html>