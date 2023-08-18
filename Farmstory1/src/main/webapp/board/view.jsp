<%@page import="java.util.List"%>
<%@page import="kr.farmstory1.dto.ArticleDTO"%>
<%@page import="kr.farmstory1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String group = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String no = request.getParameter("no");
	
	// 로그인 여부 확인
	if(sessUser == null){
		response.sendRedirect("/Farmstory1/user/login.jsp?success=101&target=view&group="+group+"&cate="+cate+"&no="+no);
		return;
	}
	
	// 데이터베이스 조회
	ArticleDAO dao = new ArticleDAO();
	
	ArticleDTO dto = dao.selectArticle(no);
	List<ArticleDTO> comments = dao.selectComments(no);
	
	pageContext.include("./_aside"+group+".jsp");
	
	
%>
<script>
	
	// 원글 삭제
	$(function(){
		$('.btnDelete').click(function(){
			
			if(confirm('정말 삭제하시겠습니까?')){
				return true;		
			}else{
				return false;	
			}
		});
	});
	
	// 댓글 삭제
	$('.del').click(function(){
		
		const result = confirm('정말 삭제하시겠습니까?');
		
		if(result){
			
			return true; 
		}else{
		
			return false; // commentDelete.jsp로 이동하는 a태그 기능 막기
		}
	});
</script>

<section class="view">
    <h3>글보기</h3>
    <table>
        <tr>
            <td>제목</td>
            <td><input type="text" name="title" value="<%= dto.getTitle() %>" readonly/></td>
        </tr>
        <% if(dto.getFile() > 0){ %> <!-- 첨부파일 있을때 -->
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
        <a href="./delete.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= no %>" class="btnDelete">삭제</a>
        <a href="./modify.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= no %>" class="btnModify">수정</a>
        <a href="./list.jsp?group=<%= group %>&cate=<%= cate %>" class="btnList">목록</a>
    </div>
    
    <!-- 댓글리스트 -->
    <section class="commentList">
        <h3>댓글목록</h3>
        <% for(ArticleDTO comment : comments){ %>
        <article class="comment">
        	<form action="#" method="post">
        		<input type="hidden" name="no"     value=""> <!-- 폼전송에서의 데이터 전송과는(이거는 submit일때) 별개로 a태그는 파라미터 따로 생성해야함 -->
        		<input type="hidden" name="parent" value="">
             <span>
                 <span><%= comment.getNick() %></span>
                 <span><%= comment.getRdate() %></span>
             </span>
             <textarea name="comment" readonly><%= comment.getContent() %></textarea>
             
             <% if(sessUser.getUid().equals(comment.getWriter())){ %>
             <div>
                 <a href="./proc/commentDelete.jsp?group=<%= group %>&cate=<%= cate %>&no=<%= comment.getNo() %>&parent=<%= comment.getParent() %>" class="del">삭제</a> <!-- a태그는 폼 전송에서 데이터 전송하는 것과 별개로 파라미터 지정해줄 것 -->
                 <a href="#" class="can">취소</a>
                 <a href="#" class="mod">수정</a>
             </div>                
             <% } %>
            </form>
        </article>
        <% } %>
        
        <% if(comments.isEmpty()){ %>
        <p class="empty">등록된 댓글이 없습니다.</p>
    	<% } %>
    </section>

    <!-- 댓글입력폼 -->
    <section class="commentForm">
        <h3>댓글쓰기</h3>
        <form action="./proc/commentInsert.jsp" method="post">
        	<input type="hidden" name="group" value="<%= group %>"/>
        	<input type="hidden" name="cate" value="<%= cate %>"/>
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
<!-- 내용 끝 -->
        </article>
    </section>
</div>			
<%@ include file="../_footer.jsp" %>