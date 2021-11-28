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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<body>

<section class="content container-fluid">
  <div class="col-lg-12">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">댓글 작성</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label for="newReplyText">댓글 내용</label>
                <input class="form-control" id="newReplyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
            </div>
            <div class="form-group">
                <label for="newReplyWriter">댓글 작성자</label>
                <input class="form-control" id="newReplyWriter" name="replyWriter" placeholder="댓글 작성자를 입력해주세요">
            </div>
        </div>
        <div class="box-footer">
            <ul id="replies">

            </ul>
        </div>
        <div class="box-footer">
            <div class="text-center">
                <ul class="pagination pagination-sm no-margin">

                </ul>
            </div>
        </div>
    </div>
  </div>

  <div class="modal fade" id="modifyModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">댓글 수정창</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="replyNo">댓글 번호</label>
                    <input class="form-control" id="replyNo" name="replyNo" readonly>
                </div>
                <div class="form-group">
                    <label for="replyText">댓글 내용</label>
                    <input class="form-control" id="replyText" name="replyText" placeholder="댓글 내용을 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="replyWriter">댓글 작성자</label>
                    <input class="form-control" id="replyWriter" name="replyWriter" readonly>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-success modalModBtn">수정</button>
                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
            </div>
        </div>
    </div>
  </div>

</section>

<div class="box box-warning">
    <div class="box-header with-border">
        <a class="link-black text-lg"><i class="fa fa-pencil"></i> 댓글작성</a>
    </div>
    <div class="box-body">
        <form class="form-horizontal">
            <div class="form-group margin">
                <div class="col-sm-10">
                    <textarea class="form-control" id="newReplyText" rows="3" placeholder="댓글내용..." style="resize: none"></textarea>
                </div>
                <div class="col-sm-2">
                    <input class="form-control" id="newReplyWriter" type="text" placeholder="댓글작성자...">
                </div>
                <hr/>
                <div class="col-sm-2">
                    <button type="button" class="btn btn-primary btn-block replyAddBtn"><i class="fa fa-save"></i> 저장</button>
                </div>
            </div>
        </form>
    </div>
</div>

<div class="box box-success collapsed-box">
    <%--댓글 유무 / 댓글 갯수 / 댓글 펼치기, 접기--%>
    <div class="box-header with-border">
        <a href="" class="link-black text-lg"><i class="fa fa-comments-o margin-r-5 replyCount"></i></a>
        <div class="box-tools">
            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                <i class="fa fa-plus"></i>
            </button>
        </div>
    </div>
    <%--댓글 목록--%>
    <div class="box-body repliesDiv">

    </div>
    <%--댓글 페이징--%>
    <div class="box-footer">
        <div class="text-center">
            <ul class="pagination pagination-sm no-margin">

            </ul>
        </div>
    </div>
</div>



</body>
</html>