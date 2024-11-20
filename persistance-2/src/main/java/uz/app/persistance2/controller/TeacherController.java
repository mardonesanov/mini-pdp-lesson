package uz.app.persistance2.controller;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.persistance2.db.Datasource;
import uz.app.persistance2.entity.Teacher;

import java.io.IOException;
import java.util.List;

@WebServlet("/teachers")
public class TeacherController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String teacherIdParam = request.getParameter("teacherId");

        EntityManager em = Datasource.createEntityManager();

        try {
            if ("delete".equalsIgnoreCase(action) && teacherIdParam != null) {
                int teacherId = Integer.parseInt(teacherIdParam);
                Teacher teacher = em.find(Teacher.class, teacherId);

                if (teacher != null) {
                    em.getTransaction().begin();
                    em.remove(teacher);
                    em.getTransaction().commit();
                }

                response.sendRedirect(request.getContextPath() + "/views/lessons.jsp");
            } else if ("update".equalsIgnoreCase(action) && teacherIdParam != null) {
                response.sendRedirect(request.getContextPath() + "/views/update_teacher.jsp?teacherId=" + teacherIdParam);
            } else {
                List<Teacher> teachers = em.createQuery("SELECT t FROM Teacher t", Teacher.class).getResultList();
                request.setAttribute("teachers", teachers);
                request.getRequestDispatcher("/views/update_teacher.jsp").forward(request, response);
            }
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String teacherIdParam = request.getParameter("teacherId");
        String name = request.getParameter("name");
        String phoneNumber = request.getParameter("phoneNumber");

        EntityManager em = Datasource.createEntityManager();
        try {
            em.getTransaction().begin();

            if (teacherIdParam != null && !teacherIdParam.isEmpty()) {
                int teacherId = Integer.parseInt(teacherIdParam);
                Teacher teacher = em.find(Teacher.class, teacherId);

                if (teacher != null) {
                    teacher.setName(name);
                    teacher.setPhoneNumber(phoneNumber);
                }
            } else {
                Teacher newTeacher = new Teacher();
                newTeacher.setName(name);
                newTeacher.setPhoneNumber(phoneNumber);
                em.persist(newTeacher);
            }

            em.getTransaction().commit();
            response.sendRedirect(request.getContextPath() + "/views/lessons.jsp");
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            response.getWriter().println("<h3 style='color: red; text-align: center;'>Xatolik yuz berdi. Qayta urinib ko'ring.</h3>");
        } finally {
            em.close();
        }
    }
}
