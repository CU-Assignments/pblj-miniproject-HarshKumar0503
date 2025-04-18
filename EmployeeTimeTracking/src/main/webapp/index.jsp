<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Time Tracking System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc); /* Gradient background */
            color: white;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            overflow: hidden;
        }

        /* Hero Section (custom background, top aligned text, animated) */
        .hero {
            width: 100%;
            height: 20vh; /* Smaller height */
            background-color: #2f80ed;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            position: absolute;
            top: 0;
            animation: fadeInDown 1s ease-out;
        }

        /* Hero Title Animation */
        .hero h1 {
            font-size: 50px; /* Increased font size */
            font-weight: bold;
            text-shadow: 3px 3px 15px rgba(0, 0, 0, 0.4);
            margin: 0;
            animation: slideInTop 1s ease-out;
        }

        /* Main Content Section (center aligned and animated) */
        .content {
            background-color: white;
            padding: 40px;
            box-shadow: 0px 15px 30px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            max-width: 600px;
            margin-top: 20vh; /* Positioned below hero section */
            text-align: center;
            z-index: 10;
            animation: fadeInUp 1s ease-out;
        }

        .content h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .content p {
            font-size: 18px;
            color: #555;
            margin-bottom: 30px;
        }

        .content a {
            text-decoration: none;
            background-color: #2f80ed;
            color: white;
            padding: 15px 25px;
            border-radius: 5px;
            font-size: 18px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin: 0 10px;
        }

        .content a:hover {
            background-color: #1c5db8;
            transform: scale(1.1);
        }

        /* Keyframes for Animations */
        @keyframes slideInTop {
            from {
                transform: translateY(-100px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Media query for responsiveness */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 32px;
            }

            .content {
                width: 90%;
                padding: 30px;
            }
        }
    </style>
</head>
<body>

    <!-- Hero Section (Top Aligned) -->
    <div class="hero">
        <h1>Welcome to the Employee Time Tracking System</h1>
    </div>

    <!-- Main Content Section (Centered) -->
    <div class="content">
        <h2>Track your work hours efficiently</h2>
        <p>Manage employee time with our easy-to-use time tracking system. Accurate records and smooth operations to boost productivity!</p>
        <div>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        </div>
    </div>

</body>
</html>
