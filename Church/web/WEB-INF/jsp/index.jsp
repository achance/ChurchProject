
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <jsp:include page="include/thirdparty.jsp"/>
    </head>

    <body id="page1">
        <div class="body1">
            <div class="main">
                <!-- header -->
                <header>
                    <jsp:include page="include/header.jsp"/>
                    <jsp:include page="include/slider.jsp"/>
                </header>
                <!-- / header -->
                <!-- content -->
                <article id="content">
                    <div class="wrapper">
                        <div class="box1">
                            <div class="line1"><div class="line2 wrapper">
                                    <section class="col1">
                                        <h2><strong>H</strong>appening<span>Now</span></h2>
                                        <div class="pad_bot1"><figure><img src="images/bgmcBig.jpg" alt=""></figure></div>
                                        New Beginning is dedicated to helping BGMC!
                                        <a href="#" class="button1">Read More</a>
                                    </section>
                                    <section class="col1 pad_left1">
                                        <h2 class="color2"><strong>C</strong>oming<span>Soon</span></h2>
                                        <div class="pad_bot1"><figure><img src="images/bgmcBig.jpg" alt=""></figure></div>

                                    </section>
                                    <section class="col1 pad_left1">
                                        <h2 class="color3"><strong>T</strong>rue<span>Story </span></h2>
                                        <div class="pad_bot1"><figure><img src="images/bgmcBig.jpg" alt=""></figure></div>
                                        IDK What to put here?!?!
                                    </section>
                                </div></div>
                        </div>	
                    </div>
                    <div class="wrapper">
                        <h3>Our Mission</h3>
                        <p class="quot">
                            REAL people, REAL church, living REAL lives <br/>filled with the RADICAL LOVE of JESUS.<img src="images/quot2.png" alt="">
                        </p>
                    </div>
                    <div class="wrapper">
                        <div class="box2">
                            <div class="line1"><div class="line2 wrapper">
                                    <section class="col1">
                                        <h4><span>Mar 25</span></h4>
                                        <p class="pad_bot2"><strong>Money Matters</strong></p>
                                        <p>Coninuing our series....</p>
                                        <a href="news.htm" class="button2">Read More</a>
                                    </section>
                                    <section class="col1 pad_left1">
                                        <h4 class="color2"><span>March 29</span></h4>
                                        <p class="pad_bot2"><strong>Farewell to Pastor Joey Johnson</strong></p>
                                        <p>Join us in saying goodbye to Pastor Joey Johnson.</p>
                                        <a href="news.htm" class="button2 color2">Read More</a>
                                    </section>
                                    <section class="col1 pad_left1">
                                        <h4 class="color3"><span>April 5</span></h4>
                                        <p class="pad_bot2"><strong>Easter Sunday</strong></p>
                                        <p>Join us for a special Easter Service</p>
                                        <a href="news.htm" class="button2 color3">Read More</a>
                                    </section>
                                </div></div>
                        </div>
                    </div>
                </article>
                <!-- / content -->
                <!-- footer -->
                <jsp:include page="include/footer.jsp"/>
                <!-- / footer -->
            </div>
        </div>
        <jsp:include page="include/footerscript.jsp"/>
    </body>
</html>
