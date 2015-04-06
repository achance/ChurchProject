<%-- 
    Document   : login
    Created on : Apr 6, 2015, 10:40:27 PM
    Author     : Binh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Login</title>
        <link rel="stylesheet" href="../css/login.css">
        <!--[if lt IE 9]><script src="../js/html5shim.js"></script><![endif]-->
    </head>
    <body>
        <section class="container">
            <div class="login">
                <h1>Login to Cms</h1>
                <form method="post" action="">
                    <p><input type="text" name="login" value="${username}" placeholder="Username"></p>
                    <p><input type="password" name="password" value="${password}" placeholder="Password"></p>
                    <p class="submit"><input type="submit" name="action" value="Login"></p>
                    <p class="submit error">
                        ${error}
                    </p>
                </form>
            </div>
        </section>

        <section class="about">
            <p class="about-author">
                &copy; 2012&ndash;2013 <a href="http://thibaut.me" target="_blank">Thibaut Courouble</a> -
                <a href="http://www.cssflow.com/mit-license" target="_blank">MIT License</a><br>
                Original PSD by <a href="http://www.premiumpixels.com/freebies/clean-simple-login-form-psd/" target="_blank">Orman Clark</a>
        </section>
    </body>
</html>
