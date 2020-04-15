<%-- 
    Document   : index
    Created on : Apr 26, 2018, 1:27:54 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <noscript>
        <meta http-equiv="refresh" content="0; URL=./noJs.jsp">
        </noscript>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title><c:out value="${param.pageTitle}"/></title>
        <link rel="shortcut icon" href="images/favicon.png" type="image/x-icon">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/dataTables.bootstrap.min.css">
        <link href="js/jqueryUI/jquery-ui.min.css" rel="stylesheet" type="text/css" />
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
        <link href="css/jquery.dataTables.yadcf.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="font-awesome/font-awesome-4.2.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/jquery-confirm.css">
        <style>
            .loader {
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 9999;
                background: url('images/loading.gif') 50% 50% no-repeat rgb(249,249,249);
            }
            .font-style {
                text-shadow: 1px 1px 1px #ccc;
                font-size: 1.5em;
            }
            #myInput{
                width: 100%;
                font-size: 16px;
                padding: 12px 20px 12px 20px;
                border: 1px solid teal;
                height:7vh;
            }
            #myInputDiv{
                margin-top: 5px;
                height:7vh;
            }
            #myInput:hover{
                box-shadow: 2px 2px 5px teal;
            }
            .header_btn{
                    width:auto;
                    height:7vh;
                    border:1px solid teal;
                    background-color: lightgrey;
            }
            .header_btn:hover{
                   box-shadow:2px 2px 10px teal;
            }
            
            /*            .dataTables_filter {
                            display: none;
                        } */
        </style>
        <script type = "text/javascript" >
            $(window).load(function() {
                $(".loader").fadeOut("slow");
            });

        </script>
    </head>