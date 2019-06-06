var app = angular.module("myApp", ["chart.js"]);



app.controller("MainCtrl", function ($scope, $window) {

    $scope.include = 'views/Main.aspx';
    $scope.mainview = 'views/Charts.aspx';

    $scope.mainclc = function (value) {
        switch (value) {
            case '1':
                $scope.main = true;
                $scope.reports = false;
                $scope.missions = false;
                $scope.newcust = false;
                $scope.newproj = false;
                $scope.projlist = false;
                $scope.include = 'views/Main.aspx';
                $scope.mainview = 'views/Charts.aspx';
                break;
            case '2':
                $scope.main = false;
                $scope.missions = false;
                $scope.reports = true;
                $scope.newcust = false;
                $scope.newproj = false;
                $scope.projlist = false;
                $scope.include = 'views/Charts.aspx';

                
                break;
            case '3':
                $scope.missions = true;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.newproj = false;
                $scope.projlist = false;
                break;

            case '4':
                $scope.missions = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = true;
                $scope.newproj = false;
                $scope.projlist = false;
                $scope.include = 'views/CustForm.aspx';
                break;

            case '5':
                $scope.missions = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.include = 'views/ProjForm.aspx';
                $scope.newproj = true;
                $scope.projlist = false;
                
                break;

            case '6':
                $scope.missions = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.include = 'views/ProjList.aspx';
                $scope.newproj = false;
                $scope.projlist = true;

                break;

            default:
                
                break;

        }
    }


   

  

    $scope.exit = function () {
        $window.location.href = 'Login.aspx';

    }




});

app.controller('projctrl', function ($scope, $http) {

    $scope.data = {};
    
    

    $scope.submitproj = function () {
        var dat = $scope.data;
        var json = angular.toJson(dat);
        data: {proj}
        var str = JSON.stringify(json);


        $http.get("WebService.asmx/GetProj", str)
            .then(function (response) {
                console.log(response);
            });

    };




});
app.controller('getprojctrl', function ($scope, $http) {

    GetAllProjects();
    function GetAllProjects() {
        $http.get("WebService.asmx/GetAllProjects")
            .then(function (response) {
                
                $scope.projects = response.data;
            });
    }


});








app.controller("charts", function ($scope) {
    $scope.labels = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
    $scope.series = ['Series A', 'Series B'];

    $scope.data = [
        [65, 59, 80, 81, 56, 55, 40],
        [28, 48, 40, 19, 86, 27, 90]
    ];
});


