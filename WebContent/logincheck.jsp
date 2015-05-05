<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/budget", "root", "nannu");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("Select * from login");
			
			int flag= 0;
			while (rs.next()) {
				if (request.getParameter("username").equals(rs.getString(3))
						&& request.getParameter("password").equals(rs.getString(4))) {
					//redirecting to success page
					session.setAttribute( "loggeduser", rs.getString(3) );
					response.sendRedirect("index.jsp");
					flag=1;
				} 
			}
			if(flag==0){
				response.sendRedirect("home.jsp");
			}
		} catch (Exception e) {
			System.out.print(e);
			e.printStackTrace();
		}
	%>
</body>
</html>