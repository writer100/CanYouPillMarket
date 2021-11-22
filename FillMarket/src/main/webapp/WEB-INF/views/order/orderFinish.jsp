<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderFinish.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- 구글 폰트 cdn -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous">
</script>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
    <br><br><br><br><br>

    <section>
        <div class="orderMSG">
            <p>결제가 완료되었습니다. 주문해 주셔서 감사합니다.</p>
        </div>
        <br><br><br>
        <div class="top">
            <span class="title">결제내역</span>
        </div>
        <br>
        <div class="order_tb">
            <table id="orderList">
                <thead>
                    <tr>
                        <th width="100px">주문 일자</th>
                        <th width="900px">상품 정보</th>
                        <th width="100px">수량</th>
                        <th width="200px">주문 가격</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>20211116</td>
                        <td>
                            <h5>ChildLife 차일드라이프 비타민D3 천연 베리맛 30ml</h5>
                        </td>
                        <td>2</td>
                        <td>140,000</td>
                        <!-- <td><button id="cancelBtn">주문취소</button></td> -->
                    </tr>
                    <tr>
                        <td>20211116</td>
                        <td>
                            <h5>ChildLife 차일드라이프 비타민D3 천연 베리맛 30ml</h5>
                        </td>
                        <td>2</td>
                        <td>140,000</td>
                        <!-- <td><button id="cancelBtn">주문취소</button></td> -->
                    </tr>
                </tbody>
            </table>
            <br>

            <table id="orderList3">
                <tr>
                    <td>총 결제금액</td>
                    <td style="text-align: right;">280,000</td>
                </tr>
            </table>
            <br><br><br>

        </div>
        <br><br><br><br>
        <div class="btnArea">
            <button id="goOrderList">주문내역 확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="goProductList">쇼핑 계속하기</button>    
        </div>
    </section>

    
    <br><br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp" />
</body>
</html>