<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div></div>
<h1>${reqeustScope.data.title}</h1>
<div>글번호 : <c:out value="${requestScope.data.title.iboard}"></</c:out></div>
<div>작성자 : <c:out value="${requestScope.data.title.unm}"></c:out>
	 | 작성일 : <c:out value="${requestScope.data.regdt}"></c:out></div>
<div><c:out value="${requestScope.data.ctnt}"></c:out></div>
<!-- out : ???무력화 시킴 -->

<div>
	<form id="cmtfrm" data-iboard="${param.iboard}">
		<input type="text" id ="cmt">
		<input type="button" value="댓글달기" onclick="regCmt();">
	</form>
</div>
<div id="cmtList"></div>



<script src="/res/js/boardDetail.js"></script>