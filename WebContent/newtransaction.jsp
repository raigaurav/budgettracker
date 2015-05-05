<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<title>Add Transaction</title>
<style>
body {
	background-image: url("light.png");
}

#transdetails {
	position: relative;
	left: 100px;
	top: 50px;
	width: 80%;
	height: 600px; border-radius : 10px;
	background-color: white;
	border-radius: 10px;
}

#myform {
	position: relative;
	width: 80%;
	left: 50px;
	top: 30px;
	width: 80%;
	left: 50px;
	top: 30px;
	bottom: 30px;
}

h5, h6 {
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div id="transdetails">
			<form id="myform" action="inserttrans.jsp" method="get">
				<h2>New Transaction</h2>

				<h3>
					<i>Transaction Details</i>
				</h3>
				<br> <label>Type</label>
				<div class="row">
					<div class="col-lg-2">
						<label>Expense</label> <input class="form-control" type="radio"
							name="group1" value="Expense">
					</div>
					<div class="col-lg-2">
						<label>Income</label> <input class="form-control" type="radio"
							name="group1" value="Income">
					</div>
				</div>
				<div class="row">
					<label>Date</label><br> <input class="form-control"
						type="date" id="datePicker" name="date"><br> <label>Category</label><br>
					<input class="form-control" type="text" name="category"><br>
					<label>Amount</label><br> <input class="form-control"
						type="text" name="amount"> <br> <input
						class="btn btn-danger" type="submit" value="Save">
				</div>

			</form>
		</div>
	</div>
	<script>
		var date = new Date();

		var day = date.getDate();
		var month = date.getMonth() + 1;
		var year = date.getFullYear();

		if (month < 10)
			month = "0" + month;
		if (day < 10)
			day = "0" + day;

		var today = year + "-" + month + "-" + day;
		document.getElementById("datePicker").value = today;
	</script>
</body>
</html>