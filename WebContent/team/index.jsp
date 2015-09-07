<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	String id = (String)session.getAttribute("userId");
	CommunDAO cd = new CommunDAO();	
	String firstSet= cd.getMalocal(id);
	StringTokenizer stt = new StringTokenizer(firstSet,"-"); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title here</title>
<link rel="stylesheet" type="text/css" href="css/commun.css" media="all"/>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.3.min.js"></script>
<script src="js/flux.js" type="text/javascript" charset="UTF-8"></script> <!--슬라이드용 JS파일 -->
<script>
	$(function(){
		
		window.mf = new flux.slider('#slide', {//배경으로 사용되는 Slide SHOW
			 autoplay: true,
			 pagination: false,
			 delay: 4000,
			 transitions: ['slide']
		});
	});
	/////////2015.09.04 12시 불필요 부분 삭제////////////////////////////
</script>
</head>
<!-- ------------------------------------------------------------------------------------ -->
<!-- ------------------------------------------------------------------------------------ -->	
<body id="indexBody">
<header id="headerbox">
	<div id="loginbox" style="z-index:3">
		<%@ include file="loginView.jspf" %>
		
	</div>
	<!-- ------------------------------------------------------------------------------------ -->	

	<h1 id="welcom">환영합니다!</h1>
	<div id="slide"> <!-- 배경화면 슬라이드에 사용되는 이미지가 들어간 박스 -->
		<img src="img/img1.jpg">
		<img src="img/img2.jpg">
		<img src="img/img3.jpg">
		<img src="img/img4.jpg">
		<img src="img/img5.jpg">
		<img src="img/img6.jpg">
	</div>

	<!-- ------------------------------------------------------------------------------------ -->	
	<div id="blackbar"> <!-- 검은색으로 보이는 Bar부분--></div>
	<div id="searchbox"><!-- 검색드롭 박스가 있는 창 -->
		<%@ include file="search.jsp" %>
	</div>
</header>
<!-- ------------------------------------------------------------------------------------ -->
<!-- 내지역정보가 로그인시 나타남-15.09.04 12시----------------------------------------------------------------------------------- -->
		<% if(session.getAttribute("loginCheck")!=null && session.getAttribute("loginCheck").equals("Y")){
		%>
		<%-- 	<div id="mylocalnews">
				<ul>
					<%
					while(stt.hasMoreElements()){
						
					%>
					<li><%=stt.nextToken() %></li>
					
					<%	
					}
					%>
				</ul>
			</div> --%>
		 <% }%>

<!--대학교 사진들 15.09.04.12시 ------------------------------------------------------------------------------------ -->
<section id="indexSection">
	<ul id="indexUl">
		<li><div><a href="view/communFinding.jsp?dong=안암동">고려대</a></div></li>
		<li><div><a href="view/communFinding.jsp?dong=신림동">서울대</a></div></li>
		<li><div><a href="view/communFinding.jsp?dong=흑석동">중앙대</a></div></li>
		<li><div><a href="view/communFinding.jsp?dong=행당동">한양대</a></div></li>
		<li><div><a href="view/communFinding.jsp?dong=화양동">건국대</a></div></li>
		<li><div><a href="view/communFinding.jsp?dong=이문동">한국외대</a></div></li>
	</ul>
</section>

<!-- 하단부의 회사의 정보가 들어간 부분--------------------------------------------------------------->
<footer id="indexFooter">
	<div id="company">
		<h3>FRESH SHARE FOOD CO. All Desige reserved by HERA.co</h3>
		<h5>Tel : 02 - 1234 - 5678 E-mail : help@fsfc.co.kr</h5>
	</div>
</footer>
</body>
</html>
