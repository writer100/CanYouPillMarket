<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>리뷰 목록</title>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!-- css -->
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css">
	<!-- 타이틀 로고 -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/finalLogo.ico" />
	<style>
	.row {
    display: flex;
    flex-wrap: wrap;
    margin-right: calc(-.5 * var(--bs-gutter-x));
    margin-left: calc(-.5 * var(--bs-gutter-x));
    justify-content: center;
	}
	.table{
		text-align: center;
		border-bottom : 1px solid rgba(0, 0, 0, 0.35);
	}
	.search{ text-align: center; }
	
	.btn{ background-color : rgb(255, 142, 117); color: white; }
	
	.my.pagination > .active > a, 
	.my.pagination > .active > span, 
	.my.pagination > .active > a:hover, 
	.my.pagination > .active > span:hover, 
	.my.pagination > .active > a:focus, 
	.my.pagination > .active > span:focus {
  		background: rgb(255, 142, 117);
 		 border-color: rgb(255, 142, 117);
	}
	
	#header{ color : rgba(0, 0, 0, 0.35) ;
			 text-align: center; }
	#review_header {
	text-align: center;
	color: rgb(255, 142, 117);
}	
	</style>
</head>
<body>
	<!-- 헤더와 네비바 -->
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
	<div id="container">
	  			<br />
                <h1 id="review_header" class="h3 mb-3 fw-normal mt-5 pt-5">
					<strong>REVIEW PAGE</strong>
				</h1>
                <br />
                <br />
                <br />
                <br />
	    <div class="row product" wieth="70%" style="text-align: center;">
			<table class="mx-auto" style="width: 80%;">
                 <thead>
                     <tr>
	                     <th>번호</th>
	                     <th>제목</th>
	                     <th>수정/삭제</th>
                     </tr>
                 </thead>
                 
                 <c:forEach items="${list}" var = "review">
                         <td>${review.reno }</td>
                         <td>${review.retitle }</td>
                         <td>
                         	<input type="hidden" name="reno" value="${review.reno}" />
							<button class="btn" style="background-color: rgb(255, 142, 117);" type="button" onclick="location.href='${pageContext.request.contextPath}/review/reviewUpdateView.do?reno=${review.reno}'">수정</button>
          	                &nbsp;&nbsp;
          	                <button class="btn" style="background-color: rgb(255, 142, 117);" type="button" onclick="location.href='${pageContext.request.contextPath}/review/reviewList.do'">삭제</button>
	
                         </td>
                     </tr>
                 </c:forEach>
             
             </table>
			
			<div>
				<br />
			</div>
	        <!-- 페이지 번호 -->
	        <div class="ListNum">
	           <br />
	           
	           <c:out value=" ${pageBar}" escapeXml="false"/>
	           
	           <br />
	           <br />
	        </div>
	    </div>
	</div>
	<c:import url="../common/footer.jsp" />
	
	<script>
	

	</script>
	<!-- JQuery CDN-->
	<script src="https://code.jquery.com/jquery-2.2.4.js"
		integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
		crossorigin="anonymous></script>	
</body>
</html>