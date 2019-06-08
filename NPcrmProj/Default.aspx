﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NPcrmProj.Default" %>

<!DOCTYPE html>

<html dir="rtl" lang="he">
<head runat="server">

    <title>מערכת מידע צעירים</title>


    <%-- Frameworks & Addons --%>
    <script src="inc/jquery-3.4.1.min.js"></script>
    <script src="inc/popper.min.js"></script>
    <script src="inc/bootstrap.min.js"></script>
    <script src="inc/angular.min.js"></script>
    <script src="inc/moment-with-locales.js"></script>
    <script src="inc/Chart.min.js"></script>
    <script src="inc/angular-chart.min.js"></script>
    <script src="inc/xml2json.min.js"></script>


    <%-- Css --%>
    <link href="inc/bootstrap.min.css" rel="stylesheet" />
    <link href="inc/font-awesome.min.css" rel="stylesheet" />
    <link href="inc/Chart.min.css" rel="stylesheet" />



    <%-- Js --%>
    <script src="js/Controllers.js"></script>
    <script src="js/DateTime.js"></script>

    





    <%-- Style --%>
    <style>
        .dropdown:hover > .dropdown-menu {
            display: block;
        }

        #navpic {
            border-radius: 50%;
        }
    </style>

</head>
<body ng-app="myApp">





    <%---------------------------- NavBar ----------------------------%>

    <div id="navbar" ng-init="main=true" ng-controller="MainCtrl">


        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <span class="navbar-brand d-none d-lg-block">
                <img id="navpic" src="pics/merkaz_btf_icon.ico">
            </span>

            <button class="navbar-toggler ml-auto" type="button" data-toggle="collapse" data-target="#navbarColor01">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav">
                    <li class="nav-item ml-auto">
                        <a class="nav-link" href="#" ng-click="mainclc('1')">ראשי</a>
                    </li>
                    <li class="nav-item dropdown ml-auto">

                        <a class="nav-link dropdown-toggle" href="#">צעירים</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#" ng-click="mainclc('4')">כרטיס חדש</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" ng-click="mainclc('8')">רשימת צעירים</a>
                        </div>
                    </li>
                

                     <li class="nav-item dropdown ml-auto">
                        <a class="nav-link dropdown-toggle" href="#">משימות</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#" ng-click="mainclc('3')">הוספת משימה</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" ng-click="mainclc('7')">רשימת משימות</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown ml-auto">
                        <a class="nav-link dropdown-toggle" href="#">פרוייקטים</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#" ng-click="mainclc('5')">הוספת פרוייקט</a>
                            <a class="dropdown-item" href="#">פרוייקטים עתידיים</a>
                            <a class="dropdown-item" href="#" ng-click="mainclc('6')">פרוייקטים שהסתיימו</a>
                        </div>
                    </li>
                    <li class="nav-item ml-auto">
                        <a class="nav-link" ng-click="mainclc('2')" href="#">דוחות</a>
                    </li>

                    



                </ul>

                <span id="datetime" class="text-white my-2 my-lg-0 mr-auto d-none d-lg-block"></span>
                


                <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                    <ul class="navbar-nav">

                        <li class="nav-item ml-auto">
                            <a class="nav-link" ng-click="exit()" href="#">התנתק</a>
                        </li>
                    </ul>

                </nav>


            </div>
        </nav>





        <%---------------------------- Pages ----------------------------%>

        <div class="float-center" ng-controller="projctrl" ng-if="newproj">
            <div ng-include="include"></div>
        </div>

        <div class="float-center" ng-if="main">
            <div ng-include="include"></div>
        </div>

        <div class="float-center" ng-controller="getcustctrl" ng-if="custlist">
            <div ng-include="include"></div>
        </div>


        <div class="float-center" ng-controller="getprojctrl" ng-if="projlist">
            <div ng-include="include"></div>
        </div>

        <div class="float-center" ng-if="newtask">
            <div ng-include="include"></div>
        </div>

        <div class="float-center" ng-if="newcust">
            <div ng-include="include"></div>
        </div>

        <div class="float-center" ng-if="reports">
            <div ng-include="include"></div>
        </div>




    </div>



</body>
</html>
