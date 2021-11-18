<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>agreement</title>

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
</head>

<script>
    const form = document.querySelector("#form__wrap");
    const checkBoxes = document.querySelectorAll(".input__check input");
    const submitButton = document.querySelector("button");

    const agreements = {
        agree1: false,
        agree2: false,
        agree3: false
    };

    form.addEventListener("submit", (e) => e.preventDefault());

    checkBoxes.forEach((item) => item.addEventListener("input", toggleCheckbox));

    function toggleCheckbox(e) {
        const { checked, id } = e.target;
        agreements[id] = checked;
        this.parentNode.classList.toggle("active");

        toggleSubmitButton();
    }
</script>

<style>
* {
	box-sizing: border-box;
}

html, body {
	height: 100%;
}

#wrap_body {
	margin: 0;
	background-color: #f5f6f7;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}

ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.wrap {
	margin: auto;
}

.wrap .logo {
	text-align: center;
	margin-bottom: 10px;
}

.wrap .logo {
	margin: 0;
	font-size: 40px;
}

.wrap .contents {
	padding: 50px;
	background-color: #ffffff;
	border-radius: 5px;
}

#form__wrap {
	margin: 0 auto;
	width: 460px;
	font-size: 14px;
}

#form__wrap .terms__check__all {
	display: flex;
	margin-bottom: 35px;
}

#form__wrap .terms__check__all label {
	margin-left: 3px;
	text-decoration: underline;
}

.terms__list .terms__box {
	margin: 20px 0;
}

.contents label {
	font-weight: 700;
}

.terms__list .terms__content {
	height: 88px;
	overflow: auto;
	margin-top: 8px;
	padding: 12px;
	border: 1px solid #dadada;
	background: #fff;
	font-size: 12px;
}

.next-button {
	width: 100%;
	height: 40px;
	outline: none;
	cursor: pointer;
	background-color: rgb(255, 142, 117);
	color: #ffffff;
	border: none;
	border-radius: 5px;
	transition-duration: 0.2s;
}

.next-button:hover:enabled {
	background-color: #a3a2a2;
}

.next-button:disabled {
	opacity: 0.2;
	cursor: not-allowed;
}

@media ( max-width : 768px) {
	.wrap {
		min-width: 280px;
		padding: 20px;
	}
	#form__wrap {
		max-width: 460px;
		width: auto;
	}
}
</style>

