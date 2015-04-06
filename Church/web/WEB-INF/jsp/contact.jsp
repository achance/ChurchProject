<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <jsp:include page="include/thirdparty.jsp"/>
    </head>

    <body id="page5">
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
                            <div class="line1 wrapper">
                                <section class="col1">
                                    <h2><strong>O</strong>ur<span>Address</span></h2>

                                    <strong class="address">
                                        <span></span>
                                        Street:<br>
                                        City:<br>
                                        State:<br>
                                        Zip Code:<br>
                                        Telephone:<br>
                                        E-Mail:
                                    </strong>
                                    1300 Henderson Hwy<br>
                                    Troy<br>
                                    Alabama<br>
                                    36079<br>
                                    (334) 566-1835
                                    <a href="mailto:">newbeginningtroy@yahoo.com</a>
                                </section>
                                <section class="col2 pad_left1">
                                    <h2 class="color2"><strong>A</strong>bout<span>Us</span></h2>
                                    <p class="pad_bot1">
                                        New Beginning Assembly of God has been serving the Troy area for over 10 years.
                                    </p>

                                </section>
                            </div>
                        </div>	
                    </div>
                    <div class="wrapper">
                        <div class="pad_left2 relative">
                            <h4 class="color3"><span>Contact</span>Form</h4>
                            <div>We would love to hear from you!</div>
                            <div style="color: red; font-weight: 700;text-align: center">${error}</div>

                            <form id="ContactForm" method="POST" target="_blank" accept-charset="UTF-8" enctype="application/x-www-form-urlencoded" autocomplete="off" novalidate>
                                <div>
                                    <input type="hidden" name="a" value="submit" id="a"/>
                                    <div class="wrapper"><span>Your Name:</span><input type="text" class="input" name="yourname" id="name"></div>
                                    <div class="wrapper"><span>Your E-mail:</span><input type="text" class="input" name="youremail" id="email"></div>
                                    <div class="wrapper"><span>Your Website:</span><input type="text" class="input" name="yourweb" id="web"></div>
                                    <div class="textarea_box"><span>Your Message:</span><textarea name="yourmess" cols="1" rows="1" id="mess"></textarea></div>
                                    <button href="" class="button2 color3" onClick="submitContact();">Send</button>
                                    <button href="" class="button2 color3" onClick="resetContact();">Clear</button>
                                </div>
                            </form>
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
