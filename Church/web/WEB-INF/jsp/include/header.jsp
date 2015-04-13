<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="wrapper">
    <h1><a href="index.htm" id="logo"></a></h1><!-- Setting background image in CSS -->
    <nav>
        <ul id="top_nav">
            <li><a href="index.htm"><img src="images/top_icon1.gif" alt=""></a></li>
            <li><a href="news.htm"><img src="images/top_icon2.gif" alt=""></a></li>
            <li class="end"><a href="contact.htm"><img src="images/top_icon3.gif" alt=""></a></li>
        </ul>
    </nav>
    <nav>
        <ul id="menu">
            <li <c:if test="${active == 'index'}">id="menu_active"</c:if>><a href="index.htm">Home</a></li>
            <li <c:if test="${active == 'mission'}">id="menu_active"</c:if>><a href="mission.htm">Our Mission</a></li>
            <li <c:if test="${active == 'news'}">id="menu_active"</c:if>><a href="news.htm">News &amp; Events</a></li>
            <li <c:if test="${active == 'help'}">id="menu_active"</c:if>><a href="help.htm">How to Help</a></li>
            <li <c:if test="${active == 'contact'}">id="menu_active"</c:if>><a href="contact.htm">Contact</a></li>
        </ul>
    </nav>
</div>