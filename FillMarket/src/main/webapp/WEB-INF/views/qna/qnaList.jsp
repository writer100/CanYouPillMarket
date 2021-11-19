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
<c:import url="../common/header.jsp"/>
</head>

<body>
    <br><br><br>
    <c:import url="../common/navbar.jsp"/>
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
                                <button class="accordion">Q. 결제 후 주문 내용 확인은 어디서 하나요?</button>
                                <div class="panel">
                                    <p>A. 주문내역은 주문 작성 시 입력하신 아이디와 비밀번호 로그인을 통해서 확인이 가능하며,<br>

                                        보다 자세한 내용은 [마이페이지]를 통해서 확인 할 수 있습니다.</p>
                                </div>

                                <button class="accordion">Q. 주문 취소는 어디서 하나요?</button>
                                <div class="panel">
                                    <p>A.  로그인 후 [마이페이지] 에서 주문 취소 하실 수 있습니다. 주문 결제 전인 경우에 고객님께서 직접 취소가 가능합니다.

                                        결제 완료 된 후 취소를 원하실 경우 제품 발송처리 전 진행이 가능합니다.
                                        
                                        (발송 및 배송 중인 경우 취소가 불가능한 점 참고 부탁드립니다.)
                                        
                                        성함, 주문번호, 연락처, 취소 사유 (환불 계좌, 은행명, 예금주 성함)를 함께 남겨주셔야 빠른 환불이 가능합니다</p>
                                </div>

                                <button class="accordion">Q. 현금 영수증/ 세금계산서 발행이 가능한가요?</button>
                                <div class="panel">
                                    <p>A. 현금 영수증의 경우 무통장 입금 주문시 휴대폰 번호를 입력하여 신청/미신청을 선택하실 수 있습니다. 

                                        세금계산서의 경우도 현금 결제에 한해서 가능하며, 사업자 등록증 사본 및 이메일 주소가 필요합니다.
                                        
                                        신청이 필요하신 경우 고객센터(070-1234-1234) 로 문의 주세요! </p>
                                </div>
                            </div>
                            <div class="content-dis">
                                <div class="content-dis">
                                    <button class="accordion">Q. 어디 택배사로 배송되나요?</button>
                                    <div class="panel">
                                        <p>A. CJ대한통운으로 빠르고 안전하게 배송됩니다.</p>
                                    </div>

                                    <button class="accordion">Q. 배송 조회는 어떻게 하나요?</button>
                                    <div class="panel">
                                        <p>A. 주문 완료 후, 전달드리는 송장번호를 통해 조회가능합니다.

                                            송장번호를 전달받지 못한 경우는 고객센터(070-1234-1234) 문의주세요.</p>
                                    </div>

                                    <button class="accordion">Q. 배송기간은 얼마나 걸리나요?</button>
                                    <div class="panel">
                                        <p>지역마다 차이가 있지만 평균적으로 배송기간은 약 1~3일 정도 소요됩니다.

                                            (택배사의 사정에 따라 약간의 배송이 지연 될 수 있습니다.)
                                            
                                            평일 오후 4시 이후 주문 건은 다음날 출고 처리가 되며,
                                            
                                            주문하신 다음날이 주말,공휴일인 경우 다음날 출고 처리가 이루어집니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="content-dis">
                                <div class="content-dis">
                                    <button class="accordion">Q. 교환/반품은 어떻게 받나요?</button>
                                    <div class="panel">
                                        <p>A.  ①단순 변심 반품

                                            - 상품 수령 후 7일 이내에 사용하지않은 제품에 한하여 가능하며, 
                                        
                                              상품이 당사에 도착한 후 2~3일내 검품을 마친 뒤에 환불 처리가 가능합니다.
                                            - 왕복택배비 5,000원은 고객님 부담입니다.
                                        
                                           ② 상품 불량 반품
                                              - 상품 불량을 증명할 수 있는 사진 첨부 필수 
                                              - 상품 수령일로부터 7일 이내 교환/반품이 가능하며, 
                                        
                                               택배비는 어시크 가 부담합니다.
                                        
                                        환불은 반품 완료 후 결제 방법에 따라 5~7일 정도 소요되는 점 참고 부탁드리며
                                        
                                        고객센터(070-1234-1234)로 문의 부탁드립니다.
                                        
                                        </p>
                                    </div>

                                    <button class="accordion">Q. 반품 시 환불 기간은 얼마나 소요되나요?</button>
                                    <div class="panel">
                                        <p>[카드결제 환불]

                                            결제 당일 취소는 카드사에서 당일 취소확인이 가능합니다.
                                            
                                            익일 이후 취소일 경우 카드사 사정에 따라 3~5일 후 해당 카드사에서 취소 내역을 확인하실 수 있습니다.
                                            <br>
                                            
                                            
                                            [현금결제(무통장입금/가상계좌)]
                                            
                                            취소/반품 신청 시, 환불계좌를 등록하시거나 1;1 게시판 or 고객센터에 
                                            
                                            문의 남겨주시면 주문취소일 또는 반품제품입고 기준일로 부터 영업일 5일 이내 처리가 됩니다.</p>
                                    </div>

                                    <button class="accordion">Q. 부분 취소가 가능한가요?</button>
                                    <div class="panel">
                                        <p>주문하신 상품은 부분 취소가 불가하여, 해당 주문을 취소하신 후 원하는 상품만 새로 구매해주셔야 합니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="content-dis">
                                <div class="content-dis">
                                    <button class="accordion">Q.회원정보(전화번호,주소 변경 등)은 어디서 하나요?</button>
                                    <div class="panel">
                                        <p>A. 고객님의 모든 회원정보는 로그인 후, [마이페이지] 에서 확인 및 수정변경 가능합니다.</p>
                                    </div>

                                    <button class="accordion">Q. 회원 ID와 비밀번호가 생각나지 않아요</button>
                                    <div class="panel">
                                        <p>A. 회원 아이디나 비밀번호를 잊어버리신 경우에는, 로그인 시 회원 아이디/비밀번호 찾기를 통해 찾을 수 있습니다.

                                            아이디/비밀번호 찾기를 통해 찾기 어려우신 분은 고객센터(070-1234-1234)로 문의 바랍니다.</p>
                                    </div>

                                    <button class="accordion">메뉴 3</button>
                                    <div class="panel">
                                        <p>내용 3</p>
                                    </div>
                                </div>
   
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
                                    <c:forEach items="${list}" var="b">
                                        <div class="num" id="${b.qaNo}">${b.qaNo}</div>
                                        <div class="tit">${b.qaTitle}</div>
                                        <div class="writer">${b.qauserId}</div>
                                        <div class="date">${b.qauploadDate}</div>
                                        <div class="status">${b.status}</div>
									</c:forEach>
                                    </div>
                                </div>
                            </div>
                            <div class="paging">
								<c:out value="${pageBar}" escapeXml="false"/>
                            </div>
                        </div>
                        <div class="buttonQ">
                            <input type="button" value="글쓰기" onclick="fn_goBoardForm();"/>

                        </div>
                        <c:import url="../common/footer.jsp"/>
                        
                        
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

                    		function fn_goBoardForm(){
                    			location.href = "${pageContext.request.contextPath}/board/boardForm.do";
                    		}
                    		
                    		$(function(){
                    			$("div[id]").on("click",function(){
                    				var boardNo = $(this).attr("id");
                    				console.log("bordNo="+boardNo);
                    				location.href = "${pageContext.request.contextPath}/board/boardView.do?no="+boardNo;
                    			});
                    		});
                        </script>
</body>
</html>