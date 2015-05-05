<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="Chart.js"></script>
<title>My budget</title>
<style type="text/css">
body {
	background-image: url("light.png");
}

#transbuttons {
	position: relative;
	top: 100px;
	left: 200px;
}

#spending {
	margin-top: 20px;
	margin-left: 60px;
	font-family: Ubuntu;
	font-size: 45px;
}

#spending h6 {
	font-size: 20px;
}

#log {
	font-family: Ubuntu;
	font-size: 35px;
	float: right;
	margin-right: 30px;
}

#canvas-holder {
	width: 30%;
}
</style>


</head>
<body>
	<%
		if (session.getAttribute("loggeduser").equals("")) {
			response.sendRedirect("home.jsp");
		}
		int income = 0;
		int expense = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/budget", "root", "nannu");
			Statement st = con.createStatement();
			Statement st1 = con.createStatement();
			String loggeduser = (String) session.getAttribute("loggeduser");
			ResultSet rs1 = st
					.executeQuery("Select sum(amount) from mybudget where type='Expense' AND username='"
							+ loggeduser + "'");
			rs1.next();
			expense = rs1.getInt(1);
			ResultSet rs2 = st1
					.executeQuery("Select sum(amount) from mybudget where type='Income' AND username='"
							+ loggeduser + "'");

			rs2.next();
			income = rs2.getInt(1);

		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	%>
	<div id="log">
		<h5><%=session.getAttribute("loggeduser")%></h5>
		<a href="home.jsp"><button class="btn btn-warning">Log
				out</button></a>
	</div>
	<div id="transbuttons">
		<div class="row">
			<a href="newtransaction.jsp"><button class="btn btn-warning">Add
					transaction</button></a> <a href="listtrans.jsp"><button
					class="btn btn-success">Previous Transactions</button></a>

		</div>
		<div class="row">
			<div id="canvas-holder" class="col-lg-5">
				<canvas id="chart-area" width="500" height="500" />
			</div>
			<div id="spending" class="col-lg-7">

				<h6>Income</h6>
				<p>
					Rs
					<%=income%></p>
				<h6>Expense</h6>
				<p>
					Rs
					<%=expense%></p>
				<hr>
				<h6>Balance</h6>
				<p>
					Rs
					<%=income - expense%></p>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var doughnutData = [ {
			value :
	<%=expense%>
		,
			color : "#F7464A",
			highlight : "#FF5A5E",
			label : "Expense"
		}, {
			value :
	<%=income - expense%>
		,
			color : "#46BFBD",
			highlight : "#5AD3D1",
			label : "Balance"
		}, {
			value :
	<%=income%>
		,
			color : "#FDB45C",
			highlight : "#FFC870",
			label : "Income"
		}, ];

		window.onload = function() {
			var ctx = document.getElementById("chart-area").getContext("2d");
			window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {
				responsive : true
			});
		};
	</script>
</body>
</html>