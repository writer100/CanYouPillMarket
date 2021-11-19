<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/memberEnroll.css">

<script
	src="${pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
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
	href="${pageContext.request.contextPath}/resources/css/style.css">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' && data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
    

</head>

<body>
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />

	
	<div id="header">
		<h4 style="font-size: 40px; text-align: center;" class="mt-5 mb-5 pt-4">회원가입</h4>
	</div>

	<!-- wrapper -->
	<div id="wrapper">

		<!-- content-->
		<div id="content">

			<!-- ID -->
			<div>
				<h5 class="join_title">
					<label for="id">아이디</label>
				</h5>
				<span class="box int_id"> <input type="text" id="id"
					class="int" maxlength="20">
				</span> <span class="error_next_box"></span>
			</div>

			<!-- PW1 -->
			<div>
				<h5 class="join_title mt-3">
					<label for="pswd1">비밀번호</label>
				</h5>
				<span class="box int_pass"> <input type="text" id="pswd1"
					class="int" maxlength="20"
					placeholder="영문 소문자, 숫자, 특수기호(_),(-) 5~20자"> <span
					id="alertTxt">사용불가</span>
				</span> <span class="error_next_box"></span>
			</div>

			<!-- PW2 -->
			<div>
				<h5 class="join_title mt-3">
					<label for="pswd2">비밀번호 확인</label>
				</h5>
				<span class="box int_pass_check"> <input type="text"
					id="pswd2" class="int" maxlength="20">
				</span> <span class="error_next_box"></span>
			</div>

			<!-- NAME -->
			<div>
				<h5 class="join_title mt-3">
					<label for="name">이름</label>
				</h5>
				<span class="box int_name"> <input type="text" id="name"
					class="int" maxlength="20"
					placeholder="한글과 영문 대, 소문자를 사용하세요(특수기호, 공백 사용불가)">
				</span> <span class="error_next_box"></span>
			</div>

			<!-- BIRTH -->
			<div>
				<h5 class="join_title mt-3">
					<label for="yy">생년월일</label>
				</h5>

				<div id="bir_wrap">
					<!-- BIRTH_YY -->
					<div id="bir_yy">
						<span class="box"> <input type="text" id="yy" class="int"
							maxlength="4" placeholder="년(4자)">
						</span>
					</div>

					<!-- BIRTH_MM -->
					<div id="bir_mm">
						<span class="box mt-3"> <select id="mm" class="sel">
								<option>월</option>
								<option value="01">1</option>
								<option value="02">2</option>
								<option value="03">3</option>
								<option value="04">4</option>
								<option value="05">5</option>
								<option value="06">6</option>
								<option value="07">7</option>
								<option value="08">8</option>
								<option value="09">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>
						</span>
					</div>

					<!-- BIRTH_DD -->
					<div id="bir_dd">
						<span class="box mt-3"> <input type="text" id="dd"
							class="int" maxlength="2" placeholder="일">
						</span>
					</div>

				</div>
				<span class="error_next_box"></span>
			</div>

			<!-- GENDER -->
			<div>
				<h5 class="join_title mt-3">
					<label for="gender">성별</label>
				</h5>
				<span class="box gender_code"> <select id="gender"
					class="sel">
						<option>성별</option>
						<option value="M">남자</option>
						<option value="F">여자</option>
				</select>
				</span> <span class="error_next_box">필수 정보입니다.</span>
			</div>

			<!-- EMAIL -->
			<div>
				<h5 class="join_title mt-3">
					<label for="email">이메일<span class="optional"></span></label>
				</h5>
				<span class="box int_email"> <input type="text" id="email"
					class="int" maxlength="100" placeholder="user01@example.com">
				</span> <span class="error_next_box">이메일 주소를 다시 확인해주세요.</span>
			</div>

			<!-- MOBILE -->
			<div>
				<h5 class="join_title mt-3">
					<label for="phoneNo">연락처</label>
				</h5>
				<span class="box int_mobile"> <input type="tel" id="mobile"
					class="int" maxlength="16" placeholder="ex)01012345678">
				</span> <span class="error_next_box"></span>
			</div>

			<div>
				<h5 class="join_title mt-3 mb-1">
					<label for="address">주소</label>
				</h5>

				<input id="address_id" type="button"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기"> <input
					class="box int_address mb-1" type="text" id="sample6_postcode"
					placeholder="우편번호"> <input class="box int_address mb-1"
					type="text" id="sample6_address" placeholder="주소"> <input
					class="box int_address mb-1" type="text" id="sample6_detailAddress"
					placeholder="상세주소"> <input class="box int_address mb-1"
					type="text" id="sample6_extraAddress" placeholder="참고항목"> <span
					class="error_next_box"></span>
			</div>

			<!-- JOIN BTN-->
			<div class="btn_area mt-5">
				<button type="button" id="btnJoin" onclick="location.href='${pageContext.request.contextPath}/member/memberEnrollEnd.do'">
					<span>가입하기</span>
				</button>
			</div>

		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->
	<div>
		<c:import url="../common/footer.jsp" />
	</div>
	
    <script>
    /*변수 선언*/

    var id = document.querySelector('#id');

    var pw1 = document.querySelector('#pswd1');
    var pwMsg = document.querySelector('#alertTxt');
    var pwImg1 = document.querySelector('#pswd1_img1');

    var pw2 = document.querySelector('#pswd2');
    var pwImg2 = document.querySelector('#pswd2_img1');
    var pwMsgArea = document.querySelector('.int_pass');

    var userName = document.querySelector('#name');

    var yy = document.querySelector('#yy');
    var mm = document.querySelector('#mm');
    var dd = document.querySelector('#dd');

    var gender = document.querySelector('#gender');

    var email = document.querySelector('#email');

    var mobile = document.querySelector('#mobile');

    var error = document.querySelectorAll('.error_next_box');



    /*이벤트 핸들러 연결*/


    id.addEventListener("focusout", checkId);
    pw1.addEventListener("focusout", checkPw);
    pw2.addEventListener("focusout", comparePw);
    userName.addEventListener("focusout", checkName);
    yy.addEventListener("focusout", isBirthCompleted);
    mm.addEventListener("focusout", isBirthCompleted);
    dd.addEventListener("focusout", isBirthCompleted);
    gender.addEventListener("focusout", function() {
        if(gender.value === "성별") {
            error[5].style.display = "block";
        } else {
            error[5].style.display = "none";
        }
    })
    email.addEventListener("focusout", isEmailCorrect);
    mobile.addEventListener("focusout", checkPhoneNum);





    /*콜백 함수*/


    function checkId() {
        var idPattern = /^[a-zA-Z0-9_-]{5,20}$/;
        if(id.value === "") {
            error[0].innerHTML = "필수 정보입니다.";
            error[0].style.display = "block";
        } else if(!idPattern.test(id.value)) {
            error[0].innerHTML = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
            error[0].style.display = "block";
        } else {
            error[0].innerHTML = "멋진 아이디네요!";
            error[0].style.color = "#08A600";
            error[0].style.display = "block";
        }
    }

    function checkPw() {
        var pwPattern = /^[a-zA-Z0-9~!@#$%^&*()_+|<>?:{}]{8,16}$/;
        if(pw1.value === "") {
            error[1].innerHTML = "필수 정보입니다.";
            error[1].style.display = "block";
        } else if(!pwPattern.test(pw1.value)) {
            error[1].innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            pwMsg.innerHTML = "사용불가";
            pwMsgArea.style.paddingRight = "93px";
            error[1].style.display = "block";
            
            pwMsg.style.display = "block";
        } else {
            error[1].style.display = "none";
            pwMsg.innerHTML = "안전";
            pwMsg.style.display = "block";
            pwMsg.style.color = "#03c75a";
        }
    }

    function comparePw() {
        if(pw2.value === pw1.value && pw2.value != "") {
            error[2].style.display = "none";
        } else if(pw2.value !== pw1.value) {
            error[2].innerHTML = "비밀번호가 일치하지 않습니다.";
            error[2].style.display = "block";
        } 

        if(pw2.value === "") {
            error[2].innerHTML = "필수 정보입니다.";
            error[2].style.display = "block";
        }
    }

    function checkName() {
        var namePattern = /^[a-zA-Z가-힣]$/;
        if(userName.value === "") {
            error[3].innerHTML = "필수 정보입니다.";
            error[3].style.display = "block";
        } else if(!namePattern.test(userName.value) || userName.value.indexOf(" ") > -1) {
            error[3].innerHTML = "한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)";
            error[3].style.display = "block";
        } else {
            error[3].style.display = "none";
        }
    }


    function isBirthCompleted() {
        var yearPattern = /^[0-9]{4}$/;

        if(!yearPattern.test(yy.value)) {
            error[4].innerHTML = "태어난 년도 4자리를 정확하게 입력하세요.";
            error[4].style.display = "block";
        } else {
            isMonthSelected();
        }


        function isMonthSelected() {
            if(mm.value === "월") {
                error[4].innerHTML = "태어난 월을 선택하세요.";
            } else {
                isDateCompleted();
            }
        }

        function isDateCompleted() {
            if(dd.value === "") {
                error[4].innerHTML = "태어난 일(날짜) 2자리를 정확하게 입력하세요.";
            } else {
                isBirthRight();
            }
        }
    }



    function isBirthRight() {
        var datePattern = /^\d{1,2}$/;
        if(!datePattern.test(dd.value) || Number(dd.value)<1 || Number(dd.value)>31) {
            error[4].innerHTML = "생년월일을 다시 확인해주세요.";
        } else {
            checkAge();
        }
    }

    function checkAge() {
        if(Number(yy.value) < 1920) {
            error[4].innerHTML = "정말이세요?";
            error[4].style.display = "block";
        } else if(Number(yy.value) > 2020) {
            error[4].innerHTML = "미래에서 오셨군요. ^^";
            error[4].style.display = "block";
        } else if(Number(yy.value) > 2005) {
            error[4].innerHTML = "만 14세 미만의 어린이는 보호자 동의가 필요합니다.";
            error[4].style.display = "block";
        } else {
            error[4].style.display = "none";
        }
    }


    function isEmailCorrect() {
        var emailPattern = /^[a-z0-9]{2,}@[a-z0-9-]{2,}\.[a-z0-9]{2,}$/;

        if(email.value === ""){ 
            error[6].style.display = "none"; 
        } else if(!emailPattern.test(email.value)) {
            error[6].style.display = "block";
        } else {
            error[6].style.display = "none"; 
        }

    }

    function checkPhoneNum() {
        var isPhoneNum = /^([01]{2})([01679]{1})([0-9]{3,4})([0-9]{4})$/;

        if(mobile.value === "") {
            error[7].innerHTML = "필수 정보입니다.";
            error[7].style.display = "block";
        } else if(!isPhoneNum.test(mobile.value)) {
            error[7].innerHTML = "형식에 맞지 않는 번호입니다.";
            error[7].style.display = "block";
        } else {
            error[7].style.display = "none";
        } 
    }
    </script>
</body>

</html>