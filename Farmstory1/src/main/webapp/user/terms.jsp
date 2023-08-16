<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<script> //자바스크립트
    	window.onload = function(){
    		//alert('onload!');
    		
    		const chk1 = document.getElementsByName('chk1')[0];
    		const chk2 = document.getElementsByName('chk2')[0];
    		
    		const btnNext = document.querySelector('.btnNext');
    		btnNext.addEventListener('click', function(e){
    			e.preventDefault();
    			
    			alert('click!');
    			
    			if(!chk1.checked){ //checked가 참이 아닐 때
    				alert('이용약관에 동의하셔야 합니다.');
    				return;
    			}else if(!chk2.checked){
    				alert('개인정보 취급방침에 동의하셔야 합니다.');
    				return;
    			}else{ // 체크박스 전부 체크 되어있으면
    				location.href = '/Farmstory1/user/register.jsp';
    			}
    		});
    	}
</script>
    
<div id="user">
 <section class="terms">
         <table>
             <caption>사이트 이용약관</caption>
             <tr>
                 <td>
                     <textarea readonly></textarea>
                     <p>
                         <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                     </p>
                 </td>
             </tr>
         </table>
         <table>
             <caption>개인정보 취급방침</caption>
             <tr>
                 <td>
                     <textarea readonly></textarea>
                     <p>
                         <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                     </p>
                 </td>
             </tr>
         </table>
         <div>
             <a href="/Farmstory1/user/login.jsp" class="btnCancel">취소</a>
             <a href="#" class="btnNext">다음</a>
         </div>
     </section>
</div>
<%@ include file="../_footer.jsp" %>        