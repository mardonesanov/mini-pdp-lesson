<%@ page import="java.util.List" %>
<%@ page import="jakarta.persistence.*" %>
<%@ page import="uz.app.persistance2.db.Datasource" %>
<%@ page import="uz.app.persistance2.entity.Teacher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>O'quvchi Qo'shish</title>
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
    body {
      font-family: 'Montserrat', sans-serif;
      text-align: center;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background: url('https://pdp.uz/static/media/temp_header_bg.0abc43dc5fb6197a7c1f.png') no-repeat center center/cover;
      background-blend-mode: overlay;
      color: #35c611;
      padding: 10px;
      box-sizing: border-box;
    }
    form {
      background: rgba(255, 255, 255, 0.9);
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
      width: 300px;
      text-align: left;
    }
    input, select {
      width: calc(100% - 20px);
      padding: 10px;
      margin-bottom: 15px;
      border: none;
      border-radius: 5px;
      font-size: 1.1em;
      font-family: 'Montserrat', sans-serif;
      background-color: #f9f9f9;
      box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
      transition: border-color 0.3s, box-shadow 0.3s;
    }
    select:hover {
      border-color: #4caf50;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }
    button {
      width: 100%;
      padding: 10px;
      cursor: pointer;
      background-color: #4caf50;
      color: white;
      border: none;
      border-radius: 20px;
      font-weight: bold;
      font-size: 1em;
      transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
    }
    button:hover {
      background-color: #388e3c;
      transform: translateY(-3px);
      box-shadow: 0 10px 20px rgba(56, 142, 60, 0.4);
    }
    h2 {
      font-size: 2em;
      font-weight: 800;
      margin-bottom: 15px;
    }
    label {
      font-size: 1em;
      font-weight: bold;
    }
  </style>
</head>
<body>

<button onclick="location.href='/views/lessons.jsp'" style="width: 130px; padding: 10px; cursor: pointer; background-color: #4caf50; color: white; border: none; border-radius: 20px; font-weight: bold; font-size: 0.9em; transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s; margin-bottom: 15px;"><i class="fas fa-arrow-left"></i> Orqaga qaytish</button>
<h2>Yangi O'quvchi Qo'shish</h2>
<%
  EntityManager em = Datasource.createEntityManager();
  List<Teacher> teachers = em.createQuery("SELECT t FROM Teacher t", Teacher.class).getResultList();
  em.close();
%>
<form action="/lessons" method="post">
  <label for="firstName"><i class="fas fa-user"></i> Ism:</label><br>
  <input type="text" id="firstName" name="firstName" required><br><br>

  <label for="lastName"><i class="fas fa-user-tag"></i> Familiya:</label><br>
  <input type="text" id="lastName" name="lastName" required><br><br>

  <label for="phoneNumber"><i class="fas fa-phone"></i> Telefon raqami:</label><br>
  <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>

  <label for="groupName"><i class="fas fa-users"></i> Guruh nomi:</label><br>
  <input type="text" id="groupName" name="groupName" required><br><br>

  <label for="lessonDay"><i class="fas fa-calendar-day"></i> Dars kuni:</label><br>
  <input type="text" id="lessonDay" name="lessonDay" required><br><br>

  <label for="lessonTime"><i class="fas fa-clock"></i> Dars vaqti:</label><br>
  <input type="text" id="lessonTime" name="lessonTime" required><br><br>

  <label for="teacherId"><i class="fas fa-chalkboard-teacher"></i> Ustozni Tanlang:</label><br>
  <select id="teacherId" name="teacherId" required>
    <option value="">Ustozni tanlang</option>
    <%
      for (Teacher teacher : teachers) {
    %>
    <option value="<%= teacher.getTeacherId() %>"><%= teacher.getName() %> (<%= teacher.getPhoneNumber() %>)</option>
    <%
      }
    %>
  </select><br><br>

  <button type="submit">Qo'shish</button>
</form>

</body>
</html>
