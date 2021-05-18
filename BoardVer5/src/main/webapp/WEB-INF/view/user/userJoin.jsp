<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<style>
	*{ padding:0; margin:0; }
	body{ font-family:"맑은고딕", sanserif; background: #AFCDAD;}
	a{ text-decoration: none; color:black;}
	#wrap{
		padding: 60px;
		display:flex;
		flex-direction: column;
		justify-content: center;
		text-align: center;
		align-content: center;
		margin-top:200px;
		margin: 20px auto;
 		margin-top: 100px;
		width: 500px;
		height: 300px;
		background-color: #fff;
		box-shadow: 3px 3px 5px #838383;
		border-radius: 10px;
	}
	select {
		width: 100px;
		height: 30px;
 		padding: .5em .5em; 
		font-family:"맑은고딕", sanserif;
		background: url('https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg') no-repeat 95% 50%; no-repeat;
		border: 1px solid #999;
		-webkit-appearance: none;
		-moz-appearance: none;
    	appearance: none;
/*     	select::-ms-expand {
  		for IE 11 
  		display: none; }*/
	}
	#button {margin-top: 10px;}
	table, tr, td {
		margin: 10px;
	}
	table {
		font-size: 7px;
	}
	th { width: 50px;}
	td { width: 800px; }
		.title {
		font-size: 50px;;
  		letter-spacing: 0;
  		-webkit-transition: all .28s ease-in-out;
  		transition: all .28s ease-in-out;
	}
	.title:hover,
	.title:focus,
	.title:active {
  		letter-spacing: 40px;
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
	<div id="wrap">
		<div class="title"><h1>Join</h1></div>
		<table>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" placeholder="ID"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" name="pw" placeholder="PW"></td>
			</tr>
			<tr>
				<th>PW 확인</th>
				<td><input type="password" name="pwchk" placeholder="PW확인"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="unm" placeholder="성명"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label><input type="radio" name="gender" value="0" checked>여자</label>
					<label><input type="radio" name="gender" value="1" checked>남자</label>
				</td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td>
					<span><input type="text" name="umail"> @</span>
					<span><input type="text" name="umail"></span>
					<span><select>
						<option selected>Select</option>
						<option>naver.com</option>
						<option>google.com</option>
						<option>nate.com</option>
						<option>yahoo.com</option>
					</select></span>
				</td>
			</tr>
		</table>
		<div id="button">
			<span><a href="/board/list"><input type="button" value="Login"></a></span>
			<span><a href="/user/join"><input type="button" value="Join"></a></span>
		</div>
	</div>

</body>
</html>