<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>1.스크립트릿</h3>
		
		<h4>스크립트릿(Scriptlet)</h4>
		<%
			// 스크립트릿(자바 프로그래밍 영역)
			int var1 = 1;
			boolean var2 = true;
			double var3 = 3.14;
			String var4 = "Hello";
			
			out.println("<p> var1 : " + var1 + "</p>"); 
			out.println("<p> var2 : " + var2 + "</p>");
		%>
		
		<h4>표현식(Expression)</h4>
		<p>var3 : <%= var3 %></p> 
		<p>var4 : <%= var4 %></p>
		
	</body>
</html>