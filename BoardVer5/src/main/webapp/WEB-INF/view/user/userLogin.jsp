<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	*{ padding:0; margin:0; }
	body{ font-family: "맑은고딕", sans-serif; background: #AFCDAD;}
	a{ text-decoration: none; color:black;}
	#wrap {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-content: center;
		text-align: center;
		margin: 20px auto;
		margin-top: 65px;
		width: 500px;
		height: 500px;
		background-color: #fff;
		box-shadow: 3px 3px 5px #838383;
		border-radius: 10px;
	}
	#button { margin-top:10px;}
	#err {
		font-size: 9px;
		color:#CB4848;
	}
	.title {
		font-size: 50px;;
  		letter-spacing: 0;
  		-webkit-transition: all .28s ease-in-out;
  		transition: all .28s ease-in-out;
	}
	.title:hover,
	.title:focus,
	.title:active {
  		letter-spacing: 10px;
	}
	.title:after,
	.title:before {
  		border: 1px solid rgba(255, 255, 255, 0);
  		bottom: 0;
  		content: " ";
  		display: block;
  		margin: 0 auto;
 		 position: relative;
  		-webkit-transition: all .28s ease-in-out;
 		 transition: all .28s ease-in-out;
  		width: 0;
	}
	.title:hover:after,
	.title:hover:before {
 		 border-color: #fff;
  		-webkit-transition: width 350ms ease-in-out;
  		transition: width 350ms ease-in-out;
 		 width: 70%;
	}
	.title:hover:before {
 		 bottom: auto;
  		top: 0;
	}
</style>
</head>
<body>

</head>
<body>
	<div id="wrap">
		<div class="title">Hello</div>
		<div id="err">${errMsg}</div>
			<form action="login" method="post">
				<div>ID : <input type="text" name="uid" placeholder="ID"></div>
				<div>PW : <input type="password" name="upw" placeholder="PW"></div>
				<div id="button">
					<input type="submit" value="Login">
					<a href="/user/join"><input type="button" value="Join"></a>
				</div>
			</form>
	</div>
</body>
</html>