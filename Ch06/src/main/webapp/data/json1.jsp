<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// Java JSON 데이터 생성
	String jsonData = "{\"uid\":\"a101\", \"name\":\"홍길동\", \"hp\":\"010-1234-1001\", \"age\":23}"; //""문자열 안에 있는 ""을 escape 처리 \(백슬레쉬로)
	
	// JSON 출력
	out.print(jsonData);
%>
