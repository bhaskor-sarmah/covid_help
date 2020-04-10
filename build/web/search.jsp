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
    <div class="container-fluid" style="margin-top: 10px;">

        <div class="row">
            <c:if test="${not empty msg}">
                <div class="row" style="margin-left: 10px;">
                    <div class="col-sm-12 col-md-6">
                        ${msg}
                    </div>
                </div>
            </c:if>
            <div class="col-sm-12 col-md-6">
                <table class="table table-striped table-responsive" id="myTable">
                    <thead>
                        <tr>
                            <th>Name<br/>নাম</th>
                            <th>State<br/>ৰাজ্য</th>
                            <th>District<br/>জিলা</th>
                            <th>Address<br/>ঠিকনা</th>
                            <th>Type of Help<br/>সহায় কৰাৰ/বিচৰা পদ্ধতি</th>
                            <th>
                                Action<br/>
                                <c:if test="${searchType == 'PINCODE'}">
                                    <button class="btn btn-sm btn-primary" onclick="doContactAll('${pin}', '${mobile}', '${captcha}', '${type}');">Contact All</button>
                                </c:if>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="obj" items="${memberList}">
                            <tr>
                                <td>${obj.name}</td>
                                <td>${obj.state}</td>
                                <td>${obj.district}</td>
                                <c:if test="${obj.src == 'APP'}">
                                    <td>
                                        ${obj.locality},&nbsp;
                                        ${obj.road}
                                    </td>
                                    <td>${obj.type_of_help}</td>
                                    <td>
                                        <button class="btn btn-sm btn-primary" onclick="doContact('${obj.mobile}', '${mobile}', '${captcha}', '${type}');">Contact</button>
                                        <button class="btn btn-sm btn-primary" onclick="doViewInMap('${obj.mobile}');" style="margin-top: 5px;">View In Map</button>
                                    </td>
                                </c:if>
                                <c:if test="${obj.src == 'POR'}">
                                    <td>
                                        PS - ${obj.police_station}<br/>
                                        ${obj.locality},&nbsp;
                                        ${obj.road},&nbsp;
                                        ${obj.house_no},&nbsp;
                                    </td>
                                    <td>${obj.type_of_help}</td>
                                    <td>
                                        <button class="btn btn-sm btn-primary" onclick="doContact('${obj.mobile}', '${mobile}', '${captcha}', '${type}');">Contact</button>
                                    </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-12 col-md-6">
                <iframe src="https://covirudh.in:8443/Map/Map" height="800px;" width="100%" id="mapFrame"></iframe>
            </div>
        </div>
    </div>
    <jsp:include page='./template/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
            $("#myTable").dataTable();
        });
        $(document).ajaxStart(function() {
            $(".loader").show();
        });
        $(document).ajaxStop(function() {
            $(".loader").fadeOut('slow');
        });
        function doContact(mm, str, c, t) {
            $.ajax({
                url: './Contact',
                type: 'POST',
                data: 'mm=' + encodeURIComponent(mm) + '&m=' + str + '&c=' + c + '&t=' + t,
                success: function(data) {
                    //called when successful
                    $.alert({
                        title: "Success",
                        content: "Selected Person contacted through SMS successfully",
                        type: "green",
                        typeAnimated: true
                    });
                },
                error: function(e) {
                }
            });
        }
        function doContactAll(pin, str, c, t) {
            $.ajax({
                url: './ContactAll',
                type: 'POST',
                data: 'p=' + pin + '&m=' + str + '&c=' + c + '&t=' + t,
                success: function(data) {
                    //called when successful
                    $.alert({
                        title: "Success",
                        content: "All Person's contacted through SMS successfully",
                        type: "green",
                        typeAnimated: true
                    });
                },
                error: function(e) {
                    console.log(e);
                }
            });
        }

        function doViewInMap(mob) {
            var url = "https://covirudh.in:8443/Map/GetMap?mno=";
            $("#mapFrame").attr("src", url + mob);
        }
    </script>
</body>
</html>
