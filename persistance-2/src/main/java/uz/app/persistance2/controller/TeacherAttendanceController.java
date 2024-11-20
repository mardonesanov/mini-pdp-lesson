package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.persistance2.db.Datasource;
import uz.app.persistance2.entity.Student;
import uz.app.persistance2.entity.Attendance;

import jakarta.persistence.EntityManager;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/attendances")
public class TeacherAttendanceController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentIdParam = request.getParameter("studentId");
        String attendanceDateParam = request.getParameter("attendanceDate");
        String presentParam = request.getParameter("present");
        String teacherPhone = request.getParameter("teacherPhone");

        int studentId = Integer.parseInt(studentIdParam);
        LocalDate attendanceDate = LocalDate.parse(attendanceDateParam);
        boolean present = "true".equals(presentParam);

        EntityManager em = Datasource.createEntityManager();
        try {
            em.getTransaction().begin();

            Student student = em.find(Student.class, studentId);
            if (student != null) {
                Attendance attendance = em.createQuery("SELECT a FROM Attendance a WHERE a.student.id = :studentId AND a.attendanceDate = :attendanceDate", Attendance.class)
                        .setParameter("studentId", studentId)
                        .setParameter("attendanceDate", attendanceDate)
                        .getResultStream()
                        .findFirst()
                        .orElse(new Attendance());

                attendance.setStudent(student);
                attendance.setAttendanceDate(attendanceDate);
                attendance.setPresent(present);
                em.persist(attendance);
            }

            em.getTransaction().commit();
            response.sendRedirect("/views/teacher.jsp?phoneNumber=" + teacherPhone + "&successMessage=Davomat belgilandi");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.getWriter().println("<h3 style='color: red; text-align: center;'>Davomatni belgilashda xatolik yuz berdi. Qayta urinib ko'ring.</h3>");
        } finally {
            em.close();
        }
    }
}