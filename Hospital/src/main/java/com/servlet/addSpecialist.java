package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBConnect;
@WebServlet("/addSpecialist")
public class addSpecialist extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String spaceName=req.getParameter("spaceName");
		SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
		boolean f= dao.addSpecialist(spaceName);
		HttpSession session=req.getSession();
		if(f)
		{
			session.setAttribute("succMsg", "SpecialistAdded");
			resp.sendRedirect("admin/index.jsp");
			
		}
		else {
			session.setAttribute("errorMsg", "some");
			resp.sendRedirect("admin-login.jsp");
		}
		
		
	}
	

}
