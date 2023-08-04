<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	int result = UserDAO.getInstance().selectCountUid(uid);
	
	
	
	// Json 생성
	JsonObject json = new JsonObject();
	json.addProperty("result", result); // key, value
	
	String jsonData = json.toString(); // toString()으로 문자열로 변환
	out.print(jsonData);
	
	// 작성완료했으면 http://localhost:8080/Jboard1/user/checkUid.jsp 띄워서 ?uid=a106 입력해서 데이터 전송해보고 json으로 result값 1 나오는지 확인해야함(json 서버 확인 전부 이런시으로)
%>