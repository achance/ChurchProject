<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help</title>
        <jsp:include page="include/thirdparty.jsp"/>
    </head>

    <body id="page4">
        <div class="body1">
            <div class="main">
                <!-- header -->
                <header>
                    <jsp:include page="include/header.jsp"/>
                </header>
                <!-- / header -->
                <!-- content -->
                <article id="content">
                    <div class="wrapper">
                        <div class="box1">
                            <div class="line1">
                                <div class="line2 wrapper">
                                    <section class="col1">
                                        <h2><strong>M</strong>ake<span> Donations</span></h2>
                                        <div class="pad_bot1"><figure><img src="images/page4_img1.jpg" alt=""></figure></div>
                                        Church events, BGMC, missions, and much more need YOUR help
                                        <!--<a href="#" class="button1">Read More</a>-->
                                    </section>
                                    <section class="col1 pad_left1">
                                        <h2 class="color2"><strong>J</strong>oin<span> Volunteer</span></h2>
                                        <div class="pad_bot1"><figure><img src="images/page4_img2.jpg" alt=""></figure></div>
                                        Sometimes, volunteering your time can be the best GIFT.
                                        <!--<a href="#" class="button1 color2">Read More</a>-->
                                    </section>
                                    <section class="col1 pad_left1">
                                        <h2 class="color3"><strong>S</strong>pread<span> Word</span></h2>
                                        <div class="pad_bot1"><figure><img src="images/page4_img3.jpg" alt=""></figure></div>
                                        GOD wants YOU to spread the WORD about CHRIST
                                        <!--<a href="#" class="button1 color3">Read More</a>-->
                                    </section>
                                </div>
                            </div>
                        </div>	
                    </div>
                    <div class="wrapper">
                        <div class="pad_left2">
                            <h4><span>How Donations</span> Help</h4>
                            <p class="pad_bot2"><strong>YOUR donation can MAKE a DIFFERENCE</strong></p>
                            <p>A little bit can go a long way!</p>
                        </div>
                    </div>
                    <div class="wrapper">
                        <div class="box2">
                            <div class="wrapper">
                                <section class="col1">
                                    <div class="wrapper">

                                        <!--<a href="#" class="left marg_right1"><img  alt=""></a>-->
                                        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                                            <input type="hidden" name="cmd" value="_s-xclick">
                                            <input type="hidden" name="hosted_button_id" value="PETDE3UX8KX84">
                                            <input type="image" src="images/banner.jpg" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                                            <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                                        </form>

                                        <p class="pad_bot2"><strong>How Can You Donate?</strong></p>
                                        Donate online using the button above. Drop something in the mail. Come by and see us!!
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </article>
                <!-- / content -->
                <!-- footer -->
                <jsp:include page="include/footer.jsp"/>
                <!-- / footer -->
            </div>
        </div>
    </body>
</html>
