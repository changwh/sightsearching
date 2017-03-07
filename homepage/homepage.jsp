<%@ page language="java" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Sight Searching Website</title>
		<script type="text/javascript">
			
		</script>
	</head>
	<style type="text/css">
		.keyword{
			border:1px solid rgba(51,51,51,.5);
			border-radius:20px;
			padding: 10px;
			font-size: 30px;
			line-height: 32px;
			width: 700px;
			font-family: 'Oleo Script', cursive;
			position:relative;
		}
		.searchButton{
			font-family: '微软雅黑';
			font-size: 30px;
			border:1px solid #000;
			padding:5px 5px;
			border:1px solid rgba(51,51,51,.5);
			-webkit-border-radius:10px;
			-moz-border-radius:10px;
			border-radius:20px;
			background-color: rgba(51,51,51,.5);
			
			-webkit-box-shadow: 2px 1px 1px #aaa;
			-moz-box-shadow: 2px 1px 1px #aaa;
			box-shadow: 2px 1px 1px #aaa;
			cursor:pointer;
			float: left;
			position: relative;
			left: 1006px;
			top:0px;
		}

		.searchButton:active{
			-webkit-box-shadow: 0px 0px 1px #aaa;
			-moz-box-shadow: 0px 0px 1px #aaa;
			box-shadow: 0px 0px 1px #aaa;
		}
		.searchButton:hover{
			background-color: rgba(0,0,172,0.6);
		}
		.main{
			text-align: center;
			position: fixed;
			top: 52%;
			left: 10.5%;
			width: 1400px;
			height: 120px;
		}
	</style>
	<body style="background-image:url(background.jpg);no-repeat top center #000;background-attachment: fixed; background-size: cover;">
		<div><img src="name.png" style="position:fixed;left:26%;top:15%;"></div>
		<div class="main">
			<form action="../resultOfSearching/resultOfSearching.jsp" method="post">
				<input type="text" name="keyword" class="keyword" style="font-family:'Times'">
				<input type="submit" value="Search" class="searchButton">
			</form>
		</div>
	</body>
</html>

