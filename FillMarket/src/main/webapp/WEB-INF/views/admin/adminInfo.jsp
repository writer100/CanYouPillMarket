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
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<style>
#imagefile {
	width: 30px;
	height: 30px;
}

#myInfo {
	margin-left: 50px;
}

#result {
	display: none;
}

#members {
	display: none;
	height: auto;
}

#myInfo {
	width: 100%;
	height: auto;
}

#firstCont {
	display: inline-block;
	height: auto;
}

#secondCont {
	display: inline-table;
	width: 100%;
	height: 385px;
}

#memoge {
	width: 100%;
}
#orderList{
	display: none;
}
#userName{
	float : right;
}
#userNameList{
	display: none;
}
</style>


<c:import url="../common/adminSide.jsp" />
<script>
	function myInfo(){
		$('#members').hide();
		$('#firstCont').show();
		
	}
	

			
	
		$(function(){
			
			
		
			
			$("tr[id]").on("click",function(){
				var userId = $(this).attr("id");
				console.log("userId="+userId);
				
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/userClick.do",
					data : {userId : userId},
					dataType: "html",
			        success : function(data){
			        	
			        	$('#members').show().css("display", 'inline-block');
			        	$('#firstCont').hide();
			        	$('#members').html(data);
			        	
			        }
					
				})
				
			});
			

				
				
				$('#memoge').on('keyup', function(){
					var memo = $('#memoge').val();
					var userId = '${myMember.userId}'
					// console.log(memo);
					
					$.ajax({
						url : "${pageContext.request.contextPath}/admin/memoSave.do",
						data : {memo : memo, userId : userId},
						dataType: "json",
				        success : function(data){
				        	
				        		if(data){
	
				        			$('#result').show(500);
					        		$('#result').html('메모가 저장되었습니다.').css('color', 'blue');
 				
				        		}
				        	
				        }
					})
				})
				
				 
				setInterval(function(){
					$('#result').hide(3000);
				},6000)
				
				
				
				$('#userName').on("keyup",function(){
					var userName = $(this).val().trim();
					console.log("userName="+userName);
					
					if(userName.length == 0){
						$('#AlluserList').show()
						$('#userNameList').hide()
					}else{
						$.ajax({
							 url  : "${pageContext.request.contextPath}/admin/checkNameList.do",
					         data : {userName : userName},
					         dataType: "html",
					         success : function(data){
					        	 
					        	 $('#AlluserList').hide()
					        	 $('#userNameList').show()
					        	 $('#userNameList').html(data)
					        	 
					         }
						})
					}
					
					
				});
				
			
		});
				
		function userDelete(userId){
			var check = confirm("회원 " +userId+ " 님의 아이디를 삭제하시겠습니까");
			
			if(check == true){
				$.ajax({
					url : '${pageContext.request.contextPath}/admin/userDelete.do',
					data : { userId : userId }, 
					dataType : 'json',
					success : function(data){
						if(data == true) {
							alert("회원 삭제 완료!");
							// location.href="${pageContext.request.contextPath}/admin/adminUserManageList.do";
						} else {
							alert("회원 삭제 실패!");
						}
					}
				})
			}else{
				alert("취소되었습니다.")
			}
		}
		function userRes(userId){
			var check = confirm("회원 " +userId+ " 님의 아이디를 복구하시겠습니까");
			
			if(check == true){
				$.ajax({
					url : '${pageContext.request.contextPath}/admin/userRes.do',
					data : {userId : userId}, 
					dataType : 'json',
					success : function(data){
						if(data == true) {
							alert("회원 복구 완료!");
							//location.href="${pageContext.request.contextPath}/admin/adminUserView.do?userid="+userId;
						} else {
							alert("회원 복구 실패!");
						}
					}
				})
			}else{
				alert("취소되었습니다.")
			}
		}
		
		
	</script>



