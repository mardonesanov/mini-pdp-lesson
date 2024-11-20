<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ustoz Qo'shish</title>
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
            color: #189d3e;
        }
        form {
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: left;
        }
        input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 20px;
            border: none;
            border-radius: 10px;
            font-size: 1em;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        button {
            width: 100%;
            padding: 15px;
            cursor: pointer;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            font-size: 1.2em;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
        }
        button:hover {
            background-color: #388e3c;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(56, 142, 60, 0.4);
        }
        h2 {
            font-size: 2.5em;
            font-weight: 800;
            margin-bottom: 20px;
        }
        label {
            font-size: 1.2em;
            font-weight: bold;
        }
        .error {
            color: red;
            font-size: 1.2em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<button onclick="location.href='/views/lessons.jsp'" style="padding: 10px 20px; cursor: pointer; background-color: #4caf50; color: white; border: none; border-radius: 20px; font-weight: bold; font-size: 1em; transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s; margin-bottom: 20px;"><i class="fas fa-arrow-left"></i> Orqaga qaytish</button>
<h2><i class="fas fa-chalkboard-teacher"></i> Ustoz Qo'shish</h2>
<% if (request.getAttribute("errorMessage") != null) { %>
<p class="error"><%= request.getAttribute("errorMessage") %></p>
<% } %>
<form action="/teachers" method="post">
    <label for="name" style="transition: color 0.3s;"><i class="fas fa-user"></i> <i class="fas fa-user"></i> Ism:</label><br>
    <input type="text" id="name" name="name" required><br><br>
    <label for="phoneNumber" style="transition: color 0.3s;"><i class="fas fa-phone"></i> <i class="fas fa-phone"></i> Telefon raqami:</label><br>
    <input type="text" id="phoneNumber" name="phoneNumber" pattern="\d{9}" title="Telefon raqami 9 ta raqamdan iborat bo'lishi kerak" required><br><br>
    <button type="submit" onmouseover="this.style.backgroundColor='#2e7d32'; this.style.transform='translateY(-5px)'; this.style.boxShadow='0 10px 20px rgba(46, 125, 50, 0.6)';" onmouseout="this.style.backgroundColor='#4caf50'; this.style.transform='translateY(0)'; this.style.boxShadow='0 10px 20px rgba(56, 142, 60, 0.4)';"><i class="fas fa-plus-circle"></i> Qo'shish</button>
</form>
</body>
</html>
