<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <jsp:include page='./template/head.jsp'>
        <jsp:param name="pageTitle" value="FAQ"/>
    </jsp:include>
    <body class="landing">
        <div class="loader"></div>
        <jsp:include page='./template/header.jsp'>
            <jsp:param name="pageTitle" value="SAHODAR"/>
        </jsp:include>
        <!-- Two -->
        <section id="two" class="wrapper special">
            <c:if test="${not empty msg}">
                <div class="row">
                    <div class="col-sm-0 col-md-2"></div>
                    <div class="col-sm-12 col-md-8">
                        ${msg}
                    </div>
                    <div class="col-sm-0 col-md-2"></div>
                </div>
            </c:if>
            <div class="inner">
                <header class="major narrow">
                    <h2>FAQ (Frequently Asked Questions)</h2>
                </header>
                <div class="row" style="margin-top: 30px;">
                    <div class="panel-group" id="faqAccordion">
                        <!--Q: 1-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question1"
                                aria-expanded="false"
                                >
                                <span class="pull-right"><i class="fa fa-2x fa-angle-down"></i></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 1:</span>
                                        </h5>
                                        Why Sahodar? 
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১:</span></h5>
                                        সহোদৰ কিয় লাগে ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question1"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 1:</span></h5>
                                    <p>
                                        The unprecedented situation arising due to the outbreak of Covid 19 pandemic has caused difficulties in the life and livelihood of many people. In the society, there lot of people who want to give their helping hand to the needy and Sahodar is a small step by Assam Police to connect the needy to help givers through a online platform. 
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১:</span></h5>
                                    <p>
                                        কভিড ১৯ মহামাৰীৰ প্ৰাদুৰ্ভাবৰ ফলত সৃষ্টি হোৱা অভুতপুৰ্ব  পৰিস্থিতিৰ বাবে বহুলোকৰ জীৱন আৰু জীৱিকা ক্ষেত্ৰত সমস্যাৰ সৃষ্টি হৈছে । সমাজত এনে বহুলোক আছে যি আৰ্ত্তজনক সহায়ৰ হাত আগবঢ়াব বিচাৰে । এই ক্ষেত্ৰত অসম আৰক্ষীৰ দ্বাৰা সহোদৰ এটা ক্ষুদ্ৰ পদক্ষেপ যাৰ দ্বাৰা আৰ্ত্তজনক অনলাইন  ব্যৱস্থাৰ জৰিয়তে সহায়দাতাৰ লগত  যোগাযোগ কৰোৱা হ'য় ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 2-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question2"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 2:</span>
                                        </h5>
                                        What is the app all about?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ ২:</span></h5>
                                        এই এপ কিহৰ বাবে ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question2"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 2:</span></h5>
                                    <p>
                                        It is basically  an app that will  allow you to help and find any help near your location during this pandemic situation in Assam. It has feature to find help and help seeker using map or address or mobile no.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ২:</span></h5>
                                    <p>
                                        এই এপৰ জৰিয়তে আপুনি, আপোনাৰ ওচৰত থকা সহায় বিচাৰোতা বা সহায় দাতাৰ সন্ধান কৰিব পাৰিব । এই এপত ভৌগোলিক অৱস্থিতিৰ জৰিয়তে সহায় বিচাৰোতা বা সহায় দাতাৰ সন্ধান কৰাত অতি সহায়ক হয় ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 3-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question3"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 3:</span>
                                        </h5>
                                        How do I seek help?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ৩:</span></h5>
                                        মই কেনেকৈ সহায় বিচাৰিম  ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question3"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 3:</span></h5>
                                    <p>
                                        You can download the app Sahodar from the Play Store or visit our website https://sahodar.org/
                                        You will find the option "Register for Seeking Help", where you can register yourself as a Help Seeker.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ৩:</span></h5>
                                    <p>
                                        আপুনি সহোদৰ এপটো গুগল প্লে ষ্ট'ৰৰ পৰা  ডাউনল'ড কৰিব পাৰে  বা আমাৰ ৱেৱছাইট https://sahodar.org/  ত চাৱ পাৰে । এই এপ টোত আপুনি  "সহায় বিচাৰোতা" হিচাবে   ৰেজিষ্টাৰ  কৰিবলৈ এটা  বুটন পাব য'ত আপুনি  সহায় বিচাৰোতা হিচাবে   ৰেজিষ্টাৰ কৰিব পাৰিব ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 4-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question4"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 4:</span>
                                        </h5>
                                        How do I search for people in need of help near me?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ৪:</span></h5>
                                        মই মোৰ কাষত থকা সহায় বিচৰা মানুহ কেনেকৈ বিচাৰিম ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question4"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 4:</span></h5>
                                    <p>
                                        You can download the app Sahodar from the Play Store or visit our website https://sahodar.org/
                                        You will find the option "Search for Help Seekers", where you can search by pincode or by district to view the list of people who are willing to help.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ৪:</span></h5>
                                    <p>
                                        আপুনি সহোদৰ এপটো গুগল প্লে ষ্ট'ৰৰ পৰা  ডাউনল'ড  কৰিব পাৰে  বা আমাৰ ৱেৱছাইট https://sahodar.org/  ত চাব পাৰে । এই এপ টোত "সহায় বিচাৰোতাৰ সন্ধান"   বুলি এটা বুটন পাব য'ত আপুনি পিন কডৰ সহায়েৰে বা জিলাৰ নামেৰে সহায় বিচাৰোতাৰ তালিকা খন চাব পাৰিব ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 5-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question5"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 5:</span>
                                        </h5>
                                        Who will help me? 
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ৫:</span></h5>
                                        মোক কোনে সহায় কৰিব ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question5"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 5:</span></h5>
                                    <p>
                                        Ideally any person in your locality who is volunteering and willing to help.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ৫:</span></h5>
                                    <p>
                                        আপোনাৰ ঘৰৰ ওচৰৰ এনে ব্যক্তি,  যিয়ে আপোনাক  সহায় কৰিব বিচাৰে,  তেওঁলোকেই আপোনাক সহায় কৰিব পাৰিব । 
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 6-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question6"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 6:</span>
                                        </h5>
                                        How long will it take the help to reach me? 
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ৬:</span></h5>
                                        মোৰ ওচৰলৈ সহায় আহি পাবলৈ কিমান সময়ৰ প্ৰয়োজন হ'ব ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question6"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 6:</span></h5>
                                    <p>
                                        Sahador along with all the help organised by state and other agencies are putting in continous effort, the exact time is difficult to estimate and depends on help available through this platform. Assam Police will daily monitor the locality wise help seekers and givers position and coordinate between them so that the help reach the needy at the fastest possible time.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ৬:</span></h5>
                                    <p>
                                        সহোদৰৰ সৈতে ৰাজ্য চৰকাৰ আৰু অন্য অনুস্থানে একেধাৰে সহায়ৰ প্ৰচেষ্টা কৰিছে যদিও প্ৰকৃত সময় অনুধাবন কৰাটো টান আৰু ই নিৰ্ভৰ কৰে এই ব্যৱস্থাটোৰ জৰিয়তে পাব পৰা সময়ৰ ওপৰত । অসম  আৰক্ষীয়ে  দৈনন্দিন অঞ্ছল ভিত্তিত সহায় বিচাৰোতা আৰু সহায়দাতাৰ তথ্য নিৰিক্ষণ কৰিব আৰু তেওঁলোকৰ মাজতে সমন্বয় সাধন কৰিব যাতে আৰ্ত্তজনৰ ওচৰত ক্ষিপ্ৰতাৰে সহায় উপস্থিত হ'য় ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 7-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question7"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 7:</span>
                                        </h5>
                                        Whom will my help go to?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ৭:</span></h5>
                                        মোৰ সহায় কোনে লাভ কৰিব ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question7"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 7:</span></h5>
                                    <p>
                                        Assam Police through the platform Sahodar will try to bring the help from the Help givers of the same locality to the help seekers in the same locality or at max from the same district.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ৭:</span></h5>
                                    <p>
                                        সহোদৰ এপৰ জৰিয়তে অসম আৰক্ষীয়ে, একে অঞ্ছলৰে বা একে জিলাৰে সহায়দাতাৰ পৰা সহায় আনি সহায় বিচাৰোতাক দিব বিচাৰিছে ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 8-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question8"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 8:</span>
                                        </h5>
                                        How will I get to know in case I came in contact with covid '+' person? 
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ৮:</span></h5>
                                        মই কভিড ১৯ পজিটিভ হোৱা  ৰোগীৰ   সংৰ্স্পশলৈ আহিছিলো বুলি  কেনেকৈ জানিম ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question8"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 8:</span></h5>
                                    <p>
                                        Please follow the guidelines specified by GOI and GOA and in addition you can install Arugya SETU App.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ৮:</span></h5>
                                    <p>
                                        অনুগ্ৰহ কৰি ভাৰত  চৰকাৰ  বা অসম চৰকাৰৰ গাইডলাইন সমুহ  পালন কৰক  অথবা আৰোগ্য সেতু এপটো ইনষ্টল কৰক ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 9-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question9"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 9:</span>
                                        </h5>
                                        How will I get tested if I have symptoms? 
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ৯:</span></h5>
                                        মোৰ কিবা লক্ষণ দেখিলে মই কেনেকৈ পৰীক্ষা কৰাম  ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question9"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 9:</span></h5>
                                    <p>
                                        Please contact the district authority on the helpline numbers provided for guidance.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ৯:</span></h5>
                                    <p>
                                        জিলা  বিষয়া সকলক তেওঁলোকৰ হেল্পলাইন নম্বৰত  পৰামৰ্শৰ বাবে যোগাযোগ কৰক ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 10-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question10"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 10:</span>
                                        </h5>
                                        What kind of help can be sought
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১০:</span></h5>
                                        কেনে ধৰনৰ সহায় আমি বিচাৰিব পাৰো ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question10"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 10:</span></h5>
                                    <p>
                                        The following kinds of help are offering right now i.e  emergency related to medicine, food, shelter only
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১০:</span></h5>
                                    <p>
                                        বৰ্ত্তমান আমি চিকিৎসা,  খাদ্য আৰু আশ্ৰয় সম্পৰ্কীয় সহায় হে বিচাৰিব পাৰো ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 11-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question11"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 11:</span>
                                        </h5>
                                        How will the help reach to help seeker
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১১:</span></h5>
                                        সহায় বিচাৰিবৰ বাবে আবেদন কৰিলে সহায় আমি  কেনেকৈ পাব পাৰিম ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question11"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 11:</span></h5>
                                    <p>
                                        When a help seeker  register himself as help seeker then Your local police authority will find you easily and coordinate between help giver and help seeker to bring the help to the needy.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১১:</span></h5>
                                    <p>
                                        যেতিয়া আপুনি সহায় বিচাৰি আপোনাৰ নামটো ৰেজিষ্টাৰ কৰিব তেতিয়া আপোনাৰ ভৌগোলিক  অৱস্থিতিৰ জৰিয়তে স্থানীয় আৰক্ষী বিভাগে সহজতে আপোনাক বিচাৰি পাব আৰু সহায় দাতা আৰু সহায় বিচাৰোতাৰ মাজত সংযোগ স্থাপন কৰি সহায় আগবঢ়োৱাত সমৰ্থ হ'ব ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 12-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question12"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 12:</span>
                                        </h5>
                                        How a user can contact a registered help seeker or help giver 
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ ১২:</span></h5>
                                        এজন ব্যৱহাৰকাৰীয়ে কেনেকৈ ৰেজিষ্টাৰ হৈ থকা সহায় বিচাৰোতা আৰু সহায় কাৰীক  যোগাযোগ কৰিব পাৰিব ? 
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question12"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 12:</span></h5>
                                    <p>
                                        The user can contact the registered help seeker or help giver found in the search result  by clicking in the contact button
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১২:</span></h5>
                                    <p>
                                        এজন ব্যৱহাৰকাৰীয়ে যোগাযোগ বুটন টো টিপি ৰেজিষ্টাৰ হৈ থকা সহায় দাতা আৰু সহায় বিচাৰোতাৰ সন্ধান কৰিব পাৰিব ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 13-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question13"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 13:</span>
                                        </h5>
                                        How map view and search will help me?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১৩:</span></h5>
                                        মেপ ভিউ আৰু সন্ধান কাৰ্য্য ই মোক কিদৰে সহায় কৰিব 
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question13"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 13:</span></h5>
                                    <p>
                                        It will help you find the helper and help seeker location.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১৩:</span></h5>
                                    <p>
                                        ই আপোনাক সহায় দাতা আৰু সহায় বিচাৰোতাৰ ভৌগোলিক অৱস্থিতিৰ বিষয়ে জনাব
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 14-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question14"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 14:</span>
                                        </h5>
                                        How will symptom tracker work?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১৪:</span></h5>
                                        চিম্প্টম ট্ৰেকাৰ টোৱে কেনেকে কাম কৰে ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question14"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 14:</span></h5>
                                    <p>
                                        It will help govt get a rough analytical data about the health condition of the people and help govt to prepare and response better in the future.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১৪:</span></h5>
                                    <p>
                                        ইয়াৰ জৰিয়তে চৰকাৰে জনসাধাৰনৰ মোটামোটি শাৰিৰীক অবস্থাৰ তথ্য লাভ কৰিব আৰু ইয়াৰ জৰিয়তে চৰকাৰে ভবিষ্যতে সহায় কৰিবলৈ সমৰ্থ হ'ব । 
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 15-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question15"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 15:</span>
                                        </h5>
                                        If you need help what will you do?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১৫:</span></h5>
                                        আপোনাক সহায় লাগিলে কি কৰিব ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question15"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 15:</span></h5>
                                    <p>
                                        First you register as help seeker giving all necessary information
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১৫:</span></h5>
                                    <p>
                                        প্ৰথমতে আপুনি সহায় বিচাৰোতা হিচাবে আপোনাৰ সকলো তথ্য দি ৰেজিষ্টাৰ কৰক 
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 16-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question16"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 16:</span>
                                        </h5>
                                        If you want to help what will you do?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১৬:</span></h5>
                                        আপুনি সহায় কৰিব বিচাৰিছে যদি কি কৰিব ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question16"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 16:</span></h5>
                                    <p>
                                        First you register yourself as help giver giving all necessary information
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১৬:</span></h5>
                                    <p>
                                        প্ৰথমতে আপুনি সহায়দাতা হিচাবে আপোনাৰ সকলো তথ্য দি ৰেজিষ্টাৰ কৰক 
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 17-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question17"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 17:</span>
                                        </h5>
                                        Can I seek help from outside of Assam?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১৭:</span></h5>
                                        মই অসমৰ বাহিৰৰ পৰা সহায় বিচাৰিব পাৰো নেকি?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question17"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 17:</span></h5>
                                    <p>
                                        Yes, you can but not through the platform of Sahodar.
                                        The Sahodar applicatin is limited for the people living in Assam.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১৭:</span></h5>
                                    <p>
                                        নিশ্চয় পাৰে । কিন্তু সহোদৰ এপৰ জৰিয়তে নোৱাৰিব , কাৰন সহোদৰ এপটো কেৱল অসমত থকা মানুহৰ বাবেহে ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 18-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question18"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 18:</span>
                                        </h5>
                                        Can I provide help from outside of Assam?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১৮:</span></h5>
                                        মই অসমৰ বাহিৰৰ পৰা কাৰোবাক সহায় আগবঢ়াব পাৰো নেকি?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question18"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 18:</span></h5>
                                    <p>
                                        Yes, you can but not through the platform of Sahodar.
                                        The Sahodar applicatin is limited for the people living in Assam.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১৮:</span></h5>
                                    <p>
                                        নিশ্চয় পাৰে । কিন্তু সহোদৰ এপৰ জৰিয়তে নোৱাৰিব , কাৰন সহোদৰ এপটো কেৱল অসমত থকা মানুহৰ বাবেহে ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 19-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question19"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 19:</span>
                                        </h5>
                                        Can I search the Govt approved facilities like Tyre repairing shop, covid hospitals etc in the Map !
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ১৯:</span></h5>
                                       মই চৰকাৰে আগবঢ়োৱা সুবিধা সমুহ যেনে টায়াৰ বনোৱা দোকান , কভিড হস্পিটেল ইত্যাদি মেপত পাব পাৰোনে ?
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question19"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 19:</span></h5>
                                    <p>
                                       Yes, the Map has the facility to search for different establishments and new locations will be added as and when geolocations are prepared and released by the Government and district authorities.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ১৯:</span></h5>
                                    <p>
                                    নিশ্চয় পাৰে । মেপত বিভিন্ন   প্ৰতিস্থান  সমুহ  চাব পৰা সুবিধা আছে । তদুপৰি  যেতিয়াই  চৰকাৰে  নতুন নতুন স্থানৰ  ভৌগোলিক অৱস্থিতিৰ চিহ্ন সমুহ  প্ৰকাশ কৰিব,  সেইবোৰ মেপত  সংযোগ কৰা হ'ব ।
                                    </p>
                                </div>
                            </div>
                        </div>

                        <!--Q: 20-->
                        <div class="panel panel-default">
                            <div
                                class="panel-heading accordion-toggle question-toggle collapsed"
                                data-toggle="collapse"
                                data-parent="#faqAccordion"
                                data-target="#question20"
                                aria-expanded="false"
                                >
                                <span class="pull-right"
                                      ><i class="fa fa-2x fa-angle-down"></i
                                    ></span>
                                <h4 class="panel-title">
                                    <span class="question">
                                        <h5>
                                            <span class="label label-success">Question 20:</span>
                                        </h5>
                                       How to display geolocation of Help seeker and Help giver in the Map so that your local police authority can easily locate you and coordinate in bringing the help from the help giver to help seeker?
                                        <br />
                                        <h5><span class="label label-success">প্ৰশ্ ২০:</span></h5>
                                       সহায়দাতা আৰু সহায় বিচাৰোতাৰ ভৌগোলিক অৱস্থিতি মেপত  কেনেকৈ দেখুৱাম  যাৰ  দ্বাৰা  স্থানীয় আৰক্ষী বিভাগে সহজে আপোনাক বিচাৰি পাব আৰু সহায় দাতা আৰু সহায় বিচাৰোতাৰ মাজত সংযোগ স্থাপন কৰি সহায় আগবঢ়োৱাত সমৰ্থ হ'ব  । 
                                    </span>
                                </h4>
                            </div>
                            <div
                                id="question20"
                                class="panel-collapse collapse"
                                style="height: 0px;"
                                aria-expanded="false"
                                >
                                <div class="panel-body answer">
                                    <h5><span class="label label-primary">Answer 20:</span></h5>
                                    <p>
                                        To display your current location in the map you may download the android app by clicking the link below (available for only android phone. The same will also be available in play store soon) and submit your request as a help giver or help seeker. Your local police authority will find you easily from your geolocation and coordinate between a help giver and help seeker to bring help to the needy.
                                    </p>
                                    <h5><span class="label label-primary">উত্তৰ ২০:</span></h5>
                                    <p>
                                       সহায়দাতা আৰু সহায় বিচাৰোতাৰ ভৌগোলিক অৱস্থিতি মেপত দেখুৱাবলৈ তলত দিয়া লিংকটোত ক্লিক কৰি আপুনি এন্দ্ৰইদ এপ টো ডাউনল'ড কৰক । ( বৰ্ত্তমান  এই এপ টো  কেৱল এন্দ্ৰইড ফোনৰ বাবেহে উপলদ্ধ ।  অতি সোনকালে   এই  এপটো  প্লে   ষ্ট'ৰটো  উপলদ্ধ  হ'ব  )   এপ টোত আপুনি সহায় দাতা বা  সহায় বিচাৰোতা হিচাপে আবেদন কৰিব পাৰিব । আপোনাৰ ভৌগোলিক অৱস্থিতিৰ জৰিয়তে  স্থানীয় আৰক্ষী বিভাগে সহজে আপোনাক  বিচাৰি  পাব আৰু সহায় দাতা আৰু সহায় বিচাৰোতাৰ মাজত সংযোগ স্থাপন কৰি সহায় আগবঢ়োৱাত সমৰ্থ হ'ব ।
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page='./template/footer.jsp' />
    </body>
</html>
