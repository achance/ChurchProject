<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News &amp; Press</title>
        <jsp:include page="include/thirdparty.jsp"/>
    </head>

    <body id="page3">
        <div class="body1">
            <div class="main">
                <!-- header -->
                <header>
                    <jsp:include page="include/header.jsp"/>
                </header>
                <!-- / header -->
                <!-- content -->
                <article id="content" class="tabs">
                    <div class="wrapper">
                        <div class="box1">
                            <div class="wrapper">
                                <section class="col1">
                                    <h2><strong>L</strong>atest<span> News</span></h2>
                                    <div class="line1">
                                        <figure class="left marg_right1"><img src="images/page3_img1.jpg" alt=""></figure>
                                        ${newsandevent.description}
                                    </div>
                                </section>
                            </div>
                        </div>	
                    </div>
                    <c:if test="${total > 0}">
                        <div class="wrapper">
                            <ul class="nav">
                                <c:forEach items="${list}" var="item" varStatus="i">
                                    <li <c:if test="${i.index==0}">class="selected"</c:if>><a href="#${item.published_time}">${item.month}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <div class="wrapper">
                            <div class="box2">
                                <c:forEach items="${list}" var="item" varStatus="i">
                                    <div class="wrapper tab-content" id="${item.published_time}">
                                        <section class="col1">
                                            <c:forEach items="${item.itemList}" var="item1" varStatus="j">
                                                <h4 <c:if test="${j.index%2 == 0}">class="color2"</c:if>><span>${item1.month}</span> ${item1.day}</h4>
                                                <p class="pad_bot2"><strong>${item1.title}</strong></p>
                                                <p class="pad_bot1">${item1.description}</p>
                                            </c:forEach>
                                        </section>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>
                </article>
                <!-- / content -->
                <!-- footer -->
                <jsp:include page="include/footer.jsp"/>
                <!-- / footer -->
            </div>
        </div>
        <script type="text/javascript">tabs.init();</script>
    </body>
</html>
