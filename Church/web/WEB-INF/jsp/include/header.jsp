<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header>
    <div class="wrapper">
        <h1><a href="index.html" id="logo"></a></h1><!-- Setting background image in CSS -->
        <nav>
            <ul id="top_nav">
                <li><a href="index.html"><img src="images/top_icon1.gif" alt=""></a></li>
                <li><a href="#"><img src="images/top_icon2.gif" alt=""></a></li>
                <li class="end"><a href="Contact.html"><img src="images/top_icon3.gif" alt=""></a></li>
            </ul>
        </nav>
        <nav>
            <ul id="menu">
                <li <c:if test="${active == 'index'}">id="menu_active"</c:if>><a href="index.htm">Home</a></li>
                <li <c:if test="${active == 'mission'}">id="menu_active"</c:if>><a href="mission.htm">Our Mission</a></li>
                <li <c:if test="${active == 'newevent'}">id="menu_active"</c:if>><a href="news.htm">News &amp; Events</a></li>
                <li <c:if test="${active == 'help'}">id="menu_active"</c:if>><a href="help.htm">How to Help</a></li>
                <li <c:if test="${active == 'contact'}">id="menu_active"</c:if>><a href="contact.htm">Contact</a></li>
            </ul>
        </nav>
    </div>
    <div class="slider">
        <ul class="items">
            <li>
                <img src="images/about.jpg" alt="">
                <div class="banner">
                    <!--	<div class="wrapper"><span>“Our<em>Mission</em>is to<em>Help</em></span></div>
                            <div class="wrapper"><strong>Those Who<em>Need</em>It”</strong></div>-->
                </div>
            </li>
            <li>
                <img src="images/sign.jpg" alt="">
                <div class="banner">
                    <div class="wrapper"><strong>“WELCOME to</strong></div>
                    <div class="wrapper"><strong>NEW BEGINNING!”</strong></div>
                </div>
            </li>
            <li>
                <img src="images/logoNBC3.jpg" alt="">
                <div class="banner">
                    <div class="wrapper"><strong>“Can't wait to</strong></div>
                    <div class="wrapper"><strong>see YOU there!”</strong></div>
                </div>
            </li>
        </ul>
        <ul class="pagination">
            <!-- Using location.assign as a workaround for href...   -->
            <li id="banner2"><a onclick="window.open('mission.htm')">Join<span>Us</span></a></li>
            <li id="banner1"><a onclick="location.assign('help.htm')">Make<span>Donations</span></a></li>
            <li id="banner3"><a onclick="location.assign('contact.htm')">Learn<span>More</span></a></li>
        </ul>
    </div>
</header>