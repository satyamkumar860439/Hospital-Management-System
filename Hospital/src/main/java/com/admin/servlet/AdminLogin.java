package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;

@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");  // changed "Password" to "password"
            HttpSession session = req.getSession();

            if ("satyam@gmail.com".equals(email) && "222".equals(password)) {
                session.setAttribute("adminobj", new User());
                resp.sendRedirect("admin/index.jsp");
            } else {
                session.setAttribute("errorMsg", "Invalid email or password");
                resp.sendRedirect("admin-login.jsp");
            }

        } catch (Exception e) {
            // You should log this using a logging framework in real-world apps
            e.printStackTrace();
        }
    }
}
