<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
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
	href="${pageContext.request.contextPath}/resources/css/login.css">

</head>
<body>
	<c:import url="views/common/header.jsp" />
	<c:import url="views/common/navbar.jsp" />

	<main class="form-signin">
		<div id="login-div">
			<form action="memberLoginEnd.do">
				<img src="/docs/5.1/assets/brand/bootstrap-logo.svg" alt=""
					width="72" height="57">
				<h1 class="h3 mb-3 fw-normal">Sign in</h1>

				<div class="form-group">
					<label for="id"></label> <input type="text" name="userId"
						class="form-control" placeholder="아이디를 입력하세요.">
				</div>

				<div class="form-group">
					<label for="password"></label> <input type="password"
						name="password" class="form-control" placeholder="비밀번호를 입력하세요.">
				</div>

				<div class="checkbox mb-3 mt-3">
					<label> <input type="checkbox" value="remember-me">
						아이디 기억하기
					</label>
				</div>
				<button class="btn" type="submit" value="Submit" id="loginBtn">로그인</button>

			</form>
			<button class="btn" type="submit" value="Submit" id="signBtn">
				<a href="#" id="signBtn-a" class="btn-signup">회원가입</a>
			</button>

			<nav class="findBox mt-3">
				<a href="#">아이디/비밀번호 찾기</a>
			</nav>

			<h3 class="mt-2" style="text-align: left;">간편 로그인</h3>

			<div class="bigContainer">
				<div class="loginApiBox">

					<!-- 카카오톡 로그인 버튼 -->
					<button class="btn ApiBtn" type="submit" value="Submit"
						style="background-color: rgb(252, 233, 78);">카카오톡 로그인</button>
					<!-- // 카카오톡 로그인 버튼 -->

					<!-- 네이버 로그인 버튼 -->
					<button class="btn ApiBtn ms-4" type="submit" value="Submit"
						style="background-color: rgb(96, 197, 58); color: white;">네이버
						로그인</button>
					<!-- // 네이버 로그인 버튼 -->
				</div>
			</div>
		</div>
	</main>
	
	<!-- JQuery CDN-->
	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous">
		
	</script>
	<c:import url="views/common/footer.jsp" />
</body>

</html>