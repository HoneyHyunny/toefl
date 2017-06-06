<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.sql.*" %> 
 <%@ page import="javax.sql.*,javax.naming.*" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//회원가입 정보 저장하는 jsp로 db안에  저장하기 



request.setCharacterEncoding("euc-kr");
String name=request.getParameter("name");
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String phone=request.getParameter("phone");
String post1=request.getParameter("post1");
String post2=request.getParameter("post2");
String addr1=request.getParameter("addr1");
String addr2=request.getParameter("addr2");
String addr3=request.getParameter("addr3");




Connection myconn=null;
PreparedStatement pstmt=null;


try{
	Context fcontext=new InitialContext();
	DataSource ds=(DataSource)fcontext.lookup("java:comp/env/jdbc/toefl");
	myconn=ds.getConnection();
	pstmt=myconn.prepareStatement("Insert into userinfo values(?,?,?,?,?,?,?,?,?)");
	  pstmt.setString(1,name);
	  pstmt.setString(2,id);
	  pstmt.setString(3,pwd);
	  pstmt.setString(4,phone);
	  pstmt.setString(5,post1);
	  pstmt.setString(6,post2);
	  pstmt.setString(7,addr1);
	  pstmt.setString(8,addr2);
	  pstmt.setString(9,addr3);
	
	  pstmt.executeUpdate();
}

finally{if(myconn !=null) try{myconn.close(); response.sendRedirect("MainHome.html");}

catch(SQLException err){
}}


%>



</body>
</html>