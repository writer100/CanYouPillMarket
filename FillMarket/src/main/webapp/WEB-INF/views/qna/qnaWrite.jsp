<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../resources/css/qstyle.css">
</head>
<body>
    <div class="board_wrap">
        <div class="board_title">
            <div class="board_title_a">문의글 작성</div>
        </div>
        <div class="board_view">
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
                  <div class="textarea"><textarea placeholder="문의 제목 입력" cols="70" rows="1    "></textarea></div>
                  </div>
                <div class="cont">
                    <textarea placeholder="문의 내용 입력" cols="130" rows="15"></textarea>
                </div>
            </div>
            <div class="bt_wrap_write">
                <div class="bt_wrap_write_first"><input type="submit" value="등록"></div>
                <div class="bt_wrap_write_second"><input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?boardNo=${board.boardNo}'" /></div>            
            </div>
        </div>
    </div>
</body>
</html>