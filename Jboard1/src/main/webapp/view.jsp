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
		$('.del').click(function(){
			
			const result = confirm('정말 삭제하시겠습니까?');
			
			if(result){
				
				return true;
			}else{
			
				return false; // commentDelete.jsp로 이동하는 a태그 기능 막기
			}
			
			
		});
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
                    <a href="#" class="btnDelete">삭제</a>
                    <a href="#" class="btnModify">수정</a>
                    <a href="/Jboard1/list.jsp" class="btnList">목록</a>
                </div>  
                
                <!-- 댓글리스트 -->
                <section class="commentList">
                    <h3>댓글목록</h3>
                    <% for(ArticleDTO comment : comments){ %>
                    <article class="comment">
                        <span>
                            <span><%= comment.getNick() %></span>
                            <span><%= comment.getRdate() %></span>
                        </span>
                        <textarea name="comment" readonly><%= comment.getContent() %></textarea>
                        
                        <% if(sessUser.getUid().equals(comment.getWriter())){ %> <!-- 문자열비교 equals() / 현재 로그인한 아이디와 댓글 쓰는 작성자(아이디)가 같을 때 삭제,수정 가능하도록 -->
                        <div>
                            <a href="/Jboard1/proc/commentDelete.jsp?no=<%= comment.getNo() %>&parent=<%= comment.getParent() %>" class="del">삭제</a> <!-- id는 for문으로 중복되서 쓸수 없다, class만 가능 -->
                            <a href="#" class="mod">수정</a>
                        </div>
                        <% } %>
                        
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