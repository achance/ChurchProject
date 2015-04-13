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
                <form id="NewsForm" method="POST" accept-charset="UTF-8" enctype="application/x-www-form-urlencoded" autocomplete="off" novalidate>
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
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label>Title</label>
                                                <input type="text" class="form-control" name="titlenews" id="titlenews" value="" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label>Content</label>
                                                <textarea name="contentnews" id="contentnews" rows="10">
                                                </textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>Published Time</label>
                                                <input type="text" class="form-control" name="newspublishedtime" id="newspublishedtime" value="" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label>Status</label>
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" value="1" name="newsstatus" id="newsstatus">Active
                                                    </label>
                                                </div>
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
                                    News & Event List
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
                                                        <th>Title</th>
                                                        <th>Description</th>
                                                        <th>Published Time</th>
                                                        <th>Status</th>
                                                        <th>Created Time</th>
                                                        <th>Updated Time</th>
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
                                                            <td>${item.minidesc}</td>
                                                            <td style="text-align: center">${item.published_time}</td>
                                                            <td style="text-align: center">
                                                                <c:if test="${item.status == 1}">
                                                                    <a onclick="updateStatus(${item.id}, ${item.status})" style="cursor: pointer;text-decoration: none;"><i class="fa fa-check fa-fw"></i></a>
                                                                    </c:if>
                                                                    <c:if test="${item.status == 0}">
                                                                    <a onclick="updateStatus(${item.id}, ${item.status})" style="cursor: pointer;text-decoration: none;"><i class="fa fa-times fa-fw"></i></a>
                                                                    </c:if>
                                                            </td>
                                                            <td style="text-align: center">${item.created_time}</td>
                                                            <td style="text-align: center">${item.updated_time}</td>
                                                            <td style="text-align: center"><a onclick="editNews(${item.id}, '${item.title}', '${item.description}', '${item.published_time}', '${item.status}')" style="cursor: pointer;text-decoration: none;"><i class="fa fa-file-text fa-fw"></i> Edit</a></td>
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
            CKEDITOR.replace('contentnews');
            var editor;
            CKEDITOR.on('instanceReady', function(ev)
            {
                editor = ev.editor;
                editor.setReadOnly(true);
            });

            function toggleReadOnly(isReadOnly)
            {
                editor.setReadOnly(isReadOnly);
            }



            $(document).ready(function() {
                $("#newspublishedtime").datepicker({dateFormat: 'yy/mm/dd'});
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            <c:if test="${error != ''}">
                alert("${error}");
            </c:if>


                $("#btnSave").click(function() {
                    event.preventDefault();
                    var titlenews = $('#titlenews').val();
                    var contentnews = $('textarea.contentnews').val();
                    var newspublishedtime = $('#newspublishedtime').val();
                    //                    var action = $('#action').val();
                    if (titlenews === null || titlenews === '' || contentnews === null || contentnews === '' || newspublishedtime === null || newspublishedtime === '') {
                        alert("Please enter all field!!");
                    } else {
                        $('#newspublishedtime').prop("disabled", false);
                        $('#titlenews').prop("disabled", false);
                        $('#NewsForm').submit();
                        $('#titlenews').prop("disabled", true);
                        $('#newspublishedtime').prop("true", false);
                        $("#newsstatus").attr("checked", false);
                        toggleReadOnly();
                        $('#btnSave').prop("disabled", true);
                        $('#btnCancel').prop("disabled", true);
                        $('#titlenews').val('');
                        editor.setData('');
                        $('#action').val('');
                        $('#id').val('');
                    }
                });
                $("#btnInsert").click(function() {
                    event.preventDefault();
                    $('#btnSave').prop("disabled", false);
                    $('#btnCancel').prop("disabled", false);
                    $('#btnInsert').prop("disabled", true);
                    $('#action').val('insert');
                    $('#titlenews').prop("disabled", false);
                    $('#newspublishedtime').prop("disabled", false);
                    $('#newsstatus').prop("disabled", false);
                    $("#newsstatus").attr("checked", false);
                    $('#titlenews').val('');
                    editor.setData('');
                    toggleReadOnly(false);
                });


                $("#btnCancel").click(function() {
                    event.preventDefault();
                    $('#btnSave').prop("disabled", true);
                    $('#btnCancel').prop("disabled", true);
                    $('#btnInsert').prop("disabled", false);
                    $('#titlenews').prop("disabled", true);
                    toggleReadOnly();
                    $('#newspublishedtime').prop("disabled", true);
                    $('#action').val('');
                    $('#titlenews').val('');
                    $('#newspublishedtime').val('');
                    $('#newsstatus').prop("disabled", true);
                    $('#newsstatus').val('');
                    editor.setData('');
                });
            });

            function editNews(id, title, description, published_time, status) {
                $('#id').val(id);
                $('#titlenews').val(title);
                editor.setData(description);
                $('#newspublishedtime').val(published_time);
                if(status === '1')
                {
                    $("#newsstatus").attr("checked", true);
                }
                $('#action').val('update');
                $('#btnSave').prop("disabled", false);
                $('#btnCancel').prop("disabled", false);
                $('#btnInsert').prop("disabled", true);
                $('#titlenews').prop("disabled", false);
                $('#newspublishedtime').prop("disabled", false);
                $('#newsstatus').prop("disabled", false);

                toggleReadOnly(false);
            }

            function updateStatus(id, status) {
                $('#id').val(id);
                $('#action').val('updateStatus');
                $('#status').val(status);
                $('#NewsForm').submit();
            }
        </script>
    </body>
</html>
