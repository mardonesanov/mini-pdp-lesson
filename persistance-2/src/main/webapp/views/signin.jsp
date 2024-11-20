<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tizimga Kirish</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
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

            color: #333;

        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
        form {
            background: rgba(255, 255, 255, 0.9);
            color: #333;
            padding: 60px;
            border-radius: 25px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            width: 400px;
        }
        @keyframes slideIn {
            from { transform: translateY(-20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        input {
            width: 100%;
            padding: 15px;
            margin-bottom: 25px;
            border: none;
            border-radius: 15px;
            font-size: 1.1em;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        }
        button {
            padding: 15px 30px;
            cursor: pointer;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 30px;
            font-weight: bold;
            font-size: 1.2em;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            animation: fadeIn 1s ease-in;
        }
        button:hover {
            background-color: #2e7d32;
            transform: translateY(-3px);
            box-shadow: 0 15px 25px rgba(46, 125, 50, 0.6);
        }
        h2 {
            font-size: 3em;
            font-weight: 800;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: color 0.3s, transform 0.3s;
            animation: fadeIn 1.5s ease-in;
        }
        label {
            font-size: 1.5em;
            font-weight: bold;
            transition: color 0.3s, transform 0.3s;
        }
    </style>
</head>
<body>
<form action="/signin" method="post" style="position: relative; z-index: 2;">
    <img src="https://yt3.googleusercontent.com/5s99jnB2pYfLrgsYd8lp40BNwZyVdq74aVM8GO-FuBUL4jdmDi3M3dLDF3ScxZ2oJghGH5bdGA=s900-c-k-c0x00ffffff-no-rj" alt="Logo" style="width: 100px; height: auto; margin-bottom: 20px;">
    <h2 onmouseover="this.style.color='#4caf50'; this.style.transform='scale(1.05)';" onmouseout="this.style.color='#4caf50'; this.style.transform='scale(1)';"><i class="fas fa-sign-in-alt icon"></i> Tizimga Kirish</h2>
    <label for="phoneNumber" onmouseover="this.style.color='#4caf50'; this.style.transform='scale(1.05)';" onmouseout="this.style.color='#407934'; this.style.transform='scale(1)';"><i class="fas fa-phone icon"></i> Telefon raqami:</label><br>
    <input type="text" id="phoneNumber" name="phoneNumber" placeholder="998XXXXXXXXX" required><br><br>
    <button type="submit" onmouseover="this.style.backgroundColor='#4caf50'; this.style.transform='translateY(-3px)';" onmouseout="this.style.backgroundColor='#407934'; this.style.transform='translateY(0)';"><i class="fas fa-arrow-right icon"></i> Tizimga kirish</button>
</form>
</body>
</html>
