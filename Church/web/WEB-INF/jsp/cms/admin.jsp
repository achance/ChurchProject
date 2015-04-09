<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <jsp:include page="include/script.jsp"/>
    </head>
    <body>
        <div id="wrapper">

            <!-- Navigation -->
            <jsp:include page="include/navigator.jsp"/>

            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">User Management</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <form id="UserForm" method="POST" accept-charset="UTF-8" enctype="application/x-www-form-urlencoded" autocomplete="off" novalidate>
                    <input type="hidden" name="action" id="action" />
                    <input type="hidden" name="id" id="id"/>
                    <input type="hidden" name="status" id="status"/>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Insert/Update
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Username:</label>
                                                <input type="text" class="form-control" name="username" id="username" value="" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label>Password:</label>
                                                <input type="password" class="form-control" name="password" id="password" value="" disabled>
                                            </div>
                                            <button type="button" id="btnInsert" class="btn btn-default">Insert</button>
                                            <button type="submit" id="btnSave" class="btn btn-default" disabled>Save</button>
                                            <button type="button" id="btnCancel" class="btn btn-default" disabled>Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    User List
                                </div>
                                <!-- /.panel-heading -->
                                <c:if test="${total == 0}">
                                    <div style="text-align: center;color: red;">No data</div>
                                </c:if>
                                <c:if test="${total > 0}">
                                    <div class="panel-body">
                                        <div class="dataTable_wrapper">
                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>Id</th>
                                                        <th>Username</th>
                                                        <th>Password</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${list}" var="item" varStatus="i">
                                                        <c:if test="${i.index%2 == 0}">
                                                            <tr class="even">
                                                            </c:if>
                                                            <c:if test="${i.index%2 != 0}">
                                                            <tr class="odd">
                                                            </c:if>
                                                            <td>${item.adminid}</td>
                                                            <td>${item.adminName}</td>
                                                            <td>${item.adminPassword}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <!-- /.panel-body -->

                                </c:if>
                            </div>
                            <!-- /.panel -->
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </form>
                <!-- /.row -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->
        <!-- jQuery -->

        <jsp:include page="include/footerscript.jsp"/>
        <script>
            $(document).ready(function() {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            <c:if test="${error != ''}">
                alert("${error}");
            </c:if>

                $("#btnInsert").click(function() {
                    event.preventDefault();
                    $('#btnSave').prop("disabled", false);
                    $('#btnCancel').prop("disabled", false);
                    $('#btnInsert').prop("disabled", true);
                    $('#action').val('insert');
                    $('#username').prop("disabled", false);
                    $('#password').prop("disabled", false);
                    $('#username').val('');
                    $('#password').val('');
                });
                $("#btnCancel").click(function() {
                    event.preventDefault();
                    $('#btnSave').prop("disabled", true);
                    $('#btnCancel').prop("disabled", true);
                    $('#btnInsert').prop("disabled", false);
                    $('#username').prop("disabled", true);
                    $('#password').prop("disabled", true);
                    $('#action').val('');
                    $('#username').val('');
                    $('#password').val('');
                });
                $("#btnSave").click(function() {
                    event.preventDefault();
                    var username = $('#username').val();
                    var password = $('#password').val();
                    if (username === null || username === '' || password === null || password === '') {
                        alert("Please enter all field!!");
                    } else {
                        $('#username').prop("disabled", true);
                        $('#password').prop("disabled", true);
                        $('#btnSave').prop("disabled", true);
                        $('#btnCancel').prop("disabled", true);
                        $('#btnInsert').prop("disabled", false);
                        $('#username').prop("disabled", false);
                        $('#password').prop("disabled", false);
                        $('#UserForm').submit();
                        $('#username').prop("disabled", true);
                        $('#password').prop("disabled", true);
                        $('#username').val('');
                        $('#password').val('');
                        $('#action').val('');
                    }
                });

            });
        </script>
    </body>
</html>
