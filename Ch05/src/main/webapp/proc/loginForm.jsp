<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 자동 로그인 체크여부에 따라 로그인 처리 
	Cookie[] cookies = request.getCookies();

	for(Cookie cookie : cookies){
		
		if(cookie.getName().equals("cid")){ //쿠키명(cid)이 있다는 건 쿠키가 존재한다는 것(loginProc에서 설정한 자동로그인체크)
			
			String id = cookie.getValue(); //쿠키명(cid)에 해당하는 value, 즉 내가 입력한 아이디값
					
			session.setAttribute("sessid", id); //브라우저 닫으면 session은 삭제, 새 브라우저에서 쿠키값 존재시 새로 session 설정
		}
	}
	
	// 로그인 여부
	String sessid = (String) session.getAttribute("sessid");
	
	if(sessid != null){
		response.sendRedirect("./loginSuccess.jsp");
		return;
	}

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>loginForm</title>
	</head>
	<body>
		<h3>로그인</h3>
		<form action="./loginProc.jsp" method="post">
			<input type="text" name="id" placeholder="아이디 입력"><br>
			<input type="password" name="pw" placeholder="비밀번호 입력"><br>
			<lable><input type="checkbox" name="auto" value="1">자동로그인</lable><br> <!-- 체크하면 1, 체크 안하면 value 값 null -->
			<input type="submit" value="로그인"><br>
		</form>
	</body>
</html>