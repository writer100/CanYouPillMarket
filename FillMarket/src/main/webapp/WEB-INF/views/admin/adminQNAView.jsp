<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>

	<style>
        .title {
            text-align: center;
        }

        #proReg {
            margin-left: 400px;
            width: 1200px;
        }
        .buttonRe{
            margin-left: 400px;
            
        }
        section #headerreg{
            margin-bottom: 60px;
            margin-left: 400px;
            border: black 1px solid;
            width: 200px;
            text-align: center;
            background: rgb(231, 133, 110);
            color: white;
            border-radius: 10px;
            font-size: 1.5em;
        }
        
        #titleh{        	
        	margin-bottom: 60px;
            margin-left: 400px;
            width: 200px;
            text-align: center;
        
        }
        
    </style>
    
<c:import url="../common/adminSide.jsp" />

</head>
<body>
<section>
	<div id="product reg">
	<br /><br />
        <h1 id="titleh">상세보기</h1>
        
        <!-- <form action="${pageContext.request.contextPath}/admin/productRegEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data"">  -->
            <table id="proReg" class="table table-bordered table-sm">
                <tr>
                    <td class="title">글 번호</td>
                    <td></td>
                    <td>작성일</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="title">제목</td>
                    <td colspan="3"></td>
                </tr>

                <tr>
                    <td class="title">내용</td>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td class="title">주의사항</td>
                    <td colspan="3"></td>
                </tr>


            </table>
            <div class="buttonRe">
                <button type="submit" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/admin/adminUpdateView.do?pno=$">수정</button>
                <button class="btn btn-default" onclick="productList()">리스트</button>
            </div>

       <!-- </form>  -->

    </div>
    </section>
    <br /><br />
</body>
</html>