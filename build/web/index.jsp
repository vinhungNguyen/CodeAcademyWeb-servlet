<%-- 
    Document   : home
    Created on : Dec 10, 2025, 11:36:29 PM
    Author     : vinhung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        video {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;       /* video phủ toàn màn */
            z-index: -1;

        }

        .header-title{
            color: white;
            font-family: sans-serif;
            margin: auto;
            width: 80%;
            text-align: center;
            margin-top: 150px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .header-title h1{
            font-size: 80px;
        }

        .slogan{
            font-size: 30px;
        }

        .home-body {
            /* align-items: center; */
            width: 25%;
            margin: auto;
            display: flex;
            /* align-items: center; */
            justify-content: center;
            gap: 55px;
            margin-top: 25px;
        }

        .home-body button{
            flex: 1;
            padding: 15px;
            font-size: 20px;
            border-radius: 10px;
            border: none;
        }

        .home-body button:hover{
            color: white;
            background: gray;

        }

        a{
            text-decoration: none;
        }

    </style>
    <body>


        <video autoPlay muted loop>
            <source src=acces/3130284-uhd_3840_2160_30fps.mp4 type='video/mp4' />
        </video>

        <div class="header-title">
            <h1>Code Academy</h1>
            <p class="slogan">Nurturing knowledge and building future tech innovators through modern, hands-on learning experiences</p>
        </div>

        <div class="home-body">
            <form action="${pageContext.request.contextPath}/course" method="get" >
                <button type="submit">Visit as guest</button>
            </form>


            <button><a href="auth.jsp">Login</a></button>


        </div>
    </body>
</html>
