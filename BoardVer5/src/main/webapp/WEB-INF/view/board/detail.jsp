<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${data.title}</title>
<script defer src="/res/js/boardDetail.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
	*{margin: 0; padding:0;}
	.hidden { display:none; }
	.fa-heart { color:red; }
</style>
</head>
<body>
	<div id="wrap">
		<div><a href="list">Back</a></div>
		<h1>${data.title} 
			<c:if test="${data.isFav eq 0}"> <!-- == :  eq라고 적어도 가능  -->
				<a href="fav?iboard=${param.iboard}&fav=1"><i class="far fa-heart"></i></a>
			</c:if>
			<c:if test="${data.isFav == 1}"> <!-- 히든 안쓰고 하는 방법 둘중 하나만 된다  -->
				<a href="fav?iboard=${param.iboard}&fav=0"><i class="fas fa-heart hidden"></i></a>
			</c:if>
		</h1>
		<div>글번호 : ${data.iboard}</div>
		<div>작성자 : ${data.unm} | 작성일 : ${data.regdt}</div>
		<div>${data.ctnt}</div>
		
		<h3>댓글</h3>
		<div>
			<form action="regCmt" method="post">
				<input type="hidden" name="iboard" value="${data.iboard}">
				<div>
					<textarea name="cmt" placeholder="댓글내용"></textarea>
					<input type="submit" value="댓글작성">
				</div>
			</form>
		</div>
		<div>
			<table>
				<tr>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>비고</th>
					<c:forEach items="${requestScope.cmtList}" var="item">
						<tr>
							<td>${item.cmt}</td>
							<td>${item.unm}</td>
							<td>${item.regdate}</td>
							<td>
								<c:if test="${item.iuser == sessionScope.loginUser.iuser}">
									<button>수정</button>
									<a href="cmt?icmt=${item.icmt}&iboard=${requestScope.data.iboard}"><button>삭제</button></a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>