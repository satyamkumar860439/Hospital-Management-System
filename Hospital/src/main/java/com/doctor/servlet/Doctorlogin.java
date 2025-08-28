 package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;
@WebServlet("/doctorLogin")

public class Doctorlogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String email = req.getParameter("email");
         String passward = req.getParameter("passward");  
         HttpSession session = req.getSession();
         DoctorDao dao=new DoctorDao(DBConnect.getConn());
         Doctor doctor= dao.login(email,passward);
         if(doctor!=null)
         {
         	session.setAttribute("doctObj",doctor);
             resp.sendRedirect("doctor/index.jsp");
         }
         else
         {
         	session.setAttribute("errorMsg","invalid email & password");
         	resp.sendRedirect("doctor-login.jsp");
         }

 }

	}
	

