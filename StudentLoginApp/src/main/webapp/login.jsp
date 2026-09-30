<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login Form</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #1a3a5c;
            overflow: hidden;
        }

        /* Background floating shapes */
        .bg-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            overflow: hidden;
        }

        .bg-shapes .shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(100, 160, 230, 0.08);
        }

        .shape-1 {
            width: 300px;
            height: 300px;
            top: -80px;
            right: -60px;
            animation: float1 8s ease-in-out infinite;
        }

        .shape-2 {
            width: 200px;
            height: 200px;
            bottom: -50px;
            left: -40px;
            animation: float2 10s ease-in-out infinite;
        }

        .shape-3 {
            width: 150px;
            height: 150px;
            top: 40%;
            right: 10%;
            animation: float3 7s ease-in-out infinite;
        }

        .shape-4 {
            width: 100px;
            height: 100px;
            top: 20%;
            left: 15%;
            animation: float1 9s ease-in-out infinite reverse;
        }

        @keyframes float1 {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-30px) rotate(10deg); }
        }

        @keyframes float2 {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(25px) rotate(-8deg); }
        }

        @keyframes float3 {
            0%, 100% { transform: translateX(0); }
            50% { transform: translateX(-20px); }
        }

        /* Login Card */
        .login-card {
            position: relative;
            z-index: 1;
            width: 460px;
            background: linear-gradient(145deg, rgba(20, 60, 110, 0.9), rgba(10, 35, 70, 0.95));
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 45px 40px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5),
                        inset 0 1px 0 rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(80, 140, 210, 0.15);
        }

        /* Decorative 3D elements on card */
        .login-card::before {
            content: '';
            position: absolute;
            top: -30px;
            right: -30px;
            width: 120px;
            height: 120px;
            background: linear-gradient(135deg, rgba(60, 130, 220, 0.3), rgba(30, 80, 160, 0.1));
            border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
            animation: morph 6s ease-in-out infinite;
        }

        .login-card::after {
            content: '';
            position: absolute;
            bottom: -20px;
            left: -20px;
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, rgba(60, 150, 255, 0.25), rgba(30, 80, 180, 0.1));
            border-radius: 50%;
            animation: float2 5s ease-in-out infinite;
        }

        @keyframes morph {
            0%, 100% { border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%; }
            50% { border-radius: 70% 30% 30% 70% / 70% 70% 30% 30%; }
        }

        /* Logo icon */
        .logo {
            text-align: center;
            margin-bottom: 8px;
        }

        .logo svg {
            width: 40px;
            height: 40px;
            fill: #4da6ff;
            filter: drop-shadow(0 2px 8px rgba(77, 166, 255, 0.4));
        }

        .login-card h1 {
            text-align: center;
            color: #ffffff;
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 30px;
            letter-spacing: 1px;
        }

        /* Form styles */
        .form-group {
            margin-bottom: 22px;
            position: relative;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 400;
            color: #8bb8e8;
            margin-bottom: 8px;
            letter-spacing: 0.5px;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            font-size: 14px;
            font-family: 'Poppins', sans-serif;
            color: #ffffff;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(100, 160, 230, 0.2);
            border-radius: 10px;
            outline: none;
            transition: all 0.3s ease;
        }

        .form-group input::placeholder {
            color: rgba(150, 190, 230, 0.4);
        }

        .form-group input:focus {
            border-color: #4da6ff;
            background: rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 15px rgba(77, 166, 255, 0.15);
        }

        /* Sign In Button */
        .login-btn {
            width: 100%;
            padding: 14px;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            color: #ffffff;
            background: linear-gradient(135deg, #0d2137, #1a3a5c);
            border: 1px solid rgba(100, 160, 230, 0.2);
            border-radius: 10px;
            cursor: pointer;
            margin-top: 8px;
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
        }

        .login-btn:hover {
            background: linear-gradient(135deg, #1a3a5c, #2a5a8c);
            border-color: #4da6ff;
            box-shadow: 0 4px 20px rgba(77, 166, 255, 0.25);
            transform: translateY(-2px);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        /* Error message */
        .error-message {
            color: #ff6b6b;
            font-size: 13px;
            font-weight: 500;
            text-align: center;
            margin-bottom: 18px;
            padding: 10px 15px;
            background: rgba(255, 80, 80, 0.1);
            border: 1px solid rgba(255, 80, 80, 0.2);
            border-radius: 8px;
        }

        /* Footer */
        .footer {
            text-align: center;
            margin-top: 25px;
            font-size: 12px;
            color: rgba(150, 190, 230, 0.5);
        }

        /* Wavy decoration */
        .wave-decoration {
            text-align: center;
            margin-top: 18px;
            color: rgba(77, 166, 255, 0.3);
            font-size: 20px;
            letter-spacing: 4px;
        }
    </style>
</head>
<body>

    <!-- Floating background shapes -->
    <div class="bg-shapes">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        <div class="shape shape-3"></div>
        <div class="shape shape-4"></div>
    </div>

    <div class="login-card">

        <!-- Logo icon -->
        <div class="logo">
            <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                <path d="M12 3L1 9l4 2.18v6L12 21l7-3.82v-6l2-1.09V17h2V9L12 3zm6.82 6L12 12.72 5.18 9 12 5.28 18.82 9zM17 15.99l-5 2.73-5-2.73v-3.72L12 15l5-2.73v3.72z"/>
            </svg>
        </div>

        <h1>Login</h1>

        <%-- Display error message if login failed --%>
        <%
            String errorMsg = (String) request.getAttribute("errorMsg");
            if (errorMsg != null) {
        %>
            <div class="error-message"><%= errorMsg %></div>
        <%
            }
        %>

        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required />
            </div>

            <button type="submit" class="login-btn">Sign in</button>
        </form>

        <div class="wave-decoration">~ ~ ~</div>

        <div class="footer">Student Login By Er. Ram Babu Buri</div>
    </div>

</body>
</html>
