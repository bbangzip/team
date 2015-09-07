<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style>
	#tbl, #btn, #sch{position:absolute;}
	#tbl tr td{text-align:right;border:0px}
	#btn{left:250px; top:130px}
	#sch{top:165px;}
	#point{font-size:19px; color:#662500; font-weight:bold}
	#userId, #userPwd{width:150px}
	#logWin{position:absolute; left:40%; top:35%; border:2px solid black; height:210px; width:315px}
</style>
<script src="../js/jquery-1.11.3.min.js"></script>
<script>
	$(function()
	{
		$("#loginFrm").submit(function()
				{
					if($("#userId").val()==null || $("#userId").val()=="")
						{
							alert("아이디를 입력하세요..");
							return false;
						}
					if($("#userPwd").val()==null || $("#userPwd").val()=="")
						{
							alert("비밀번호 입력하세요");
							return false;
						}
					
				});
	});
	
</script>
</head>
<body>
<div id="logWin">
<h1>Commun Login Page</h1>
<h4>아이디와 패스워드를 입력하시오.</h4>
<hr>
<form  method="post" name="loginFrm" id="loginFrm" action="loginOk.jsp">
<table id="tbl" border="1">
	<tr><td>I D</td><td>:</td><td><input type="text" name="userId" id = "userId" ></td></tr>
	<tr><td>Password</td><td>:</td><td><input type="password" name="userPwd" id = "userPwd"></td></tr>
</table>
<input type="image" id="btn" src="../img/loginbtn.png">

<h5 id="sch"><a href="#">아이디/패스워드 찾기</a> <span id="point"> | </span> <a href="register.jsp">회원 가입</a></h5>
</form>
</div>
</body>
</html>