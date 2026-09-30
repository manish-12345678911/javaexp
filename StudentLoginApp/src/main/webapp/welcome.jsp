<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String user = (String) session.getAttribute("username");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome - Student Portal</title>
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

        .bg-shapes {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            z-index: 0;
            overflow: hidden;
        }

        .bg-shapes .shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(100, 160, 230, 0.08);
        }

        .shape-1 { width: 300px; height: 300px; top: -80px; right: -60px; animation: float1 8s ease-in-out infinite; }
        .shape-2 { width: 200px; height: 200px; bottom: -50px; left: -40px; animation: float2 10s ease-in-out infinite; }
        .shape-3 { width: 150px; height: 150px; top: 40%; right: 10%; animation: float3 7s ease-in-out infinite; }
        .shape-4 { width: 100px; height: 100px; top: 20%; left: 15%; animation: float1 9s ease-in-out infinite reverse; }

        @keyframes float1 {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-30px) rotate(10deg); }
        }
        @keyframes float2 {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(25px); }
        }
        @keyframes float3 {
            0%, 100% { transform: translateX(0); }
            50% { transform: translateX(-20px); }
        }

        .welcome-card {
            position: relative;
            z-index: 1;
            width: 480px;
            background: linear-gradient(145deg, rgba(20, 60, 110, 0.9), rgba(10, 35, 70, 0.95));
            backdrop-filter: blur(20px);
            border-radius: 20px;
            padding: 45px 40px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.5),
                        inset 0 1px 0 rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(80, 140, 210, 0.15);
            text-align: center;
        }

        .welcome-card::before {
            content: '';
            position: absolute;
            top: -30px; right: -30px;
            width: 120px; height: 120px;
            background: linear-gradient(135deg, rgba(60, 130, 220, 0.3), rgba(30, 80, 160, 0.1));
            border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%;
            animation: morph 6s ease-in-out infinite;
        }

        .welcome-card::after {
            content: '';
            position: absolute;
            bottom: -20px; left: -20px;
            width: 80px; height: 80px;
            background: linear-gradient(135deg, rgba(60, 150, 255, 0.25), rgba(30, 80, 180, 0.1));
            border-radius: 50%;
            animation: float2 5s ease-in-out infinite;
        }

        @keyframes morph {
            0%, 100% { border-radius: 30% 70% 70% 30% / 30% 30% 70% 70%; }
            50% { border-radius: 70% 30% 30% 70% / 70% 70% 30% 30%; }
        }

        .success-circle {
            width: 90px;
            height: 90px;
            background: linear-gradient(135deg, #2e7d32, #4caf50);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 22px auto;
            font-size: 42px;
            color: #ffffff;
            box-shadow: 0 6px 25px rgba(46, 125, 50, 0.5);
            animation: popIn 0.6s ease-out;
        }

        @keyframes popIn {
            0% { transform: scale(0); opacity: 0; }
            70% { transform: scale(1.15); }
            100% { transform: scale(1); opacity: 1; }
        }

        .welcome-card h2 {
            color: #ffffff;
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .welcome-card .subtitle {
            font-size: 14px;
            color: #8bb8e8;
            margin-bottom: 28px;
        }

        .info-panel {
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(100, 160, 230, 0.15);
            border-radius: 12px;
            padding: 18px 22px;
            margin-bottom: 28px;
            text-align: left;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 8px 0;
            border-bottom: 1px solid rgba(100, 160, 230, 0.08);
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-row .label {
            font-size: 13px;
            font-weight: 500;
            color: #8bb8e8;
        }

        .info-row .value {
            font-size: 13px;
            font-weight: 600;
            color: #ffffff;
        }

        .status-active {
            color: #66bb6a !important;
        }

        .logout-btn {
            display: inline-block;
            padding: 13px 50px;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            color: #ffffff;
            background: linear-gradient(135deg, #c62828, #e53935);
            border: none;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(198, 40, 40, 0.4);
        }

        .logout-btn:hover {
            background: linear-gradient(135deg, #b71c1c, #c62828);
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(198, 40, 40, 0.5);
        }

        .wave-decoration {
            margin-top: 22px;
            color: rgba(77, 166, 255, 0.3);
            font-size: 20px;
            letter-spacing: 4px;
        }

        .footer {
            margin-top: 15px;
            font-size: 12px;
            color: rgba(150, 190, 230, 0.5);
        }
    </style>
</head>
<body>

    <div class="bg-shapes">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        <div class="shape shape-3"></div>
        <div class="shape shape-4"></div>
    </div>

    <div class="welcome-card">
        <div class="success-circle">&#10004;</div>
        <h2>Welcome, <%= user %>!</h2>
        <p class="subtitle">You have successfully logged in.</p>

        <div class="info-panel">
            <div class="info-row">
                <span class="label">Username</span>
                <span class="value"><%= user %></span>
            </div>
            <div class="info-row">
                <span class="label">Status</span>
                <span class="value status-active">&#9679; Active</span>
            </div>
            <div class="info-row">
                <span class="label">Session</span>
                <span class="value">Valid</span>
            </div>
        </div>

        <a href="logout" class="logout-btn">Logout</a>

        <div class="wave-decoration">~ ~ ~</div>
        <div class="footer">Student Login By Er. Ram Babu Buri</div>
    </div>

</body>
</html>
