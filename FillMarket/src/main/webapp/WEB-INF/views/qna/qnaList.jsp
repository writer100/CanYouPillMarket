<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>QNA리스트</title>
    <link rel="stylesheet" href="../resources/css/qstyle.css"> 
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <style>

        
    </style>
</head>

<body>
    <br><br><br>
    <div class="board_list_wrap">
        <div class="faq">
            <div class="board_title">
                <div class="board_title_a">FAQ</div>
                <div class="board_title_b">자주묻는 질문들</div>
                
            </div>
                <div class="faq_button">
                    <div class="main">
                        <input type="radio" id="tab-1" name="show" checked />
                        <input type="radio" id="tab-2" name="show" />
                        <input type="radio" id="tab-3" name="show" />
                        <input type="radio" id="tab-4" name="show" />
                        <div class="tab">
                            <label for="tab-1">주문/결제</label>
                            <label for="tab-2">배송 문의</label>
                            <label for="tab-3">교환/반품</label>
                            <label for="tab-4">기타 문의</label>
                        </div>
                        <div class="content">
                            <div class="content-dis">
                                <button class="accordion">메뉴 1</button>
                                <div class="panel">
                                    <p>내용 1</p>
                                </div>

                                <button class="accordion">메뉴 2</button>
                                <div class="panel">
                                    <p>내용 2</p>
                                </div>

                                <button class="accordion">메뉴 3</button>
                                <div class="panel">
                                    <p>내용 3</p>
                                </div>
                            </div>
                            <div class="content-dis">
                                <div class="content-dis">
                                    <button class="accordion">메뉴 1</button>
                                    <div class="panel">
                                        <p>내용 1</p>
                                    </div>

                                    <button class="accordion">메뉴 2</button>
                                    <div class="panel">
                                        <p>내용 2</p>
                                    </div>

                                    <button class="accordion">메뉴 3</button>
                                    <div class="panel">
                                        <p>내용 3</p>
                                    </div>
                                </div>
                            </div>
                            <div class="content-dis">
                                <div class="content-dis">
                                    <button class="accordion">메뉴 1</button>
                                    <div class="panel">
                                        <p>내용 1</p>
                                    </div>

                                    <button class="accordion">메뉴 2</button>
                                    <div class="panel">
                                        <p>내용 2</p>
                                    </div>

                                    <button class="accordion">메뉴 3</button>
                                    <div class="panel">
                                        <p>내용 3</p>
                                    </div>
                                </div>
                            </div>
                            <div class="content-dis">
                                <div class="content-dis">
                                    <button class="accordion">메뉴 1</button>
                                    <div class="panel">
                                        <p>내용 1</p>
                                    </div>

                                    <button class="accordion">메뉴 2</button>
                                    <div class="panel">
                                        <p>내용 2</p>
                                    </div>

                                    <button class="accordion">메뉴 3</button>
                                    <div class="panel">
                                        <p>내용 3</p>
                                    </div>
                                </div>
                            </div>
                            <div>
                            </div>
                        </div>

                        <div class="board_title">
                            <div class="board_title_a">Q&A</div>
                            <div class="board_title_b">고객센터</div>
                            
                        </div>    
                            <div class="board_list">
                                <div class="board_list_head">
                                    <div class="num">No</div>
                                    <div class="tit">제목</div>
                                    <div class="writer">글쓴이</div>
                                    <div class="date">작성일</div>
                                </div>
                                <div class="board_list_body">
                                    <div class="item">
                                        <div class="num">3</div>
                                        <div class="tit"><a href="#">asdasdasdasd</a></div>
                                        <div class="writer">관리자</div>
                                        <div class="date">2019-11-02</div>

                                    </div>
                                    <div class="item">
                                        <div class="num">2</div>
                                        <div class="tit"><a href="#">asdsadasd</a></div>
                                        <div class="writer">관리자</div>
                                        <div class="date">2019-10-28</div>

                                    </div>
                                    <div class="item">
                                        <div class="num">1</div>
                                        <div class="tit"><a href="#">asdasdasd</a></div>
                                        <div class="writer">관리자</div>
                                        <div class="date">2019-10-24</div>

                                    </div>
                                </div>
                            </div>
                            <div class="paging">
                                <a href="#" class="bt first">처음 페이지</a>
                                <a href="#" class="bt prev">이전 페이지</a>
                                <a href="#" class="num on">1</a>
                                <a href="#" class="num">2</a>
                                <a href="#" class="num">3</a>
                                <a href="#" class="bt next">다음 페이지</a>
                                <a href="#" class="bt last">마지막 페이지</a>
                            </div>
                        </div>
                        <div class="buttonQ">
                            <input type="button" value="글쓰기"
                                onclick="location.href='${pageContext.request.contextPath}/board/boardDelete.do?boardNo=${board.boardNo}'" />

                        </div>
                        <script>
                            var acc = document.getElementsByClassName("accordion");
                            var i;

                            for (i = 0; i < acc.length; i++) {
                                acc[i].addEventListener("click", function () {
                                    this.classList.toggle("active");
                                    var panel = this.nextElementSibling;
                                    if (panel.style.maxHeight) {
                                        panel.style.maxHeight = null;
                                    } else {
                                        panel.style.maxHeight = panel.scrollHeight + "px";
                                    }
                                });
                            }
                        </script>
</body>
</html>