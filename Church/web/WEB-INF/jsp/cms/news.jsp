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
                        <h1 class="page-header">News And Event</h1>
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
                                    News
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>News Title</label>
                                                <input type="text" class="form-control" name="titlenews" id="titlenews" value="" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label>News Content</label>
                                                <input type="text" class="form-control" name="contentnews" id="contentnews" value="" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label>published_time</label>
                                                <input type="text" class="form-control" name="newspublishedtime" id="newspublishedtime" value="" disabled>
                                            </div>
                                            <button type="submit" id="btnSave" class="btn btn-default" disabled>Save</button>
                                            <button type="button" id="btnInsert" class="btn btn-default">Insert</button>
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
                                    Display New and Event
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
                                                        <th>Title</th>
                                                        <th>Content</th>
                                                        <th>Created Time</th>
                                                        <th></th>
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
                                                            <td>${item.id}</td>
                                                            <td>${item.title}</td>
                                                            <td>${item.description}</td>
                                                            <td>${item.published_time}</td>
                                                            <td>
                                                                <!--<a onclick="editNews(${item.id}, '${item.title}', '${item.description}' '${item.published_time}')" style="cursor: pointer;text-decoration: none;"><i class="fa fa-file-text fa-fw"></i> Edit</a>-->
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
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
            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            <c:if test="${error != ''}">
                alert("${error}");
            </c:if>


                $("#btnSave").click(function () {
                    event.preventDefault();
                    var titlenews = $('#titlenews').val();
                    var contentnews = $('#contentnews').val();
                    var action = $('#action').val();
                    if (action != 'update' && (titlenews === null || titlenews === '' || contentnews === null || contentnews === '')) {
                        alert("Please enter all field!!");
                    } else {
                        $('#titlenews').prop("disabled", false);
                        $('#contentnews').prop("disabled", false);
                        $('#UserForm').submit();
                        $('#titlenews').prop("disabled", true);
                        $('#contentnews').prop("disabled", true);
                        $('#newspublishedtime').prop("disabled", false);
                        $('#btnSave').prop("disabled", true);
                        $('#btnCancel').prop("disabled", true);
                        $('#titlenews').val('');
                        $('#contentnews').val('');
                        $('#action').val('');
                        $('#id').val('');
                    }
                });
                $("#btnInsert").click(function () {
                    event.preventDefault();
                    $('#btnSave').prop("disabled", false);
                    $('#btnCancel').prop("disabled", false);
                    $('#btnInsert').prop("disabled", true);
                    $('#action').val('insert');
                    $('#titlenews').prop("disabled", false);
                    $('#contentnews').prop("disabled", false);
                    $('#newspublishedtime').prop("disabled", false);
                    $('#titlenews').val('');
                    $('#contentnews').val('');
                });
            });
            $("#btnCancel").click(function () {
                event.preventDefault();
                $('#btnSave').prop("disabled", true);
                $('#btnCancel').prop("disabled", true);
                $('#btnInsert').prop("disabled", false);
                $('#titlenews').prop("disabled", true);
                $('#contentnews').prop("disabled", true);
                $('#newspublishedtime').prop("disabled", true);
                $('#action').val('');
                $('#titlenews').val('');
                $('#contentnews').val('');
                $('#newspublishedtime').val('');

            });

        </script>
    </body>
</html>
