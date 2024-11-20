<%@ page import="jakarta.persistence.*" %>
<%@ page import="uz.app.persistance2.db.Datasource" %>
<%@ page import="uz.app.persistance2.entity.Student" %>
<%@ page import="uz.app.persistance2.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>O'quvchini Tahrirlash</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            background: linear-gradient(to right, #ffffff, #f0f0f0);
            color: #1b5e20;
        }
        form {
            background: rgba(255, 255, 255, 0.95);
            padding: 40px;
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            width: 500px;
            text-align: left;
        }
        input, select, button {
            padding: 15px;
            margin: 10px 0;
            width: 100%;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-family: 'Montserrat', sans-serif;
        }
        button {
            background-color: #2e7d32;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s ease;
        }
        button:hover {
            background-color: #1b5e20;
            transform: scale(1.05);
        }
        h2 {
            font-size: 2.5em;
            font-weight: 900;
            margin-bottom: 25px;
            color: #1b5e20;
        }
        label {
            font-size: 1.2em;
            font-weight: 600;
            color: #2e7d32;
        }
        .logo {
            margin-bottom: 20px;
        }
        .back-btn {
            background-color: #f44336;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<%
    String studentIdParam = request.getParameter("studentId");
    EntityManager em = Datasource.createEntityManager();
    Student student = null;
    List<Teacher> teachers = em.createQuery("SELECT t FROM Teacher t", Teacher.class).getResultList();

    if (studentIdParam != null) {
        try {
            int studentId = Integer.parseInt(studentIdParam);
            student = em.find(Student.class, studentId);
        } finally {
            em.close();
        }
    }
%>
<div class="logo">
    <img src="https://yt3.googleusercontent.com/5s99jnB2pYfLrgsYd8lp40BNwZyVdq74aVM8GO-FuBUL4jdmDi3M3dLDF3ScxZ2oJghGH5bdGA=s900-c-k-c0x00ffffff-no-rj" alt="Logo" width="100">
</div>
<h2>O'quvchini Tahrirlash</h2>
<form action="/lessons" method="post">
    <input type="hidden" name="studentId" value="<%= student != null ? student.getStudentId() : "" %>"/>

    <label for="firstName"><i class="fas fa-user"></i> Ism:</label>
    <input type="text" id="firstName" name="firstName" value="<%= student != null ? student.getFirstName() : "" %>" required/>

    <label for="lastName"><i class="fas fa-user"></i> Familiya:</label>
    <input type="text" id="lastName" name="lastName" value="<%= student != null ? student.getLastName() : "" %>" required/>

    <label for="phoneNumber"><i class="fas fa-phone"></i> Telefon raqami:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" value="<%= student != null ? student.getPhoneNumber() : "" %>" required/>

    <label for="groupName"><i class="fas fa-users"></i> Guruh:</label>
    <input type="text" id="groupName" name="groupName" value="<%= student != null ? student.getGroupName() : "" %>" required/>

    <label for="lessonDay"><i class="fas fa-calendar-day"></i> Dars kuni:</label>
    <input type="text" id="lessonDay" name="lessonDay" value="<%= student != null ? student.getLessonDay() : "" %>" required/>

    <label for="lessonTime"><i class="fas fa-clock"></i> Dars vaqti:</label>
    <input type="text" id="lessonTime" name="lessonTime" value="<%= student != null ? student.getLessonTime() : "" %>" required/>

    <label for="teacherId"><i class="fas fa-chalkboard-teacher"></i> Ustozni Tanlang:</label>
    <select id="teacherId" name="teacherId" required>
        <option value="">Mavjud ustozni tanlang</option>
        <%
            for (Teacher t : teachers) {
        %>
        <option value="<%= t.getTeacherId() %>" <%= (student != null && student.getTeacher() != null && t.getTeacherId() == student.getTeacher().getTeacherId()) ? "selected" : "" %>>
            <%= t.getName() %> (<%= t.getPhoneNumber() %>)
        </option>
        <%
            }
        %>
    </select>

    <button type="submit">Saqlash</button>
    <button type="button" class="back-btn" onclick="window.location.href='/views/signin.jsp'">Orqaga</button>
</form>
</body>
</html>
