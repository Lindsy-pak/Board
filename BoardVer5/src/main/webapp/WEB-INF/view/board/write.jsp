<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
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
</style>
</head>
<body>
	<div id="wrap">
		<span><button onclick="moveToBack()">Back</button></span>
		<h1>Write</h1>
		<p>Title</p>
		<div><input type="text" name="title" placeholder="title"></div>
		<p>Contents</p>
		<p><textarea name="ctnt" placeholder="contents"></textarea></p>
		<span><input type="submit" value="Write"></span>
		<span><input type="reset" value="Reset"></span>
	</div>
	
	<script>
		function moveToBack() {
			history.back();
		}
	</script>
</body>
</html>