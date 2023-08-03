/**
 * 사용자 개인정보 중복체크
 */
// 사용자 개인정보 중복체크
    	$(function(){
    		
    		// 아이디 중복체크
    		$('#btnCheckUid').click(function(){
    			
    			const uid = $('input[name=uid]').val();
    			
    			if(!uid.match(reUid)){
					$('.resultId').css('color', 'red').text('유효한 아이디가 아닙니다.');
					isUidOk = false;
					return;
				}
    			
    			const jsonData = {
    					"uid":uid
    			};
    			
    			console.log(jsonData);
    			
    			
    			$.ajax({ //ajax는 서버로 전송하고, json으로 받는다
    				url:'/Jboard1/user/checkUid.jsp',
    				type:'GET',
    				data:jsonData, 
    				DataType:'json',
    				success:function(data){
    					
    					console.log(data);
    					
    					if(data.result >= 1){
    						$('.resultId').css('color', 'red').text('이미 사용중인 아이디입니다.');
    						isUidOk = false;
    					}else{
    						$('.resultId').css('color', 'green').text('사용가능한 아이디입니다.');
    						isUidOk = true;
    					}
    				}
    			});
    			
    		}); // 아이디 중복체크 끝
    		
    		// 닉네임 중복체크 / 닉네임 다 입력하고 커서가 나갈때 중복체크
    		$('input[name=nick]').focusout(function(){
    			//alert('focusout!');
    			
    			// 입력데이터 가져오기
    			const nick = $(this).val();
    			//console.log('nick : ' + nick);
    			
    			if(!nick.match(reNick)){
					$('.resultNick').css('color', 'red').text('유효한 닉네임이 아닙니다.');
					isNickOK = false;
					return;
				}
    			
    			// JSON 생성
    			const jsonData = {
    					"nick": nick //json 생성 왜 하는거지??? $.get('/Jboard1/user/checkNick.jsp?nick=nick' 형태로 get 하기 때문.
    			};
    			
    			// 데이터 전송
    			$.get('/Jboard1/user/checkNick.jsp', jsonData, function(data){ // $.ajax({}) type:'GET' 이면 이렇게 축약 가능
    				console.log(data);
    				if(data.result >= 1){
    					$('.resultNick').css('color', 'red').text('이미 사용중인 별명입니다.');
    					isNickOk = false;
    				}else{
    					$('.resultNick').css('color', 'green').text('사용가능한 별명입니다.');
    					isNickOk = true;
    				}
    			}); 
    				
    		}); // 닉네임 중복체크 끝
    		
    		// 이메일 중복체크 / 자바스크립트는 = 이 주로 들어가네, jQuery는 () 가 주로 들어가고
    		const email = document.getElementsByName('email')[0];
    			email.onfocusout = function(){
					
					const resultEmail = document.getElementById('resultEmail');
    				//alert('email focusout!');
    				
    				// 입력 데이터 가져오기
    				const email = this.value;
    				//console.log('email : ' + email);
    				
    				if(!email.match(reEmail)){
						resultEmail.innerText = '유효한 이메일이 아닙니다.';
						resultEmail.style.color = 'red';
						isEmailOk = false;
						return; //밑으로 안 내려가게 종료(정규표현식에 부합 안 한 email을 굳이 서버에 전송해서 중복 확인할 필요 없다)
						
					}
    				
    				
    				const xhr = new XMLHttpRequest();
    				xhr.open('GET', '/Jboard1/user/checkEmail.jsp?email='+email); //checkEmail.jsp에 ?email= 파라미터로 밑에 send를 통해 전송
    				xhr.send();
    				
    				xhr.onreadystatechange = function(){ // 콜백함수
    					
    					if(xhr.readyState == XMLHttpRequest.DONE){
    						
    						if(xhr.status == 200){
    							const data = JSON.parse(xhr.response);
    							console.log('data : ' + data);
    							
    							
    							
    							if(data.result >=1){
    								resultEmail.innerText = '이미 사용중인 이메일입니다.'; // innerText ()넣는 거 아님
    								resultEmail.style.color = 'red';
    								isEmailOk = false;
    							}else{
    								resultEmail.innerText = '사용 가능한 이메일입니다.';
    								resultEmail.style.color = 'green';
    								isEmailOk = true;
    							}
    						}
    					}		
    				} // onreadystatechange end
    			}; // email.onfocusout end
    			
    			// 휴대폰 중복체크
    			document.getElementsByName('hp')[0].addEventListener('focusout', function(){ //getElementsByName
    				 //alert('focusout!');
    				 
    				 const resultHp = document.getElementById('resultHp');
    				 const hp = this.value;
    				 
    				 if(!hp.match(reHp)){
						 resultHp.innerText = '유효한 휴대폰번호가 아닙니다.';
						 resultHp.style.color = 'red';
						 isHpOk = false;
						 return;
						 
					 }
    				 
    				 const url = '/Jboard1/user/checkHp.jsp?hp='+this.value;
    				 
    				 fetch(url)
    				 	.then(response => response.json())
    				 	.then(data => {
    				 		
    				 		console.log(data);
    				 		
    				 		
    				 		
    				 		if(data.result >= 1){
    				 			resultHp.innerText = '이미 사용중인 휴대폰번호입니다.'; // innerText ()넣는 거 아님
								resultHp.style.color = 'red';
								isHpOk = false;	
    				 		}else{
    				 			resultHp.innerText = '사용가능한 휴대폰번호입니다.'; // innerText ()넣는 거 아님
								resultHp.style.color = 'green';
								isHpOk = true;
    				 		}
    				 	});
    			}); // 휴대폰 중복체크 끝
    	});	// onready end	