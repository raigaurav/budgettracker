<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src='<c:url value="jquery-2.1.1.min.js"/>'></script>
<script src="Chart.js"></script>
<title>Transactions</title>
<style type="text/css">
body {
	background-image: url("light.png");
}

#history {
	position: relative;
	margin-left: 200px;
	top: 70px;
	font-family: Ubuntu;
	font-size: 20px;
}

h1 b {
	margin-left: 40px;
}

#canvas-holder {
	width: 30%;
	float: right;
	margin-right: 180px;
}
</style>

<script>
	$(function() {
		$(".delbtn").hide();

		$("#del").click(function() {
			$(".delbtn").show();
		});
	});
	function getRandomColor() {
		var letters = '0123456789ABCDEF'.split('');
		var color = '#';
		for (var i = 0; i < 6; i++) {
			color += letters[Math.floor(Math.random() * 16)];
		}
		return color;
	}
</script>

</head>
<body>
	<h1>
		<b>Budget Tracker</b> <a href="index.jsp"><button
				class="btn btn-warning">Home</button></a>
	</h1>

	<div id="history">

		<h2>
			<b>Transactions</b>
			<button class="btn btn-success" id="del">Remove Transactions</button>
			<br>
		</h2>


		<div id="canvas-holder" class="col-lg-5">
			<h4>Expense Share</h4>
			<canvas id="chart-area" width="500" height="500" />

		</div>
		<%
			Vector<Integer> amounts = new Vector<Integer>();
			Vector<String> cat = new Vector<String>();
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/budget", "root", "nannu");
				Statement st = con.createStatement();
				String loggeduser = (String) session.getAttribute("loggeduser");
				ResultSet rs = st
						.executeQuery("Select * from mybudget where username='"
								+ loggeduser + "' ORDER BY date DESC");
				String sign;
				
				while (rs.next()) {
					
					
					
					if (rs.getString(2).equals("Income"))
						sign = "+";
					else
					{
						sign = "-";
						amounts.add(rs.getInt(5));
						cat.add(rs.getString(4));
					}
		%>
		<p style="color: green"><%=rs.getString(4)%></p>
		<p>
			<%=sign%>
			Rs
			<%=rs.getInt(5)%></p>

		<p>
			Date:
			<%=rs.getDate(3)%></p>
		<a href="deltrans.jsp?id=<%=rs.getInt(1)%>"><button
				class="delbtn btn btn-danger">Delete</button></a> <br> <br>
		<%
			}
			} catch (Exception e) {
				System.out.print(e);
				e.printStackTrace();
			}
		%>

	</div>


	<script>

	/*Code for adding dynamic pie charts*/

		var pieData = [ {
			value : 0,
			color : getRandomColor(),
			highlight : "#FF5A5E",
			label : ""
		}];

		window.onload = function() {

			var ctx = document.getElementById("chart-area").getContext("2d");
			myPie = new Chart(ctx).Pie(pieData, {
				responsive : true,
			});
			window.myPie = myPie;
	<%for(int i=0;i<amounts.size();i++)
			 {%>
		myPie.segments[<%=i%>].value =<%=amounts.get(i)%>;
		myPie.segments[<%=i%>].label = "<%=cat.get(i)%>";
		myPie.addData({
		    value: 0,
		    color: getRandomColor(),
		    highlight: getRandomColor(),
		    label: ""
		});
	<%}%>
		window.myPie.update();
		};
	</script>
</body>
</html>