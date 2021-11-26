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

#chartdiv {
	transition: 5s;
}
#myInfo{
	margin-left : 50px;
}
#result{
	display: none;
}
</style>


<c:import url="../common/adminSide.jsp" />
<script>
	function yearMonth(){
		$('#productChart').hide();
		$('#chartdiv').show(100);
		//$('#chartdiv').css('visibility', 'visible');
	}
	
		$(function(){
			$("#selectVal").val('${myMember.levelType}')
			
			
			$("tr[id]").on("click",function(){
				var userId = $(this).attr("id");
				console.log("userId="+userId);
				
				$.ajax({
					url : "${pageContext.request.contextPath}/admin/productGraph.do",
					data : {pno : pno},
					dataType: "html",
			        success : function(data){
			        	$('#productChart').show();
			        	 $('#chartdiv').hide(100);
			        	// $('#chartdiv').css('visibility', 'hidden');
			        	$('#productChart').html(data);
			        }
					
				})
				
			});
			
			$("#Export").on("click", function(){
				// 캡쳐 라이브러리를 통해서 canvas 오브젝트를 받고 이미지 파일로 리턴한다.
				html2canvas(document.querySelector("#capture")).then(canvas => {
				saveAs(canvas.toDataURL('image/png'),"capture-test.png");
				});
				});
				function saveAs(uri, filename) {
				// 캡쳐된 파일을 이미지 파일로 내보낸다.
				var link = document.createElement('a');
				if (typeof link.download === 'string') {
				link.href = uri;
				link.download = filename;
				document.body.appendChild(link);
				link.click();
				document.body.removeChild(link);
				} else {
				window.open(uri);
				}
				}
				
				
				
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

<style>
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
#memoge{
	width: 100%;
}
</style>

<!-- Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<!-- Chart code -->

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
			<h1 class="h2">매출</h1>
			<div class="btn-toolbar mb-2 mb-md-0">
				<div class="btn-group me-2">
					<button type="button" class="btn btn-sm btn-outline-secondary"
						onclick="yearMonth()">년/월</button>
					<button type="button" class="btn btn-sm btn-outline-secondary"
						id="Export">Export</button>
				</div>

			</div>
		</div>

		<div id="myInfo" class="col-md-12">
			<div id="firstCont" class="col-md-7">
				<form name="signUpForm" class="form" role="form">
					<div class="container">
						<div class="row">
						<h3>유저 정보</h3>
									<table class="table">
										<tr>
											<td>아이디</td>
											<td>${myMember.userId } <select class="form-select" name="levelType" id="selectVal">
													<option value="1">사용자</option>
													<option value="2">관리자</option>
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

										<tr id="menu">
											  <td class="text-center">
								<button onclick="location.href='MemberUpdateForm.jsp?id='"
									class="btn btn-primary">회원수정</button>  
											<td><c:set var="status"
													value="${myMember.status}" /> <c:choose>
													<c:when test="${status eq 'Y'}">

														<button onclick="userDelete('${member.userId}');"
															class="btn btn-danger">회원삭제</button>

													</c:when>
													<c:when test="${status eq 'N'}">

														<button onclick="userRes('${member.userId}');"
															class="btn btn-danger">회원복구</button>

													</c:when>
												</c:choose>
												
											</td>
											
										</tr>


									</table>
								
							
						</div>
						<!-- row -->
					</div>
				</form>
			</div>
			<div id="secondCont" class="col-md-4">
				<h1>메모장</h1>
				<textarea id="memoge" rows="15" style="resize: none;">${myMember.memo }</textarea>
				<span id="result"></span>			
			</div>
		<div id="members"></div>
		</div>
		<!--<canvas class="my-4 w-100 chartjs-render-monitor" id="myChart" width="912" height="385" style="display: block; width: 912px; height: 385px;"></canvas>
 		-->
		<h2>상품</h2>
		<div class="table-responsive justify-content-md-center">
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
	</div>

</body>
</html>