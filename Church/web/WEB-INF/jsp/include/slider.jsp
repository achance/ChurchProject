<%-- 
    Document   : slider
    Created on : Apr 6, 2015, 9:05:57 AM
    Author     : Binh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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