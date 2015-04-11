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
                        <h1 class="page-header">News And Eventt</h1>
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
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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

            
                $("#btnSave").click(function() {
                    event.preventDefault();
                    var titlenews = $('#titlenews').val();
                    var contentnews = $('#contentnews').val();
                    var action = $('#action').val();
                    if (action!='update' && (titlenews === null || titlenews === '' || contentnews === null || contentnews === '')) {
                        alert("Please enter all field!!");
                    } else {
                        $('#titlenews').prop("disabled", true);
                        $('#contentnews').prop("disabled", true);
                        $('#btnSave').prop("disabled", true);
                        $('#password').prop("disabled", false);
                        $('#UserForm').submit();
                        $('#username').prop("disabled", true);
                        $('#password').prop("disabled", true);
                        $('#username').val('');
                        $('#password').val('');
                        $('#action').val('');
                        $('#id').val('');
                    }
                });
            });

          
        </script>
    </body>
</html>
