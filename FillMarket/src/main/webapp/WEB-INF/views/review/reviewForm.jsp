<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="../resources/css/qstyle.css">
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
	
	#header{ color : rgba(0, 0, 0, 0.35) ;
			 text-align: center; }
	#reviewForm_header {
	text-align: center;
	color: rgb(255, 142, 117);;
}	
	</style>
<c:import url="../common/header.jsp" />
<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=title]","[name=cont]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<c:import url="../common/navbar.jsp" />
	<div class="container">
	<br />
                <h1 id="reviewForm_header" class="h3 mb-3 fw-normal mt-5 pt-5">
					<strong>REVIEW FORM PAGE</strong>
				</h1>
                <br />
                <br />
                <br />
                <br />
		<form name="boardFrm"
			action="${pageContext.request.contextPath}/review/reviewForm.do"
			method="post" onsubmit="return validate();">
			<div class="input-group" id="title_write">
				<span class="input-group-text" id="inputGroup-sizing-default"
					requeird>제목</span> 
				<input type="text" placeholder="리뷰 제목" class="form-control" name="retitle" >	

				<input type="text" class="form-control" name="reuserid" value="${member.userId}" readonly required>
			</div>
			<div class="textarea">
				<textarea placeholder="리뷰 내용" name="recontent" rows="15" cols="155"></textarea>
			</div>
			<div class="button">
				<input class="btn btn-primary" type="submit" value="등록">
				<input class="btn btn-primary" type="button" value="취소"
					onclick="location.href='${pageContext.request.contextPath}/review/reviewList.do'">
		</form>
	</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</body>
</html>