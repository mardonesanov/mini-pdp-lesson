<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>O'quvchi Ma'lumotlari (student_info.jsp)</title>
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
            position: relative;
        }
        .info-container {
            background: rgba(255, 255, 255, 0.95);
            padding: 50px;
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            width: 450px;
            text-align: left;
            transition: transform 0.3s ease;
        }
        .info-container:hover {
            transform: translateY(-10px);
        }
        h2 {
            font-size: 3em;
            font-weight: 900;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1b5e20;
            transition: transform 0.3s ease;
        }
        h2:hover {
            transform: scale(1.05);
        }
        p {
            font-size: 1.3em;
            font-weight: 700;
            margin-bottom: 15px;
            color: #2e7d32;
            transition: transform 0.3s ease;
        }
        p:hover {
            transform: scale(1.05);
        }
        p i {
            margin-right: 10px;
        }
        .logo {
            width: 120px;
            height: auto;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .logo:hover {
            transform: rotate(10deg);
        }
        .back-button {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #2e7d32;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s, transform 0.3s ease;
            position: absolute;
            bottom: 20px;
        }
        .back-button:hover {
            background-color: #1b5e20;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<img src="https://yt3.googleusercontent.com/5s99jnB2pYfLrgsYd8lp40BNwZyVdq74aVM8GO-FuBUL4jdmDi3M3dLDF3ScxZ2oJghGH5bdGA=s900-c-k-c0x00ffffff-no-rj" alt="Logo" class="logo">
<h2><i class="fas fa-user-graduate"></i> O'quvchi Ma'lumotlari</h2>
<div class="info-container">
    <p><i class="fas fa-user"></i> Ism: ${student.firstName}</p>
    <p><i class="fas fa-user-tag"></i> Familiya: ${student.lastName}</p>
    <p><i class="fas fa-phone"></i> Telefon raqami: ${student.phoneNumber}</p>
    <p><i class="fas fa-users"></i> Guruh: ${student.groupName}</p>
    <p><i class="fas fa-calendar-day"></i> Dars kuni: ${student.lessonDay}</p>
    <p><i class="fas fa-clock"></i> Dars vaqti: ${student.lessonTime}</p>
    <p><i class="fas fa-chalkboard-teacher"></i> Ustoz: ${student.teacher.name} (${student.teacher.phoneNumber})</p>
</div>
<button class="back-button" onclick="location.href='/views/signin.jsp'">Orqaga</button>
</body>
</html>