<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.persistence.*" %>
<%@ page import="uz.app.persistance2.db.Datasource" %>
<%@ page import="uz.app.persistance2.entity.Student" %>
<%@ page import="uz.app.persistance2.entity.Teacher" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lessons and Teachers</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700;900&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            position: relative;
            color: #333;
            text-align: center;
            padding: 20px;
        }
        .background-image {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://cdn.prod.website-files.com/62361b0ee9fbf8a744598959/63fa07a8e05459fee66edf83_Cover%20vaqtinchalik.svg') no-repeat center center/cover;
            filter: blur(10px);
            z-index: -1;
        }
        .container {
            margin-top: 20px;
        }
        button {
            padding: 10px 20px;
            margin: 10px;
            cursor: pointer;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.3s;
        }
        button:hover {
            background-color: #388e3c;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(56, 142, 60, 0.4);
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 90%;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }
        table, th, td {
            border: 1px solid #4caf50;
        }
        th, td {
            padding: 20px;
            text-align: center;
            background: rgba(255, 255, 255, 0.9);
            transition: background 0.3s, transform 0.3s;
            font-size: 1.2em;
            font-weight: 700;
        }
        th {
            background-color: #4caf50;
            color: white;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        td:hover {
            background: rgba(76, 175, 80, 0.3);
            transform: scale(1.05);
        }
        h2 {
            color: #185a9d;
            margin-top: 30px;
            letter-spacing: 1px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.2em;
            font-weight: 900;
        }
        .icon {
            margin-right: 10px;
        }
        .logo {
            width: 200px;
            height: auto;
            margin-bottom: 20px;
        }
    </style>
</head>
<div class="container" style="position: absolute; top: 20px; right: 20px;">
    <button onclick="location.href='/views/more.jsp'"><i class="fas fa-info-circle"></i> Biz haqimizda</button>
</div>
<div class="container">
</div>
<img src="https://cdn.prod.website-files.com/62361b0ee9fbf8a744598959/63fa07a8e05459fee66edf83_Cover%20vaqtinchalik.svg" alt="Logo" class="logo">
<h2><i class="fas fa-user-graduate icon"></i>O'quvchilar Ro'yxati</h2>
<div class="container">
    <button onclick="location.href='/views/signin.jsp'"><i class="fas fa-arrow-left icon"></i>Orqaga</button>
    <button onclick="location.href='add_lesson.jsp'"><i class="fas fa-user-plus icon"></i>O'quvchi qo'shish</button>
    <button onclick="location.href='add_teacher.jsp'"><i class="fas fa-chalkboard-teacher icon"></i>Ustoz qo'shish</button>
</div>

<%
    EntityManager em = Datasource.createEntityManager();

    try {
        List<Student> students = em.createQuery("SELECT s FROM Student s", Student.class).getResultList();
%>
<table>
    <tr>
        <th><i class="fas fa-user icon"></i> Ism</th>
        <th><i class="fas fa-user-tag icon"></i> Familiya</th>
        <th><i class="fas fa-phone icon"></i> Telefon raqami</th>
        <th><i class="fas fa-users icon"></i> Guruh</th>
        <th><i class="fas fa-calendar-day icon"></i> Dars kuni</th>
        <th><i class="fas fa-clock icon"></i> Dars vaqti</th>
        <th><i class="fas fa-chalkboard-teacher icon"></i> Ustoz Ismi</th>
        <th><i class="fas fa-phone-square icon"></i> Ustoz Telefon Raqami</th>
        <th><i class="fas fa-tools icon"></i> Amallar</th>
    </tr>
    <%
        for (Student student : students) {
            Teacher teacher = student.getTeacher();
    %>
    <tr>
        <td><%= student.getFirstName() %></td>
        <td><%= student.getLastName() %></td>
        <td><%= student.getPhoneNumber() %></td>
        <td><%= student.getGroupName() %></td>
        <td><%= student.getLessonDay() %></td>
        <td><%= student.getLessonTime() %></td>
        <td><%= teacher != null ? teacher.getName() : "Ustoz mavjud emas" %></td>
        <td><%= teacher != null ? teacher.getPhoneNumber() : "Noma'lum" %></td>
        <td>
            <button onclick="location.href='/lessons?action=update&studentId=<%= student.getStudentId() %>'"><i class="fas fa-edit icon"></i>Tahrirlash</button>
            <button onclick="location.href='/lessons?action=delete&studentId=<%= student.getStudentId() %>'"><i class="fas fa-trash icon"></i>O'chirish</button>
        </td>
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

<h2><i class="fas fa-chalkboard-teacher icon"></i>Ustozlar Ro'yxati</h2>
<%
    em = Datasource.createEntityManager();

    try {
        List<Teacher> teachers = em.createQuery("SELECT t FROM Teacher t", Teacher.class).getResultList();
%>
<table>
    <tr>
        <th><i class="fas fa-user icon"></i> Ism</th>
        <th><i class="fas fa-phone icon"></i> Telefon raqami</th>
        <th><i class="fas fa-user-friends icon"></i> O'quvchilar soni</th>
        <th><i class="fas fa-tools icon"></i> Amallar</th>
    </tr>
    <%
        for (Teacher teacher : teachers) {
    %>
    <tr>
        <td><%= teacher.getName() %></td>
        <td><%= teacher.getPhoneNumber() %></td>
        <td><%= teacher.getStudents() != null ? teacher.getStudents().size() : 0 %></td>
        <td>
            <button onclick="location.href='/teachers?action=update&teacherId=<%= teacher.getTeacherId() %>'"><i class="fas fa-edit icon"></i>Tahrirlash</button>
            <button onclick="location.href='/teachers?action=delete&teacherId=<%= teacher.getTeacherId() %>'"><i class="fas fa-trash icon"></i>O'chirish</button>
        </td>
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
</body>
</html>
