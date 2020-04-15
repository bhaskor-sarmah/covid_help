<%-- 
    Document   : index
    Created on : 7 Apr, 2020, 8:04:19 PM
    Author     : Bhaskor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page='./template/head.jsp'>
    <jsp:param name="pageTitle" value="Home"/>
</jsp:include>
<body style="margin-bottom: 70px;">
    <style type="text/css">
        @media screen and (max-width: 400px) {
            .mainContainerDiv {
                margin-bottom: 10px;
                margin-top: 10px;
            }
        }

        @media screen and (min-width: 800px) {
            .mainContainerDiv {
                margin-bottom: 50px;
                margin-top: 10px;
            }
        }
    </style>
    <div class="loader"></div>
    <jsp:include page="./template/header.jsp"/>
    <div class="container mainContainerDiv" style="margin-top: 30px;">
        <c:if test="${not empty msg}">
            <div class="row">
                <div class="col-sm-0 col-md-2"></div>
                <div class="col-sm-12 col-md-8">
                    ${msg}
                </div>
                <div class="col-sm-0 col-md-2"></div>
            </div>
        </c:if>
        <div class="row">
            <div class="col-sm-0 col-md-2"></div>
            <div class="col-sm-12 col-md-8">
                <div class="alert alert-warning text-center">
                    <!--<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>-->
                    <strong>This facility for help is being provided for the people who are currently living in Assam.</strong><br/>
                    <strong>এই সুবিধা সমুহ, বৰ্তমান সময়ত, কেৱল অসমত থকা মানুহসকলৰ বাবেহে আগবঢ়োৱা হৈছে ।</strong>
                </div>
            </div>
            <div class="col-sm-0 col-md-2">
                <form action="./DownloadApk" method="POST" target="_blank">
                    <button class="btn btn-primary" id="mobileApp" type="submit"><i class="glyphicon glyphicon-phone"></i>&nbsp;Download Mobile App</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-0 col-md-2"></div>
            <div class="col-sm-12 col-md-8">
                <div class="alert alert-warning alert-dismissable text-center">
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    <strong>Please Note that the portal will accept data in English Language Only.</strong><br/>
                    <strong>মন কৰিব, এই ৱেব পৰ্টেল টোত কেৱল মাত্ৰ ইংৰাজী ভাষাতহে তথ্য লিখিব পাৰিব ।</strong>
                </div>
            </div>
            <div class="col-sm-0 col-md-2"></div>
        </div>
        <div class="row">
            <div class="col-sm-12 col-md-12 mainboxshadow">
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./Register" method="POST">
                        <input type="hidden" name="type" value="HELP SEEKER" />
                        <div class="alert alert-danger">
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <img src="./images/seeking_help_transparent.png" height="70px;"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Register for Seeking help</label><br/>
                                    <label>সহায় বিচাৰিবৰ বাবে নিবন্ধন কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>If you need help please fill up the details by clicking "Register" button below and someone might find you from the same locality or district</p>
                                    <p>আপোনাক যদি সহায়ৰ প্ৰয়োজন, তেনেহলে, অনুগ্ৰহ কৰি তলত দিয়া "ৰেজিষ্টাৰ" বুটামটো ক্লিক কৰি আপোনাৰ সৱিশেষ জনাওক । তেতিয়া একে অঞ্ছলৰে বা একে জিলাৰে  কোনোবাই আপোনাক বিচাৰি পাব পাৰে  </p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./Register" method="POST">
                        <input type="hidden" name="type" value="HELP GIVER" />
                        <div class="alert alert-info">
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <img src="./images/giving_help_transparent.png" height="70px;"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Register for Giving help</label><br/>
                                    <label>সহায় কৰিবৰ বাবে নিবন্ধন কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>If you are willing to help please fill up the details by clicking "Register" button below and someone might find you from the same locality or district</p>
                                    <p>আপুনি যদি কাৰোবাক সহায় কৰিব বিচাৰে তেনেহলে, অনুগ্ৰহ কৰি তলত দিয়া "ৰেজিষ্টাৰ" বুটামটো ক্লিক কৰি আপোনাৰ সৱিশেষ জনাওক । তেতিয়া একে অঞ্ছলৰে বা একে জিলাৰে  কোনোবাই আপোনাক বিচাৰি পাব পাৰে</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="clearfix"></div>
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./GetSearch" method="POST">
                        <input type="hidden" name="type" value="HELP SEEKER" />
                        <div class="alert alert-danger">
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <img src="./images/search_help_transparent.png" height="70px;"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Search for help Seeker</label><br/>
                                    <label>সহায় বিচাৰোতাৰ সন্ধান কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>Search by pincode or by district to view the list of people who are in need of help</p>
                                    <p>পিন ক'ডৰ জৰিয়তে বা জিলাৰ নামেৰে সহায় বিচাৰোতাৰ তালিকা সন্ধান কৰক ।</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-xs-12 col-md-6" style="margin-top:10px;">
                    <form action="./GetSearch" method="POST">
                        <input type="hidden" name="type" value="HELP GIVER" />
                        <div class="alert alert-info">
                            <div class="row">
                                <div class="col-sm-12 text-center">
                                    <img src="./images/search_help_transparent.png" height="70px;"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 text-center" style="border-bottom: 1px solid lightgrey;margin-bottom: 10px;">
                                    <label>Search for help Giver</label><br/>
                                    <label>সহায়দাতাৰ সন্ধান কৰক</label>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <p>Search by pincode or by district to view the list of people who are willing to help.</p>
                                    <p>পিন ক'ডৰ জৰিয়তে বা জিলাৰ নামেৰে সহায়দাতাৰ তালিকা সন্ধান কৰক ।</p>
                                </div>
                                <div class="col-sm-12 text-center">
                                    <button type="submit" class="btn btn-primary">Search</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div class="row" style="margin-top: 30px;">
            <h2>FAQ - Frequently Asked Questions </h2>
            <div class="panel-group" id="faqAccordion">

                <!--Q: 1-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question1">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 1:</span></h5> 
                                Why Sahador ?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১:</span></h5> 
                                সহোদৰ কিয় লাগে ?
                            </span>
                        </h4>
                    </div>
                    <div id="question1" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 1:</span></h5>
                            <p>Due to the unprecedented situation arising due to the outbreak of Covid 19 pandemic, the life and livelihood of many people at difficult situations. In the society there lot of people who wants to give their helping hand to the needy and Sohodar is a small step by Assam Police to connect the needy to help givers through a online platform. 
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১:</span></h5>
                            <p>কভিড ১৯ মহামাৰীৰ প্ৰাদুৰ্ভাবৰ ফলত সৃষ্টি হোৱা অভুতপুৰ্ব  পৰিস্থিতিৰ বাবে বহুলোকৰ জীৱন আৰু জীৱীকাৰ ক্ষেত্ৰত সমস্যাৰ সৃষ্টি হৈছে । সমাজত এনে বহুলোক আছে যি আৰ্ত্তজনক সহায়ৰ হাত আগবঢ়াব বিচাৰে । এই ক্ষেত্ৰত অসম পুলিচৰ দ্বাৰা সহোদৰ এটা ক্ষুদ্ৰ পদক্ষেপ যাৰ দ্বাৰা আৰ্ত্তজনক অনলাইন  ব্যৱস্থাৰ জৰিয়তে সহায়দাতাৰ লগত  যোগাযোগ কৰোৱা হ'য় ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 2-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question2">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 2:</span></h5> 
                                What is the app all about?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ ২:</span></h5> 
                                এই এপ কিহৰ বাবে ?
                            </span>
                        </h4>
                    </div>
                    <div id="question2" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 2:</span></h5>
                            <p>It is basically  an app that will  allow you to help and find any help near your location during this pandemic situation in Assam. It has feature to find help and help seeker using map or address or mobile no.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ২:</span></h5>
                            <p>এই এপৰ জৰিয়তে আপুনি, আপোনাৰ ওচৰত থকা সহায় বিচাৰোতা বা সহায় দাতাৰ সন্ধান কৰিব পাৰিব । এই এপত ভৌগোলিক অৱস্থিতিৰ জৰিয়তে সহায় বিচাৰোতা বা সহায় দাতাৰ সন্ধান কৰাত অতি সহায়ক হয় ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 3-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question3">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 3:</span></h5> 
                                How do I register to be a help giver?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ৩:</span></h5> 
                                সহায়দাতা হিচাৱে মই কেনেকৈ ৰেজিষ্টাৰ কৰিম ?
                            </span>
                        </h4>
                    </div>
                    <div id="question3" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 3:</span></h5>
                            <p>You can download the app Sahodar from the Play Store or visit our website https://sahodar.org/ . You will find the option "Register for Giving Help", where you can register yourself as a Help Giver.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ৩:</span></h5>
                            <p>আপুনি সহোদৰ এপটো গুগল প্লে ষ্ট'ৰৰ পৰা  দাউনল'ড কৰিব পাৰে  বা আমাৰ ৱেৱছাইট https://sahodar.org/  ত যাৱ পাৰে । এই এপ টোত সহায় কৰিবৰ বাবে ৰেজিষ্টাৰ কৰক বুলি এটা বুটন পাব য'ত আপুনি সহায় কৰোতা হিচাবে ৰেজিষ্টাৰ কৰিব পাৰে ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 4-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question4">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 4:</span></h5> 
                                How do I serach for people willing to help near me ?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ৪:</span></h5> 
                                মই মোৰ কাষত থকা সহায় বিচৰা মানুহ কেনেকৈ বিচাৰিম ?
                            </span>
                        </h4>
                    </div>
                    <div id="question4" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 4:</span></h5>
                            <p>You can download the app Sahodar from the Play Store or visit our website https://sahodar.org/ . You will find the option "Search for Help Seekers", where you can search by pincode or by district to view the list of people who are willing to help.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ৪:</span></h5>
                            <p>আপুনি সহোদৰ এপটো গুগল প্লে ষ্ট'ৰৰ পৰা  দাউনল'ড কৰিব পাৰে  বা আমাৰ ৱেৱছাইট https://sahodar.org/  ত যাৱ পাৰে । এই এপ টোত সহায় বিচাৰোতা  বুলি এটা বুটন পাব য'ত আপুনি পিন কডৰ সহায়েৰে বা জিলাৰ নামেৰে সহায় বিচাৰোতাৰ লিষ্ট খন চাব পাৰে ।  
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 5-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question5">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 5:</span></h5> 
                                Who will help me? 
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ৫:</span></h5> 
                                মোক কোনে সহায় কৰিব ?
                            </span>
                        </h4>
                    </div>
                    <div id="question5" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 5:</span></h5>
                            <p>Ideally any person in your locality who is volunteering and willing to help.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ৫:</span></h5>
                            <p>আপোনাৰ ঘৰৰ ওচৰৰ যিকোনো মানুহেই পাৰিব যি আপোনাক  সহায় কৰিব বিচাৰে 
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 6-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question6">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 6:</span></h5> 
                                How long will it take the help to reach me? 
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ৬:</span></h5> 
                                মই সহায় পাবৰ বাবে কিমান দিন লাগিব ?
                            </span>
                        </h4>
                    </div>
                    <div id="question6" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 6:</span></h5>
                            <p>Though the effort of Sohador is in addition to all other help being organised by state and other agencies, the exact time is difficult to estimate and depends on help available through this platform. Assam Police will daily monitor the locality wise help seekers and givers position and coordinate between help givers and help seekers so that the help reach the needy at the fastest possible time.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ৬:</span></h5>
                            <p>
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 7-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question7">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 7:</span></h5> 
                                Whom will my help go to?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ৭:</span></h5> 
                                মোৰ সহায় কোনে লাভ কৰিব ?
                            </span>
                        </h4>
                    </div>
                    <div id="question7" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 7:</span></h5>
                            <p>Assam Police through the platform Sahodar will try to bring the help from the Help givers of the same locality to the help seekers in the same locality or at max from the same district.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ৭:</span></h5>
                            <p>সহোদৰ এপৰ জৰিয়তে অসম পুলিচে, একে অঞ্ছলৰে বা একে জিলাৰে সহায়দাতাৰ পৰা সহায় আনি সহায় বিচাৰোতাক দিব বিচাৰিছে ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 8-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question8">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 8:</span></h5> 
                                How will I get to know in case I came in contact with covid '+' person? 
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ৮:</span></h5> 
                                মই কভিড ১৯ পজিটিভ হোৱা বেমাৰীৰ সংৰ্স্পশলৈ আহিছিলো বুলি  কেনেকৈ জানিম ?
                            </span>
                        </h4>
                    </div>
                    <div id="question8" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 8:</span></h5>
                            <p>Please follow the guidelines specified by GOI and GOA and in addition can install Arugya SETU App.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ৮:</span></h5>
                            <p>অনুগ্ৰহ কৰি ভাৰত বা অসম চৰকাৰৰ গাইডলাইন সমুহ পঢ়ক   অথবা আৰোগ্য সেতু এপটো ইনষ্টল কৰক 
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 9-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question9">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 9:</span></h5> 
                                How will I get tested if I have symptoms? 
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ৯:</span></h5> 
                                মোৰ কিবা লক্ষণ দেখিলে মই কেনেকৈ টেষ্ট কৰিম ?
                            </span>
                        </h4>
                    </div>
                    <div id="question9" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 9:</span></h5>
                            <p>Please connect the district authority on the helpline numbers provided and they will guide for needful.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ৯:</span></h5>
                            <p>জিলা অধিকাৰী সকলক তেওঁলোকৰ হেল্পলাইন নম্বৰত  যোগাযোগ কৰক 
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 10-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question10">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 10:</span></h5> 
                                What kind of help can be sought
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১০:</span></h5> 
                                কেনে ধৰনৰ সহায় আমি বিচাৰিব পাৰো ?
                            </span>
                        </h4>
                    </div>
                    <div id="question10" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 10:</span></h5>
                            <p>The following kinds of help are offering right now i.e  emergency related to medicine, food, shelter only
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১০:</span></h5>
                            <p>বৰ্ত্তমান আমি চিকিৎসা,  খাদ্য আৰু আশ্ৰয় সম্পৰ্কীয় সহায় হে বিচাৰিব পাৰো ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 11-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question11">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 11:</span></h5> 
                                How will the help reach to help seeker
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১১:</span></h5> 
                                সহায় বিচাৰিবৰ বাবে আবেদন কৰিলে সহায় কেনেকৈ আমি পাব পাৰিম ?
                            </span>
                        </h4>
                    </div>
                    <div id="question11" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 11:</span></h5>
                            <p>When a help seeker  register himself as help seeker then Your local police authority will find you easily and coordinate between help giver and help seeker to bring the help to the needy.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১১:</span></h5>
                            <p>যেতিয়া আপুনি সহায় বিচাৰি আপোনাৰ নামটো ৰেজিষ্টাৰ কৰিব তেতিয়া আপোনাৰ ভৌগোলিক  অৱস্থিতিৰ জৰিয়তে স্থানীয় পুলিচ বিভাগে সহজতে আপোনাক বিচাৰি পাব আৰু সহায় দাতা আৰু সহায় বিচাৰোতাৰ মাজত সংযোগ স্থাপন কৰি সহায় আগবঢ়োৱাত সমৰ্থ হ'ব ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 12-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question12">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 12:</span></h5> 
                                How a user can contact a registered help seeker or help giver ?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ ১২:</span></h5> 
                                এজন ব্যৱহাৰকাৰীয়ে কেনেকৈ ৰেজিষ্টাৰ হৈ থকা সহায় বিচাৰোতা আৰু সহায় কাৰীক  যোগাযোগ কৰিব পাৰিব ?
                            </span>
                        </h4>
                    </div>
                    <div id="question12" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 12:</span></h5>
                            <p>The user can contact the registered help seeker or help giver found in the search result  by clicking in the contact button
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১২:</span></h5>
                            <p>এজন ব্যৱহাৰকাৰীয়ে যোগাযোগ বুটন টো টিপি ৰেজিষ্টাৰ হৈ থকা সহায় দাতা আৰু সহায় বিচাৰোতাৰ সন্ধান কৰিব পাৰিব 
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 13-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question13">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 13:</span></h5> 
                                How map view and search will help me?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১৩:</span></h5> 
                                মেপ ভিউ আৰু সন্ধান টোৱে মোক কিদৰে সহায় কৰিব 
                            </span>
                        </h4>
                    </div>
                    <div id="question13" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 13:</span></h5>
                            <p>It will help you find the helper and help seeker location.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১৩:</span></h5>
                            <p>ই আপোনাক সহায় দাতা আৰু সহায় বিচাৰোতাৰ ভৌগোলিক অৱস্থিতিৰ বিষয়ে জনাব 
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 14-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question14">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 14:</span></h5> 
                                How will symptom tracker work?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১৪:</span></h5> 
                                চিম্প্টম ট্ৰেকাৰ টোৱে কেনেকে কাম কৰে ?
                            </span>
                        </h4>
                    </div>
                    <div id="question14" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 14:</span></h5>
                            <p>It will help govt get a rough analytical data about the health condition of the people and help govt to prepare and response better in the future.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১৪:</span></h5>
                            <p>ইয়াৰ জৰিয়তে চৰকাৰে জনসাধাৰনৰ মোতামোটি শাৰিৰীক অবস্থাৰ তথ্য লাভ কৰিব আৰু ইয়াৰ জৰিয়তে চৰকাৰে ভবিষ্যতে সহায় কৰিবলৈ সমৰ্থ হ'ব । 
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 15-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question15">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 15:</span></h5> 
                                If you need help what will you do?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১৫:</span></h5> 
                                আপোনাক সহায় লাগিলে কি কৰিব ?
                            </span>
                        </h4>
                    </div>
                    <div id="question15" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 15:</span></h5>
                            <p>First you register as help seeker giving all necessary information
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১৫:</span></h5>
                            <p>প্ৰথমতে আপুনি সহায় বিচাৰোতা হিচাবে আপোনাৰ সকলো তথ্য দি ৰেজিষ্টাৰ কৰক 
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 16-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question16">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 16:</span></h5> 
                                If you want to help what will you do?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্  ১৬:</span></h5> 
                                আপুনি সহায় কৰিব বিচাৰিছে যদি কি কৰিব ?
                            </span>
                        </h4>
                    </div>
                    <div id="question16" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 16:</span></h5>
                            <p>First you register yourself as help giver giving all necessary information
                            </p>
                            <h5><span class="label label-primary">উত্তৰ  ১৬:</span></h5>
                            <p>প্ৰথমতে আপুনি সহায়দাতা হিচাবে আপোনাৰ সকলো তথ্য দি ৰেজিষ্টাৰ কৰক 
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 17-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question17">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 17:</span></h5> 
                                Can I seek help from outside of Assam?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১৭:</span></h5> 
                                মই অসমৰ বাহিৰৰ পৰা সহায় বিচাৰিব পাৰো নেকি?
                            </span>
                        </h4>
                    </div>
                    <div id="question17" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 17:</span></h5>
                            <p>Yes you can but not through the platform of Sahodar. The Sahador application is limited for the people living in Assam.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১৭:</span></h5>
                            <p>নিশ্চয় পাৰে । কিন্তু সহোদৰ এপৰ জৰিয়তে নোৱাৰিব , কাৰন সহোদৰ এপটো কেৱল অসমত থকা মানুহৰ বাবেহে ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 18-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question18">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 18:</span></h5> 
                                Can I provide help from outside of Assam?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১৮:</span></h5> 
                                মই অসমৰ বাহিৰৰ পৰা কাৰোবাক সহায় আগবঢ়াব পাৰো নেকি?
                            </span>
                        </h4>
                    </div>
                    <div id="question18" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 18:</span></h5>
                            <p>Yes you can but not through the platform of Sahodar. The Sahador application is limited for the people living in Assam
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১৮:</span></h5>
                            <p>নিশ্চয় পাৰে । কিন্তু সহোদৰ এপৰ জৰিয়তে নোৱাৰিব , কাৰন সহোদৰ এপটো কেৱল অসমত থকা মানুহৰ বাবেহে ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 19-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question19">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 19:</span></h5> 
                                Can I search the Govt approved facilities like Tyre repairing shop, covid hospitals etc in the Map !
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ১৯:</span></h5> 
                                মই চৰকাৰে আগবঢ়োৱা সুবিধা সমুহ যেনে টায়াৰ বনোৱা দোকান , কভিড হস্পিটেল ইত্যাদি মেপত পাব পাৰোনে ?
                            </span>
                        </h4>
                    </div>
                    <div id="question19" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 19:</span></h5>
                            <p>Yes, the Map has the facility to search for different establishments and the new and new locations will be added as when geo locations are prepared and released by the Government and district authorities
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ১৯:</span></h5>
                            <p>নিশ্চয় পাৰে । মেপত সেই চাব পৰা সুবিধা আছে ।
                            </p>
                        </div>
                    </div>
                </div>

                <!--Q: 20-->
                <div class="panel panel-default ">
                    <div class="panel-heading accordion-toggle question-toggle collapsed" data-toggle="collapse" data-parent="#faqAccordion" data-target="#question20">
                        <span class="pull-right"><i class="glyphicon glyphicon-chevron-down"></i></span>
                        <h4 class="panel-title">
                            <span class="question">
                                <h5><span class="label label-success">Question 20:</span></h5> 
                                How to display geolocation of Help seeker and Help giver in the Map so that your local police authority can easily locate you and coordinate in bringing the help from the help giver to help seeker ?
                                <br/>
                                <h5><span class="label label-success">প্ৰশ্ ২০:</span></h5> 
                               সহায়দাতা আৰু সহায় বিচাৰোতাৰ ভৌগোলিক অৱস্থিতি মেপত  কেনেকৈ দেখুৱাম  যাতে স্থানীয় পুলিচ বিভাগে সহজে আপোনাক বিচাৰি পায় আৰু সহায় দাতা আৰু সহায় বিচাৰোতাৰ মাজত সংযোগ স্থাপন কৰি সহায় আগবঢ়োৱাত সমৰ্থ হয় । 
                            </span>
                        </h4>
                    </div>
                    <div id="question20" class="panel-collapse collapse" style="height: 0px;">
                        <div class="panel-body answer">
                            <h5><span class="label label-primary">Answer 20:</span></h5>
                            <p>To display your current location in the map you may download the android app by clicking the link below (available for only android phone. The same will also be available in play store soon) and submit your request as help giver or help seeker. Your local police authority will find you easily from your geolocation and coordinate between help giver and help seeker to bring the help to the needy.
                            </p>
                            <h5><span class="label label-primary">উত্তৰ ২০:</span></h5>
                            <p>সহায়দাতা আৰু সহায় বিচাৰোতাৰ ভৌগোলিক অৱস্থিতি মেপত দেখুৱাবলৈ তলত দিয়া লিংকটোত ক্লিক কৰি আপুনি ডাউনল'ড কৰিব লাগিব এন্দ্ৰইদ এপ । এপ টোত আপুনি সহায় দাতা বা  সহায় বিচাৰোতা হিচাপে আবেদন কৰিব পাৰিব । স্থানীয় পুলিচ বিভাগে তেতিয়া সহজে আপোনাক ভৌগোলিক অৱস্থিতিৰ জৰিয়তে  লগ পাব আৰু সহায় দাতা আৰু সহায় বিচাৰোতাৰ মাজত সংযোগ স্থাপন কৰি সহায় আগবঢ়োৱাত সমৰ্থ হ'ব ।
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
<!--    <div id="myModal" class="modal fade" role="dialog" style="font-size: small;">
        <div class="modal-dialog modal-lg">
             Modal content
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Please Note</h4>
                </div>
                <div class="modal-body">
                    <h2>Android Application Installation Instruction</h2>
                    <ul>
                        <li>While the App is being published on <pre>Play Store</pre> you can download the Android App from our server</li>
                        <li>Downloading App from our server might show warning on your device <pre>This file might be harmful to your device.</pre> 
                            <b>Please be assured we respect your privacy, no harm will be done to your device and personal information collected are those only user allows or provides.</b></li>
                        <li>Once downloaded open the Settings app on your Android device.</li>
                        <li>Tap <pre>Security</pre> This will open the Security menu.</li>
                        <li>Scroll down and check the <pre>Unknown sources</pre> box. Tap "OK" to confirm that you want to enable this.</li>
                        <li>Tap the APK file. This will immediately open the installer for the app</li>
                        <li>Tap "Install" to install the app. </li>
                    </ul>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>-->
    <jsp:include page='./template/footer.jsp' />
    <script type="text/javascript">
        $(document).ready(function() {
            $('.accordion-toggle').on('click', function() {
                $(this).find('.glyphicon').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-up');
            });
        });

        $("#mobileApp").click(function() {
            $("#myModal").modal('show');
        });
    </script>
</body>
</html>

