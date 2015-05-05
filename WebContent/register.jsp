		<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src='<c:url value="jquery.validate.min.js"/>'></script>
<title>Insert title here</title>
<style>
body {
	background-image: url("or_jean.jpg");
}

.row {
	margin-top: 25px;
}

#registerform {
	height: 50%;
	width: 90%;
	margin-left: 20px;
	margin-bottom: 10px;
}

.topbox {
	position: relative;
	background-color:white;
	border-radius : 10px;
	top: 50px;
	width: 40%;
	height: 80%;
}
</style>

<script>
	$(function() {

		$('form')
				.validate(
						{
							rules : {
								first_name : {
									minlength : 3,
									maxlength : 20,
									required : true
								},
								last_name : {
									minlength : 3,
									maxlength : 20,
									required : true
								},
								email : {
									required : true,
								},
								password : {
									minlength : 6,
									required : true,
								},
								confirm : {
									minlength : 6,
									equalTo : "#password"
								},
							},
							submitHandler : function(form) {
								$
										.ajax({
											url : "insertregisdata.jsp",
											type : "POST",
											data : $(form).serializeArray(),
											success : function(data,
													textStatus, jqXHR) {
												$(form).hide();
												$("body")
														.html(
																"<h3 style='color:green'>Registration Successful</h3>");
											},
											error : function(jqXHR, textStatus,
													errorThrown) {
												//if fails     
											}
										});
							},
							highlight : function(element) {
								$(element).closest('.form-group').addClass(
										'has-error');
							},
							unhighlight : function(element) {
								$(element).closest('.form-group').removeClass(
										'has-error');
							},
							errorElement : 'span',
							errorClass : 'help-block',
							errorPlacement : function(error, element) {
								if (element.parent('.input-group').length) {
									error.insertAfter(element.parent());
								} else {
									error.insertAfter(element);
								}
							}
						});
	});
</script>
</head>
<body>
	<div class="container-fluid topbox">
		<form id="registerform">
			<div class="form-group row">
				<label for="first_name">First Name</label> <input
					class="form-control" id="first_name" name="first_name"
					placeholder="First Name" type="text">
			</div>
			<div class="form-group row">
				<label for="last_name">Last Name</label> <input class="form-control"
					id="last_name" name="last_name" placeholder="Last Name" type="text">
			</div>
			<div class="form-group row">
				<label for="email">E-mail</label> <input class="form-control"
					id="email" name="username" placeholder="E-mail" type="email">
				<p id="emailmsg"></p>
			</div>
			<div class="form-group row">
				<label for="password">Password</label> <input class="form-control"
					id="password" name="password" placeholder="Password"
					type="password">
			</div>
			<div class="form-group row">
				<label for="confirm">Confirm</label> <input class="form-control"
					id="confirm" name="confirm" placeholder="Confirm Password"
					type="password">
			</div>
			<div class="row">
				<br /> <input class="btn btn-warning btn-md" id="submit"
					type="submit" value="Sign Up">
			</div>
		</form>
	</div>
</body>
</html>