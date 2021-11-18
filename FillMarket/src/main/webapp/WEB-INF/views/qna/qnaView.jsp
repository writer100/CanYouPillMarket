<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세 내용</title>
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="../resources/css/qstyle.css">
</head>

<body>
    <div class="board_wrap">

            <div class="board_title">
                <div class="board_title_a">Q&A</div>
            </div>
            <div class="board_view">
                <div class="title">
                    <div class="titleBox">제목
                    </div> 
                    <div class="drop_select"><select name="fruits" class="select">
                        <option disabled selected>-- 문의 선택--</option>
                        <option value="a">주문/결제 문의</option>
                        <option value="b">배송 문의</option>
                        <option value="c">교환/반품 문의</option>
                        <option value="d">기타 문의</option>
                      </select>
                    </div>
                      <div class="textarea"><textarea name="title" id="boardview_title_textarea" cols="50" rows="1"></textarea></div>
                </div>
                <div class="info">
                    <dl>
                        <dt>작성자</dt>
                        <dd>김이름</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2021.1.16</dd>
                    </dl>
                </div>
                
                <div class="cont">
                    <textarea placeholder="문의 내용 입력" cols="130" rows="15"></textarea>
                </div>
            </div>

            <div id="wrap">
                <br><br>
                <div id="board">

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
                                            <font size="1" color="gray">2021-10-14 21:09
                                                <!--${comment.comment_date}-->
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
                                        <div id="btn" style="text-align:center;">
                                            <!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
                                            <c:if test="${comment.comment_id == sessionScope.sessionID}-->">
                                                <a href="#">[수정]</a><br>
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
                                    <input type="hidden" name="comment_board" value="${board.board_num}">
                                    <input type="hidden" name="comment_id" value="${sessionScope.sessionID}">
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
                                        <div id="btn" style="text-align:center;">
                                            <p><a href="#" onclick="writeCmt()">[댓글등록]</a></p>
                                        </div>
                                    </td>
                                </form>
                            </tr>
                        </c:if>

                    </table>
                </div>
            </div>

            <div class="bt_wrap_view">
                <div class="bt_wrap_view_first"><input type="submit" value="수정"></div>
                <div class="bt_wrap_view_second"><input type="button" value="삭제"/></div>           
            </div>
            <div class="bt_wrap_view_v">
                <div class="bt_wrap_view_vv"><input type="button" value="목록으로"></div>
            </div>
            
        </div>
    </div>
</body>
</html>