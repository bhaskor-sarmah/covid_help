<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
    <jsp:include page='./template/head.jsp'>
        <jsp:param name="pageTitle" value="SEARCH RESULT"/>
    </jsp:include>
    <body class="landing">
        <div class="loader"></div>
        <jsp:include page='./template/header.jsp'>
            <jsp:param name="pageTitle" value="HOME"/>
        </jsp:include>
        <div class="container-fluid" style="margin-top: 10px;">
            <div class="row">
                <c:if test="${not empty msg}">
                    <div class="col-sm-12 col-md-12">
                        <div class="col-sm-0 col-md-2"></div>
                        <div class="col-sm-12 col-md-8 text-center">
                            ${msg}
                        </div>
                        <div class="col-sm-0 col-md-2"></div>
                    </div>
                </c:if>
                <div class="col-sm-12 col-md-6">
                    <table class="table table-striped table-responsive" id="myTable">
                        <thead>
                            <tr>
                                <th>Name<br/>নাম</th>
                                <th>Address<br/>ঠিকনা</th>
                                <th>Type of Help<br/>সহায় কৰাৰ/বিচৰা পদ্ধতি</th>
                                <th>
                                    Action
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="obj" items="${memberList}">
                                <tr>
                                    <td>${obj.name}</td>
                                    <td>${obj.address}</td>
                                    <td>
                                        <c:forEach var="o" items="${obj.help_details}" varStatus="list">
                                            <p>
                                                <b>${list.count}. HELP ${o.type}</b><br>Type : ${o.helpId},<br>Details: ${o.helpDetails},<br>Quantity: ${o.helpQuantity}
                                            </p><br>
                                        </c:forEach>
                                    </td>
                                    <td>
                                        <button class="btn btn-sm btn-primary" onclick="doContact('${obj.mobile}', '${mobile}', '${captcha}', '${type}', '${name}');">Contact</button>
                                        <c:if test="${obj.src == 'APP'}">
                                            <button class="btn btn-sm btn-primary" onclick="doViewInMap('${obj.mobile}');">View In Map</button>
                                        </c:if>
                                    </td>
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
            function doContact(mm, str, c, t, n) {
                $.ajax({
                    url: './Contact',
                    type: 'POST',
                    data: 'mm=' + encodeURIComponent(mm) + '&m=' + str + '&c=' + c + '&t=' + t + '&n=' + n,
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
            //        function doContactAll(pin, str, c, t, n) {
            //            $.ajax({
            //                url: './ContactAll',
            //                type: 'POST',
            //                data: 'p=' + pin + '&m=' + str + '&c=' + c + '&t=' + t + '&n=' + n,
            //                success: function(data) {
            //                    //called when successful
            //                    $.alert({
            //                        title: "Success",
            //                        content: "All Person's contacted through SMS successfully",
            //                        type: "green",
            //                        typeAnimated: true
            //                    });
            //                },
            //                error: function(e) {
            //                    console.log(e);
            //                }
            //            });
            //        }

            function doViewInMap(mob) {
                var url = "https://covirudh.in:8443/Map/Map?mno=";
                //            alert(encodeURIComponent(mob));//l+FlOTxqJL6sCSfOUiuqeA==
                $("#mapFrame").attr("src", url + encodeURIComponent(mob));
            }
        </script>
    </body>
</html>
