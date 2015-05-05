<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/budget", "root", "nannu");
	Statement st = con.createStatement();
	String loggeduser = (String) session.getAttribute("loggeduser");
	int transid = Integer.parseInt(request.getParameter("id"));
	st.executeUpdate("DELETE from mybudget where username='"
					+ loggeduser + "' AND id='"+transid+"'");
	response.sendRedirect("listtrans.jsp");
}
catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>
</body>
</html>