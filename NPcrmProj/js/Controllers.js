﻿var app = angular.module("myApp", ["chart.js"]);



app.controller("MainCtrl", function ($scope, $window) {
   


    $scope.mainclc = function (value) {
        switch (value) {
            case '1':
                $scope.main = true;
                $scope.reports = false;
                $scope.missions = false;
                break;
            case '2':
                $scope.main = false;
                $scope.missions = false;
                $scope.reports = true;
                $scope.labels = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
                $scope.series = ['Series A', 'Series B'];

                $scope.data = [
                    [65, 59, 80, 81, 56, 55, 40],
                    [28, 48, 40, 19, 86, 27, 90]
                ];
                break;
            case '3':
                $scope.missions = true;
                $scope.main = false;
                $scope.reports = false;
                break;

            default:

                break;

        }
    }

    $scope.exit = function () {
        $window.location.href = 'Login.aspx';

    }


});



