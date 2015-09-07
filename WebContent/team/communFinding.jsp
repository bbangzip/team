<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import ="team.CommunDAO" %>
<%@ page import ="team.ZipVO" %>
<%@ page import ="team.ListVO" %>

<%@page import="java.util.ArrayList"%>
    <jsp:useBean id="member" class="team.ListVO" scope="page"/>
    <jsp:setProperty name="member" property="*"/>
<%
	request.setCharacterEncoding("UTF-8");
	CommunDAO cd = new CommunDAO();
	String gu  = request.getParameter("gu");
	String dong = (String)request.getParameter("dong");
	String userId=(String)session.getAttribute("userId");
	int cnt = cd.getLocal(dong);
	
	List<ListVO> lst = cd.getDesc(dong, 2);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/jquery.gmap.js"></script>
<style>
	body{padding:0px;margin:0px}
	ul, li{margin:0px; padding:0px; list-style-type:none; float:left}
	#main{width:1000px; height:1000px;background-color:yellow;margin-left:50%;
	left:-500px;position:absolute;}
	#Banner{width:100%;height:100px;background-color:red;position:absolute;}
	#Banner>h1{font-size:40px;text-align:center;line-height:100px}
	#inform{position:absolute;width:200px;height:100px;top:0px;left:850px;}
	#map{width:100%;height:400px;top:100px;position:absolute;}
	#goomap{width:96%;height:90%;margin:2% 2% 2% 2%}
	#localFind{width:100%;height:100px;top:500px;text-align:center;line-height:100px;position:absolute;}
	/**************************************************************************************/
	#searchbox{width:100%; height:100px; background-color:black; opacity: 0.5;position:absolute;}
		#scbox_main{width:800px; height:50px; background-color:white; position:relative; left:100px; top:30px }
		#scbox_main>div{float:left; margin:0px; padding:0px;}
/*지역찾기*/	#scbox_main>div{width:158px; height:49px; font-weight:bold;  text-align: center; line-height:50px; border:1px solid gray;position:relative}	
	#searchBtn{background-color: rgb(255,90,95); width:130px; height:50px; color:white;}
			#searchBtn:hover{background-color:white; color:rgb(255,90,95);}	
	/**************************************************************************************/
	#smallDesc{width:100%;height:400px;top:600px;text-align:right; position:absolute;}
	#descript{margin:50px 0px 0px 50px}
	.descstyle{background-color:yellow;width:200px;border:1px solid gray;text-align:center}
</style>
<script>

	$(function(){
		//지도 표시
		$('#goomap').gMap({
			address:"<%=dong%>",
			maptype:'ROADMAP',//종류= ROADMAP,HYBRID,SATELLITE,TERRAIN
			zoom: 16,
			markers:[{
				address:"<%=dong%>",
				html:"_address"
			}],
			controls:{
				panControl: false,
				zoomControl: true,
				mapTypeControl: true,
				scaleControl: true,
				streetViewControl: true,
				overViewMapControl: true
			}
		});
	});
	function myCommunMove(){
		<%
		if(session.getAttribute("loginCheck")!=null && session.getAttribute("loginCheck").equals("Y")){
		%>
			location.href="myCommun.jsp?dong=<%=dong%>&gu=<%=gu%>&id=<%=userId%>";		
		<%
		}else if(session.getAttribute("loginCheck")==null || session.getAttribute("loginCheck").equals("N")){
		%>
			location.href="login.jsp";
		<%}%>
		
	}
	function myCommunSet(){
		<%
		if(session.getAttribute("loginCheck")!=null && session.getAttribute("loginCheck").equals("Y")){
		%>	
		location.href='setMalocal.jsp?dong=<%=dong%>&id=<%=userId%>';			
		<%
		}else if(session.getAttribute("loginCheck")==null || session.getAttribute("loginCheck").equals("N")){
		%>	location.href="login.jsp";
		<%}%>
	}
	function readBoardGo(){
		<%
		if(session.getAttribute("loginCheck")!=null && session.getAttribute("loginCheck").equals("Y")){
		%>
			location.href='readBoard.jsp?subject=<%=member.getSubJect()%>&writeId=<%=member.getUserId()%>';			
		<%
		}else if(session.getAttribute("loginCheck")==null || session.getAttribute("loginCheck").equals("N")){
		%>
			location.href="login.jsp";
		<%}%>
	}
	
	
	
</script>
</head>
<body>
<div id="main">
	<div id="Banner">
		<h1>-COMMUN-</h1>
		<div id="inform">
			<%@ include file="loginView.jspf" %>
		</div>
	</div>
	<div id="map">
		<div id="goomap">
		</div>
	</div>
	<div id="localFind">
		<div id="searchbox">
		</div> <!-- 검은색으로 보이는 Bar부분 -->	
		<div id="scbox_main"> <!-- 실제 검색어창이 있는 부분 -->
			<div>지역찾기</div>
			<div>서울시</div>
			<div id="local1"><%=gu%> ▼</div>
			<div onClick="dropmenu2()"><%=dong%> ▼</div>
			<div id="searchBtn" onClick="location.href='communFinding.jsp?gu=<%=gu%>&dong=<%=dong%>">찾기</div>
		</div>	
	</div>
	<div id="smallDesc">
		<label style="font-size:30px"><%=dong %>　　　　　　　　</label>
		<label style="font-size:30px">COMMUN　　　　　</label>
		<input type="button" style="width:150px;height:40px" value="내 코뮨 설정" onClick="myCommunSet()"/>
		<input type="button" style="width:150px;height:40px" value="게시판 들어가기" onClick="myCommunMove()"/>
		<div id="descript">
			<ul>
				<li><label>지역회원:<%=cnt%>명</label></li></br>
				<li class="descstyle">머리글</li>
				<li class="descstyle" style="width:500px">최신글</li>
				<li class="descstyle">작성자</li></br>
				<%for(int i=0;i<lst.size();i++){ 
					member = lst.get(i);
				%>
					<li class="descstyle"><%=member.getHdName()%></li>
					<li class="descstyle" style="width:500px"><a href="javascript:readBoardGo()"><%=member.getSubJect()%></a></li>
					<li class="descstyle"><%=member.getUserId()%></li>
				<%} %>
			</ul>		
		</div>
	</div>
</div>
</body>
</html>