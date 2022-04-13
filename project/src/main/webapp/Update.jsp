
<%@ page import="job.connection.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>update</title>
<link href="job.css" rel="Stylesheet">
<style>

</style>



</head>
<body>
<div class="header">
	<ul>
 		 <li><a  href="index.html">Home</a></li>
 		 <li><a href="">Insert</a></li>
 		 <li><a class="active" href="">Update</a></li>
 		  <li><a href="">Delete</a></li>
  	 	 <li><a href="">Display</a></li>
	</ul>
</div>

<div>
	
	<%
	try {
		Connection con = DBConnection.initialiseDatabase();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from jobdetails");
	%>
	<table class="table-class" align="center" >
		<tr>
			<td>Enter Job Id :</td>
			<form method="get" action="Update.jsp">
				<td><select name="Id">
						<%
						while (rs.next()) {
						%>
						<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
						<%
						}
						%>
				</select></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="Show Details" onclick="hiding()"></td>
		</tr>
		</form>
	</table>

	<%
	} 
		catch (Exception e) {
		e.printStackTrace();
	}
	%>

</div>

<div class="content">

    <table align="center" class="table-class" style="margin-top:20px">

    <%
    	try{
   		 Connection con = DBConnection.initialiseDatabase();
         String Id=request.getParameter("Id");
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("select * from jobdetails where ( jobid= '"+Id+"');");
         ResultSetMetaData rsmd=rs.getMetaData();
         int columns=rsmd.getColumnCount();
        
         rs.next();
         %>
      
         <form method="get" action="UpdateDB.jsp">
         <tr><td><%=rsmd.getColumnName(1)%></td><td><input type="text" name="Id" value="<%=rs.getString(1)%>"></td></tr>
         <tr><td><%=rsmd.getColumnName(2)%></td><td><input type="text" name="Name" value="<%=rs.getString(2)%>" ></td></tr>
        <tr><td><%=rsmd.getColumnName(3)%></td><td><input type="text" name="Type" value="<%=rs.getString(3)%>"></td></tr>
        <tr><td><%=rsmd.getColumnName(4)%></td><td><input type="text" name="Vacancy" value="<%=rs.getString(4)%>"></td></tr>
        <tr><td><%=rsmd.getColumnName(5)%></td><td><input type="text" name="Description" value="<%=rs.getString(5)%>"></td></tr>
        <tr><td colspan="2" align="center" class="sub"><input type="submit" value="Update"></td></tr>
         </form>
    </table>
   
		<%
    	}
    		catch(Exception e){
    		e.printStackTrace();
    	}
	%>
</div>






<div class="footer">
       &#169; 2022.All Rights Reserved.
</div>
</body>
</html>


