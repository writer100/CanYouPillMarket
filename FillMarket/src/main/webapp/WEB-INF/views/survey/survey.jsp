<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사</title>
    <link rel="stylesheet" href="../resources/css/style.css">
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
</head>

<body>
    <div class="back">
        <div class="back_t">
            <p>맞춤 진단 시작</p>
        </div>
        <div class="qa_wrap">
        <div class="q">
            <div class="q_q">Q1.</div>
            <div class="q_qq">나이를 알려주세요.</div>
        </div>
        <div class="qa">
            <div class="q_a"><input type="number" placeholder="숫자 4자리" max="9999" maxlength="4"
                    oninput="maxLengthCheck(this)" onkeyup="onlynumberic(event)" name="year" /> 년생</div>
        </div></div>
<div class="qa_wrap">
        <div class="q">
            <div class="q_q">Q2.</div>
            <div class="q_qq">성별을 알려주세요.</div>
        </div>
        <div class="qa">
            <div class="q_a"><input type="radio" id="gender" name="gender" value="M">남자 &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio" id="gender" name="gender" value="F">여자
            </div>
        </div></div>
<div class="qa_wrap">
        <div class="q">
            <div class="q_q">Q3.</div>
            <div class="q_qq">걱정되는 건강 항목을 선택해주세요.</div>
        </div>
        <div class="qa">
            <div class="q_a">
                <div class="inputBox"><input type="checkbox" name="info" value="1">소화/장</div>
                <div class="inputBox"><input type="checkbox" name="info" value="2">면역력</div>
                <div class="inputBox"><input type="checkbox" name="info" value="3">뼈/관절</div>
                <div class="inputBox"><input type="checkbox" name="info" value="4">심장/혈관</div>
                <div class="inputBox"><input type="checkbox" name="info" value="5">모발/피부</div>
                <div class="inputBox"><input type="checkbox" name="info" value="6">눈</div>
            </div>
        </div></div>
        <div class="bt_wrap_update">
            <div class="bt_wrap_update_q"><input type="submit" value="결과 보기"></div>

    </div>
    <script>
        //maxlength 체크
        function maxLengthCheck(object) {
            if (object.value.length > object.maxLength) {
                object.value = object.value.slice(0, object.maxLength);
            }
        }
        //숫자만남기고제거
        function onlynumberic(event) {
            event.target.value = event.target.value.replace(/[^0-9]/g, "");
        }
    </script>
</body>

</html>