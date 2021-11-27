<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<table class="table">
	
	
	
	<h3>주문내역</h3>
	<span>${orderlist[0].orderuserid }님의 주문내역입니다.</span>
	<tr>
		<th>주문번호</th>
		<th>상품명</th>	
	</tr>
	<c:forEach items="${orderlist}" var="ol">
		<tr>
			<td><a style="text-decoration: none;" href="${pageContext.request.contextPath}/order/orderDetail.do?n=${ ol.orderid }">${ol.orderid }</a></td>
			<td>${ol.pname }</td>
			
		</tr>
		
	</c:forEach>
	
	
</table>
<c:out value="${pageBar}" escapeXml="false"/>