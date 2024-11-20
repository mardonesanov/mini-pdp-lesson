package uz.app.persistance2.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.persistance2.db.Datasource;
import uz.app.persistance2.entity.Student;
import uz.app.persistance2.entity.Teacher;

import jakarta.persistence.EntityManager;
import java.io.IOException;
import java.util.List;

@WebServlet("/signin")
public class SignInController extends HttpServlet {

    private static final String ADMIN_PHONE = "945191305";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phoneNumber = request.getParameter("phoneNumber");

        if (phoneNumber == null || phoneNumber.replaceAll("[^0-9]", "").length() != 9) {
            response.sendRedirect(request.getContextPath() + "/views/error.jsp");
            return;
        }

        EntityManager em = Datasource.createEntityManager();
        try {
            if (ADMIN_PHONE.equals(phoneNumber)) {
                response.sendRedirect(request.getContextPath() + "/views/lessons.jsp"); // Admin uchun lessons sahifasiga o'tish
                return;
            } else {
                List<Teacher> teachers = em.createQuery("SELECT t FROM Teacher t WHERE t.phoneNumber = :phoneNumber", Teacher.class)
                        .setParameter("phoneNumber", phoneNumber)
                        .getResultList();
                if (!teachers.isEmpty()) {
                    Teacher teacher = teachers.get(0);
                    request.setAttribute("teacher", teacher);
                    request.getRequestDispatcher("/views/teacher.jsp").forward(request, response);
                } else {
                    List<Student> students = em.createQuery("SELECT s FROM Student s WHERE s.phoneNumber = :phoneNumber", Student.class)
                            .setParameter("phoneNumber", phoneNumber)
                            .getResultList();
                    if (!students.isEmpty()) {
                        Student student = students.get(0);
                        request.setAttribute("student", student);
                        request.getRequestDispatcher("/views/student_info.jsp").forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/views/error.jsp");
                    }
                }
            }
        } finally {
            em.close();
        }
    }
}