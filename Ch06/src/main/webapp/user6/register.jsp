
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user6::register</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
		
		<script>
			$(function(){
				
				$('input[type=submit]').click(function(e){
					
					e.preventDefault();
					
					// 입력데이터 가져오기
					let uid = $('input[name=uid]').val();
					let name = $('input[name=name]').val();
					let hp = $('input[name=hp]').val();
					let age = $('input[name=age]').val();
					
					// JSON 생성
					const jsonData = {
							"uid":uid,
							"name":name,
							"hp":hp,
							"age":age
					};
					
					console.log(jsonData);
					
					$.ajax({
						url:'./registerProc.jsp',
						type:'POST', // GET 방식은 파라미터 나오지만 POST 방식은 파라미터 안 나옴
						data:jsonData,
						dataType:'json',
						success:function(data){ //AJAX로 서버로 전송한 데이터, JSON으로 data에 다시 들어옴
							console.log(data);
						
							if(data.result >= 1){
								alert('데이터가 추가 되었습니다.');
								
								// 폼 초기화
								$('form')[0].reset(); // 등록하고 나서 입력칸 초기화 되도록
							}else{
								alert('데이터 추가가 실패했습니다. 아이디 또는 휴대폰 중복인 것 같아요.');
							}
						}
					});
				});	
			});
		</script>
	</head>
	<body>
		<h3>User6 등록</h3>
		<a href="/Ch06/user6/list.jsp">User6 목록</a>
		
		<form action="#" method="post"> <!-- insert는 post 전송 -->
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="uid"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td>
				</tr>
				
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp"></td>
				</tr>
				
				<tr>
					<td>나이</td>
					<td><input type="number" name="age"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form>
		
	</body>
</html>