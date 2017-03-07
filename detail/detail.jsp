<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<%! String url1="0"; %>
<%!	String url2="0"; %>
<%!	String url3="0"; %>
<%!	String url4="0"; %>
<%!	String url5="0"; %>
<%!	String url6="0"; %>

<%
	request.setCharacterEncoding("utf-8");
	String sightnum=request.getParameter("sightnum");
	Connection conn=null;
	PreparedStatement pstmt=null;
	try{
	Class.forName("oracle.jdbc.OracleDriver");
	//out.println("创建驱动成功！");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:SEARCH","manager","123456");
	//out.println("连接数据库成功！");
	String sql="select CNNAME,ENNAME,DSCR,SCORE,ADDRESS,MAPURL,PICURL1,PICURL2,PICURL3,PICURL4,PICURL5 from SIGHT where SIGHTNUM=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,sightnum);
	ResultSet rs=pstmt.executeQuery();
	while(rs.next()){
		request.setAttribute("cnname",rs.getString("CNNAME"));
		request.setAttribute("enname",rs.getString("ENNAME"));
		request.setAttribute("dscr",rs.getString("DSCR"));
		request.setAttribute("score",rs.getString("SCORE"));
		request.setAttribute("address",rs.getString("ADDRESS"));
		request.setAttribute("mapurl",rs.getString("MAPURL"));
		request.setAttribute("picurl1",rs.getString("PICURL1"));
		request.setAttribute("picurl2",rs.getString("PICURL2"));
		request.setAttribute("picurl3",rs.getString("PICURL3"));
		request.setAttribute("picurl4",rs.getString("PICURL4"));
		request.setAttribute("picurl5",rs.getString("PICURL5")); 
		url1=rs.getString("MAPURL");
		url2=rs.getString("PICURL1");
		url3=rs.getString("PICURL2");
		url4=rs.getString("PICURL3");
		url5=rs.getString("PICURL4");
		url6=rs.getString("PICURL5");
	}
	}catch(Exception e){
		System.out.println("处理异常："+e);
	}
%>

<html>
	
	<head>
		<meta charset="utf-8">
		<title>detail of sight</title>
	</head>
	<style type="text/css">
		.cnname{
			font-size: 70px;
			color: white;
			height: 80px;

			position: relative;
			left: 70px;
			top: 50px;
		}
		.enname{
			font-size: 35px;
			color: white;
			height: 50px;

			position: relative;
			left: 110px;
			top: 50px;
		}
		.score{
			font-size: 50px;
			color:white;
			height: 80px;
			width: 350px;
			float: right;
			position: relative;
			left: -170px;
			top: -30px;
		}
		.dscr{
			background-color: rgba(40,40,122,0.7);
			font-size: 34px;
			color: #eeeeee;
			width: 900px;
			padding: 50px;
			position: relative;
			left: 150px;
			top: 80px;
			text-indent: 2em;
			min-height: 580px;
			border-radius: 30px;
			text-shadow: black 1px 1px;
		}
		.picpart{
			background-color: rgba(40,40,122,0.7);	
			padding: 10px;
			padding-top: 30px;
			padding-bottom: 30px; 
			position: absolute;
			left: 1190px;
			top: 235px;
			border-radius: 30px;
		}
		.mapAndAddress{
			padding: 10px;
			padding-top: 30px;
			padding-bottom: 30px; 
			text-align: center;
			position: relative;
			top: 280px;
		}
		.address{
			color: white;
			width: 450px;
			font-size: 20px;
		}
		.pics{ 
			position: relative;
			top: -350px;
			left: 58px;
			height: 250px; 
			width: 350px; 
			overflow-y: hidden; 
			overflow-x: auto; 
			white-space: nowrap; 
		}
		.pic{ 
			width: 350px; 
			height:230px; 
			border: 0.5px; 
			display: inline-block; 
			margin: 0.5ex; 
		}
	</style>
	<body style="background-image:url(background.jpg);no-repeat top center #000;background-attachment: fixed; background-size: cover;">
		<div>
			<div><a href="../homepage/homepage.jsp"><img src="back.png" style="height:60px;width:50px;position:relative;float:right;"></a></div>
			<div>			
			<div>
				<div class="cnname">
					${cnname}
				</div>
				<div class="enname">
					${enname}
				</div>
				<hr width=90% size=3 color=white style="filter:progid:DXImageTransform.Microsoft.Glow(color=white,strength=10);text-align: center;position: relative;top: 50px;left:-42px;">
				<div class="score">
					SCORE:${score}
				</div>
			</div>
			<div class="dscr">
				${dscr}
			</div>
			<div class="picpart">
				<div class="mapAndAddress">
					<div class="map">
					<%
						if(url1==null){
						}else{
							%>
							<img style="height:230px;width:350px;" src="${mapurl}"></img>
							<%
						}
					%>
					</div>
					<div style="height:20px;"></div>
					<div class="address">
						Address:${address}
					</div>
				</div>
				
				<div class="pics">
					<div class="pic">
						<%
							if(url2==null){
							}else{
								%>
								<img src="${picurl1}"></img>
								<%
							}
						%>
					</div>
					<div class="pic">
						<%
							if(url3==null){
							}else{
								%>
								<img src="${picurl2}"></img>
								<%
							}
						%>
					</div>
					<div class="pic">
						<%
							if(url4==null){
							}else{
								%>
								<img src="${picurl3}"></img>
								<%
							}
						%>
					</div>
					<div class="pic">
						<%
							if(url5==null){
							}else{
								%>
								<img src="${picurl4}"></img>
								<%
							}
						%>
					</div>
					<div class="pic">
						<%
							if(url6==null){
							}else{
								%>
								<img src="${picurl5}"></img>
								<%
							}
						%>
					</div>
				</div>
			</div>
			
		</div>
	</body>
</html>
