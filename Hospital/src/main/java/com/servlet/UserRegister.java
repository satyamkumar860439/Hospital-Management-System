package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;
@WebServlet("/user_register")

public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String fullName=req.getParameter("fullName");
			String email=req.getParameter("email");
			String passward=req.getParameter("passward");
			User u=new User(fullName,email,passward);
			UserDao dao = new UserDao( DBConnect.getConn());
			HttpSession session=req.getSession();
			boolean f=dao. registerUser(u);
			if(f)
			{
				session.setAttribute("sucMsg", "RegisterSuccessfull");
			resp.sendRedirect("signup.jsp");
			//	System.out.println("Register successfull");
			}
			else
			{
				session.setAttribute("errorMSg", "something wrong on server");
				resp.sendRedirect("signup.jsp");
			//	System.out.println("Somethin wentwrong server");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
	}
	

}
