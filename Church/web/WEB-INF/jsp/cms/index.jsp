<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Church CMS</title>
        <link rel="stylesheet" href="../css/cms.css">
    </head>
    <body>
        <div id="page-top-outer">
            <div id="page-top">
                <div id="logo">
                    <a href="index.htm">Church CMS</a>
                </div>
                <div id="user-panel">
                    <c:if test="${admin != null}">
                        <div class="showhide-account">Wellcome, ${admin.adminName}</div>
                        <div class="nav-divider">&nbsp;&nbsp;|</div>
                    </c:if>
                    <a href="logout.htm" id="logout">Logout</a>
                    <div class="clear">&nbsp;</div>
                </div>
            </div>
        </div>
        <div class="nav-outer-repeat"> 
            <div class="nav-outer">
                <div class="table">

                    <ul class="select"><li><a href="#nogo"><b>Dashboard</b><!--[if IE 7]><!--></a><!--<![endif]-->
                            <!--[if lte IE 6]><table><tr><td><![endif]-->
                            <div class="select_sub">
                                <ul class="sub">
                                    <li><a href="#nogo">Dashboard Details 1</a></li>
                                    <li><a href="#nogo">Dashboard Details 2</a></li>
                                    <li><a href="#nogo">Dashboard Details 3</a></li>
                                </ul>
                            </div>
                            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                        </li>
                    </ul>

                    <div class="nav-divider">&nbsp;</div>

                    <ul class="current"><li><a href="#nogo"><b>Products</b><!--[if IE 7]><!--></a><!--<![endif]-->
                            <!--[if lte IE 6]><table><tr><td><![endif]-->
                            <div class="select_sub show">
                                <ul class="sub">
                                    <li><a href="#nogo">View all products</a></li>
                                    <li class="sub_show"><a href="#nogo">Add product</a></li>
                                    <li><a href="#nogo">Delete products</a></li>
                                </ul>
                            </div>
                            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                        </li>
                    </ul>

                    <div class="nav-divider">&nbsp;</div>

                    <ul class="select"><li><a href="#nogo"><b>Categories</b><!--[if IE 7]><!--></a><!--<![endif]-->
                            <!--[if lte IE 6]><table><tr><td><![endif]-->
                            <div class="select_sub">
                                <ul class="sub">
                                    <li><a href="#nogo">Categories Details 1</a></li>
                                    <li><a href="#nogo">Categories Details 2</a></li>
                                    <li><a href="#nogo">Categories Details 3</a></li>
                                </ul>
                            </div>
                            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                        </li>
                    </ul>

                    <div class="nav-divider">&nbsp;</div>

                    <ul class="select"><li><a href="#nogo"><b>Clients</b><!--[if IE 7]><!--></a><!--<![endif]-->
                            <!--[if lte IE 6]><table><tr><td><![endif]-->
                            <div class="select_sub">
                                <ul class="sub">
                                    <li><a href="#nogo">Clients Details 1</a></li>
                                    <li><a href="#nogo">Clients Details 2</a></li>
                                    <li><a href="#nogo">Clients Details 3</a></li>

                                </ul>
                            </div>
                            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                        </li>
                    </ul>

                    <div class="nav-divider">&nbsp;</div>

                    <ul class="select"><li><a href="#nogo"><b>News</b><!--[if IE 7]><!--></a><!--<![endif]-->
                            <!--[if lte IE 6]><table><tr><td><![endif]-->
                            <div class="select_sub">
                                <ul class="sub">
                                    <li><a href="#nogo">News details 1</a></li>
                                    <li><a href="#nogo">News details 2</a></li>
                                    <li><a href="#nogo">News details 3</a></li>
                                </ul>
                            </div>
                            <!--[if lte IE 6]></td></tr></table></a><![endif]-->
                        </li>
                    </ul>

                    <div class="clear"></div>
                </div>
            </div>
            <div class="clear">&nbsp;</div>
        </div>
    </body>
</html>
