<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page info="copyright" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_Directive</title>
	</head>
	<body>
		<h3>5.지시자</h3>
		
		<h4>page 지시자</h4>
		<p>
			page copyright : <%= getServletInfo() %>
		</p>
		
		<h4>include 지시자</h4>
		<%@ include file="./inc/_header.html" %>
		<%@ include file="./inc/_footer.html" %>
	</body>
</html>