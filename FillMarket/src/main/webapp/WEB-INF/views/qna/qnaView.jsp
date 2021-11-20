<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세 내용</title>
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
	href="${pageContext.request.contextPath}/resources/css/qstyle.css">
<c:import url="../common/header.jsp" />
</head>

<body>
	<div class="container">
		<div class="board_title">
			<div class="board_title_a">문의글 작성</div>
		</div>
		<div class="input-group" id="title_write">
			<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
			<select class="form-select" aria-label="Default select example">
				<option value="0" disabled selected hidden>문의 유형 선택</option>
				<option value="1">주문/결제</option>
				<option value="2">배송 문의</option>
				<option value="3">교환/반품</option>
				<option value="4">기타 문의</option>
			</select> <input type="text" placeholder="제목 입력" class="form-control"
				aria-label="Sizing example input"
				aria-describedby="inputGroup-sizing-default"
				value="${board.qatitle }">
				<input type="text" class="form-control" name="qauserid" value="작성자 : " + "${member.userId}" readonly required>
		</div>
		<div class="textarea">
			<textarea placeholder="문의 내용 입력" rows="15" cols="155">${board.qacontent}</textarea>
		</div>
		<div class="button_view">
			<input class="btn btn-primary" type="button" onclick="location.href='${pageContext.request.contextPath}/qna/qnaUpdateView.do?qnano=${board.qano}'"value="수 정"/> 
			<input class="btn btn-primary" type="reset" value="삭제" onclick="location.href='${pageContext.request.contextPath}/qna/qnaDelete.do?qnano=${board.qano}'"/> 
			<input class="btn btn-primary" type="reset" value="목 록" onclick="location.href='${pageContext.request.contextPath}/qna/qnaList.do'"/>
		</div>
	</div>


	<!-- 댓글 부분 -->
	<div id="comment">
		<table border="1" bordercolor="lightgray">
			<!-- 댓글 목록 -->
			<c:if test="${requestScope.commentList != null}">
				<c:forEach var="comment" items="${requestScope.commentList}">

					<tr>
						<!-- 아이디, 작성날짜 -->
						<td width="200">
							<div id='re'>
								다니엘
								<!-- ${comment.comment_id}<br> -->
								<font size="1" color="gray">2021-10-14 21:09 <!--${comment.comment_date}-->
								</font>
							</div>
						</td>
						<!-- 본문내용 -->
						<td width="550">
							<div class="text_wrapper" id='re'>
								댓글 내용이 들어갑니다.
								<!-- ${comment.comment_content} -->
							</div>
						</td>
						<!-- 버튼 -->
						<td width="100">
							<div id="btn" style="text-align: center;">
								<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
								<c:if test="${comment.comment_id == sessionScope.sessionID}-->">
									<a href="#">[수정]</a>
									<br>
									<a href="#">[삭제]</a>
								</c:if>
							</div>
						</td>
					</tr>

				</c:forEach>
			</c:if>

			<!-- 로그인 했을 경우만 댓글 작성가능 -->
			<c:if test="${sessionScope.sessionID !=null}">
				<tr bgcolor="#F5F5F5">
					<form id="writeCommentForm">
						<input type="hidden" name="comment_board"
							value="${board.board_num}"> <input type="hidden"
							name="comment_id" value="${sessionScope.sessionID}">
						<!-- 아이디-->
						<td width="150">
							<div id='re'>
								작성자
								<!-- ${sessionScope.sessionID} -->
							</div>
						</td>
						<!-- 본문 작성-->
						<td width="550">
							<div>
								<textarea name="comment_content" rows="4" cols="70"></textarea>
							</div>
						</td>
						<!-- 댓글 등록 버튼 -->
						<td width="100">
							<div id="btn" style="text-align: center;">
								<p>
									<a href="#" onclick="writeCmt()">[댓글등록]</a>
								</p>
							</div>
						</td>
					</form>
				</tr>
			</c:if>

		</table>
	</div>
	</div>


	</div>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>