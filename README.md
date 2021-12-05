# Spring FrameWork Project 'CanYouPillMarket'

## [최종보고서 링크] <!-- (링크 첨부) -->
* 프로젝트 명 : 캔유필마켓(CanYouPillMarket)

* 프로젝트 기간 : 2021-11-14 ~ 2021-11-28

* 직책 : 팀원

* 프로젝트 설명

  - Spring FrameWork로 제작한 웹 페이지
  - 코로나 19 팬데믹이 지속되며 바이러스 감염 우려로 건강관리에 대한 중요성과 소비자의 관심도가 증가하였다. 하지만 시중에 나와있는 건강기능식품의 종류가 많아 무엇을 구입해야할 지 고민하는 소비자가 많고 이들를 위하여 소비자가 찾는 영양제를 추천해주고 구입까지 할 수 있는 영양제 쇼핑몰을 기획
  - 외부 API(Daum Postcode API, IMPORT 결제 API), BootStrap 등 다양한 기술을 활용한 프로젝트

* 사용기술 및 개발환경

  - OS : Windows 10, MacOS
  - Developer-Tool : 
      VSCode / Eclipse / SQLDeveloper
  - Front-End : 
      HTML5 / CSS3 / JavaScript (ES8) / jQuery
  - Back-End :
      Java EE 11 / Oracle DBMS 11G R2(XE) / apache-tomcat 8.5
  - version control tools : 
      Egit (Eclipse Git) / GitHub
      
* 역할

  - 장바구니
  - 결제

## 구현기능 및 기능설명
* 상품 목록에서 장바구니 추가
![addCart](https://user-images.githubusercontent.com/91815909/144743116-2252337b-c591-4b70-b35d-1297abe7d2cf.gif)
**상품 목록에서 장바구니 추가 시 수량 선택하는 옵션이 없기때문에 한 개의 상품만 장바구니에 추가될 수 있게 cart.setAmount(1) <- 수량을 한 개로 고정함**
```
		if(count == 0) {
			// 없으면 insert
			cart.setAmount(1);
			cart.setOrderprice(cart.getAmount() * cart.getPprice());
			cartService.insertCart(cart);
			
			System.out.println("장바구니 추가 : " + cart);
			
			msg = "상품이 장바구니에 담겼습니다.";
	
		} else { 
			cart.setAmount(1);
			cart.setOrderprice(cart.getAmount() * cart.getPprice());
			cartService.updateCart(cart);
			
			msg = "이미 있는 상품의 수량을 추가하였습니다.";
		}
```

* 상품 상세페이지에서 장바구니 추가
![addCart2](https://user-images.githubusercontent.com/91815909/144743167-6de48fe1-1d13-4f22-9f04-a095486121c4.gif)
**상품 상세페이지에선 수량 선택하는 옵션이 있어 form태그로 묶고 submit 버튼으로 입력받은 값을 보내 장바구니에 추가함**

* 장바구니 상품 하나 삭제, 전체 삭제
![deleteCart](https://user-images.githubusercontent.com/91815909/144743631-cbfb49d9-65e6-471f-aa71-f19cde0c0adf.gif)
**상품 우측의 x표시를 누르면 해당 상품이 장바구니에서 삭제되고, 상단의 전체삭제를 누르면 confirm 창이 뜨고 확인을 누르면 장바구니에 담긴 상품 전체가 삭제 됨**

* 장바구니 내 상품 주문
![order](https://user-images.githubusercontent.com/91815909/144749255-57bf6f44-f244-4bfb-b3e1-a4e567e3d8ae.gif)
**주문하기 버튼을 클릭하면 주문정보입력 페이지로 이동<br>
세션값을 받아와 로그인한 회원의 이름과 연락처를 주문자 정보에 뜨게하고<br>
우측 체크박스를 체크하면 배송지 정보 입력창에도 주문자 정보와 동일한 정보가 입력 됨<br>
주소입력은 다음 주소 API 이용<br>
아임포트 결제 API 를 이용해 결제하기 버튼을 누를 시 카카오페이 결제창이 뜨고 결제완료 후 결제완료 페이지로 이동**
```
   <input type="checkbox" id="copyChecked" onclick="copyInfo();"> 주문자 정보 가져오기</label></span>
                                
   <script>
      // 주문자 정보 가져오기 체크박스
      function copyInfo() {
        if(document.getElementById('copyChecked').checked) {
          document.getElementById('receiverName').value = document.getElementById('customerName').value;
          document.getElementById('receiverTel').value = document.getElementById('customerTel').value;
          }
      }
   </script>
```

* 주문 진행 시 주문번호 랜덤으로 생성
```
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for (int i = 0; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String orderId = ymd + "_" + subNum;
		
		// System.out.println("주문번호 생성 : " + orderId);
				
			order.setOrderid(orderId);
```

* 주문 완료 후 나의 주문 내역에서 주문 상세 확인
![list-detail](https://user-images.githubusercontent.com/91815909/144759455-718b8ab9-4612-4baa-b4f2-0439fdc2d0fe.png)

## 개선사항
  - 설문조사 기능 미완성 (설문조사는 있지만 결과를 통해 영양제를 추천해주는 기능을 완성하지 못 함)
  - 장바구니 내 수량 수정 불가
  - 장바구니 내 선택 상품 삭제, 주문 기능 추가 필요
  - 전체적으로 UI가 통일되지 않음
