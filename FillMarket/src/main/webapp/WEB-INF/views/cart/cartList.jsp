<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- fontawesome 아이콘cdn -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/cartList.css" />
<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
	<br>
	<br>
	<section class="section">
		<div class="top">
			<span class="cart">장바구니</span>
			<span><button id="deleteChecked">선택 상품 삭제</button></span>
		</div>
		<br> <br>
		<div class="cart_tb">
			<table id="cartList">
				<thead>
                        <tr>
                            <th width="30px"></th>
                            <th width="160px">이미지</th>
                            <th width="570px">상 품</th>
                            <th width="180px">가 격</th>
                            <th width="120px">수 량</th>
                            <th width="180px">합 계</th>
                            <th width="20px"></th>
                        </tr>
				</thead>
				<tbody>
					<c:choose><c:when test="${ list != null }">
					<c:forEach items="${list}" var="cartList" varStatus="i">
					<tr>
						<td id="checked"><input type="checkbox"></td>
						<td id="productImg">
							<img src="${pageContext.request.contextPath}/resources/productUpload/20211115_171451_674.png"/>
						</td>
						<td style="text-align: left;"><h5>${ cartList.pname }</h5></td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${ cartList.pprice }" /> 원
						</td>
						<td>
							<input style="width: 35px; height:23px" type="number" min="1" name="amount" value="${ cartList.amount }">
							<button type="submit" id="updateBtn">수정</button> 
							<input type="hidden" name="cartno" value="${ cartList.cartno }"> 
							<input type="hidden" name="pno" value="${ cartList.pno }">
							<input type="hidden" name="userId" value="${ userId }" />
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${ cartList.orderprice }" /> 원
						</td>
						<td> ###,### 원</td>
						<td id="deleteBtn">
							<a href="${path}/cart/cartDelete.do?cno=${ cartList.cno }"> 
							<i id="deleteIcon" class="fas fa-times"></i></a>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<table id="cartList2">
				<tr>
					<td><b>Total</b></td>
					<td style="text-align: right;"><b><fmt:formatNumber pattern="###,###,###" value="${ map.sumPrice }" /> 원</b>
					</td>
				</tr>
				<tr>
					<td>배송비</td>
					<td style="text-align: right;">${ map.fee } 원</td>
				</tr>
			</table>
			<br> <br>
			<table id="cartList2">
				<tr>
					<td><b>총 주문 금액</b></td>
					<td style="text-align: right;">
						<h3>
							<fmt:formatNumber pattern="###,###,###" value="${ map.allSum }" /> 원
						</h3>
					</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td id="emptyMsg" colspan="7"><h3>장바구니가 비어있습니다.</h3></td>
				</tr>
				</c:otherwise></c:choose>
			</table>
		</div>
        <br><br>
        <div class="btnArea">
            <button id="checkedOrder" onclick="goCheckedOrder();">선택 상품 주문하기</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="orderBtn" onclick="goOrder();">주문하기</button>
        </div>
    </section>
    <br><br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp" />
	
	<script>
	
	</script>
</body>
</html>