<body id="wrap_body">
	<c:import url="../common/header.jsp" />
	<c:import url="../common/navbar.jsp" />
	<div class="wrap">
		
		<div class="contents">
			<form action="memberEnroll.jsp" method="POST" id="form__wrap">

				<ul class="terms__list">
					<li class="terms__box">
                        <div class="logo">
                            <h4 class="mb-5">회원가입 약관</h4>
                        </div>
						<div class="input__check">
							<input type="checkbox" name="agreement" id="agree1"
								value="arree1" required> <label for="agree1"
								class="required">전자상거래 표준약관 동의</label>
						</div>
						<div class="terms__content">제1조(목적) 이 약관은
							CanYouPillMarket(전자상거래 사업자)가 운영하는 CanYouPillMarket 사이버 몰(이하 “몰”이라
							한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및
							책임사항을 규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는
							한 이 약관을 준용합니다.」 제2조(정의) ① “몰”이란 CanYouPillMarket의 재화 또는 용역(이하 “재화
							등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한
							가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다. ② “이용자”란 “몰”에 접속하여
							이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. ③ ‘회원’이라 함은 “몰”에 회원등록을
							한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다. ④ ‘비회원’이라 함은 회원에
							가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다. 제3조 (약관 등의 명시와 설명 및 개정) ①
							“몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를
							포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게
							알 수 있도록 CanYouPillMarket 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은
							이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져
							있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는
							팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. ③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」,
							「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망
							이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는
							범위에서 이 약관을 개정할 수 있습니다. ④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여
							현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게
							약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과
							개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은
							그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로
							적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의
							공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. ⑥ 이 약관에서 정하지
							아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률,
							공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다. 제4조(서비스의 제공
							및 변경) ① “몰”은 다음과 같은 업무를 수행합니다. 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
							2. 구매계약이 체결된 재화 또는 용역의 배송 3. 기타 “몰”이 정하는 업무 ② “몰”은 재화 또는 용역의 품절
							또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수
							있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한
							곳에 즉시 공지합니다. ③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적
							사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다. ④ 전항의 경우
							“몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는
							그러하지 아니합니다. 제5조(서비스의 중단) ① “몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의
							두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다. ② “몰”은 제1항의 사유로
							서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의
							또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다. ③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의
							이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서
							제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지
							또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다. 제6조(회원가입)

							① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을
							신청합니다. ② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한
							회원으로 등록합니다. 1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만
							제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
							2. 등록 내용에 허위, 기재누락, 오기가 있는 경우 3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이
							있다고 판단되는 경우 ③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다. ④ 회원은
							회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그
							변경사항을 알려야 합니다. 제7조(회원 탈퇴 및 자격 상실 등) ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며
							“몰”은 즉시 회원탈퇴를 처리합니다. ② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및
							정지시킬 수 있습니다. 1. 가입 신청 시에 허위 내용을 등록한 경우 2. “몰”을 이용하여 구입한 재화 등의 대금,
							기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우 3. 다른 사람의 “몰” 이용을
							방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우 4. “몰”을 이용하여 법령 또는 이 약관이
							금지하거나 공서양속에 반하는 행위를 하는 경우 ③ “몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상
							반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다. ④ “몰”이
							회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한
							30일 이상의 기간을 정하여 소명할 기회를 부여합니다. 제8조(회원에 대한 통지) ① “몰”이 회원에 대한 통지를
							하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다. ② “몰”은 불특정다수 회원에
							대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와
							관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다. 제9조(구매신청 및 개인정보 제공 동의 등) ①
							“몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에
							있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 1. 재화 등의 검색 및 선택 2. 받는 사람의 성명, 주소,
							전화번호, 전자우편주소(또는 이동전화번호) 등의 입력 3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비
							등의 비용부담과 관련한 내용에 대한 확인 4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시 (예,
							마우스 클릭) 5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의 6. 결제방법의 선택 ②
							“몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는
							자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을
							구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) ③ “몰”이 제3자에게
							구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보
							취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도
							같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망
							이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와
							동의절차를 거치지 않아도 됩니다. 제10조 (계약의 성립) ① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에
							해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면
							미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다. 1. 신청 내용에 허위,
							기재누락, 오기가 있는 경우 2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
							3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우 ② “몰”의 승낙이
							제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다. ③ “몰”의 승낙의
							의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야
							합니다. 제11조(지급방법) “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한
							방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여
							징수할 수 없습니다. 1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 2. 선불카드, 직불카드, 신용카드
							등의 각종 카드 결제 3. 온라인무통장입금 4. 전자화폐에 의한 결제 5. 수령 시 대금지급 6. 마일리지 등
							“몰”이 지급한 포인트에 의한 결제 7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 8. 기타
							전자적 지급 방법에 의한 대금 지급 등 제12조(수신확인통지․구매신청 변경 및 취소) ① “몰”은 이용자의 구매신청이
							있는 경우 이용자에게 수신확인통지를 합니다. ② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는
							수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는
							경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에
							관한 규정에 따릅니다. 제13조(재화 등의 공급) ① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이
							없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한
							조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를
							받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수
							있도록 적절한 조치를 합니다. ② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별
							배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야
							합니다. 다만 “몰”이 고의․과실이 없음을 입증한 경우에는 그러하지 아니합니다. 제14조(환급) “몰”은 이용자가
							구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고
							사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.

							제15조(청약철회 등) ① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에
							관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게
							이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할
							수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동
							법 규정에 따릅니다. ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할
							수 없습니다. 1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기
							위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다) 2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의
							가치가 현저히 감소한 경우 3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우 4.
							같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우 ③ 제2항제2호 내지
							제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을
							제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다. ④ 이용자는 제1항 및 제2항의 규정에
							불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터
							3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

							제16조(청약철회 등의 효과) ① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화
							등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래
							등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다. ②
							“몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는
							지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다. ③
							청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을
							이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게
							이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다. ④ 이용자가 재화 등을
							제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게
							표시합니다. 제17조(개인정보보호) ① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의
							개인정보를 수집합니다. ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련
							법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는
							그러하지 아니합니다. ③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를
							받습니다. ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는
							제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련
							법령에 달리 정함이 있는 경우에는 예외로 합니다. ⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는
							경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에
							대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한
							법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.

							⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에
							대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할
							때까지 당해 개인정보를 이용하지 않습니다. ⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를
							최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자
							제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다. ⑧ “몰” 또는 그로부터 개인정보를 제공받은
							제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다. ⑨ “몰”은
							개인정보의 수집·이용·제공에 관한 동의 란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의
							수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의
							수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.

							제18조(“몰“의 의무) ① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이
							정하는 바에 따라 지속적이고, 안정적으로 재화․용역을 제공하는데 최선을 다하여야 합니다. ② “몰”은 이용자가
							안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야
							합니다. ③ “몰”이 상품이나 용역에 대하여 「표시․광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시․광고행위를
							함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다. ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성
							전자우편을 발송하지 않습니다. 제19조(회원의 ID 및 비밀번호에 대한 의무) ① 제17조의 경우를 제외한 ID와
							비밀번호에 관한 관리책임은 회원에게 있습니다. ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는
							안됩니다. ③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에
							통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다. 제20조(이용자의 의무) 이용자는 다음 행위를 하여서는
							안 됩니다. 1. 신청 또는 변경시 허위 내용의 등록 2. 타인의 정보 도용 3. “몰”에 게시된 정보의 변경 4.
							“몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시 5. “몰” 기타 제3자의 저작권 등
							지적재산권에 대한 침해 6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 7. 외설 또는 폭력적인
							메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위 제21조(연결“몰”과 피연결“몰”
							간의 관계) ① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이
							포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고
							합니다. ② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증
							책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한
							보증 책임을 지지 않습니다. 제22조(저작권의 귀속 및 이용제한) ① “몰“이 작성한 저작물에 대한 저작권 기타
							지적재산권은 ”몰“에 귀속합니다. ② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된
							정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나
							제3자에게 이용하게 하여서는 안됩니다. ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해
							이용자에게 통보하여야 합니다. 제23조(분쟁해결) ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그
							피해를 보상처리하기 위하여 피해보상처리기구를 설치․운영합니다. ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은
							우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해
							드립니다. ③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는
							공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다. 제24조(재판권 및 준거법) ①
							“몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는
							거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국
							거주자의 경우에는 민사소송법상의 관할법원에 제기합니다. ② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을
							적용합니다.</div>
					</li>
					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="agreement" id="agree2"
								value="agree2" required /> <label for="agree2" class="required">개인정보
								수집 및 이용에 대한 안내</label>
						</div>
						<div class="terms__content">&lt; CanYouPillMarket
							>('localhost:8180/market'이하 'CanYouPillMarket')은(는) 「개인정보 보호법」
							제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여
							다음과 같이 개인정보 처리방침을 수립·공개합니다. 제1조(개인정보의 처리목적) &lt; CanYouPillMarket
							>(이)가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다. 1. 개인정보
							파일명 : 개인정보보호 개인정보의 처리목적 : 전자상거래 수집방법 : 홈페이지, 전화/팩스, 경품행사, 배송요청,
							제휴사로부터 제공 받음, 생성정보 수집 툴을 통한 수집 보유근거 : 안전 보유기간 : 3년 관련법령 : 신용정보의
							수집/처리 및 이용 등에 관한 기록 : 3년, 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 제2조(개인정보의
							제3자 제공) ① &lt; CanYouPillMarket >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서
							명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에
							해당하는 경우에만 개인정보를 제3자에게 제공합니다. ② &lt; CanYouPillMarket >은(는) 다음과 같이
							개인정보를 제3자에게 제공하고 있습니다. 1. &lt; CanYouPillMarket > 개인정보를 제공받는 자 :
							CanYouPillMarket 제공받는 자의 개인정보 이용목적 : 이메일, 휴대전화번호, 자택주소, 비밀번호 질문과
							답, 비밀번호, 로그인ID, 성별, 생년월일, 이름 제공받는 자의 보유.이용기간: 3년 제3조(개인정보처리 위탁) ①
							&lt; CanYouPillMarket >은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를
							위탁하고 있습니다. 1. &lt; > 위탁받는 자 (수탁자) : 위탁하는 업무의 내용 : 위탁기간 : ② &lt;
							CanYouPillMarket >은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외
							개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을
							계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다. ③ 위탁업무의 내용이나
							수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다. 제4조(정보주체와 법정대리인의
							권리·의무 및 그 행사방법) ① 정보주체는 CanYouPillMarket에 대해 언제든지 개인정보
							열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다. ② 제1항에 따른 권리
							행사는CanYouPillMarket에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편,
							모사전송(FAX) 등을 통하여 하실 수 있으며 CanYouPillMarket은(는) 이에 대해 지체 없이
							조치하겠습니다. ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수
							있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야
							합니다. ④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여
							정보주체의 권리가 제한 될 수 있습니다. ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집
							대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다. ⑥ CanYouPillMarket은(는) 정보주체
							권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한
							대리인인지를 확인합니다. 제5조(처리하는 개인정보의 항목 작성) ① &lt; CanYouPillMarket >은(는)
							다음의 개인정보 항목을 처리하고 있습니다. 1&lt; 개인정보보호 > 필수항목 : 이메일, 휴대전화번호, 자택주소,
							자택전화번호, 비밀번호 질문과 답, 비밀번호, 로그인ID, 성별, 생년월일, 이름 선택항목 : 서비스 이용 기록,
							접속 로그, 쿠키, 접속 IP 정보, 결제기록 제6조(개인정보의 파기) ① &lt; CanYouPillMarket >
							은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를
							파기합니다. ② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에
							따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를
							달리하여 보존합니다. 1. 법령 근거 : 2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜 ③ 개인정보 파기의 절차
							및 방법은 다음과 같습니다. 1. 파기절차 &lt; CanYouPillMarket > 은(는) 파기 사유가 발생한
							개인정보를 선정하고, &lt; CanYouPillMarket > 의 개인정보 보호책임자의 승인을 받아 개인정보를
							파기합니다. 2. 파기방법 전자적 파일 형태의 정보는 기록을 재생할 수 없는 기술적 방법을 사용합니다. 종이에 출력된
							개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다 제7조(개인정보의 안전성 확보 조치) &lt;
							CanYouPillMarket >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다. 1.
							정기적인 자체 감사 실시 개인정보 취급 관련 안정성 확보를 위해 정기적(분기 1회)으로 자체 감사를 실시하고
							있습니다. 2. 개인정보 취급 직원의 최소화 및 교육 개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화
							하여 개인정보를 관리하는 대책을 시행하고 있습니다. 3. 내부관리계획의 수립 및 시행 개인정보의 안전한 처리를 위하여
							내부관리계획을 수립하고 시행하고 있습니다. 4. 개인정보의 암호화 이용자의 개인정보는 비밀번호는 암호화 되어 저장 및
							관리되고 있어, 본인만이 알 수 있으며 중요한 데이터는 파일 및 전송 데이터를 암호화 하거나 파일 잠금 기능을
							사용하는 등의 별도 보안기능을 사용하고 있습니다. 5. 접속기록의 보관 및 위변조 방지 개인정보처리시스템에 접속한
							기록을 최소 1년 이상 보관, 관리하고 있으며,다만, 5만명 이상의 정보주체에 관하여 개인정보를 추가하거나,
							고유식별정보 또는 민감정보를 처리하는 경우에는 2년이상 보관, 관리하고 있습니다. 또한, 접속기록이 위변조 및 도난,
							분실되지 않도록 보안기능을 사용하고 있습니다. 6. 문서보안을 위한 잠금장치 사용 개인정보가 포함된 서류,
							보조저장매체 등을 잠금장치가 있는 안전한 장소에 보관하고 있습니다. 제8조(개인정보 자동 수집 장치의 설치•운영 및
							거부에 관한 사항) ① CanYouPillMarket 은(는) 이용자에게 개별적인 맞춤서비스를 제공하기 위해
							이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용합니다. ② 쿠키는 웹사이트를 운영하는데 이용되는
							서버(http)가 이용자의 컴퓨터 브라우저에게 보내는 소량의 정보이며 이용자들의 PC 컴퓨터내의 하드디스크에
							저장되기도 합니다. 가. 쿠키의 사용 목적 : 이용자가 방문한 각 서비스와 웹 사이트들에 대한 방문 및 이용형태,
							인기 검색어, 보안접속 여부, 등을 파악하여 이용자에게 최적화된 정보 제공을 위해 사용됩니다. 나. 쿠키의 설치•운영
							및 거부 : 웹브라우저 상단의 도구>인터넷 옵션>개인정보 메뉴의 옵션 설정을 통해 쿠키 저장을 거부 할 수 있습니다.
							다. 쿠키 저장을 거부할 경우 맞춤형 서비스 이용에 어려움이 발생할 수 있습니다. 제9조 (개인정보 보호책임자) ①
							CanYouPillMarket 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한
							정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다. ▶ 개인정보
							보호책임자 성명 :약사조 직책 :대표 직급 :대표 연락처 :1234, admin@example.com, ※ 개인정보
							보호 담당부서로 연결됩니다. ▶ 개인정보 보호 담당부서 부서명 : 담당자 : 연락처 :, , ② 정보주체께서는
							CanYouPillMarket 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리,
							피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. CanYouPillMarket
							은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다. 제10조(개인정보 열람청구) 정보주체는
							｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다. &lt;
							CanYouPillMarket >은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다. ▶
							개인정보 열람청구 접수·처리 부서 부서명 : 담당자 : 연락처 : , , 제11조(권익침해 구제방법) 정보주체는
							개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나
							상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기
							바랍니다. 1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr) 2.
							개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr) 3. 대검찰청 : (국번없이)
							1301 (www.spo.go.kr) 4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)

							「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의
							규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는
							행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다. ※ 행정심판에 대해 자세한 사항은
							중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다. 제12조(개인정보 처리방침 변경)


							① 이 개인정보처리방침은 2021년 11월 18부터 적용됩니다. ② 이전의 개인정보 처리방침은 아래에서 확인하실 수
							있습니다.</div>
					</li>


					<li class="terms__box">
						<div class="input__check">
							<input type="checkbox" name="agreement" id="agree3"
								value="agree3" required /> <label for="agree3" class="required">해외구매(쇼핑몰형
								구매대행) 표준약관</label>
						</div>
						<div class="terms__content">제1조(목적) 이 약관은
							CanYouPillMarket(이하 “회사”)가 제공하는 쇼핑몰형 구매대행 관련 서비스(이하 “서비스”)를 이용함에
							있어 회사와 이용자 간의 권리·의무, 책임사항 및 절차 등을 규정함을 목적으로 합니다. 제2조(정의) 이 약관에서
							사용하는 용어의 정의는 다음과 같습니다. 1. “몰”은 회사가 이 약관에 의하여 재화 또는 용역(이하 “재화 등”)을
							이용자에게 제공하기 위하여 정보통신설비와 정보통신망을 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을
							말하며, 아울러 “몰”을 운영하는 회사의 의미로도 사용합니다. 2. “이용자”라 함은 회사가 제공하는 서비스를
							이용하는 자를 말합니다. 3. “해외사업자”라 함은 대한민국 이외의 국적이거나 대한민국 이외의 국가에 사업자 등록,
							법인, 영업소, 호스트서버 소재지 등을 가진 사업자를 의미합니다. 4. “쇼핑몰형 구매대행”이라 함은 회사가 “몰”을
							통해 해외에서 구매 가능한 재화 등에 대하여 정보를 제공하고 이용자의 청약을 받아, 회사가 해당 재화 등을 이용자의
							명의로 수입하여 판매하는 것을 의미합니다. 다만, 이 경우 재화 등은 이용자의 자가 소비용에 한정합니다. 5.
							“검수”라 함은 이용자가 구매한 재화 등의 누락, 하자, 파손 여부 등을 회사가 정한 기준에 따라 확인하는 서비스를
							의미합니다. 제3조(서비스의 제공) 회사는 다음 각 호의 업무를 수행할 수 있습니다. 1. 재화 등에 대한 정보제공
							2. 수입 및 통관 관련 업무 3. 국제반송 관련 업무 4. 기타 회사가 정하는 업무 제4조(서비스이용 제한) ①
							회사는 이용자의 서비스 이용 요청이 다음 각 호의 어느 하나에 해당하는 경우 서비스 제공을 거절할 수 있습니다. 1.
							신청내용에 허위, 기재누락, 오기가 있는 경우 2. 이용자가 요청한 서비스의 제공이 회사의 경영상 또는 기술상의
							이유로 현저히 곤란한 경우 3. 이용자가 불법 또는 부당한 목적을 위해 서비스를 이용하는 것으로 판단되는 경우 ②
							전항에 따라 서비스 제공을 거절하는 경우, 회사는 이용자에게 거절의 사유 및 근거를 통지하여야 합니다.

							제5조(상품가의 구성) ① “몰”에 표시된 재화 등의 판매 가격은 [해외사업자로부터의 해당 재화 등 구매가격,
							해외사업자로부터 회사의 해외 수령 장소까지의 운송료, 해외 현지 세금, 해외 구매 계약 체결 수수료, 해외 현지 수령
							장소(해외 물류센터) 이용료, 국제운송료와 수입관세, 수입부가세, 국내운송료, 기타세금 등(이하 “관·부가세
							등”)]이 포함된 가격입니다. ② 회사는 이용자가 재화 등의 판매가격을 지급하기 전에 전항에 따른 판매가격의 구성
							내역을 구분하여 고지하여야 합니다. ③ 판매가격은 해외사업자의 할인 행사, 환율 변화 등의 사유로 변동될 수 있으며,
							이로 인하여 회사가 청약을 받은 재화를 공급할 수 없는 경우 그 사유를 이용자에게 알리고 요금을 3영업일 이내에
							환급하는 등의 조치를 해야 합니다. 제6조(계약의 성립) ① 회사는 이용자의 구매의 신청이 있으면 수신확인통지를
							합니다. 수신확인통지에는 주문내역, 금액, 수령 주소 등의 신청 정보와 구매 신청의 정정, 취소 등에 관한 정보 등을
							포함하여야 합니다. ② 계약은 이용자의 구매신청에 대하여 회사의 수신확인통지가 이용자에게 도달한 때에 성립됩니다. ③
							수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우 지체 없이 회사에 구매 신청 변경 또는 취소를 요청할
							수 있으며, 회사는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 요금을 지급한 경우에는 제11조의
							청약철회 등에 관한 규정에 따릅니다. 제7조(검수 및 재포장) ① 회사는 이용자가 구매 신청한 재화 등에 대하여
							동일성 여부 및 하자·파손 여부, 운송물이 수출입 법령 등에 저촉되지 않는지 여부 등의 확인을 위해 해당 운송물의
							개봉·검수를 할 수 있습니다. 회사는 검수의 기준 및 범위를 정하여 이용자에게 미리 통지합니다. ② 회사가 재화 등의
							하자, 파손 등을 발견한 경우, 이용자에게 이를 통보하고 이용자의 요청에 따라 계약을 해제 또는 해지, 청약철회(이하
							“청약철회 등”)하거나, 재화 등의 인도를 진행합니다. ③ 이용자가 구매 신청한 재화 등에 대하여 회사가 검수를 통해
							악취, 액체누수 등의 이상이 있다고 판단한 경우 이용자에게 이러한 사실을 통지하고 해당 재화 등을 별도 보관하는 등
							임시조치를 취할 수 있습니다. ④ 제3항의 경우 회사는 이용자의 요구에 따라 해당 재화 등을 처분하며, 해당 재화의
							판매가를 배상하고 처분에 소요되는 비용을 부담합니다. ⑤ 회사는 포장이 운송에 적합하지 아니한 때에는 운송 중 발생될
							수 있는 충격의 정도를 고려하여 추가 포장을 할 수 있습니다. 제8조(배송) 이용자가 복수의 재화 등을 구매하고, 각
							재화 등을 공급하는 해외사업자가 다를 경우에는 해당 재화 등을 회사의 해외 수령 장소에 도착하는 순서대로 배송할 수
							있으며, 관·부가세 회피를 위한 분할배송 및 가격허위 신고 등 이용자의 불법행위 요청에는 협조하지 않습니다.

							제9조(통관) ① 회사는 이용자를 위하여 회사가 정한 운송 및 통관 업무 위탁사를 통해 통관절차를 수행합니다. 이 때
							발생하는 관·부가세 등은 이용자 또는 수하인이 부담합니다. ② 제1항의 통관 업무를 수행할 때에, 회사가 정한 운송
							및 통관 업무 위탁사가 관·부가세 등을 이용자를 대신하여 납부하면, 회사는 이용자가 재화 등의 구매 계약 체결 시
							미리 지급한 관·부가세 등을 운송 및 통관 업무 위탁사와 정산합니다. 제10조(긴급조치) ① 회사는 재화 등에 관하여
							이용자의 책임 있는 사유로 인하여 관할관청 등의 관련법령에 근거한 적법한 인도 요구가 있는 경우 해당 재화 등을 관할
							기관에 인도합니다. 이 경우 회사는 지체 없이 이를 이용자에게 통지합니다. ② 전항의 조치로 인하여 이용자가 손해를
							입은 경우 회사는 그 손해를 배상합니다. ③ 제1항의 관할관청 등이 재화 등을 반환한 경우, 회사는 지체 없이
							구매계약에 따른 채무를 계속해서 이행해야 합니다. 제11조(청약철회 등) 회사의 “몰”에 소개된 해외에서 구매 가능한
							재화 등의 구매에 관한 계약을 체결한 이용자는 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의
							공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의
							철회 등을 할 수 있습니다. 제12조(청약철회 등의 제한) ① 이용자는 재화 등을 배송 받은 경우 다음 각 호의 어느
							하나에 해당하는 경우에는 청약철회 등을 할 수 없습니다. 1. 이용자에게 책임 있는 사유로 재화 등이 분실 또는
							파손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다) 2.
							이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우 3. 시간의 경과에 의하여 재판매가
							곤란할 정도로 재화 등의 가치가 현저히 감소한 경우 4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인
							재화 등의 포장을 훼손한 경우 5. 그 밖에 이용자의 주문에 따라 개별적으로 생산되는 재화 등 또는 이와 유사한 재화
							등에 대하여 청약철회를 인정하는 경우 쇼핑몰형 구매대행업체에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에
							해당 거래에 대하여 별도로 그 사실을 고지하고 이용자의 서면(전자문서를 포함한다)에 의한 동의를 받은 경우 ② 전항
							제2호 내지 제4호의 경우에 회사가 “몰”에 사전에 청약철회 등이 제한되는 사실을 이용자가 쉽게 알 수 있는 곳에
							표시하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등은 제한되지 않습니다.

							제13조(상품상이, 하자, 파손 등) 이용자는 제12조에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나
							계약내용과 다르게 이행된 때에는 해당 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던
							날부터 30일 이내에 청약철회 등을 할 수 있습니다. 제14조(청약철회의 효과) ① 회사는 이용자로부터 재화 등을
							반품 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 요금을 환급합니다. 이 경우 회사가 이용자에게 재화 등의
							환급을 지연한 때에는 그 지연기간에 대하여 연 100분의 20의 지연이자율을 곱하여 산정한 지연이자를 지급합니다. ②
							회사는 제1항의 요금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 지급수단으로 재화 등의 요금을 지급한
							때에는 지체 없이 해당 지급수단을 제공한 사업자로 하여금 재화 등의 요금의 청구를 정지 또는 취소하도록 요청합니다.

							제15조(반품) ① 이용자가 구매한 재화 등에 대하여 회사와 해외사업자간의 매매계약이 체결되어 해당 재화가 회사의
							해외 현지 수령 장소로 발송된 이후 이용자가 청약철회 등을 한 경우, 해외 현지 운송료 및 구매 수수료, 해외 현지
							반송료는 이용자가 부담합니다. 이 경우, 회사는 이용자에게 해당 매매계약이 체결된 일시 및 발송의 일시를 증빙하는
							자료를 제시하여야 합니다. ② 이용자가 구매한 재화 등에 대하여 회사가 이용자의 국내 수령 장소로 발송한 이후
							이용자가 청약철회 등을 하는 경우, 해당 재화 등의 수입 시 발생한 해외 현지 운송료, 해외 세금, 해외 현지 수령
							장소 이용료, 선적비용, 항공운송료, 통관 업무 위탁 수수료, 관·부가세 등 해당 재화 등을 수입하기 위해 들어간
							비용과 회사의 국내주소지로 해당 재화를 반송하는 운송료는 이용자가 부담합니다. ③ 재화 등의 내용이 표시·광고 내용과
							다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반품에 필요한 비용은 회사가 부담합니다. ④
							이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 회사는 청약철회 등의 경우 그 비용을 누가 부담하는지를
							이용자가 알기 쉽도록 명확하게 표시합니다. ⑤ 회사는 제1항 및 제2항의 사실을 사전에 “몰”에 이용자가 쉽게 알 수
							있는 곳에 표시하는 등의 조치를 취해야 합니다. 제16조(교환과 수리) ① 회사는 재화 등의 재고를 보유하고 있지
							않으므로 교환은 불가능하나, 청약철회 등에 따른 반품 및 환불은 가능합니다. ② 회사는 재화 등의 수리(A/S)
							업무를 수행하지 않습니다. ③ 제1항 및 제2항의 사항을 회사가 “몰”에 사전에 이용자가 쉽게 알 수 있는 곳에
							표시하는 등의 조치를 취하지 않았다면, 회사는 이용자의 교환과 수리 요구에 협조하여야 합니다. 제17조(분쟁해결) ①
							회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를
							설치․운영합니다. ② 회사는 이용자로부터 제출되는 불만사항 및 의견을 다른 사안에 우선하여 처리합니다. 다만, 신속한
							처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 지체 없이 통지하여야 합니다. ③ 회사와 대한민국 국민 또는
							대한민국에 사무소를 가지는 이용자 간에 발생한 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회
							또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다. 제18조(관할법원 및 준거법) ① 회사와 대한민국
							국민 또는 대한민국에 사무소를 가지는 이용자 간에 발생한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는
							경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나
							외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다. ② 회사와 대한민국 국민 또는 대한민국에 사무소를 가지는
							이용자 간에 발생한 소송의 준거법은 대한민국법으로 합니다.</div>
				</ul>
				<button type="submit" class="next-button mb-3">확인</button>
			</form>
		</div>
	</div>
	<c:import url="../common/footer.jsp" />
</body>

</html>