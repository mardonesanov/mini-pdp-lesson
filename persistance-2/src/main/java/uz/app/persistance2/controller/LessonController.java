package uz.app.persistance2.controller;

import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uz.app.persistance2.db.Datasource;
import uz.app.persistance2.entity.Student;
import uz.app.persistance2.entity.Teacher;

import java.io.IOException;

@WebServlet("/lessons")
public class LessonController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String studentIdParam = request.getParameter("studentId");

        EntityManager em = Datasource.createEntityManager();

        try {
            if ("delete".equalsIgnoreCase(action) && studentIdParam != null) {
                int studentId = Integer.parseInt(studentIdParam);
                Student student = em.find(Student.class, studentId);

                if (student != null) {
                    em.getTransaction().begin();
                    em.remove(student);
                    em.getTransaction().commit();
                }

                response.sendRedirect(request.getContextPath() + "/views/lessons.jsp");
            } else if ("update".equalsIgnoreCase(action) && studentIdParam != null) {
                response.sendRedirect(request.getContextPath() + "/views/update.jsp?studentId=" + studentIdParam);
            }
        } finally {
            em.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phoneNumber = request.getParameter("phoneNumber");
        String groupName = request.getParameter("groupName");
        String lessonDay = request.getParameter("lessonDay");
        String lessonTime = request.getParameter("lessonTime");
        String teacherIdParam = request.getParameter("teacherId");
        String studentIdParam = request.getParameter("studentId");

        if (!phoneNumber.matches("\\d{9}")) {
            response.sendRedirect(request.getContextPath() + "/views/error.jsp");
            return;
        }

        EntityManager em = Datasource.createEntityManager();
        try {
            em.getTransaction().begin();

            if (studentIdParam != null) {
                int studentId = Integer.parseInt(studentIdParam);
                Student student = em.find(Student.class, studentId);

                if (student != null) {
                    student.setFirstName(firstName);
                    student.setLastName(lastName);
                    student.setPhoneNumber(phoneNumber);
                    student.setGroupName(groupName);
                    student.setLessonDay(lessonDay);
                    student.setLessonTime(lessonTime);

                    if (teacherIdParam != null) {
                        int teacherId = Integer.parseInt(teacherIdParam);
                        Teacher teacher = em.find(Teacher.class, teacherId);
                        student.setTeacher(teacher);
                    }
                }
            } else {
                int teacherId = Integer.parseInt(teacherIdParam);
                Teacher teacher = em.find(Teacher.class, teacherId);

                Student newStudent = new Student();
                newStudent.setFirstName(firstName);
                newStudent.setLastName(lastName);
                newStudent.setPhoneNumber(phoneNumber);
                newStudent.setGroupName(groupName);
                newStudent.setLessonDay(lessonDay);
                newStudent.setLessonTime(lessonTime);
                newStudent.setTeacher(teacher);
                em.persist(newStudent);
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
