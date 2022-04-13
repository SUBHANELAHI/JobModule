
<%@ page import="job.connection.*"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>update</title>
<link href="job.css" rel="Stylesheet">
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
<div class="content">
	<%
	try {
		Connection con = DBConnection.initialiseDatabase();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from jobdetails");
	%>
	<table class="table-class" align="center">
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
			<td colspan="2" align="center"><input type="submit" value="Show Details"></td>
			</form>
		</tr>
	</table>

	<%
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
</div>

<div class="footer">
       &#169; 2022.All Rights Reserved.
</div>
</body>
</html>


