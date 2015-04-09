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
                        <h1 class="page-header">Message</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <form id="ContactForm" method="POST" accept-charset="UTF-8" enctype="application/x-www-form-urlencoded" autocomplete="off" novalidate>
                    <input type="hidden" name="action" id="action" />
                    <input type="hidden" name="id" id="id"/>
                    <input type="hidden" name="status" id="status"/>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Message List
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
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Website</th>
                                                        <th>Message</th>
                                                        <th>Created Time</th>
                                                        <th>Status</th>
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
                                                            <td>${item.name}</td>
                                                            <td>${item.email}</td>
                                                            <td>${item.web}</td>
                                                            <td>${item.message}</td>
                                                            <td style="text-align: center">${item.createdTime}</td>
                                                            <td style="text-align: center">
                                                                <c:if test="${item.status == 1}">
                                                                    <a onclick="updateStatus(${item.id}, ${item.status})" style="cursor: pointer;text-decoration: none;"><i class="fa fa-check fa-fw"></i></a>
                                                                    </c:if>
                                                                    <c:if test="${item.status == 0}">
                                                                    <a onclick="updateStatus(${item.id}, ${item.status})" style="cursor: pointer;text-decoration: none;"><i class="fa fa-times fa-fw"></i></a>
                                                                    </c:if>
                                                            </td>
                                                            <td style="text-align: center">
                                                                <a onclick="deleteContact(${item.id})" style="cursor: pointer;text-decoration: none;"><i class="fa fa-times-circle fa-fw"></i> Delete</a>
                                                            </td>
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
        <jsp:include page="include/footerscript.jsp"/>
        <script>
            $(document).ready(function() {
                $('#dataTables-example').DataTable({
                    responsive: true
                });

            <c:if test="${error != ''}">
                alert("${error}");
            </c:if>
            });

            function deleteContact(id) {
                $('#id').val(id);
                $('#action').val('delete');
                $('#ContactForm').submit();
            }

            function updateStatus(id, status) {
                $('#id').val(id);
                $('#action').val('updateStatus');
                $('#status').val(status);
                $('#ContactForm').submit();
            }


        </script>
    </body>
</html>
