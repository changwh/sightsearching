<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<div><a href="../homepage/homepage.jsp"><img src="back.png" style="height:60px;width:50px;position:relative;float:right;"></a></div>
<div>
	<div id="cityname">
	<hr width=70% size=3 color=white style="filter:progid:DXImageTransform.Microsoft.Glow(color=white,strength=10);text-align: center;position: relative;top: 112px;"> 
	</div>
	<div id="list" class="list"></div>
</div>



<script type="text/javascript">
	function addCityName(obj,cityname){
		var parent = document.getElementById(obj);
		var cityName=document.createElement("div");
		cityName.setAttribute("class","cityname");
		cityName.innerHTML=cityname;
		parent.appendChild(cityName);
	}
	function addElementDiv(obj,cnname,enname,score,sightnum) {
　　　　var parent = document.getElementById(obj);
　　　　//添加 div
　　　　var sight =document.createElement("div");
		//设置 div 属性，如 id
		sight.setAttribute("class", "sight");
		sight.setAttribute("onclick","window.open('../detail/detail.jsp?sightnum="+sightnum+"','_self')");

		var cname=document.createElement("div");
		cname.setAttribute("class","cname");
		cname.innerHTML=cnname;

		var ename=document.createElement("div");
		ename.setAttribute("class","ename");
		ename.innerHTML=enname;

		var sscore=document.createElement("div");
		sscore.setAttribute("class","score");
		sscore.innerHTML="Score："+score;

		var br = document.createElement("br");

		sight.appendChild(cname);
		sight.appendChild(ename);
		sight.appendChild(sscore);
　　　　parent.appendChild(sight);
		parent.appendChild(br);
　　}
<%
	request.setCharacterEncoding("utf-8");
	String keyword=(String)request.getParameter("keyword");
	keyword=keyword.toLowerCase();
	keyword=keyword.replaceAll(" ","");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	try{
	//String keyword=request.getParameter("keyword");
	Class.forName("oracle.jdbc.OracleDriver");
	//out.println("创建驱动成功！");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:SEARCH","manager","123456");
	//out.println("连接数据库成功！");
	
	String sql="select SIGHT.SIGHTNUM as SIGHTNUM, CITY.CNNAME as CITYNAME, SIGHT.CNNAME as CNNAME, SIGHT.ENNAME as SENNAME, SIGHT.SCORE as SCORE from CITY join SIGHT on CITY.CITYNUM=SIGHT.CITYNUM where CITY.CNNAME=? or CITY.ENNAME=? order by SIGHT.SCORE desc";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,keyword);
	pstmt.setString(2,keyword);
	ResultSet rs=pstmt.executeQuery();
	int i=0;
	while(rs.next()){
		request.setAttribute("cityname",rs.getString("CITYNAME"));
		request.setAttribute("cnname",rs.getString("CNNAME"));
		request.setAttribute("enname",rs.getString("SENNAME"));
		request.setAttribute("score",rs.getString("SCORE"));
		request.setAttribute("sightnum",rs.getString("SIGHTNUM"));
		if(i==0){
			%>
				addCityName("cityname","${cityname}");
			<%
			i++;
		}
%>
	    addElementDiv("list","${cnname}","${enname}","${score}","${sightnum}");

<%
	}
	}catch(Exception e){
		System.out.println("处理异常："+e);
	}
%>
</script>

	<head>
		<meta charset="utf-8">
		<title>result of searching</title>
		
	</head>
	<style type="text/css">
		.cityname{
			font-size: 70px;
			color: white;
			height: 100px;
			width: 500px;
			position: relative;
			left: 240px;
		}
		.list{
			color: white;
			position: relative;
			top:20px;
			left: 150px;
			width: 1100px;
		}
		.sight{
			height: 140px;
			position: relative;
			left: 200px;
			background-color: rgba(40,40,122,0.7);
			border-radius: 20px;
		}
		.sight:hover{
			background-color: rgba(40,40,172,0.6);
		}
		.cname{
			position: relative;
			left:80px;
			top:26px;
			font-size: 40px;
			position: relative;
			cursor:default;
		}
		.ename{
			position: relative;
			left:80px;
			top:26px;
			font-size: 20px;
			position: relative;
			cursor:default;
		}
		.score{
			font-size: 38px;
			float: right;
			position: relative;
			top: -42px;
			left: -100px;
			height: 45px;
			width: 200px;
			cursor:default;
		}
	</style>
	<body style="background-image:url(background.jpg);no-repeat top center #000;background-attachment: fixed; background-size: cover;">
	</body>
</html>
