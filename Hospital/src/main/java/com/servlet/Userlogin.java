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
@WebServlet("/user-login")

public class Userlogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
            String email = req.getParameter("email");
            String passward = req.getParameter("passward"); 
            HttpSession session = req.getSession();
            UserDao dao=new UserDao(DBConnect.getConn());
            User user=dao.login(email, passward);
            if(user!=null)
            {
            	session.setAttribute("userobj", user);
                resp.sendRedirect("index.jsp");
            }
            else
            {
            	session.setAttribute("errorMsg","invalid email & password");
            	resp.sendRedirect("user-login.jsp");
            }

    }
	
	}
