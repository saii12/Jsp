<%@page import="vo.User1VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//수신할 데이터 없음, 바로 데이터베이스 처리하면 됨
	//데이터베이스 처리 
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	List<User1VO> users = new ArrayList<>(); //users는 User1VO 객체로 이루어진 리스트
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
	 	Statement stmt = conn.createStatement(); //Statement java.sql 객체임 /stmt psmt 차이가 뭐임(캐시사용 차이, 큰 차이는 없음)
		ResultSet rs = stmt.executeQuery("SELECT * FROM `user1`"); 
	 	
		while(rs.next()){ //rs.next 할 때마다 하나의 레이블을 가리키고 그 레이블의 1번칼럼, 2번칼럼, 3번칼럼, 4번칼럼
			User1VO vo = new User1VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getInt(4)); //User1VO 클래스의 setAge 메서드는 int age를 변수로 받기 때문에 rs.getInt값이 와야함
			
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
	</head>
	<body>
		<h3>User1 목록</h3>
		<a href="/Ch06/1_JDBC.jsp">처음으로</a>
		<a href="/Ch06/user1/register.jsp">User1 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<% for(User1VO vo : users){ %>
			<tr>
				<td><%= vo.getUid() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getHp() %></td>
				<td><%= vo.getAge() %></td>
				<td>
					<a href="/Ch06/user1/modify.jsp?uid=<%= vo.getUid() %>">수정</a> <!-- ?(파라미터)를 기점으로 '주소?전송데이터' 형식임. uid=A101 을 서버로 전송하고 그걸 request.getparameter 하는 것 -->
					<a href="/Ch06/user1/delete.jsp?uid=<%= vo.getUid() %>">삭제</a> <!-- ?(파라미터)를 이용하는 건 전송데이터를 getparameter 할 게 없기 때문 ex) request.getParameter("uid") 하려면 name값 있어야지 -->
				</td>
			</tr>
			<% } %>
		
		</table>
		
	</body>
</html>