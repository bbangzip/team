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
	#pic img{width:700px;height:140px}
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
		<img src="img/inforedit.jpg">
	</div>
	<div id="navi"><br/>
		<label>아이디</label><br/><br/>
		<label>비밀번호</label><br/><br/>
		<label>비밀번호 확인</label><br/><br/><br/>
		<label>이름</label><br/><br/>
		<label>이메일</label><br/><br/>
		<label>우편 번호</label><br/>
		<label>주소</label><br/><br/><br/>
		<label>전화번호</label><br/><br/>
		<label>내지역 보기</label><br/><br/>
		
	</div>
	<div id="content">
	<form method="post" action="registerOk.jsp" id="registerChk" name="frm">
		<br/><label style=color:red>＊　</label>
		<input type="text" name="userId" id="Id"readonly style="background-color: #e2e2e2;"/>		
		<input type="hidden" value="1" name="idChk" id="idChk"/><br/><br/>
		<label style=color:red>＊　</label><input type="text" name="userPwd" id="pass"><br/>
		<label>　비밀번호는 4자리 이상 12자리 이하로 입력해주세요.</label><br/>
		<label style=color:red>＊　</label><input type="text" id="passCheck" name="userPwd2"><br/><br/>
		<label style=color:red>＊　</label><input type="text" id="name" name="userName" readonly style="background-color: #e2e2e2;"/><br/><br/>
		<label style=color:red>＊　</label><input type="text" id="email" name="email"><br/><br/>
		<label style=color:red>＊　</label><input type="text" id="zipCode" name="zipCode" maxlength="5">
		<input type="button" value="검색" onClick="zipWin()"> <br/>
		<label style=color:red>＊　</label><input type="text" id="addr1" name="addr1"><br/>
		<label>　　</label><input type="text" id="addr2" name="addr2"><br/><br/>
		<label style=color:red>＊　</label><select name="tel1">
			<option value="010">010</option>
		</select>
		-<input type="text" style="width:60px" id="tel2" name="tel2" maxlength="4">-<input type="text" style=width:60px id="tel3" name="tel3" maxlength="4"><br/>
		<label style=color:red>＊　</label><input type="text" name="mylocation1" id="mylocation1"readonly style="background-color: #e2e2e2;"/>
		<input type="button" value="삭제"/><br/>
		<label>　　</label><input type="text" id="mylocation2" name="mylocation2" readonly style="background-color: #e2e2e2;">
		<input type="button" value="삭제"/><br/>
		<label>　　</label><input type="text" id="mylocation3" name="mylocation3" readonly style="background-color: #e2e2e2;">
		<input type="button" value="삭제"/><br/><br/>
		</div>
	<div id="Btn">
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</div>
	</form>
	
</div>
</body>
</html>