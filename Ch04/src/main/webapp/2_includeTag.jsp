<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_includeTag</title>
		<!-- 
			날짜 : 2023/07/26
			이름 : 박한산
			내용 : JSP include 액션태그 실습하기
			
			include 지시자
			 - 일반적으로 UI모듈, 공통 전역 파일을 삽입할 때 사용하는 지시자 
			 - 정적타임에 삽입
			 
			include 태그
			 - UI모듈 위주로삽입하는 include 태그
			 - 런타임에 삽입
			 
			 
		 -->
	</head>
	<body>
		<h3>2.include 액션태그</h3>
		
		<h4>include 지시자</h4>
		<%@ include file="./inc/_header.html" %>
		<%@ include file="./inc/_footer.html" %>
		<%@ include file="./inc/_config1.jsp" %> <!-- 정적타임에 삽입 / 변수선언 -->
		<p>
			num1 : <%= num1 %><br>
			num2 : <%= num2 %><br>
			num3 : <%= num3 %><br>
		</p>
		
		<h4>include 태그</h4>
		<jsp:include page="./inc/_header.html"></jsp:include>
		<jsp:include page="./inc/_footer.html"></jsp:include>
		<jsp:include page="./inc/_config2.jsp"></jsp:include> <!-- 런타임에 삽입(실행할 때), 지금은 삽입 안 되어있어서 밑에 오류 -->
		
		<%-- p태그안에 스크립트릿 있어서 html 주석 안 됨, JSP 주석처리
		<p>
			var1 : <%= var1 %><br>
			var2 : <%= var2 %><br>
			var3 : <%= var3 %><br>
		</p>
		--%>
		
		<h4>include 메서드</h4>
		<%
			pageContext.include("./inc/_header.html");
			pageContext.include("./inc/_footer.html");
		%>
	</body>
</html>