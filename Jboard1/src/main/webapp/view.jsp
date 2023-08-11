<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.dto.ArticleDTO"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no"); //article 테이블의 PK기본키인 no로 데이터 수신해야지
	
	ArticleDAO dao = new ArticleDAO();
	
	// 원글 조회
	ArticleDTO dto =  dao.selectArticle(no); // dto 객체 생성해주기 / 매개변수 int no로 받으면 어떻게 해줘야 한다고??
	
	// 댓글 조회
	List<ArticleDTO> comments = dao.selectComments(no);
%>
<script>

	$(function(){
		
		// 댓글 내용 전역변수
		let comment = '';
		
		
		// 댓글 수정
		$('.mod').click(function(e){
			e.preventDefault();
			
			const txt = $(this).text();
			
			if(txt == '수정'){
				// 수정모드 전환
				$(this).parent().prev().addClass('modi'); // jQuery해야함, javascript는 시간낭비
				$(this).parent().prev().attr('readonly', false);
				$(this).parent().prev().focus();
				$(this).text('수정완료');
				$(this).prev().show();
			}else{
				
				// '수정완료' 클릭
				if(confirm('정말 수정하시겠습니까?')){
					// 수정데이터 전송
					$(this).closest('form').submit();	
				}
				
				
				// 수정모드 해제
				$(this).parent().prev().removeClass('modi');
				$(this).parent().prev().attr('readonly', true);
				$(this).text('수정');
				$(this).prev().hide();
			}
		});
		
		// 댓글 수정취소
		/*
		$('.can').click(function(e){
			e.preventDefault();
			
			// 수정모드 해제
			$(this).parent().prev().removeClass('modi'); // this: 내가 클릭한 취소 링크, parent(): 부모태그(div), prev():div 앞에태그(textarea)
			$(this).parent().prev().attr('readonly', true);
			$(this).hide();
			$(this).next().text('수정');
		});
		*/
		
		// 댓글 삭제
		$('.del').click(function(){
			
			const result = confirm('정말 삭제하시겠습니까?');
			
			if(result){
				
				return true; 
			}else{
			
				return false; // commentDelete.jsp로 이동하는 a태그 기능 막기
			}
		});
		
		// 댓글쓰기 취소
		// Javascript 형식
		const commentcontent = document.querySelector('form > textarea[name=content]');
		const btnCancel = document.querySelector('.btnCancel');
		btnCancel.onclick = function(e){
			e.preventDefault();
			commentcontent.value = '';
		}
		
		// JQuery 형식
		$('.btnCancel').click(function(e){
			e.preventDefault();
			$('form > textarea[name=content]').val('');
		});
		
		// 원글삭제
		const btnDelete = document.getElementsByClassName('btnDelete')[0];
		btnDelete.onclick = function(){
			if(confirm('정말 삭제하시겠습니까?')){
				return true; // 예 누르면 return true가 되고, a태그 기능 실행
			}else{
				return false;
			}
		}
	});
	
</script>

   		<main>
            <section class="view">
                <h3>글보기</h3>
                <table>
                    <tr>
                        <td>제목</td>
                        <td><input type="text" name="title" value="<%= dto.getTitle() %>" readonly/></td>
                    </tr>
                    <% if(dto.getFile() > 0){ %> 
                    <tr>
                        <td>첨부파일</td>
                        <td>
                            <a href="#">2020년 상반기 매출자료.xls</a>
                            <span>7회 다운로드</span>
                        </td>
                    </tr>
                    <% } %>
                    <tr>
                        <td>내용</td>
                        <td>
                            <textarea name="content" readonly><%= dto.getContent() %></textarea>
                        </td>
                    </tr>
                </table>
                <div>
                <% if(sessUser.getUid().equals(dto.getWriter())){ %> <!-- 로그인사용자와 이 글의 작성자가 같으면 -->
                    <a href="/Jboard1/delete.jsp?no=<%= no %>" class="btnDelete">삭제</a>
                    <a href="/Jboard1/modify.jsp?no=<%= no %>" class="btnModify">수정</a>
                    <a href="/Jboard1/list.jsp" class="btnList">목록</a>
              	<% }else{%>
              		<a href="/Jboard1/list.jsp" class="btnList">목록</a>
              	<% } %>	
                </div>  
                
                <!-- 댓글리스트 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    <% for(ArticleDTO comment : comments){ %>
                    <article class="comment">
                    	<form action="/Jboard1/proc/commentUpdate.jsp" method="post"> <!-- a태그는 get 방식, 대부분의 태그는 get방식. 딱 form만 method방식을 선택할 수 있다. 파라미터는 get방식에서 가능 -->
                    		<input type="hidden" name="no" value="<%= comment.getNo() %>">
                    		<input type="hidden" name="parent" value="<%= comment.getParent() %>">
	                        <span>
	                            <span><%= comment.getNick() %></span>
	                            <span><%= comment.getRdate() %></span>
	                        </span>
	                        <textarea name="comment" readonly><%= comment.getContent() %></textarea>
	                        
	                        <% if(sessUser.getUid().equals(comment.getWriter())){ %> <!-- 문자열비교 equals() / 현재 로그인한 아이디와 댓글 쓰는 작성자(아이디)가 같을 때 삭제,수정 가능하도록 -->
	                        <div>
	                            <a href="/Jboard1/proc/commentDelete.jsp?no=<%= comment.getNo() %>&parent=<%= comment.getParent() %>" class="del">삭제</a> <!-- id는 for문으로 중복되서 쓸수 없다, class만 가능 -->
	                            <a href="/Jboard1/view.jsp?no=<%= no %>" class="can">취소</a>
	                            <a href="#" class="mod" >수정</a>
	                        </div>
	                        <% } %>
                        </form>
                        
                    </article>
                    <% } %>
                    
                    <% if(comments.isEmpty()){ %> <!-- comments.size() == 0 도 가능하지만 -->
                    <p class="empty"> 등록된 댓글이 없습니다.</p>
                    <% } %>
                </section>
    
                <!-- 댓글입력폼 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="/Jboard1/proc/commentProc.jsp" method="post">
                    <input type="hidden" name="parent" value="<%= no %>"/>
                    <input type="hidden" name="writer" value="<%= sessUser.getUid() %>"/>
                    
                        <textarea name="content"></textarea>
                        <div>
                            <a href="#" class="btnCancel">취소</a>
                            <input type="submit" class="btnWrite" value="작성완료"/>
                        </div>
                    </form>
                </section>
    
            </section>
        </main>
<%@ include file="./_footer.jsp" %> 