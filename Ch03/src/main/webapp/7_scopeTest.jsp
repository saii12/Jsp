<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>7_scopeTest</title>
		<!-- 
			날짜 : 2023/07/26
			이름 : 박한산
			내용 : JSP scopeTest
		 -->
	</head>
	<body>
		<h3>7.내장객체 영역</h3>
		<%
			// 내장객체 값 설정
			pageContext.setAttribute("name", "김유신"); // 각 내장객체의 name 값 설정
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "강감찬");
		%>
		
		<h4>내장객체 값 확인</h4>
		<p>
			pageContext 확인 : <%= pageContext.getAttribute("name") %><br>
			request 확인 : <%= request.getAttribute("name") %><br>
			session 확인 : <%= session.getAttribute("name") %><br>
			application 확인 : <%= application.getAttribute("name") %><br>
		</p>
		
		<%													// session 객체를 바꾸려면 새 브라우저에서 proc/scoperesult.jsp 이 서버 가리키면 됨(7_scopeTest.jsp 서버로 들어가면 session 값 또 '장보고' 나옴 : 새 브라우저에서도 setAttribute 하게 되니깐. application 객체를 새로 하려면 톰캣 껐다 키면 됨.
			pageContext.forward("./proc/scopeResult.jsp"); // forward 하면서 scopeResult.jsp의 pageContext로 바뀜(설정 안했으니 null) / but scopeResult.jsp 를 forward 해도 request, session, applicaton 객체는 같다. request는 include,forward할 때 같은 객체임
		%> 
	</body>
</html>