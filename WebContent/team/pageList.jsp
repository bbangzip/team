<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "team.PageVO, team.CommunDAO, team.MemberVO" %>
<%@ page import = "java.util.List" %>
<%
	CommunDAO gd = new CommunDAO();
	
	int pNum = 1;
	int rSize = 3;	
	int tPage = 1;
	int pCnt = 5;
	int pStart = 1;
	int tRecord = 0;
	
	String requestPageNum = request.getParameter("num");
	if(requestPageNum==null){
		pNum=1;
	}else{
		pNum=Integer.parseInt(requestPageNum);
		
	}
	
	tRecord = gd.recordCnt((String)session.getAttribute("userId"));
	if(tRecord % rSize ==0){
		tPage = tRecord / rSize;
	}else{
		tPage = tRecord / rSize + 1;
	}
	
	if(pNum % pCnt == 0){
		pStart = (pNum / pCnt - 1)*pCnt + 1;
		
	}else{
		pStart = (pNum / pCnt)*pCnt +1;
	}

	List<PageVO> lst = gd.select(pNum, rSize, tPage, (String)session.getAttribute("userId") );
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
function delwin(num){
	location.href="pageDel.jsp?num="+num;
}
</script>
<style>
#list{margin-left:130px}
.button{margin-left:200px;}
#list ul, #list li{padding:5px; margin:1px;list-style-type:none}
#list li{float:left;}
#list ul{width:500px;height:120px}
.lbl1{width:68px;background-color:#BDBDBD}
.result1{width:158px;background-color:#FAE0D4}
.result2{width:407px;background-color:#FAE0D4}

#pList{position:absolute; left:200px}
#pList ul, #pList li{padding:5px; margin:1px; list-style-type:none;}
#pList ul{height:40px; }
#pList li{height:40px; line-height:40px; float:left; text-align:center;
			width:40px;}
#pList li:hover{background-color:yellow}
#pList a:link{text-decoration:none; color:black}
hr{width:500px; float:left;}
#a{list-style-type:none}
#pWriteBtn{position:absolute; left:550px; color: rgb(255,90,95)}
</style>
</head>
<body>
<label>방명록 리스트 : <%=pNum%></label><br/>
<label><a href="../index.jsp">홈</a></label>

<br/>
<div id="list">
<% for(int idx=0; idx<lst.size(); idx++){
		PageVO gv = lst.get(idx);
		%>
		<ul>
		<li class="lbl1"><label>글쓴이: </label></li><li class="result1">
		<%=gv.getUserId2() %></li>
		<li class="lbl1"><label>받는이: </label></li><li class="result1">
		<%=gv.getUserId1() %></li>
		<li class="lbl1"><label>날짜: </label></li><li class="result2">
		<%=gv.getWriteDate() %></li>
		<li class="lbl1"><label>글내용: </label></li><li class="result2">
		<%=gv.getText() %></li>
		</ul>
		<div class = "button">
		<input type = "button" value = "삭제" onClick="delwin(<%=gv.getNum()%>)">
		</div>
<hr/>
<%}%>

</div>


<ul id = "pList">
<%if(pStart>1){%>
	<li title="이전페이지 5"><a href="pageList.jsp?num=<%=pStart-pCnt%>">◀ ◀ </a></li>
	
	 <%}else{
	 	%>
	 	<li title="X">◀ ◀</li>
	 	
	 <%}
	 if(pNum>1){
	 %>
		<li title="이전페이지"><a href="pageList.jsp?num=<%=pNum-1%>">◀ </a></li>
	<%}else{%>
		<li title="X">◀</li>

	<%}
	for(int i=pStart; i<pStart+pCnt; i++){
		if(i==pNum){ %>
			<li style="border:3px solid red"><a href="pageList.jsp?num=<%=i%>"> <%=i%> </a></li>
		<%}else{%>
			<li><a href="pageList.jsp?num=<%=i%>"> <%=i%> </a></li>
			
		<%}
		
		if(i>=tPage){
			break;
		}
		
	}
	
	if(pNum==tPage){%>
		<li title="다음페이지">▶ </li>
		
	<%}else{%>
		<li title="다음페이지"><a href="pageList.jsp?num=<%=pNum+1%>">▶ </a></li>
		
	<%}%>
	<%if(pStart+pCnt>tPage){%>
		<li title="다음페이지5">▶▶ </li>
	<%}else{%>
		<li title="다음페이지5"><a href="pageList.jsp?num=<%=pStart+pCnt%>">▶▶ </a></li>

	<%}%>
	</ul><br/><br/>
	
<label id="pWriteBtn"><input type="button" value="쪽지쓰기" onClick="location.href='page.jsp'">
</label>
 

</body>
</html>