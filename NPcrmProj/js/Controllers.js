var app = angular.module("myApp", ["chart.js", "angularUtils.directives.dirPagination"]);



app.controller("MainCtrl", function ($scope, $window, $http) {

    $scope.include = 'views/Main.aspx';
    $scope.lastcust = 'views/LastCust.aspx';
    $scope.lasttask = 'views/LastTask.aspx';
    GetLastCusts();
    GetLastTasks();
    GetCustCount();
    GetProjCount();
    GetTaskCount();

    

    $scope.mainclc = function (value) {
        switch (value) {
            case '1':
                $scope.include = 'views/Main.aspx';
                $scope.lastcust = 'views/LastCust.aspx';
                $scope.mainview = 'views/LastTask.aspx';
                GetLastCusts();
                GetLastTasks();
                GetCustCount();
                GetProjCount();
                GetTaskCount();


                break;


            case '2':
                $scope.include = 'views/ReportForm.aspx';


                break;
            case '3':
                $scope.include = 'views/TaskForm.aspx';

                break;

            case '4':
                $scope.include = 'views/CustForm.aspx';

                break;

            case '5':
                $scope.include = 'views/ProjForm.aspx';

                break;

            case '6':
                $scope.include = 'views/FinProjList.aspx';
                GetFinAllProjects();

                break;

            case '7':
                $scope.include = 'views/TaskList.aspx';
                GetAllOpenTasks();

                break;

            case '8':
                $scope.include = 'views/CustList.aspx';
                GetAllCustomers();

                break;

            case '9':
                $scope.include = 'views/NotFinProjList.aspx';
                GetNotFinAllProjects();

                break;

            case '10':
                $scope.include = 'views/ClosedTasks.aspx';
                GetClosedTasks();

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
        $scope.projects = null;
        $scope.sortType = 'Name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetNotFinAllProjects")
            .then(function (response) {
                $scope.projects = response.data;
            });
    }


    function GetCustCount() {
        $scope.custcount = null;
        $http.get("WebService.asmx/GetCustCount")
            .then(function (response) {
                $scope.custcount = response.data;
            });
    }

    function GetProjCount() {
        $scope.projcount = null;
        $http.get("WebService.asmx/GetProjCount")
            .then(function (response) {
                $scope.projcount = response.data;
            });
    }

    function GetTaskCount() {
        $scope.taskcount = null;
        $http.get("WebService.asmx/GetTaskCount")
            .then(function (response) {
                $scope.taskcount = response.data;
            });
    }





    $scope.editproj = function (project) {
        $scope.projname = null;
        $scope.description = null;
        $scope.startDate = null;
        $scope.time = null;
        $scope.finaltime = null;
        $scope.participant = null;
        $scope.responsible = null;
        $scope.projectCost = null;

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
    $scope.addParticipant = function (project) {
        $scope.projname = null;
        $scope.description = null;
        $scope.startDate = null;
        $scope.time = null;
        $scope.finaltime = null;
        $scope.participant = null;
        $scope.responsible = null;
        $scope.projectCost = null;

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
        $scope.include = "views/EditFinProj.aspx";

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


    $scope.ParticipantProj = function () {
        var editdata = {
            params: { Name: this.projname, ActualParticipant: this.ActualParticipant }
        }
        $http.get("WebService.asmx/EditParticipant", editdata)
            .then(function (response) {
                if (response == false) {
                    alert("תקלה בעריכת פרויקט");
                }
                else {
                    alert("הפרטים נשמרו")
                    $scope.include = "views/FinProjList.aspx";
                    GetFinAllProjects();
                }
            });
    }


    $scope.delproj = function (project) {
        if (confirm("האם אתה בטוח שברצונך למחוק פרויקט?")) {
            con = true;
        } else {
            con = false;
        }
        if (con == true) {
            var data = {
                params: { Name: project.Name }
            }
            $http.get("WebService.asmx/DeleteProj", data)
                .then(function (response) {
                    GetNotFinAllProjects();
                });
        }
    }





    function GetFinAllProjects() {
        $scope.projects = null;
        $scope.sortType = 'Name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetFinAllProjects")
            .then(function (response) {
                $scope.projects = response.data;
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
                if (response.data.d == "id") {
                    alert("מספר תעודת זהות קיים במערכת");
                }
                if (response.data.d == "mail") {
                    alert("אימייל קיים במערכת");
                }
                if (response.data.d == "mobile") {
                    alert("מספר טלפון נייד קיים במערכת");
                }
                if (response.data.d == ok) {
                    $http.post("WebService.asmx/SetCustomerCategory", categories, null)
                        .then(function (response) {
                        });
                    alert("לקוח חדש נוסף בהצלחה");
                    $scope.include = "views/CustList.aspx";
                    GetAllCustomers();

                }
            });
    };



    $scope.editCust = function (customer) {
        $window.scrollTo(0, 0);

        $scope.firstName = null;
        $scope.lastName = null;
        $scope.id = null;
        $scope.email = null;
        $scope.mobile = null;
        $scope.gender = null;
        $scope.birthDate = null;
        $scope.city = null;
        $scope.address = null;
        $scope.Education = null;
        $scope.student = null;
        $scope.studyField = null;
        $scope.AcademicDegree = null;
        $scope.militaryService = null;
        $scope.work = null;
        $scope.department = null;
        $scope.Summary = null;

        $scope.firstName = customer.FirstName;
        $scope.lastName = customer.LastName;
        $scope.id = customer.Id;
        $scope.email = customer.Email;
        $scope.mobile = customer.Mobile;
        $scope.gender = customer.Gender.trim();
        $scope.birthDate = customer.BirthDate.split("T", 1);
        $scope.city = customer.City;
        $scope.address = customer.Address;
        $scope.Education = customer.Education;
        $scope.student = customer.Student;
        $scope.studyField = customer.Studyfield;
        $scope.AcademicDegree = customer.AcademicDegree;
        $scope.militaryService = customer.MilitaryService;
        $scope.work = customer.WorkStatus;
        $scope.department = customer.Department;
        $scope.Summary = customer.Summary;
        $scope.include = "views/EditCust.aspx";

    }





    $scope.submitEditCustomer = function () {
        var editdata = {
            params: {
                FirstName: this.firstName, LastName: this.lastName, Id: this.id, Mobile: this.mobile, Email: this.email, Gender: this.gender, City: this.city, Address: this.address
                , Education: this.Education, Student: this.student, StudyField: this.studyField, AcademicDegree: this.AcademicDegree, MilitaryService: this.militaryService, WorkStatus: this.work, Department: this.department, Summary: this.Summary
            }
        }
        $http.get("WebService.asmx/EditCust", editdata)
            .then(function (response) {
                if (response == false) {
                    alert("תקלה בעריכת לקוח");
                }
                else {
                    alert("הפרטים נשמרו")
                    $scope.include = "views/CustList.aspx";
                    GetAllCustomers();
                }
            });
    }

    function GetAllCustomers() {
        $scope.customers = null;
        $scope.sortType = 'FirstName'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetAllCustomers")
            .then(function (response) {
                $scope.customers = response.data;
            });
    }


    $scope.delCust = function (customer) {
        if (confirm("האם אתה בטוח שברצונך למחוק לקוח?")) {
            con = true;
        } else {
            con = false;
        }
        if (con == true) {
            var data = {
                params: { Id: customer.Id }
            }
            $http.get("WebService.asmx/DeleteCust", data)
                .then(function (response) {
                    GetAllCustomers();
                });
        }
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
                    GetAllOpenTasks();
                }
            });
    };
    $scope.editTask = function (task) {
        $window.scrollTo(0, 0);
        $scope.taskName = null;
        $scope.description = null;
        $scope.finalDate = null;
        $scope.department = null;

        $scope.taskName = task.Name;
        $scope.description = task.Description;
        $scope.finalDate = task.FinalDate.split("T", 1);
        $scope.department = task.Department;
        $scope.include = "views/EditTask.aspx";

    }
    $scope.doneTask = function (task) {
        let con;
        if (confirm("האם אתה בטוח שברצונך לסיים משימה?")) {
            con = true;
        } else {
            con = false;
        }
        if (con == true) {

            $window.scrollTo(0, 0);
            $scope.taskName = task.Name;
            var editdata = {
                params: {
                    Name: this.taskName
                }
            }
            $http.get("WebService.asmx/DoneTask", editdata)
                .then(function (response) {
                    if (response == false) {
                        alert("תקלה בסגירת משימה");
                    }
                    else {
                        alert("משימה הסתיימה")
                        $scope.include = "views/TaskList.aspx";
                        GetAllOpenTasks();
                    }
                })
        }
    }

    $scope.submitEditTask = function () {
        var editdata = {
            params: {
                Name: this.taskName, Description: this.description, Department: this.department
            }
        }
        $http.get("WebService.asmx/EditTask", editdata)
            .then(function (response) {
                if (response == false) {
                    alert("תקלה בעריכת משימה");
                }
                else {
                    alert("הפרטים נשמרו")
                    $scope.include = "views/TaskList.aspx";
                    GetAllOpenTasks();
                }
            });
    }

    $scope.delTask = function (task) {
        if (confirm("האם אתה בטוח שברצונך למחוק משימה?")) {
            con = true;
        } else {
            con = false;
        }
        if (con == true) {
            var data = {
                params: { Id: task.Id }
            }
            $http.get("WebService.asmx/DeleteTask", data)
                .then(function (response) {
                    GetAllOpenTasks();

                });
        }
    }


    function GetAllOpenTasks() {
        $scope.optasks = null;
        $scope.sortType = 'Name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetAllOpenTasks")
            .then(function (response) {
                $scope.optasks = response.data;
            });
    }

    function GetClosedTasks() {
        $scope.clstasks = null;
        $scope.sortType = 'Name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetClosedTasks")
            .then(function (response) {
                $scope.clstasks = response.data;
            });
    }


    function GetLastCusts() {
        $scope.customers = null;
        $scope.sortType = 'FirstName'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetLastCusts")
            .then(function (response) {
                $scope.customers = response.data;
            });
    }

    function GetLastTasks() {
        $scope.tasks = null;
        $scope.sortType = 'Name'; // set the default sort type
        $scope.sortReverse = false;  // set the default sort order
        $http.get("WebService.asmx/GetLastTasks")
            .then(function (response) {
                $scope.tasks = response.data;
            });
    }

    $scope.IdValidation = function (data) {
        var data = {
            params: { Id: data.id }
        }
        
        $http.get("WebService.asmx/IdValidation", data)
            .then(function (response) {
                if (response.data == "False") {
                    $scope.idval = { "border": "solid 2px red" };
                    $scope.idred = true;
                }
                else {
                    $scope.idval = { "border": "solid 2px green" };
                    $scope.idred = false;
                }
            });
    }

    $scope.EmailValidation = function (data) {
        var data = {
            params: { Email: data.email }
        }

        $http.get("WebService.asmx/EmailValidation", data)
            .then(function (response) {
                if (response.data == "False") {
                    $scope.emailval = { "border": "solid 2px red" };
                    $scope.emailred = true;
                }
                else {
                    $scope.emailval = { "border": "solid 2px green" };
                    $scope.emailred = false;
                }
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

