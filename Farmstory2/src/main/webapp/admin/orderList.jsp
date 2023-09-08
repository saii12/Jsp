<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

<script>
	$(function(){

		$('.showPopup').click(function(e){
			e.preventDefault();
			$('#orderPopup').show();
		});

		$('#orderPopup .btnClose').click(function(){
			$('#orderPopup').hide();
		});

	});
</script>
<main>
    <aside>
        <h3>주요기능</h3>
        <ul>
            <li><a href="#">상품관리</a></li>
            <li class="on"><a href="#">주문관리</a></li>
            <li><a href="#">회원관리</a></li>                    
        </ul>
    </aside>
    <section id="orderList">
        <nav>
            <h3>주문목록</h3>
        </nav>

        <article>
            <table border="0">
                <tr>
                    <th><input type="checkbox" name="all"/></th>
                    <th>주문번호</th>
                    <th>상품명</th>
                    <th>판매가격</th>
                    <th>수량</th>
                    <th>배송비</th>
                    <th>합계</th>
                    <th>주문자</th>
                    <th>주문일</th>
                    <th>확인</th>
                </tr>
                <c:forEach var="order" items="${orders}">
                <tr>
                    <td><input type="checkbox" name=""/></td>
                    <td>${order.orderNo}</td>
                    <td>${order.pName}</td>
                    <td>${order.orderPrice}</td>
                    <td>${order.orderCount}</td>
                    <td>${order.orderDelivery}</td>
                    <td>${order.orderTotal}</td>
                    <td>${order.orderUser}</td>
                    <td>${order.orderDate}</td>
                    <td><a href="#" class="showPopup" onclick="userData(this)" data-value="${dto}">[상세확인]</a>
                </tr>
                </c:forEach>
            </table>
            <p>
                <a href="#" class="orderDelete">선택삭제</a>                        
            </p>
            
            <p class="paging">
            	<c:if test="${pageGroupStart > 1}">
	            	<a href="/Farmstory2/admin/orderList.do?pg=${pageGroupStart - 1}" class="prev"><</a> <!-- ${ctxpath} 강사님 꺼 복붙해서 안됬었음 -->
	            </c:if>
	            <c:forEach var="i" begin="${pageGroupStart}" end="${pageGroupEnd}">
	            	<a href="/Farmstory2/admin/orderList.do?pg=${i}&" class="num ${currentPage == i?'current':'off'}">[${i}]</a>
	            </c:forEach>
	            <c:if test="${pageGroupEnd < lastPageNum}">
	            	<a href="/Farmstory2/admin/orderList.do?&pg=${pageGroupEnd + 1}" class="next">></a>
	            </c:if>
            </p>
        </article>
    </section>
</main>
<div id="orderPopup">
    <section>
        <nav>
            <h1>상세주문내역</h1>
            <button class="btnClose">닫기</button>
        </nav>

        <article>  
            <h3>기본정보</h3>
            <table border="0">
                <tr>
                    <td rowspan="7" class="thumb"><img src="./images//sample_item1.jpg" alt="사과 500g"></td>
                    <td>상품번호</td>
                    <td>1011</td>
                </tr>
                <tr>
                    <td>상품명</td>
                    <td>사과 500g</td>
                </tr>
                <tr>
                    <td>판매가격</td>
                    <td>4,000원</td>
                </tr>
                <tr>
                    <td>수량</td>
                    <td>2개</td>
                </tr>
                <tr>
                    <td>배송비</td>
                    <td>3,000원</td>
                </tr>
                <tr>
                    <td>합계</td>
                    <td>11,000원</td>
                </tr>
                <tr>
                    <td>주문자</td>
                    <td>홍길동</td>
                </tr>                        
            </table>

            <h3>배송지 정보</h3>
            <table border="0">
                <tr>
                    <td>받는분</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>배송지</td>
                    <td>부산광역시 부산진구 대연동 120 루미너스 10층</td>
                </tr>
            </table>
        </article>
    </section>
</div><!-- orderPopup end -->
<%@ include file="./_footer.jsp" %>