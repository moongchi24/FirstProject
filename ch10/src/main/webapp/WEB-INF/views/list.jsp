<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<div class="container" align="center">
	<h2 class="text-primary">게시글 목록</h2>
<c:set var="num" value="${no }"></c:set>
<table class="table table-striped">
	<tr><th>번호</th><th>제목</th><th>작성자</th><th>조회수</th>
		<th>작성일</th></tr>
<c:if test="${empty list }">
	<tr><th colspan="5">게시글이 없습니다</th></tr>
</c:if>
<c:if test="${not empty list }">
	<c:forEach var="board" items="${list }">
		<tr><td>${num}<%-- ${board.num } --%></td>
			<c:set var="num" value="${num -1}"></c:set>
		<c:if test="${board.del == 'y' }">
			<th colspan="4">삭제된 글입니다</th>
		</c:if>
	<c:if test="${board.del != 'y' }">
			<td title="${board.content }">
				<c:if test="${board.re_level > 0}">
					<!-- 10 px씩 들여쓰기 -->
					<img alt="" src="${path}/resources/images/level.gif" 
						height="5" width="${board.re_level * 10}">
					<img alt="" src="${path}/resources/images/re.gif">
				</c:if>
				<a href="${path}/view/num/${board.num}/pageNum/${pb.currentPage}" 
					class="btn btn-info btn-sm">${board.subject}</a>
				<c:if test="${board.readcount > 50 }">
					<img alt="" src="${path}/resources/images/hot.gif">
				</c:if>
			</td>
			<td>${board.writer }</td>
			<td>${board.readcount }</td>
			<td>${board.reg_date }</td>
	</c:if></tr>
  </c:forEach>
</c:if>
</table>
<div align="center">
	<ul class="pagination">
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="${path}/list/pageNum/1?search=${board.search }&keyword=${board.keyword}">
				<span class="glyphicon glyphicon-backward"></span>
			</a></li>
			<li><a href="${path}/list/pageNum/${pb.startPage-1 }?search=${board.search }&keyword=${board.keyword}">
				<span class="glyphicon glyphicon-triangle-left"></span>
			</a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage}" 
				end="${pb.endPage}">
			<c:if test="${pb.currentPage == i }">
				<li class="active"><a href="${path}/list/pageNum/${i}?search=${board.search }&keyword=${board.keyword}">${i}</a></li>
			</c:if>
			<c:if test="${pb.currentPage != i }">
				<li><a href="${path}/list/pageNum/${i}?search=${board.search }&keyword=${board.keyword}">${i}</a></li>
			</c:if>			
		</c:forEach>
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="${path}/list/pageNum/${pb.endPage+1}?search=${board.search }&keyword=${board.keyword}">
				<span class="glyphicon glyphicon-triangle-right"></span>
			</a></li>
			<li><a href="${path}/list/pageNum/${pb.totalPage}?search=${board.search }&keyword=${board.keyword}">
				<span class="glyphicon glyphicon-forward"></span>
			</a></li>
		</c:if>
	</ul>	
</div>
<form action="${path}/list/pageNum/1">	
<!--<select name="search">
		<option value="writer">작성자</option>
		<option value="subject">제목</option>
		<option value="content">내용</option>
	</select> -->
	<!-- onchange="a()"에 메서드를 주고 자바스크립트에서 처리하면  -->
	<select name="search" >
		<c:forTokens var="sh" items="writer,subject,content,subcon" 
			delims="," varStatus="i">
		<!-- 전에 선택했던 검색 조건을 유지 -->
		<!-- selected="selected" select태그에서 맨 위에 보이는 것을 선택 -->
			<c:if test="${sh==board.search }">
				<option value="${sh}" selected="selected">${tit[i.index]}</option>
			</c:if>
		<!-- option에서 value search에 담아가는 값
			<option>값</option> option사이에 있는 값은 화면에 보이는 값 -->
			<c:if test="${sh!=board.search }">
				<option value="${sh}">${tit[i.index]}</option>
			</c:if>
		</c:forTokens>
	</select>
	<input type="text" name="keyword" value="${board.keyword }">
	<input type="submit" value="확인">
</form>
<div align="center">
	<a href="${path}/insertForm/num/0/pageNum/1"
		class="btn btn-success">게시글 입력</a>
</div>
</div>
</body>
</html>