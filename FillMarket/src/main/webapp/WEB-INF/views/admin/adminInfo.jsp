<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/adminSide.jsp" />
<style>
	textarea{
		margin-left : 300px;
	}
</style>
</head>
<body>
	
	<div>
		<textarea rows="30" cols="30" id="memo"></textarea>
		<div id="check"></div>
	</div>
	<script>
		$(function(){
			$('#memo').on("keyup", function(){
				var memo = $(this).val();
				// console.log(memo)
				
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/adminMemo.do",
						data : {memo : memo}
						dataType: "json",
						success : function(data){
							$('#check').html("지금 까지 저장 됨");
							
						}
					
					})
				
				
				
			})
		})
	</script>
	
</body>
</html>