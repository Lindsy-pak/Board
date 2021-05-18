<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	*{ padding:0; margin:0; }
	body{ font-family: "맑은고딕", san-serif; }
	a{ text-decoration: none; color:black;}
	#wrap {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-content: center;
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	<div id="wrap">
			<div>ID : <input type="text" name="id" placeholder="ID"></div>
			<div>PW : <input type="password" name="pw" placeholder="PW"></div>
			<div>
				<span><a href="/board/list"><input type="button" value="Login"></a></span>
				<span><a href="/user/join"><input type="button" value="Join"></a></span>
			</div>
	</div>
</body>
</html>