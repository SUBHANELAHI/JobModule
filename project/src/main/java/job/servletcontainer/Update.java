package job.servletcontainer;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import job.connection.*;

@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Id = request.getParameter("Id");
		String Name = request.getParameter("Name");
		String Type = request.getParameter("Type");
		String Vacancy = request.getParameter("Vacancy");
		String Description = request.getParameter("Description");
		try {
		Connection con = DBConnection.initialiseDatabase();
		 PrintWriter out = response.getWriter();	
		PreparedStatement ps=con.prepareStatement("update jobdetails set jobid=?,jobname=?,jobtype=?,jobvacancy=?,jobdesc=? where jobid='"+Id+"'");

	    ps.setString(1, Id);
	    ps.setString(2, Name);
	    ps.setString(3, Type);
	    ps.setString(4, Vacancy);
	    ps.setString(5, Description);
	    ps.executeUpdate();
	    out.println("<script>window.alert(' Updated Successfully');</script>");
	    request.getRequestDispatcher("Update.jsp").forward(request, response);
	    out.println("<script>window.alert(' Updated Successfully');</script>");
	   
		}
		catch(Exception e){
			e.printStackTrace();
		}

	}

}
