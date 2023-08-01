<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 인코딩 설정
	request.setCharacterEncoding("UTF-8");

	// 전송 데이터 수신
	String uid = request.getParameter("uid"); //modify.jsp에서 uid,name,hp,age에 있는 값들을 수신
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	// 데이터베이스 처리
	int result = 0;
	try{
		
		// JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경이름
		
		// 커넥션 풀에서 커넥션 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/userdb");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("UPDATE `user6` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?");
		
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, age);
		psmt.setString(4, uid);
		
		result = psmt.executeUpdate(); //result는 1(레이블생성) 아니면 0(레이블생성 실패)값
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	String jsonData = "{\"result\":"+result+"}";
	out.print(jsonData);
	
%>
