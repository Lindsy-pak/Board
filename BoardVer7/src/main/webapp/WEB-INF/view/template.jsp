<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/res/css/common.css">
<script defer src="/res/css/common.js"></script>
<title>${requestScope.title}</title>
</head>
<body>
	<header>
		<nav>
			<ul>
				<c:if test="${empty sessionScope.loginUser}">
				<%--<c:if test="${empty sessionScope.loginUser eq null}"> --%>
					<li><a href="/user/login">로그인</a></li> <!--로그인이 안되어 있으면-->
				</c:if>
				
				<c:if test="${not empty sessionScope.loginUser}">
					<li><a href="/user/logout">로그아웃</a></li> <!--로그인이 되어있을 때 -->
				</c:if>
				<li><a href="/board/list">리스트</a></li>
				<li><a href="/board/write">글쓰기</a></li>
				<li><a href="/board/favoriteList">좋아요</a></li> <!-- 좋아요 : 내가 좋아요 눌렀던 것을 볼 수 있는 페이지  -->
			</ul>
		</nav>
	</header>
	<section>
		<jsp:include page="/WEB-INF/view/${requestScope.jsp}.jsp"></jsp:include> 
	</section>
</body>
</html>