package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.entity.Appointment;
import com.dao.AppointmentDao;
import com.db.DBConnect;

@WebServlet("/add_appoint")
public class Appointment_user extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userid = Integer.parseInt(req.getParameter("userid"));
        String fullname = req.getParameter("fullname");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        String appoint_date = req.getParameter("appoint_date");
        String email = req.getParameter("email");
        String diseases = req.getParameter("diseases");
        String phno = req.getParameter("number");
        int doctor_id = Integer.parseInt(req.getParameter("doct"));
        String address = req.getParameter("address");

        Appointment ap = new Appointment (userid, fullname, gender, age, appoint_date, email, diseases, phno, doctor_id, address," Pending");

        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
        boolean success = dao.addAppointment(ap);

        HttpSession session = req.getSession();

        if (success) {
            session.setAttribute("sucMsg", "Appointment booked successfully.");
            resp.sendRedirect("user_appointment.jsp");
        } else {
            session.setAttribute("errorMsg", "Something went wrong. Try again.");
            resp.sendRedirect("user_appointment.jsp");
        }
    }
}
