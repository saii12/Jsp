<%@page import="sub1.UserVo"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_session</title>
		<!-- 
			날짜 : 2023/07/26
			이름 : 박한산
			내용 : JSP session 내장객체 실습하기
			
			session
			 - session은 최초 요청부터 마지막 요청까지의 전체 시간 경과
			 - 클라이언트에 대응되는 객체, 서버에 기록되는 클라이언트 고유번호(Session Table)
			 - 서버(WAS)는 각 클라이언트에 대한 고유식별번호(SID)를 자동으로 발급
		 -->
	</head>
	<body>
		<h3>5.session 내장객체</h3>
		
		<h4>session ID 확인</h4>
		<%= session.getId() %> <!-- 같은 브라우저 새 탭에서는 같은 ID, 다른 브라우저면 다른 ID, 즉 클라이언트가 다르다는 의미-->
		
		<h4>session 설정</h4>
		<%
			UserVo user = new UserVo("a101", "김유신", "010-1234-1001", 23);
			
			// session table에 user컬럼명으로 user 객체 저장
			session.setAttribute("userColumn", user); //session id 옆 컬럼으로 userColumn가 생기고 거기에 user 객체 저장
			
			// session table에 저장된 userColumn 컬럼 값을 가져옴
			UserVo userVo = (UserVo) session.getAttribute("userColumn"); //getAttribute Object 리턴하는데 Object는 최상위 클래스라 아무거나 다운캐스팅(형변환) 가능
		%>
		<p>
			아이디 : <%= userVo.getUid() %><br>
			이름 : <%= userVo.getName() %><br>
			휴대폰 : <%= userVo.getHp() %><br>
			나이 : <%= userVo.getAge() %><br>
		</p>
		
	</body>
</html>