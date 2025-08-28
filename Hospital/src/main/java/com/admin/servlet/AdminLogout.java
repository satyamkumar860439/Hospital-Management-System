package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Adminlogout")
public class AdminLogout extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // G
        if (session != null) {
            session.removeAttribute("adminobj");
            session.setAttribute("sucMsg", "Admin Logout Successfully");
        }
        resp.sendRedirect("admin-login.jsp"); 
    }
}

