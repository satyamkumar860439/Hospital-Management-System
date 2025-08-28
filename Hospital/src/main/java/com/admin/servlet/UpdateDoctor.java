package com.admin.servlet;

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

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String specialist = req.getParameter("specialist");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String passward = req.getParameter("passward"); 
            int id = Integer.parseInt(req.getParameter("id"));

           
            Doctor d = new Doctor(id, fullName, dob, qualification, specialist, email, mobno, passward);
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.Updatedoctor(d)) {
                session.setAttribute("sucMsg", "Doctor updated successfully.");
                resp.sendRedirect("admin/view_doctor.jsp");

            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server.");
                resp.sendRedirect("admin/view_doctor.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
 
        }
    }
}
