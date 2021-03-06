<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#boardDisp').load('${path}/list/pageNum/${pageNum}');
	});
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 상세 내역</h2>
<table class="table table-striped">
	<tr><td>제목</td><td>${board.subject}</td></tr>
	<tr><td>작성자</td><td>${board.writer}</td></tr>
	<tr><td>내용</td><td><pre>${board.content}</pre></td></tr>
	<tr><td>이메일</td><td>${board.email}</td></tr>
	<tr><td>조회수</td><td>${board.readcount}</td></tr>
	<tr><td>작성일</td><td>${board.reg_date}</td></tr>
	<tr><td colspan="2">
		<a href="${path}/list/pageNum/${pageNum}"
			class="btn btn-info">게시글 목록</a>
		<a href="${path}/updateForm/num/${board.num}/pageNum/${pageNum}"
			class="btn btn-warning">수정</a>
		<a href="${path}/deleteForm/num/${board.num}/pageNum/${pageNum}"
			class="btn btn-danger">삭제</a>
		<a href="${path}/insertForm/num/${board.num}/pageNum/${pageNum}"
			class="btn btn-success">답글</a>
	</td></tr>
</table>
<div id="boardDisp"></div>
</div>
</body>
</html>