<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>  
 <%@ page import="javax.sql.*,javax.naming.*" %> 
<!DOCTYPE html>
<html>
<head>
<style>
	tr{background:orange;}
	a:hover{text-decoration:none;color:white;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member List</title>
</head>
<body>

<h2>회원정보</h2>
<table border=1 width=400>
<tr>
<td>이름</td><td>아이디</td></tr>
<%
Connection myconn=null;
PreparedStatement pst =null;
ResultSet rs=null;
try{
	Context fcontext =new InitialContext();
	DataSource ds=(DataSource)fcontext.lookup("java:comp/env/jdbc/toefl");
	myconn=ds.getConnection();
	String q1="select * from userinfo";
	pst=myconn.prepareStatement(q1);
	rs=pst.executeQuery();
	while(rs.next())
	{
	%>
	<tr><td><%=rs.getString("name") %></td>
	<td><a href="Member_List2.jsp?id=<%=rs.getString("id") %>"><%=rs.getString("id") %></a></td></tr>
	<%
	}
}
finally{
	if(pst!=null) try{pst.close();} catch(SQLException err) {err.printStackTrace();}
	if(myconn!=null) try{myconn.close();} catch(SQLException err) {err.printStackTrace();}
}

%>
</body>
</html>