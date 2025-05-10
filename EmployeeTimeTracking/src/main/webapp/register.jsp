<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
    <title>Register - Employee Tracker</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
            margin: 0;
        }
        .box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.2);
            text-align: center;
            width: 350px;
        }
        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        input[type="submit"] {
            background-color: #ff7f50;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
        }
        a {
            display: block;
            margin-top: 15px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2>Register</h2>
        <form method="post" action="RegisterServlet">
            <input type="text" name="name" placeholder="Full Name" required/><br/>
            <input type="text" name="username" placeholder="Username" required/><br/>
            <input type="password" name="password" placeholder="Password" required/><br/>
            <input type="submit" value="Register"/>
        </form>
        <a href="login.jsp">Already have an account? Login here</a>
    </div>
</body>
</html>
