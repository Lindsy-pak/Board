<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
<script defer src="/res/js/boardList.js"></script><!-- defer는 먼저 읽었지만 모든 일이 끝난뒤에 실행 -->
<!-- 스크립트는 ../로 상대경로 x 무조건 절대경로로 해야한다. -->
<link rel="stylesheet" type="text/css" href="/res/css/boardList.css">
<style>
	*{margin:0; padding:0;}
	body{ font-family: "맑은고딕", sans-serif; background: #AFCDAD; }
	a{ text-decoration: none; color:black;}
	#wrap {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-content: center;
		text-align: center;
		width: 500px;
		height: 500px;
		background-color: #fff;
		box-shadow: 3px 3px 5px #838383;
		border-radius: 10px;
 		margin: 20px auto; 
		margin-top: 65px;
	
	}
	table, td, th {
		border: 1px solid #000;
		border-collapse: collapse;
	}
	table {
	 display: flex;
	 justify-content:center;
	 text-align:center;
	 align-content:center;
	}
	th {
		background-color: #AFCDAD;
		color:#fff;
	}
</style>
</head>
<body>
	<div id="wrap">
		<a href="/user/logout"><button>Logout</button></a>
		<h1>List</h1>
		<p>${loginUser.unm}님 환영합니다 :)</p><!-- session에 unm을 담았기 때문에 -->
		<!-- ${sessionScope.loginUser.unm} : 성능향상 (pageContext,request에서 안찾아도 되기 때문에)-->

		<div>
			<table>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일시</th>
				</tr>
				
				<c:forEach items="${list}" var="item"><!--${requestScope.list} -->
					<tr class="record" onclick="moveToDetail(${item.iboard})">
						<td>${item.iboard}</td> 
						<td>${item.title}</td>
						<td>${item.unm}</td>
						<td>${item.regdt}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<a href="/board/write"><button>Write</button></a>
	</div>
</body>
</html>