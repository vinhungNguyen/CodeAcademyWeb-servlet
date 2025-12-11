<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login & Register - CodeAcademy</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .wrapper {
            width: 420px;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
        }

        .tabs {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .tabs button {
            flex: 1;
            padding: 12px;
            border: none;
            background: #ddd;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        .tabs button.active {
            background: #4a90e2;
            color: #fff;
        }

        form {
            display: none;
            animation: fade 0.4s ease;
        }

        form.active {
            display: block;
        }

        @keyframes fade {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button.submit-btn {
            width: 100%;
            padding: 12px;
            background: #27ae60;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button.submit-btn:hover {
            background: #1e874b;
        }
    </style>
</head>

<body>

<div class="wrapper">

    <!-- Tab chọn Login / Register -->
    <div class="tabs">
        <button id="loginTab" class="active">Login</button>
        <button id="registerTab">Register</button>
    </div>

    <!-- Form Login -->
    <form id="loginForm" class="active"
          action="${pageContext.request.contextPath}/login"
          method="post">

        <input type="email" name="email" placeholder="Email" required>

        <input type="password" name="password" placeholder="Password" required>

        <button type="submit" class="submit-btn">Login</button>
    </form>

    <!-- Form Register -->
    <form id="registerForm"
          action="${pageContext.request.contextPath}/register"
          method="post">

        <input type="text" name="fullname" placeholder="Full name" required>

        <input type="email" name="email" placeholder="Email" required>

        <input type="password" name="password" placeholder="Password" required>

        <input type="password" name="confirm" placeholder="Confirm Password" required>

        <button type="submit" class="submit-btn">Register</button>
    </form>

</div>

<script>
    const loginTab = document.getElementById("loginTab");
    const registerTab = document.getElementById("registerTab");

    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");

    loginTab.onclick = () => {
        loginTab.classList.add("active");
        registerTab.classList.remove("active");

        loginForm.classList.add("active");
        registerForm.classList.remove("active");
    };

    registerTab.onclick = () => {
        registerTab.classList.add("active");
        loginTab.classList.remove("active");

        registerForm.classList.add("active");
        loginForm.classList.remove("active");
    };
</script>

</body>
</html>
