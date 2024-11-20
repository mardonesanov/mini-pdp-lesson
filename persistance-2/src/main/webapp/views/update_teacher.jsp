<%@ page import="jakarta.persistence.*" %>
<%@ page import="uz.app.persistance2.db.Datasource" %>
<%@ page import="uz.app.persistance2.entity.Teacher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ustozni Tahrirlash</title>
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
        input, button {
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
        .back-btn {
            background-color: #f44336;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<%
    String teacherIdParam = request.getParameter("teacherId");
    if (teacherIdParam != null) {
        EntityManager em = Datasource.createEntityManager();
        Teacher teacher = null;
        try {
            int teacherId = Integer.parseInt(teacherIdParam);
            teacher = em.find(Teacher.class, teacherId);
        } finally {
            em.close();
        }

        if (teacher != null) {
%>
<div class="logo">
    <img src="https://yt3.googleusercontent.com/5s99jnB2pYfLrgsYd8lp40BNwZyVdq74aVM8GO-FuBUL4jdmDi3M3dLDF3ScxZ2oJghGH5bdGA=s900-c-k-c0x00ffffff-no-rj" alt="Logo" width="100">
</div>
<h2>Ustozni Tahrirlash</h2>
<form action="/teachers" method="post">
    <input type="hidden" name="teacherId" value="<%= teacher.getTeacherId() %>"/>

    <label for="name"><i class="fas fa-user"></i> Ism:</label>
    <input type="text" id="name" name="name" value="<%= teacher.getName() %>" required/>

    <label for="phoneNumber"><i class="fas fa-phone"></i> Telefon raqami:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" value="<%= teacher.getPhoneNumber() %>" required/>

    <button type="submit">Saqlash</button>
    <button type="button" class="back-btn" onclick="window.location.href='/views/signin.jsp'">Orqaga</button>
</form>
<%
} else {
%>
<h3 style="color: red;">Ustoz topilmadi</h3>
<%
    }
} else {
%>
<h3 style="color: red;">Ustozni tahrirlash uchun ID berilishi kerak</h3>
<%
    }
%>
</body>
</html>
