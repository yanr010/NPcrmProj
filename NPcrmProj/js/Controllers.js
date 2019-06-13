var app = angular.module("myApp", ["chart.js"]);



app.controller("MainCtrl", function ($scope, $window) {

    $scope.include = 'views/Main.aspx';
    $scope.mainview = 'views/Charts.aspx';

    $scope.mainclc = function (value) {
        switch (value) {
            case '1':
                $scope.main = true;
                $scope.reports = false;
                $scope.newtask = false;
                $scope.newcust = false;
                $scope.newproj = false;
                $scope.finprojlist = false;
                $scope.include = 'views/Main.aspx';
                $scope.mainview = 'views/Charts.aspx';
                $scope.custlist = false;
                $scope.tasklist = false;
                $scope.notfinprojlist = false;
                break;


            case '2':
                $scope.main = false;
                $scope.newtask = false;
                $scope.reports = true;
                $scope.newcust = false;
                $scope.newproj = false;
                $scope.finprojlist = false;
                $scope.include = 'views/ReportForm.aspx';
                $scope.custlist = false;
                $scope.tasklist = false;
                $scope.notfinprojlist = false;


                break;
            case '3':
                $scope.newtask = true;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.newproj = false;
                $scope.finprojlist = false;
                $scope.include = 'views/TaskForm.aspx';
                $scope.custlist = false;
                $scope.notfinprojlist = false;
                $scope.tasklist = false;
                break;

            case '4':
                $scope.newtask = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = true;
                $scope.newproj = false;
                $scope.finprojlist = false;
                $scope.include = 'views/CustForm.aspx';
                $scope.custlist = false;
                $scope.tasklist = false;
                $scope.notfinprojlist = false;
                break;

            case '5':
                $scope.newtask = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.include = 'views/ProjForm.aspx';
                $scope.newproj = true;
                $scope.finprojlist = false;
                $scope.custlist = false;
                $scope.notfinprojlist = false;
                $scope.tasklist = false;

                break;

            case '6':
                $scope.newtask = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.include = 'views/FinProjList.aspx';
                $scope.newproj = false;
                $scope.finprojlist = true;
                $scope.custlist = false;
                $scope.tasklist = false;
                $scope.notfinprojlist = false;

                break;

            case '7':
                $scope.newtask = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.include = 'views/TaskList.aspx';
                $scope.newproj = false;
                $scope.finprojlist = false;
                $scope.custlist = false;
                $scope.tasklist = true;
                $scope.notfinprojlist = false;

                break;

            case '8':
                $scope.newtask = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.include = 'views/CustList.aspx';
                $scope.newproj = false;
                $scope.finprojlist = false;
                $scope.custlist = true;
                $scope.tasklist = false;
                $scope.notfinprojlist = false;

                break;

            case '9':
                $scope.newtask = false;
                $scope.main = false;
                $scope.reports = false;
                $scope.newcust = false;
                $scope.include = 'views/NotFinProjList.aspx';
                $scope.newproj = false;
                $scope.finprojlist = false;
                $scope.custlist = false;
                $scope.tasklist = false;
                $scope.notfinprojlist = true;

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
        var dat = { data: $scope.data };
        var json = angular.toJson(dat);
        //data: { proj }
        var str = JSON.stringify(json);
        

        $http.post("WebService.asmx/SetProj", dat,null)
            .then(function (response) {
                if (response.data.d == false) {
                    alert("פרוייקט בשם זה כבר קיים במערכת, אנא בחר שם אחר");
                }
                else {
                    alert("פרוייקט חדש נוסף בהצלחה");
                    $scope.include = "views/NotFinProjList.aspx";
                    GetAllProjects();
                }
            });
    };

    function GetAllProjects() {
        $http.get("WebService.asmx/GetFinAllProjects")
            .then(function (response) {

                var jsondata = response.data;

                $scope.projects = jsondata;
            });
    }

    $scope.editproj = function (project) {
        $scope.include = "views/EditProj.aspx";
        console.log(project);
    }


    $scope.delproj = function (project) {
        var data = {
            params: { Name: project.Name }
        }
        $http.get("WebService.asmx/DeleteProj", data)
            .then(function (response) {
                GetAllProjects();

            });
    }
});

app.controller('getfinprojctrl', function ($scope, $http) {

    $scope.sortType = 'Name'; // set the default sort type
    $scope.sortReverse = false;  // set the default sort order


    GetAllProjects();
    function GetAllProjects() {
        $http.get("WebService.asmx/GetFinAllProjects")
            .then(function (response) {

                var jsondata = response.data;

                $scope.projects = jsondata;
            });
    }


});

app.controller('getnotfinprojctrl', function ($scope, $http) {

    $scope.sortType = 'Name'; // set the default sort type
    $scope.sortReverse = false;  // set the default sort order


    GetAllProjects();
    function GetAllProjects() {
        $http.get("WebService.asmx/GetNotFinAllProjects")
            .then(function (response) {

                var jsondata = response.data;

                $scope.projects = jsondata;
            });
    }

    $scope.editproj = function (project) {
        $scope.projname = project.Name;
        $scope.description = project.Description;
        $scope.startDate = project.StartDate.split("T", 1);
        var time = project.Time.split(":");
        $scope.time = time[0] + ":" + time[1];
        var finaltime = project.FinalTime.split(":");
        $scope.finaltime = finaltime[0] + ":" + finaltime[1];
        $scope.participant = project.Participant;
        $scope.responsible = project.Responsible;
        $scope.projectCost = project.ProjectCost;
        $scope.include = "views/EditProj.aspx";
        
    }



    $scope.delproj = function (project) {
        var data = {
            params: { Name: project.Name }
        }
        $http.get("WebService.asmx/DeleteProj",data)
            .then(function (response) {
                GetAllProjects();
                
            });
    }
});

app.controller('getcustctrl', function ($scope, $http) {

    $scope.sortType = 'FirstName'; // set the default sort type
    $scope.sortReverse = false;  // set the default sort order

    GetAllCustomers();
    function GetAllCustomers() {
        $http.get("WebService.asmx/GetAllCustomers")
            .then(function (response) {
                var jsondata = response.data;
                $scope.customers = jsondata;
            });
    }
});

app.controller('gettaskctrl', function ($scope, $http) {

    $scope.sortType = 'Name'; // set the default sort type
    $scope.sortReverse = false;  // set the default sort order

    GetAllTasks();
    function GetAllTasks() {
        $http.get("WebService.asmx/GetAllTasks")
            .then(function (response) {
                var jsondata = response.data;
                $scope.tasks = jsondata;
            });
    }
});



app.directive('loading', ['$http', function ($http) {
    return {
        restrict: 'A',
        link: function (scope, elm, attrs) {
            scope.isLoading = function () {
                return $http.pendingRequests.length > 0;
            };

            scope.$watch(scope.isLoading, function (v) {
                if (v) {
                    elm.show();
                } else {
                    elm.hide();
                }
            });
        }
    };

}]);





app.controller("charts", function ($scope) {
    $scope.labels = ['2006', '2007', '2008', '2009', '2010', '2011', '2012'];
    $scope.series = ['Series A', 'Series B'];

    $scope.data = [
        [65, 59, 80, 81, 56, 55, 40],
        [28, 48, 40, 19, 86, 27, 90]
    ];
});


