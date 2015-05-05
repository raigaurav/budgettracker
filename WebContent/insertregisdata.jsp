<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String first_name=request.getParameter("first_name");
String last_name=request.getParameter("last_name");
String username=request.getParameter("username");
String password=request.getParameter("password");
        try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "nannu");
           Statement st=con.createStatement();
           int i=st.executeUpdate("insert into login(first_name,last_name,username,password) values('"+first_name+"','"+last_name+"','"+username+"','"+password+"')");
           response.sendRedirect("home.jsp");
        }
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
%>

</body>
</html>