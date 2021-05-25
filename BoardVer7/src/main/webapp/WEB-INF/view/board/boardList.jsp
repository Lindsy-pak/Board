<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/res/css/boardList.css">
<h1>리스트</h1>

<table>
	<tr>
		<th>No.</th>
		<th>제목</th>
		<th>글쓴이</th>
		<th>작성일시</th>
	</tr>
	<c:forEach items="${requestScope.list}" var="item">
		<tr class="record" onclick="moveToDetail(${item.iboard})">
			<td>${item.iboard}</td>
			<td><!--<mark> : tag는 형광펜 한것처럼 박스가 칠해짐  replace : 변경, 대체 -->
			<!-- EL식${}에서 문자열 합치기 할경우 += 로 해야 문자열이 합쳐진다.  -->
				<c:choose>
					<c:when test="${param.searchType eq 1 || param.searchType eq 2}">
						${item.title.replace(param.searchText, '<mark>' += param.searchText += '</mark>'}
					</c:when>
				</c:choose>
				<c:otherwise>
					${item.title}
				</c:otherwise>
			</td>
				
			<td> <!-- 둘다 choose를 하지 않으면 검색했을 때 제목과 글쓴이 둘다 검색하려는 키워드가 있으면 둘다 mark가 된다  -->
				<c:choose> 
					<c:when test="${param.searchType eq 4}">
						${item.title.replace(param.searchText, '<mark>' += param.searchText += '</mark>'}
					</c:when>
				</c:choose>
				<c:otherwise>
					${item.writerNm}
				</c:otherwise>
			</td>
			
			<td>${item.regdt}</td>
		</tr>
	</c:forEach>
</table>

<div>

	<c:forEach begin="1" end="${requestScope.pagingCnt}" var="page"> <!--forEach는 pageContext에 담아준다. (setAttribute에 담을 수 있느 내장 객체)-->
		<!-- if문과 같고 else를 쓸 수 있다. choose라면 x, otherwise 그렇지 않다면 y  -->
		<!-- empty- : 내가 클릭한 페이지의 번호의 a태그가 사라진다. -->
		<c:choose>
			<c:when test="${page eq param.cPage || (empty param.cPage && page eq 1)}"> 
				<span class="colorRed">${page}</span>
			</c:when>
			<c:otherwise>
				<span><a href="/list?cPage=${page}&searchType=${param.searchType}&searchText=${param.searchText}"></a></span> 
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>
<!-- 검색기능 -->
<div>
	<form action="list" method="get">
		<div>
			<select name="searchType"><!-- 보통은 for문 돌려서 한다.   -->
				<option value="1" ${param.searchType == 1 ? 'selected': ''}>제목+내용</option> <!--selected넣으면 기본으로 옵션 넣어지는 기능  -->
				<option value="2" ${param.searchType == 2 ? 'selected': ''}>제목</option>
				<option value="3" ${param.searchType == 3 ? 'selected': ''}>내용</option>
				<option value="4" ${param.searchType == 4 ? 'selected': ''}>글쓴이</option>
			</select>
			<input type="search" name="searchText">
			<input type="submit" value="검색">
		</div>
	</form>
</div>
<script src="/res/js/boardList.js"></script>