</head>
<body>
	<div class="col-md-10" style="margin-left: 250px;" id="capture">
		<div class="chartjs-size-monitor">
			<div class="chartjs-size-monitor-expand">
				<div class=""></div>
			</div>
			<div class="chartjs-size-monitor-shrink">
				<div class=""></div>
			</div>
		</div>
		<div
			class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom ">
			<h1 class="h2">사용자 관리</h1>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group me-2">
					<button type="button" class="btn btn-sm btn-outline-secondary"
						onclick="myInfo()">내정보</button>
					<button type="button" class="btn btn-sm btn-outline-secondary"
						onclick="memoView()">메모장</button>
				</div>

			</div>
		</div>

		<div id="myInfo" class="col-md-12">
			<div id="firstCont" class="col-md-7">
				
					<div class="container">
						<div class="row">
							<h3>유저 정보</h3>
							<table class="table">
								<tr>
									<td class="td col-2">아이디</td>
									<td>${myMember.userId }<select class="form-select"
										name="levelType" id="selectVala">
											<option value="1" <c:if test="${myMember.levelType == 1}">selected</c:if>>사용자</option>
											<option value="2" <c:if test="${myMember.levelType == 2}">selected</c:if>>관리자</option>
									</select></td>


								</tr>

								<tr>
									<td>이름</td>
									<td>${myMember.userName }</td>

								</tr>

								<tr>
									<td>이메일</td>
									<td>${myMember.email }</td>

								</tr>

								<tr>
									<td>전화</td>
									<td>${myMember.phone }</td>

								</tr>

								<tr>
									<td>주소</td>
									<td>${myMember.address }</td>

								</tr>

								<tr>
									<td>생년월일</td>
									<td>${myMember.birth }</td>

								</tr>

								<tr>
									<td>상태</td>
									<td>${myMember.status }</td>

								</tr>

								<tr>
									<td></td>
									<td>
										<button onclick="adminAuthorA('${myMember.userId}');"
											class="btn btn-primary">회원수정</button>
											
										<button class="btn btn-success" onclick="orderList('${myMember.userId}');">주문내역</button>
										
										 <c:set
											var="status" value="${myMember.status}" /> <c:choose>
											<c:when test="${status eq 'Y'}">
												<button onclick="userDelete('${myMember.userId}');"
													class="btn btn-danger">회원삭제</button>
											</c:when>
											<c:when test="${status eq 'N'}">

												<button onclick="userRes('${myMember.userId}');"
													class="btn btn-danger">회원복구</button>
											</c:when>
										</c:choose>
									
									</td>
								</tr>


							</table>


						</div>
						<!-- row -->
					</div>
				
			</div>
			<div id="members" class="col-md-7"></div>
			<div id="secondCont" class="col-md-4">
				<h1>메모장</h1>
				<textarea id="memoge" rows="15" style="resize: none;">${myMember.memo }</textarea>
				<span id="result"></span>
			</div>
			<div id="orderList" class="col-md-4"></div>

		</div>
		<!--<canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" width="912" height="385" style="display: block; width: 912px; height: 385px;"></canvas>
 		-->
		<h2 style="display : inline;">유저</h2><br />
		<input type="text" id="userName" placeholder="이름"/>
		<div class="table-responsive justify-content-md-center">
		<div id="AlluserList">
			<table class="table table-hover table-sm">
				<thead>
					<tr>
						<th scope="col" style="text-align: center;">아이디</th>
						<th scope="col" style="text-align: center;">역할</th>
						<th scope="col" style="text-align: center;">주소</th>
						<th scope="col" style="text-align: center;">연락처</th>
						<th scope="col" style="text-align: center;">생년월일</th>
						<th scope="col" style="text-align: center;">이름</th>
						<th scope="col" style="text-align: center;">상태</th>


					</tr>
				</thead>
				<tbody>
				
					<c:forEach items="${list}" var="u">
						<tr id="${u.userId}">
							<td style="text-align: center;">${u.userId}</td>
							<td style="text-align: center;"><c:choose>
									<c:when test="${u.levelType == 1 }">사용자</c:when>
									<c:when test="${u.levelType == 2 }">관리자</c:when>
								</c:choose></td>

							<td style="text-align: center;">${u.address}</td>
							<td style="text-align: center;">${u.phone }</td>
							<td style="text-align: center;">${u.birth}</td>
							<td style="text-align: center;">${u.userName }</td>
							<td style="text-align: center;">${u.status }</td>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
			<c:out value="${pageBar}" escapeXml="false" />
		</div>
		<div id="userNameList"></div>
	</div>
<script>
function orderList(userId){
	
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/adminOrderList.do",
		data : {userId : userId},
		dataType :"html",
		success : function(data){
			
			$('#orderList').show().css("display", 'inline-table');
			$('#secondCont').hide();
			$('#orderList').html(data);
			},
		error: function() {
            alert("주문하신 정보가 없습니다.");
			}
		})
	}
	function memoView(){
		$('#orderList').hide()
		$('#secondCont').show();
	}
	
	function adminAuthorA(userId){
		var selectAuthor = $('#selectVala').val();
		var myAuthor = ${myMember.levelType}
		alert("나의 권한은 ?????"+myAuthor)
		
		if(selectAuthor == myAuthor){
			alert("이미 ")
		}
		
		
	
	}
	
	
</script>
</body>
</html>