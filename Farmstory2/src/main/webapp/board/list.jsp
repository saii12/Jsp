<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../_header.jsp" %>
<!--
	- group 값을 참조하기 위해 include 태그를 사용
	- include 지시자는 표현언어 참조 안됨
-->
<style>
.list {
    position: relative;
    width: 720px;
    margin: 60px auto;
}

.list > article > p {
    position: absolute;
    right: 0;
    top: 0;
}

.list table {
    width: 100%;
    border-top: 2px solid #111;
    border-collapse: collapse;
    border-spacing: 0;
    margin-top: 6px;
}

.list table th {
    padding: 12px;
    border-top: 1px solid #d1dee2;
    border-bottom: 1px solid #d1dee2;
    background: #e5ecef;
    color: #383838;
}
.list table td {    
    padding: 12px 6px;
    border-top: 1px solid #e9e9e9;
    border-bottom: 1px solid #e9e9e9;    
}
.list table tr > td:nth-child(1) {width:  50px; text-align: center; background: #fff;}
.list table tr > td:nth-child(2) {width:  auto; text-align: left;}
.list table tr > td:nth-child(3) {width: 100px; text-align: center;}
.list table tr > td:nth-child(4) {width: 100px; text-align: center;}
.list table tr > td:nth-child(5) {width:  50px; text-align: center;}

.list > .paging {
    padding: 20px;
    text-align: center;            
}
.list > .paging > a {
    padding: 8px;
    background: #f2f2f2;
    border: 1px solid #d7d7d7;            
}

.list > .paging > .current {
    border: 1px solid #6d6d6d;
    background: #888;
    color: #fff;
}
.list > .btnWrite {
    position: absolute;
    bottom: 14px;
    right: 0;
}
</style>
<jsp:include page="./_aside${group}.jsp"/> <!-- header에서 파라미터로 전송한 데이터를 ListController에서 속성으로 저장하여 표현언어로 참조가능 -->
			<section class="list">
			    <h3>글목록</h3>
			    <article>
			   
			        <table border="0">
			            <tr>
			                <th>번호</th>
			                <th>제목</th>
			                <th>글쓴이</th>
			                <th>날짜</th>
			                <th>조회</th>
			            </tr>
			            <c:forEach var="article" items="${articles}">                    
				            <tr>
				                <td>${pageStartNum = pageStartNum - 1}</td>
				                <td><a href="./view.do?group=${group}&cate=${cate}&no=${article.no}">${article.title}[${article.comment}]</a></td>
				                <td>${article.nick}</td>
				                <td>${article.rdate}</td>
				                <td>${article.hit}</td>
				            </tr>
			            </c:forEach>
			        </table>
			    </article>
			
			    <!-- 페이지 네비게이션 -->
		        <div class="paging">
		        	<c:if test="${pageGroupStart > 1}">
		            	<a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}&pg=${pageGroupStart - 1}" class="prev">이전</a>
		            </c:if>
		            <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
		            	<a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}&pg=${i}" class="num ${currentPage == i?'current':'off'}">${i}</a>
		            </c:forEach>
		            <c:if test="${pageGroupEnd < lastPageNum}">
		            	<a href="/Farmstory2/board/list.do?group=${group}&cate=${cate}&pg=${pageGroupEnd + 1}" class="next">다음</a>
		            </c:if>
		        </div>
			
			    <!-- 글쓰기 버튼 -->
			    <a href="./write.do?group=${group}&cate=${cate}" class="btnWrite">글쓰기</a>
			</section>
			<!-- 내용 끝 -->

        </article>
    </section>
</div>			
<%@ include file="../_footer.jsp" %>