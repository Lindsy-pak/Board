<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>join</h1>

<form id="frm" action="join" method="post" onsubmit="return frmChk();"> 
<!-- on**이면 이벤트기능:서브밋할때 무언가 실행 리턴키워드 반드시 있어야 함 false가 아니면 무조건 실행-->
	<div>
		<input type="text" name="uid" placeholder="아이디">
		<button id="btnChkId">중복ID체크</button>
	</div>
	<div id="chkUidResult"></div>
	<div><input type="password" name="upw" placeholder="비밀번호"></div>
	<div><input type="password" name="chkUpw" placeholder="비밀번호 확인"></div>
	<div>
		성별 : 
		<label>여성 <input type="radio" name="gender" value="0" checked></label><!-- 이름(문자)만 눌러도 체크가 되게끔  -->
		<label>남성 <input type="radio" name="gender" value="1"></label>
	</div>
	<div><input type="text" name="unm" placeholder="이름"></div>
	<div>
		<input type="submit" value="회원가입">
		<input type="reset" value="초기화">
	</div>
</form>

<script src="/res/js/userJoin.js"></script>