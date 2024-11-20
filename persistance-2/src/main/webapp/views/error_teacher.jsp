<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xatolik</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #e0f7e9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.1);
            border-radius: 16px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .error-container:hover {
            transform: translateY(-5px);
            box-shadow: 0px 20px 40px rgba(0, 0, 0, 0.2);
        }
        h1 {
            color: #4caf50;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        .icon {
            font-size: 4em;
            color: #4caf50;
            margin-bottom: 20px;
            animation: pulse 1.5s infinite;
        }
        a.button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #4caf50;
            border-radius: 8px;
            text-decoration: none;
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        a.button:hover {
            background-color: #43a047;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
        }
        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }
    </style>
</head>
<body>
<div class="error-container">
    <i class="fas fa-exclamation-circle icon"></i>
    <h1>Mavjud raqam kiritdingiz</h1>
    <p>Bu telefon raqami allaqachon mavjud. Iltimos, boshqa raqam kiritib qayta urinib ko'ring.</p>
    <a href="/views/add_teacher.jsp" class="button">Ortga qaytish</a>
</div>
</body>
</html>
