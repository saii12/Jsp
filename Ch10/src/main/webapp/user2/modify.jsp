<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2::modify</title>
	</head>
	<body>
		<h3>User2 수정</h3>
		<a href="/Ch10">처음으로</a>
		<a href="/Ch10/user2/list.do">User2 목록</a>
		
		<form action="#" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid" readonly value=""></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value=""></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value=""></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value=""></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>		
	</body>
</html>