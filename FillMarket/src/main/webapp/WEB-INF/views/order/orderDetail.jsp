<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세 조회</title>
<!-- 타이틀 로고 -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderDetail.css">
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
        <div class="top">
            <span class="title">주문상세정보</span>
        </div>
        <div class="top2">
            <span class="title2">주문정보</span>
        </div>
        <br>
        <div class="myOrderDetail">
            <table id="myOrderDetail_tb">
                <tr>
                    <td>주문정보</td>
                    <td>20211116-1234</td>
                </tr>
                <tr>
                    <td>주문일자</td>
                    <td>2021-11-16 20:15:59</td>
                </tr>
                <tr>
                    <td>주문자</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>주문처리상태</td>
                    <td>배송중</td>
                </tr>
            </table>
        </div>
        <br>
        <div class="top2">
            <span class="title2">결제정보</span>
        </div>
        <br>
        <div class="paymentDetail">
            <table id="paymentDetail_tb">
                <tr>
                    <td>총 주문금액</td>
                    <td>280,000원</td>
                </tr>
                <tr>
                    <td>배송비</td>
                    <td>무료배송</td>
                </tr>
                <tr>
                    <td>총 결제금액</td>
                    <td>280,000</td>
                </tr>
                <tr>
                    <td>결제수단</td>
                    <td>카드 결제</td>
                </tr>
            </table>
        </div>
        <br>
        <div class="top2">
            <span class="title2">주문 상품 정보</span>
        </div>
        <br>
        <div class="orderProductInfo">
            <table id="orderProductInfo_tb">
                <thead>
                    <tr>
                        <th width="200px">이미지</th>
                        <th width="590px">상 품</th>
                        <th width="50px">수 량</th>
                        <th width="140px">합 계</th>
                        <th width="130px">처리상태</th>
                        <th width="100px">취소/교환/반품</th>
                    </tr>
                    <tbody>
                        <tr>
                            <td><img src="../images/childLife.png"></td>
                            <td><h5>ChildLife 차일드라이프 비타민D3 천연 베리맛 30ml</h5></td>
                            <td>2</td>
                            <td>140,000</td>
                            <td>배송중</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </thead>
            </table>
        </div>
        <br>
        <div class="top2">
            <span class="title2">배송지 정보</span>
        </div>
        <br>
        <div class="deliveryInfo">
            <table id="deliveryInfo_tb">
                <tr>
                    <td>받으시는 분</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>우편번호</td>
                    <td>54221</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>서울 강남구 테헤란로14길 6 남도빌딩</td>
                </tr>
                <tr>
                    <td>휴대전화</td>
                    <td>010-1111-2222</td>
                </tr>
            </table>
        </div>
        <br><br><br><br><br><br>
        <div class="btnArea">
            <button id="goOrderList">주문 내역 목록</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="goProductList">쇼핑 계속하기</button>    
        </div>
    </section>

    <br><br><br><br><br><br><br><br><br><br>
	<c:import url="../common/footer.jsp" />
</body>
</html>