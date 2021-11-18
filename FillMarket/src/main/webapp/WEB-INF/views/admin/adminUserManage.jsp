<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자관리</title>
<c:import url="../common/adminSide.jsp" />
<style>
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
		
		.mini{
			width : 100px;
			text-align: center;
		}
		.long{
			text-align: center;
		}
		
		
		.mid{
			width : 150px;
			text-align: center;
		}
		
		
		
		
	</style>
	<script>
		function fn_goProductForm(){
			location.href = "${pageContext.request.contextPath}/admin/productFrom.do";
		}
		
		$(function(){
			$("tr[id]").on("click",function(){
				var pno = $(this).attr("id");
				console.log("pno="+pno);
				location.href = "${pageContext.request.contextPath}/admin/adminView.do?pno="+pno;
			});
		});
	</script>
</head>
<body>
<div id="container">
			<section id="board-container" class="container" >
			<br />
				<h1>사용자 관리</h1>
				<input type="button" value="상품등록" id="btn-add" class="btn btn-outline-success" onclick="fn_goProductForm();"/>
				<input type="text" />
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th class="mid">아이디</th>
						<th class="mini">이름</th>		
						<th class="long">주소</th>
						<th class="mid">연락처</th>
						<th class="mid">생년월일</th>
						<th class="mini">성별</th>
						<th class="mini">회원상태</th>
						
					</tr>
					<c:forEach items="${list}" var="m"> 
					<tr id="${m.userid }">
						<td class="mid">${m.userid }</td>
						<td class="mini">${m.username }</td>
						<td class="long">${m.address }</td>
						<td class="mid">${m.phone }</td>
						<td class="mid">${m.birth }</td>
						<td class="mini">${m.gender }</td>
						<td class="mini">${m.status }</td>
						
						
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
			</section>
	</div>
	
</body>
</html>