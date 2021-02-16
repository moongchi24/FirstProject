<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호가 다릅니다");   		frm.password.focus();
			frm.password.value = "";	return false;
		}
	}
</script></head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 삭제</h2>
<form action="${path}/delete" name="frm" onsubmit="return chk()">
	<input type="hidden" name="password2" value="${board.password }">
	<input type="hidden" name="num" value="${board.num }">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<!-- 회원 게시판이 아닐 경우는 암호 점검 후 삭제 회운게시판은 불 필요한 화면-->
<table class="table table-hover">
	<tr><td>암호</td><td><input type="password" name="password"
		required="required" autofocus="autofocus"></td></tr>
	<tr><td colspan="2"><input type="submit"></td></tr>
</table>
</form>
</div>
</body>
</html>