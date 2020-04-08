<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page='./template/head.jsp'>
    <jsp:param name="pageTitle" value="Search Result"/>
</jsp:include>
<body style="overflow-x: scroll;margin-bottom: 55px;">
    <div class="loader"></div>
    <jsp:include page="./template/header.jsp"/>
    <div class="container" style="margin-top: 10px;">
        <div class="row" style="margin-bottom: 50px;">
            <div class="col-sm-0 col-md-10"></div>
            <div class="col-sm-12 col-md-2">
                <label class="eng">Site Language: </label>
                <label class="ass">Site Language: </label>
                <select class="form-control" id="langSelect" onchange="doChangeRadio(this.value);">
                    <option value="eng">ENGLISH</option>
                    <option value="ass">ASSAMESE</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-striped" id="myTable">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Mobile</th>
                            <th>Pin</th>
                            <th>State</th>
                            <th>District</th>
                            <th>Address</th>
                            <th>Helper/Seeker</th>
                            <th>Type of Help</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="obj" items="${memberList}">
                            <tr>
                                <td>${obj.name}</td>
                                <td>${obj.mobile}</td>
                                <td>${obj.pin}</td>
                                <td>${obj.state}</td>
                                <td>${obj.district}</td>
                                <td>${obj.circle}</td>
                                <td>${obj.address}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <c:if test="${not empty msg}">
            <div class="row">
                <div class="col-sm-0 col-md-3"></div>
                <div class="col-sm-12 col-md-6">
                    ${msg}
                </div>
                <div class="col-sm-0 col-md-3"></div>
            </div>
        </c:if>
    </div>
    <jsp:include page='./template/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
            $("#langSelect").val("eng");
            $(".ass").hide();
            $("#myTable").dataTable();
        });
        function doChangeRadio(str) {
            $(".loader").show();
            if (str === "eng") {
                $(".eng").show();
                $(".ass").hide();
            } else {
                $(".eng").hide();
                $(".ass").show();
            }
            $(".loader").hide();
        }
    </script>
</body>
</html>
