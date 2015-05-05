<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
String type=request.getParameter("group1");
String date=request.getParameter("date");
String category=request.getParameter("category");
String username = (String)session.getAttribute("loggeduser");
int amount=Integer.parseInt(request.getParameter("amount"));
        try{
         Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/budget", "root", "nannu");
           Statement st=con.createStatement();
           int i=st.executeUpdate("insert into mybudget(type,date,category,amount,username) values('"+type+"','"+date+"','"+category+"','"+amount+"','"+username+"')");
        response.sendRedirect("index.jsp");
        }
        catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
        }
%>

</body>
</html>