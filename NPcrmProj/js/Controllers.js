var app = angular.module("myApp", []);



app.controller("MainCtrl", function ($scope) {
   


    $scope.mainclc = function (value) {
        switch (value) {
            case '1':
                $scope.main = false;
                $scope.odot = false;
                break;
            case '2':
                $scope.odot = true;
                $scope.main = true;
                break;
            default:
                break;

        }
    }


});



