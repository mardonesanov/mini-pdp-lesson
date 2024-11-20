<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zamonaviy Tizimga Kirish Sahifasi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(to bottom right, #43cea2, #185a9d), url('https://avatars.mds.yandex.net/get-altay/10095165/2a00000190e9f3c050a6a5420ff1fcd2adff/L_height') no-repeat center center/cover;
            background-blend-mode: overlay;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 60px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            width: 450px;
            transition: transform 0.3s ease-in-out;
        }

        .container:hover {
            transform: scale(1.05);
        }

        h1 {
            font-weight: 700;
            margin-bottom: 35px;
            color: #185a9d;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .icon {
            width: 180px;
            height: 180px;
            margin-bottom: 35px;
            border-radius: 50%;
            border: 5px solid #4caf50;
        }

        .btn {
            display: inline-block;
            background: #4caf50;
            color: #fff;
            padding: 20px 50px;
            text-decoration: none;
            border-radius: 50px;
            font-weight: bold;
            font-size: 1.3em;
            transition: background 0.3s, transform 0.3s, box-shadow 0.3s;
        }

        .btn i {
            margin-right: 10px;
        }

        .btn:hover {
            background: #43a047;
            transform: translateY(-7px);
            box-shadow: 0 12px 20px rgba(67, 160, 71, 0.5);
        }

        .social-icons {
            margin-top: 30px;
        }

        .social-icons a {
            color: #185a9d;
            margin: 0 10px;
            font-size: 2em;
            transition: color 0.3s;
        }

        .social-icons a:hover {
            color: #43a047;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="https://yt3.googleusercontent.com/5s99jnB2pYfLrgsYd8lp40BNwZyVdq74aVM8GO-FuBUL4jdmDi3M3dLDF3ScxZ2oJghGH5bdGA=s900-c-k-c0x00ffffff-no-rj" alt="Logo" class="icon">
    <h1>Tizimga Xush Kelibsiz!</h1>
    <a href="${pageContext.request.contextPath}/views/signin.jsp" class="btn"><i class="fas fa-sign-in-alt"></i>Tizimga Kirish</a>
    <div class="social-icons">
        <a href="https://www.instagram.com/esanov_wr" title="Instagram"><i class="fab fa-instagram"></i></a>
        <a href="https://t.me/esanov_wr" title="Telegram"><i class="fab fa-telegram"></i></a>
        <a href="https://www.facebook.com/esanov_wr" title="Facebook"><i class="fab fa-facebook"></i></a>
    </div>
</div>
</body>
</html>