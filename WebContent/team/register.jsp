<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-1.11.3.min.js"></script>
<script src="../js/register.js"></script>
<style>
	#pic img{width:700px;}
	#register{width:700px; height:542px; position:absolute; left:50%; margin-left:-350px;top:15%;
		border:1px solid gray}
	#navi{width:150px;height:400px;background-color:pink;
		text-align:right;position:absolute}
	#content{width:550px;height:400px;position:absolute;left:150px}
	#Btn{position:relative;left:330px;top:400px}
</style>
<script>
	function idCheckWin(){
		window.open("idCheck.jsp?id="+document.frm.userId.value,"idchkwin","width=400,height=200,scrollbars=no");
		
	}
	function zipWin(){
		window.open("zipSearch.jsp","zipWin","width=500, heigth=500")
	}
</script>
</head>
<body>
<div id="register">
	<div id="pic">
		<img src="img/registBanner.jpg">
	</div>
	<div id="navi"><br/>
		<label>아이디</label><br/><br/>
		<label>비밀번호</label><br/><br/>
		<label>비밀번호 확인</label><br/><br/><br/>
		<label>이름</label><br/><br/>
		<label>우편 번호</label><br/>
		<label>주소</label><br/><br/><br/>
		<label>전화번호</label><br/><br/>
		<label>이메일</label><br/><br/>
		
	</div>
	<div id="content">
	<form method="post" action="registerOk.jsp" id="registerChk" name="frm">
		<label style=color:red>＊　</label><input type="text" name="userId" id="Id" maxlength="12">		
		<input type="button" value="ID중복검사" name="userIdChk" id="userIdChk" onClick="idCheckWin()">
		<input type="hidden" value="1" name="idChk" id="idChk"/><br/>
		<label>　　아이디는 영문,숫자 조합으로 하셔야 합니다.[4자리 이상 12자리 이하]<br/>
		　　아이디는 <span style=color:red>소문자</span>로 저장됩니다</label><br/>
		<label style=color:red>＊　</label><input type="text" name="userPwd" id="pass"><br/>
		<label>　비밀번호는 4자리 이상 12자리 이하로 입력해주세요.</label><br/>
		<label style=color:red>＊　</label><input type="text" id="passCheck" name="userPwd2"><br/><br/>
		<label style=color:red>＊　</label><input type="text" id="name" name="userName"><br/><br/>
		<label style=color:red>＊　</label><input type="text" id="zipCode" name="zipCode" maxlength="5">
		<input type="button" value="검색" onClick="zipWin()"> <br/>
		<label style=color:red>＊　</label><input type="text" id="addr1" name="addr1"><br/>
		<label>　　</label><input type="text" id="addr2" name="addr2"><br/><br/>
		<label style=color:red>＊　</label><select name="tel1">
			<option value="010">010</option>
		</select>
		-<input type="text" style="width:60px" id="tel2" name="tel2" maxlength="4">-<input type="text" style=width:60px id="tel3" name="tel3" maxlength="4"><br/><br/>
		<label>　　</label>
		<label style=color:red>＊　</label><input type="text" id="email" name="email"><br/><br/>
		</div>
	<div id="Btn">
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</div>
	</form>
	
</div>
</body>
</html>