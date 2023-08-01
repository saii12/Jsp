<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");
	
	// 전송 데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age"); //전송데이터는 수신할 때 무조건 문자열로 됨
	
	// 데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/userdb";
	String user = "root";
	String pass = "1234";
	
	int result = 0;
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("INSERT INTO `user6` VALUES (?,?,?,?)");
		psmt.setString(1, uid); //1번 파라미터에 uid
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, age); //Integer.parseInt(age) 문자열을 숫자로 변환하면 되긴한데 굳이, 문자열이나 숫자나 같음
		result = psmt.executeUpdate(); // result 값은 1(insert 성공시) 또는 0(기본키 중복되면 insert 못할 때) 나옴
		psmt.close(); //close() 왜 해주는 거랬지???
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//response.sendRedirect("/Ch06/user1/list.jsp");
	String jsonData = "{\"result\":"+result+"}";
	out.print(jsonData);
%>