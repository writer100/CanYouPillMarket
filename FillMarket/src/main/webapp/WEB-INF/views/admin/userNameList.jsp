<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<body>
	
	
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
					
					<tr id="${m.userId }">
						<td class="mid">${m.userId }</td>
						<td class="mini">${m.userName }</td>
						<td class="long">${m.address }</td>
						<td class="mid">${m.phone }</td>
						<td class="mid">${m.birth }</td>
						<td class="mini">${m.gender }</td>
						<td class="mini">${m.status }</td>
					</tr>
					</c:forEach>
					
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
				
				<script>
				$(function(){
					$("tr[id]").on("click",function(){
						var userId = $(this).attr("id");
						console.log("userId="+userId);
						location.href = "${pageContext.request.contextPath}/admin/adminUserView.do?userid="+userId;
					});
					
						
					});

				</script>
	
	
</body>