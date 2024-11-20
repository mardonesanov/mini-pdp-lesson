<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.persistence.*" %>
<%@ page import="uz.app.persistance2.db.Datasource" %>
<%@ page import="uz.app.persistance2.entity.Student" %>
<%@ page import="uz.app.persistance2.entity.Teacher" %>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard (teacher.jsp)</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&family=Montserrat:wght@400;500;700&display=swap">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background: url('https://cdn.prod.website-files.com/62361b0ee9fbf8a744598959/63fa07a8e05459fee66edf83_Cover%20vaqtinchalik.svg') no-repeat center center fixed;
            background-size: cover;
            backdrop-filter: blur(4px);
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            width: 90%;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            overflow: hidden;
        }
        h2 {
            color: #28a745;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
        }
        .logo {
            text-align: center;
            margin-bottom: 20px;
        }
        .logo img {
            max-width: 150px;
            border-radius: 10%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            font-size: 0.9em;
        }
        th, td {
            padding: 8px;
            text-align: center;
            border-bottom: 1px solid #f1f1f1;
            font-weight: 500;
        }
        th {
            background-color: #28a745;
            color: white;
            font-weight: 600;
        }
        .attendance-icon {
            cursor: pointer;
            font-size: 1.8em;
            width: 55px;
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            transition: transform 0.3s, color 0.3s, box-shadow 0.3s;
            border: none;
        }
        .attendance-icon.absent {
            background-color: #dc3545;
            color: white;
        }
        .attendance-icon.present {
            background-color: #28a745;
            color: white;
        }
        .attendance-icon:hover {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .back-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .back-button:hover {
            background-color: #218838;
        }
    </style>
    <script>
        function toggleAttendance(button) {
            const form = button.closest('form');
            const isPresent = button.classList.contains('present');

            if (isPresent) {
                button.classList.remove('present');
                button.classList.add('absent');
                form.querySelector('input[name="present"]').value = 'false';
                form.submit();
            } else {
                button.classList.remove('absent');
                button.classList.add('present');
                form.querySelector('input[name="present"]').value = 'true';
                form.submit();
            }
        }
    </script>
</head>
<body>
<div class="container">
    <div class="logo">
        <img src="https://yt3.googleusercontent.com/5s99jnB2pYfLrgsYd8lp40BNwZyVdq74aVM8GO-FuBUL4jdmDi3M3dLDF3ScxZ2oJghGH5bdGA=s900-c-k-c0x00ffffff-no-rj" alt="Logo">
    </div>
    <h2>Teacher Dashboard</h2>
    <a href="/views/signin.jsp" class="back-button">Orqaga qaytish</a>
    <%
        String teacherPhone = request.getParameter("phoneNumber");
        EntityManager em = Datasource.createEntityManager();
        try {
            Teacher teacher = em.createQuery("SELECT t FROM Teacher t WHERE t.phoneNumber = :phoneNumber", Teacher.class)
                    .setParameter("phoneNumber", teacherPhone)
                    .getSingleResult();
            List<Student> students = teacher.getStudents();
    %>
    <table>
        <tr>
            <th class="icon-header"><i class="fas fa-user"></i> <span>Ism</span></th>
            <th class="icon-header"><i class="fas fa-user-tag"></i> <span>Familiya</span></th>
            <th class="icon-header"><i class="fas fa-phone"></i> <span>Telefon raqami</span></th>
            <th class="icon-header"><i class="fas fa-users"></i> <span>Guruh</span></th>
            <%
                LocalDate startDate = LocalDate.now();
                for (int i = 0; i < 12; i++) {
                    LocalDate attendanceDate = startDate.plusDays((i / 3) * 7 + (i % 3) * 2);
            %>
            <th class="icon-header"><i class="fas fa-clock"></i> <%= attendanceDate %></th>
            <%
                }
            %>
        </tr>
        <%
            for (Student student : students) {
        %>
        <tr>
            <td><%= student.getFirstName() %></td>
            <td><%= student.getLastName() %></td>
            <td><%= student.getPhoneNumber() %></td>
            <td><%= student.getGroupName() %></td>
            <%
                for (int i = 0; i < 12; i++) {
                    LocalDate attendanceDate = startDate.plusDays((i / 3) * 7 + (i % 3) * 2);
                    boolean isPresent = em.createQuery("SELECT COUNT(a) FROM Attendance a WHERE a.student.id = :studentId AND a.attendanceDate = :attendanceDate AND a.present = true", Long.class)
                            .setParameter("studentId", student.getStudentId())
                            .setParameter("attendanceDate", attendanceDate)
                            .getSingleResult() > 0;
            %>
            <td>
                <form action="/attendances" method="post" style="display: inline;">
                    <input type="hidden" name="studentId" value="<%= student.getStudentId() %>" />
                    <input type="hidden" name="attendanceDate" value="<%= attendanceDate %>" />
                    <input type="hidden" name="teacherPhone" value="<%= teacherPhone %>" />
                    <input type="hidden" name="present" value="<%= isPresent ? "true" : "false" %>" />
                    <button type="button" onclick="toggleAttendance(this)" class="attendance-icon <%= isPresent ? "present" : "absent" %>"></button>
                </form>
            </td>
            <%
                }
            %>
        </tr>
        <%
            }
        %>
    </table>
    <%
        } finally {
            em.close();
        }
    %>
</div>
</body>
</html>
