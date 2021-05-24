<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>login</h1>
<div id="wrap">
	<div class="title">Hello</div>
	<div class="errMsg">
		<p>${errMsg}</p>
	</div>
	<form action="login" method="post">
		<div>
			<p>
				ID : <input type="text" name="uid" placeholder="아이디">
			</p>
			<p>
				PW : <input type="password" name="upw" placeholder="비밀번호">
			</p>
		</div>
		<div>
			<span><input type="submit" value="Login"></span> <span><a
				href="/user/join"><button>Join</button></a></span>
		</div>
	</form>
</div>
