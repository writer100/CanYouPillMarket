<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../resources/css/qstyle.css">
	<c:import url="../common/header.jsp"/>
	<script>
	/* textarea에도 required속성을 적용가능하지만, 공백이 입력된 경우 대비 유효성검사를 실시함. */
	function validate(){
		var content = $("[name=title]","[name=cont]").val();
		if(content.trim().length==0){
			alert("내용을 입력하세요");
			return false;
		}
		return true;
	}</script>
</head>
<body>
		<c:import url="../common/navbar.jsp"/>
    <div class="board_wrap">
        <div class="board_title">
            <div class="board_title_a">문의글 작성</div>
        </div>
        <div class="board_view">
        <form name="boardFrm" action="${pageContext.request.contextPath}/qna/qnaWriteEnd.do" method="post" onsubmit="return validate();">
            <div class="title">
                <div class="titleBox">제목
                </div> 
                <div class="drop_select"><select name="QA" class="select">
                    <option disabled selected>---- 문의 선택----</option>
                    <option value="a">주문/결제 문의</option>
                    <option value="b">배송 문의</option>
                    <option value="c">교환/반품 문의</option>
                    <option value="d">기타 문의</option>
                  </select>
                </div>
                  <div class="textarea"> <input type="text" name="title" placeholder="제목을 작성해주세요."  required></textarea></div>
                  </div>
                <div class="cont">
                    <textarea placeholder="문의 내용 입력" name="cont" cols="130" rows="15" required></textarea>
                </div>
            </div>
            <div class="bt_wrap_write">
                <div class="bt_wrap_write_first"><input type="submit" value="등록"></div>
                <div class="bt_wrap_write_second"><input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/qna/qnaList.do'"/></div>            
            </div>
            </form>
        </div>
    </div>
</body>
</html>