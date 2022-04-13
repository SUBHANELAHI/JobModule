<%@ page import="job.connection.*"%>
<%@ page import="java.sql.*"%>
<%
	try{
    String Id=request.getParameter("Id");
    String Name=request.getParameter("Name");
    String Type=request.getParameter("Type");
    String Vacancy=request.getParameter("Vacancy");
    String Description=request.getParameter("Description");
 
    
    Connection con = DBConnection.initialiseDatabase();
    PreparedStatement ps=con.prepareStatement("update jobdetails set jobid=?,jobname=?,jobtype=?,jobvacancy=?,jobdesc=? where jobid='"+Id+"'");

    ps.setString(1, Id);
    ps.setString(2, Name);
    ps.setString(3, Type);
    ps.setString(4, Vacancy);
    ps.setString(5, Description);
    ps.executeUpdate();
	
    
%>

<script>window.alert("Updated Successfully"); window.location.assign("Vieww.jsp");</script>
<%
    	}
    		catch(Exception e){
    		e.printStackTrace();
    	}
	%>