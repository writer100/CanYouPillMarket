<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품 목록</title>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- css -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	
	<style>

	</style>
</head>
<body>
	<!-- 헤더와 네비바 -->
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
	
	<div class="container" style="width: 70%">
		
		<div class="row"><h1 class="page-header" style="text-align: center; margin-bottom: 50px;">${product.pname}</h1>
			<input type="hidden" value="${product.pno}" id="pno">
		</div>
		<div class="row" style="float: left; text-align: center; width:35%;">
			<img alt="productPhoto" src="/resources/productUpload${pattachment.changename}" width="150%"">
		</div>

		<div class="row productInfo" style="width: 40%; float: right;" >
			<div class="form-group" style="text-align: center;">
				<h3 class="page-header"><span>${product.pname}</span><br><small>${product.pinfo}</small></h3>
			</div>
			<div class="form-group" style="text-align: left;">
				<label>가격 : </label><span>&nbsp;<fmt:formatNumber value="${product.pprice}" type="number"/></span><span>&nbsp;원</span>
				<input type="hidden" value="${product.pprice}" id="pprice">
			</div>
			<div class="form-group" style="text-align: left;">
				<label>배송비 : </label><span>&nbsp;2500원</span>
				<p>도서산간지역 배송비 5000원</p>
			</div>
	
			<div class="form-horizontal" style="text-align: left;">
				<label>구매수량 : </label> 
				<select class="form-control" id="select_count">
				<c:forEach begin="1" end="${product.pstock}" var="product">
					<option>${product.pstock}</option>
				</c:forEach>
				</select>
			</div>	
			<hr>
			
			<div class="row">
				<div class="selected_option" style="text-align: right;">
				</div>
				<div style="text-align: center;">
					<button class="btn btn-default">장바구니</button>
				</div>
			</div>
			<hr>	
		</div>
	</div>
	<div class="container">
		<div class="row nav">
			<nav id="middle_nav">
				<ul class="nav nav-tabs nav-justified">
					<li id="about">상품상세</li>
					<li id="review">리뷰</li>
				</ul>
			</nav>
		</div>
		
		<div class="row" style="margin: 50px 0;">
			<h1 class="jumbotron">
				<div class="container">
					<h1>Hello world</h1>
					<small>This is product page.</small>
				</div>
			</h1>
		</div>
		
		<div class="row about_product" style="text-align: center;">
			<h1 class="page-header">상품 상세</h1>

		</div>
		<div class="row reviews" style="text-align: center; margin: 80px 0;">
			<h1 class="page-header" style="margin-bottom: 50px;">Review</h1>
			<c:forEach begin="1" end="5">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Panel title</h3>
				</div>
				<div class="panel-body">Panel content</div>
			</div>
			</c:forEach>
		</div>

	<c:import url="../common/footer.jsp" />
		
</body>
</html>