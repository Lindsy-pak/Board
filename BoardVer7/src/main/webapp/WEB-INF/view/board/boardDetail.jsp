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

<div><!-- data- 할때는 대문자 사용불가(로그인 한사람의 pk값을 알아야 함 누가 댓글 쓴지 알아야하니까)-->
	<form id="cmtfrm" data-login_user_pk="${sessionScope.loginUser.iuser}" data-iboard="${param.iboard}" onsumit=""> <!--data - 데이타 안에 들어있는 속성을 의미한다.   -->
		<input type="text" id ="cmt">
		<input type="button" value="댓글달기" onclick="regCmt();">
	</form>
</div>
<div id="cmtList"></div>



<script src="/res/js/boardDetail.js"></script>