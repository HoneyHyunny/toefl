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
String id=request.getParameter("id");
String pwd=request.getParameter("pwd"); 

Connection myconn=null;
PreparedStatement pst=null;
ResultSet rs=null;





try{
	Context fcontext=new InitialContext();
	DataSource ds=(DataSource)fcontext.lookup("java:comp/env/jdbc/toefl");
	myconn=ds.getConnection();
	String q1="select * from userinfo where id=? && pwd=?";
	pst=myconn.prepareStatement(q1);
	pst.setString(1, id);
	pst.setString(2, pwd);
	rs=pst.executeQuery();

	if(rs.next())
	{
		  if(id.equals(rs.getString("id")) && pwd.equals(rs.getString("pwd")))
		  {
			  	 	if(id.equals("admin"))
					{ 
						out.println("<script>alert('You re admin! welcome!');</script>");	
		   				session.setAttribute("id",id);
		   				out.println("<script>");
		   				out.println("location.href='admin_list.html'");
		   				out.println("</script>");
		   			}
			  	 	
			  	 	else 
			  	 	{
			  	 	
			  	 	session.setAttribute("id",id);
			   		out.println("<script>");
			  	 	out.println("location.href='userloginpage.jsp'");
			  	 	out.println("</script>");
			  	 	}
			  	 	
		  }
		
			
			  	 	
	 }  
	  else
	  {
			out.println("<script>alert('login failed! please check your correct id with password!');</script>"); 
			out.println("<script>");
			out.println("location.href='MainHome.html'");
			out.println("</script>");
	  }




} 



	
		catch(Exception e){
		 e.printStackTrace();
		}
	
	 finally{
		if(myconn !=null) try{myconn.close();} catch(SQLException err){}
	}
	 
		%>


</body>
</html>