<%-- 
    Document   : navigator
    Created on : Apr 8, 2015, 9:51:18 PM
    Author     : Binh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.html">Admin</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <!-- /.dropdown -->
        <li class="dropdown">
            <a class="dropdown-toggle" >
                <i class="fa fa-user fa-fw"></i>  
                <c:if test="${admin != null}">
                    &nbsp;&nbsp;&nbsp;<span style="color: #333;">Wellcome, ${admin.adminName}</span>
                </c:if>
            </a>
        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" href="logout.htm">
                <i class="fa fa-sign-out fa-fw"></i> Logout
            </a>
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="admin.htm"><i class="fa fa-edit fa-fw"></i> User management</a>
                </li>
                <li>
                    <a href="news.htm"><i class="fa fa-files-o fa-fw"></i> News & Event</a>
                </li>
                <li>
                    <a href="contact.htm"><i class="fa fa-comment fa-fw"></i> Message</a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>