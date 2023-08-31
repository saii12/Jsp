<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./_header.jsp" %>
        <main id="board">
            <section class="view">
                
                <table border="0">
                    <caption>글보기</caption>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="title" value="${article.title}" readonly/></td>
                    </tr>
                    <tr>
                        <th>파일</th>
                        <td><a href="#">2020년 상반기 매출자료.xls</a>&nbsp;<span>7</span>회 다운로드</td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="content" readonly>${article.content}</textarea>
                        </td>
                    </tr>                    
                </table>
                
                <div>
                    <a href="#" class="btn btnRemove">삭제</a>
                    <a href="/Jboard2/modify.do?no=${article.no}" class="btn btnModify">수정</a>
                    <a href="./list.do" class="btn btnList">목록</a> <!-- 상대경로도 써보고, 절대경로도 써보고 -->
                </div>

                <!-- 댓글목록 -->
                <section class="commentList">
                    <h3>댓글목록</h3>                   
					<c:forEach var="comment" items="${comments}">
	                    <article>
	                        <span class="nick">${comment.nick}</span>
	                        <span class="date">${comment.rdate}</span>
	                        <p class="content">${comment.content}</p>                        
	                        <div>
	                            <a href="#" class="remove">삭제</a>
	                            <a href="#" class="modify">수정</a>
	                        </div>
	                    </article>
                    </c:forEach>

                    <p class="empty">등록된 댓글이 없습니다.</p>

                </section>

                <!-- 댓글쓰기 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="/Jboard2/comment.do" method="post"> <!-- method 써줘야지! -->
                    <input type="hidden" name="parent" value="${no}"/> <!-- 뭐가 생략된거지??? -->
                    <input type="hidden" name="writer" value="${sessUser.uid}"/>
                        <textarea name="content">댓글내용 입력</textarea>
                        <div>
                            <a href="#" class="btn btnCancel">취소</a>
                            <input type="submit" value="작성완료" class="btn btnComplete"/>
                        </div>
                    </form>
                </section>

            </section>
        </main>
<%@ include file="./_footer.jsp" %>