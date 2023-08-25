<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>Member 수정</h3>
		<a href="/Ch11">처음으로</a>
		<a href="/Ch11/list.do">Member 목록</a>
		<form action="/Ch11/modify.do" method="post"> 
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value="${member.uid}"></td> <!-- readonly 입력 못하고 읽기만 가능(primary key이므로) -->
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="${member.name}"></td>
				</tr>
				
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="${member.hp}"></td>
				</tr>
				
				<tr>
					<td>직급</td>
					<td><input type="text" name="pos" value="${member.pos}"></td>
				</tr>
				
				<tr>
					<td>부서</td>
					<td><input type="number" name="dep" value="${member.dep}"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</body>
</html>