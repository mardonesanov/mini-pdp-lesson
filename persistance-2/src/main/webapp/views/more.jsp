<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="PDP Academy mini qismi - Java, Jakarta, Hibernate yordami bilan yaratilgan zamonaviy dastur.">
    <title>PDP Academy</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffffff;
            color: #00cc66;
        }

        header {
            background-color: #00cc66;
            padding: 20px;
            text-align: center;
            font-size: 2em;
            font-weight: 700;
            border-bottom: 2px solid #ffffff;
            animation: fadeInDown 0.5s ease-in-out;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.2s ease;
        }

        header:hover {
            transform: scale(1.03);
        }

        .container {
            padding: 40px;
            max-width: 1200px;
            margin: auto;
            animation: fadeIn 1s ease-in-out;
        }

        .content {
            text-align: center;
            background: rgba(0, 204, 102, 0.1);
            padding: 30px;
            border-radius: 10px;
            animation: fadeInUp 1s ease-in-out;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease;
        }

        .content:hover {
            transform: translateY(-5px);
        }

        .back-button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            background-color: #00cc66;
            color: #ffffff;
            text-decoration: none;
            font-weight: 700;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #00994d;
        }

        footer {
            background-color: #00cc66;
            padding: 20px;
            text-align: center;
            margin-top: 40px;
            animation: fadeInUp 1s ease-in-out;
            box-shadow: 0 -8px 15px rgba(0, 0, 0, 0.3);
        }

        .links a {
            color: #ffffff;
            text-decoration: none;
            font-weight: 700;
            padding: 0 15px;
            transition: color 0.3s, transform 0.2s;
            font-size: 1.5em;
        }

        .links a:hover {
            color: #ffcc00;
            transform: scale(1.1);
        }

        .links a i {
            margin-right: 8px;
            font-size: 1.5em;
        }

        .logo {
            width: 100px;
            height: auto;
            margin-bottom: 20px;
            animation: fadeIn 1s ease-in-out;
            transition: transform 0.2s ease;
            background-color: #ffffff;
            padding: 10px;
            border-radius: 50%;
        }

        .logo:hover {
            transform: rotate(180deg);
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        @keyframes fadeInDown {
            0% { opacity: 0; transform: translateY(-10px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes fadeInUp {
            0% { opacity: 0; transform: translateY(10px); }
            100% { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<header>
    <img src="https://yt3.googleusercontent.com/5s99jnB2pYfLrgsYd8lp40BNwZyVdq74aVM8GO-FuBUL4jdmDi3M3dLDF3ScxZ2oJghGH5bdGA=s900-c-k-c0x00ffffff-no-rj" alt="PDP Academy Logo" class="logo">
    <i class="fas fa-graduation-cap"></i> PDP Academy Mini Versiya
</header>

<div class="container">
    <div class="content">
        <h2><i class="fas fa-info-circle"></i> Bizning loyihamiz haqidagi qisqacha ma'lumot</h2>
        <p>Bu mini veb-sahifa PDP Academy loyihasining kichik versiyasi bo'lib, Java, Jakarta, va Hibernate yordami bilan yozilgan. Dasturni yozish sanasi: 20.11.2024</p>
        <p>O'zingizning malakangizni oshirish va dasturlashni o'rganish uchun ajoyib platforma - PDP Academy</p>
    </div>
    <a href="/views/lessons.jsp" class="back-button">Orqaga qaytish</a>
</div>

<footer>
    <div class="links">
        <a href="https://t.me/esanov_wr" target="_blank"><i class="fab fa-telegram"></i>Telegram</a> |
        <a href="https://www.instagram.com/esanov_wr" target="_blank"><i class="fab fa-instagram"></i>Instagram</a>
    </div>
    <p>&copy; 2024 PDP Academy Mini Qismi | Yozuvchi: Mardonbek Esonov</p>
</footer>

</body>
</html>