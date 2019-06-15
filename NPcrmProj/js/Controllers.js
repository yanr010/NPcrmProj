var app = angular.module("myApp", ["chart.js"]);



app.controller("MainCtrl", function ($scope, $window, $http) {

    $scope.include = 'views/Main.aspx';
    $scope.mainview = 'views/Charts.aspx';

    $scope.mainclc = function (value) {
        switch (value) {
            case '1':
                //$scope.main = true;
                //$scope.reports = false;
                //$scope.newtask = false;
                //$scope.newcust = false;
                //$scope.newproj = false;
                //$scope.finprojlist = false;
                $scope.include = 'views/Main.aspx';
                $scope.mainview = 'views/Charts.aspx';
                //$scope.custlist = false;
                //$scope.tasklist = false;
                //$scope.notfinprojlist = false;
                break;


            case '2':
                //$scope.main = false;
                //$scope.newtask = false;
                //$scope.reports = true;
                //$scope.newcust = false;
                //$scope.newproj = false;
                //$scope.finprojlist = false;
                $scope.include = 'views/ReportForm.aspx';
                //$scope.custlist = false;
                //$scope.tasklist = false;
                //$scope.notfinprojlist = false;


                break;
            case '3':
                //$scope.newtask = true;
                //$scope.main = false;
                //$scope.reports = false;
                //$scope.newcust = false;
                //$scope.newproj = false;
                //$scope.finprojlist = false;
                $scope.include = 'views/TaskForm.aspx';
                //$scope.custlist = false;
                //$scope.notfinprojlist = false;
                //$scope.tasklist = false;
                break;

            case '4':
                //$scope.newtask = false;
                //$scope.main = false;
                //$scope.reports = false;
                //$scope.newcust = true;
                //$scope.newproj = false;
                //$scope.finprojlist = false;
                $scope.include = 'views/CustForm.aspx';
                //$scope.custlist = false;
                //$scope.tasklist = false;
                //$scope.notfinprojlist = false;
                break;

            case '5':
                //$scope.newtask = false;
                //$scope.main = false;
                //$scope.reports = false;
                //$scope.newcust = false;
                $scope.include = 'views/ProjForm.aspx';
                //$scope.newproj = true;
                //$scope.finprojlist = false;
                //$scope.custlist = false;
                //$scope.notfinprojlist = false;
                //$scope.tasklist = false;

                break;

            case '6':
                //$scope.newtask = false;
                //$scope.main = false;
                //$scope.reports = false;
                //$scope.newcust = false;
                $scope.include = 'views/FinProjList.aspx';
                GetFinAllProjects();
                //$scope.newproj = false;
                //$scope.finprojlist = true;
                //$scope.custlist = false;
                //$scope.tasklist = false;
                //$scope.notfinprojlist = false;

                break;

            case '7':
                //$scope.newtask = false;
                //$scope.main = false;
                //$scope.reports = false;
                //$scope.newcust = false;
                $scope.include = 'views/TaskList.aspx';
                GetAllTasks();
                //$scope.newproj = false;
                //$scope.finprojlist = false;
                //$scope.custlist = false;
                //$scope.tasklist = true;
                //$scope.notfinprojlist = false;

                break;

            case '8':
                //$scope.newtask = false;
                //$scope.main = false;
                //$scope.reports = false;
                //$scope.newcust = false;
                $scope.include = 'views/CustList.aspx';
                GetAllCustomers();
                //$scope.newproj = false;
                //$scope.finprojlist = false;
                //$scope.custlist = true;
                //$scope.tasklist = false;
                //$scope.notfinprojlist = false;

                break;

            case '9':
                //$scope.newtask = false;
                //$scope.main = false;
                //$scope.reports = false;
                //$scope.newcust = false;
                $scope.include = 'views/NotFinProjList.aspx';
                GetNotFinAllProjects();
                //$scope.newproj = false;
                //$scope.finprojlist = false;
                //$scope.custlist = false;
                //$scope.tasklist = false;
                //$scope.notfinprojlist = true;

                break;

            default:

                break;

        }
    }






    $scope.exit = function () {
        $window.location.href = 'Login.aspx';

    }


    


    $scope.data = {};
    $scope.submitproj = function () {
        
        $scope.data.startDate = $scope.data.startDate.toDateString();
        $scope.data.time = $scope.data.time.toTimeString();
        if ($scope.data.finaltime != null)
            $scope.data.finaltime = $scope.data.finaltime.toTimeString();
        
        var category = [];
        category[0] = $scope.data.projname;
        if ($scope.data.inp1 == true) {
            category[1] = "מציאת עבודה";
        }

        if ($scope.data.inp2 == true) {
            category[2] = "כספים";
        }

        if ($scope.data.inp3 == true) {
            category[3] = "מלגות לימודים";
        }

        if ($scope.data.inp4 == true) {
            category[4] = "לימודים";
        }

        if ($scope.data.inp5 == true) {
            category[5] = "זכויות של חיילים משוחררים";
        }

        if ($scope.data.inp6 == true) {
            category[6] = "קורסי פסיכומטרי";
        }

        if ($scope.data.inp7 == true) {
            category[7] = "משפחה והורות";
        }



        var categories = { data: category };
        var dat = { data: $scope.data };



        $http.post("WebService.asmx/SetProj", dat, null)
            .then(function (response) {
                if (response.data.d == false) {
                    alert("פרוייקט בשם זה כבר קיים במערכת, אנא בחר שם אחר");
                }
                else {
                    $http.post("WebService.asmx/SetCategeryProj", categories, null)
                        .then(function (response) {
                        });
                    alert("פרוייקט חדש נוסף בהצלחה");
                    $scope.include = "views/NotFinProjList.aspx";
                    GetNotFinAllProjects();
                }
            });
    };


    function GetNotFinAllProjects() {
        $scope.sortType = 'Name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
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


    $scope.submitedit = function () {
        var editdata = {
            params: { Name: this.projname, Description: this.description, Participant: this.participant, ProjectCost: this.projectCost }
        }
        $http.get("WebService.asmx/EditProj", editdata)
            .then(function (response) {
                if (response == false) {
                    alert("תקלה בעריכת פרויקט");
                }
                else {
                    alert("הפרטים נשמרו")
                    $scope.include = "views/NotFinProjList.aspx";
                    GetNotFinAllProjects();
                }
            });
    }

    $scope.delproj = function (project) {
        var data = {
            params: { Name: project.Name }
        }
        $http.get("WebService.asmx/DeleteProj", data)
            .then(function (response) {
                GetNotFinAllProjects();

            });
    }

    


    
    function GetFinAllProjects() {
        $scope.sortType = 'Name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetFinAllProjects")
            .then(function (response) {

                var jsondata = response.data;

                $scope.projects = jsondata;
            });
    }




    $scope.submitCust = function () {
        var category = [];
        category[0] = $scope.data.id;
        if ($scope.data.inp1 == true) {
            category[1] = "מציאת עבודה";
        }

        if ($scope.data.inp2 == true) {
            category[2] = "כספים";
        }

        if ($scope.data.inp3 == true) {
            category[3] = "מלגות לימודים";
        }

        if ($scope.data.inp4 == true) {
            category[4] = "לימודים";
        }

        if ($scope.data.inp5 == true) {
            category[5] = "זכויות של חיילים משוחררים";
        }

        if ($scope.data.inp6 == true) {
            category[6] = "קורסי פסיכומטרי";
        }

        if ($scope.data.inp7 == true) {
            category[7] = "משפחה והורות";
        }



        var categories = { data: category };
        var dat = { data: $scope.data };


        $http.post("WebService.asmx/SetCust", dat, null)
            .then(function (response) {
                console.log(response);
                if (response.data.d == true) {
                    $http.post("WebService.asmx/SetCustomerCategory", categories, null)
                      .then(function (response) {
                      });
                    alert("לקוח חדש נוסף בהצלחה");
                    $scope.include = "views/CustList.aspx";
                    GetAllCustomers();
                 
                }
                else {
                    alert("לקוח זה כבר קיים במערכת");
                }
            });
    };

    function GetAllCustomers() {
        $scope.sortType = 'FirstName'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetAllCustomers")
            .then(function (response) {
                var jsondata = response.data;
                $scope.customers = jsondata;
            });
    }

 
    $scope.delCust = function (customer) {
        var data = {
            params: { Id: customer.Id}
        }
        $http.get("WebService.asmx/DeleteCust", data)
          .then(function (response) {
              GetAllCustomers();

          });
    }

    $scope.submitTask = function () {

        $scope.data.finalDate = $scope.data.finalDate.toDateString();

        var dat = { data: $scope.data };



        $http.post("WebService.asmx/SetTask", dat, null)
            .then(function (response) {
                if (response.data.d == false) {
                    alert("משימה בשם זה כבר קיימת במערכת, אנא בחר שם אחר");
                }
                else {
                    alert("משימה חדשה נוספה בהצלחה");
                    $scope.include = "views/TaskList.aspx";
                    GetAllTasks();
                }
            });
    };
    function GetAllTasks() {
        $scope.sortType = 'Name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
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
















//app.controller('projctrl', function ($scope, $http) {

//    $scope.data = {};



//    $scope.submitproj = function () {
//        $scope.data.startDate = $scope.data.startDate.toDateString();
//        var dat = { data: $scope.data };

        

//        $http.post("WebService.asmx/SetProj", dat,null)
//            .then(function (response) {
//                if (response.data.d == false) {
//                    alert("פרוייקט בשם זה כבר קיים במערכת, אנא בחר שם אחר");
//                }
//                else {
//                    alert("פרוייקט חדש נוסף בהצלחה");
//                    $scope.include = "views/NotFinProjList.aspx";
//                    GetAllProjects();
//                }
//            });
//    };

//    function GetAllProjects() {
//        $http.get("WebService.asmx/GetNotFinAllProjects")
//            .then(function (response) {

//                var jsondata = response.data;

//                $scope.projects = jsondata;
//            });
//    }

//    $scope.editproj = function (project) {
//        $scope.projname = project.Name;
//        $scope.description = project.Description;
//        $scope.startDate = project.StartDate.split("T", 1);
//        var time = project.Time.split(":");
//        $scope.time = time[0] + ":" + time[1];
//        var finaltime = project.FinalTime.split(":");
//        $scope.finaltime = finaltime[0] + ":" + finaltime[1];
//        $scope.participant = project.Participant;
//        $scope.responsible = project.Responsible;
//        $scope.projectCost = project.ProjectCost;
//        $scope.include = "views/EditProj.aspx";

//    }

//    $scope.submitedit = function () {
//        var editdata = {
//            params: { Name: this.projname, Description: this.description, Participant: this.participant, ProjectCost: this.projectCost }
//        }
//        $http.get("WebService.asmx/EditProj", editdata)
//            .then(function (response) {
//                if (response == false) {
//                    alert("תקלה בעריכת פרויקט");
//                }
//                else {
//                    alert("הפרטים נשמרו")
//                    $scope.include = "views/NotFinProjList.aspx";
//                    GetAllProjects();
//                }
//            });
//    }


//    $scope.delproj = function (project) {
//        var data = {
//            params: { Name: project.Name }
//        }
//        $http.get("WebService.asmx/DeleteProj", data)
//            .then(function (response) {
//                GetAllProjects();

//            });
//    }
//});

//app.controller('getfinprojctrl', function ($scope, $http) {

//    $scope.sortType = 'Name'; // set the default sort type
//    $scope.sortReverse = false;  // set the default sort order


//    GetAllProjects();
//    function GetAllProjects() {
//        $http.get("WebService.asmx/GetFinAllProjects")
//            .then(function (response) {

//                var jsondata = response.data;

//                $scope.projects = jsondata;
//            });
//    }


//});

//app.controller('getnotfinprojctrl', function ($scope, $http) {

//    $scope.sortType = 'Name'; // set the default sort type
//    $scope.sortReverse = false;  // set the default sort order


//    GetAllProjects();
//    function GetAllProjects() {
//        $http.get("WebService.asmx/GetNotFinAllProjects")
//            .then(function (response) {

//                var jsondata = response.data;

//                $scope.projects = jsondata;
//            });
//    }

//    $scope.editproj = function (project) {
//        $scope.projname = project.Name;
//        $scope.description = project.Description;
//        $scope.startDate = project.StartDate.split("T", 1);
//        var time = project.Time.split(":");
//        $scope.time = time[0] + ":" + time[1];
//        var finaltime = project.FinalTime.split(":");
//        $scope.finaltime = finaltime[0] + ":" + finaltime[1];
//        $scope.participant = project.Participant;
//        $scope.responsible = project.Responsible;
//        $scope.projectCost = project.ProjectCost;
//        $scope.include = "views/EditProj.aspx";
        
//    }

//    $scope.submitedit = function () {
//        var editdata = {
//            params: { Name: this.projname, Description: this.description, Participant: this.participant, ProjectCost: this.projectCost}
//        }
//        $http.get("WebService.asmx/EditProj", editdata)
//            .then(function (response) {
//                if (response == false) {
//                    alert("תקלה בעריכת פרויקט");
//                }
//                else {
//                    alert("הפרטים נשמרו")
//                    $scope.include = "views/NotFinProjList.aspx";
//                    GetAllProjects();
//                }
//            });
//    }



//    $scope.delproj = function (project) {
//        var data = {
//            params: { Name: project.Name }
//        }
//        $http.get("WebService.asmx/DeleteProj",data)
//            .then(function (response) {
//                GetAllProjects();
                
//            });
//    }
//});

//app.controller('getcustctrl', function ($scope, $http) {

//    $scope.sortType = 'FirstName'; // set the default sort type
//    $scope.sortReverse = false;  // set the default sort order

//    GetAllCustomers();
//    function GetAllCustomers() {
//        $http.get("WebService.asmx/GetAllCustomers")
//            .then(function (response) {
//                var jsondata = response.data;
//                $scope.customers = jsondata;
//            });
//    }
//});

//app.controller('gettaskctrl', function ($scope, $http) {

//    $scope.sortType = 'Name'; // set the default sort type
//    $scope.sortReverse = false;  // set the default sort order

//    GetAllTasks();
//    function GetAllTasks() {
//        $http.get("WebService.asmx/GetAllTasks")
//            .then(function (response) {
//                var jsondata = response.data;
//                $scope.tasks = jsondata;
//            });
//    }
//});



