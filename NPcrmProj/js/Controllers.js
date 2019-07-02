var app = angular.module("myApp", ["chart.js", "angularUtils.directives.dirPagination", "myApp.config"]);



app.controller("MainCtrl", function ($scope, $window, $http, CONFIG) {

    
    $scope.include = 'views/Main.aspx';
    $scope.lastcust = 'views/LastCust.aspx';
    $scope.lasttask = 'views/LastTask.aspx';
    $scope.custbycord = 'views/charts/CustByCord.aspx';
    $scope.mailinc = 'views/Email.aspx';
    $scope.profile = true;
    GetLastCusts();
    GetLastTasks();
    GetCustCount();
    GetProjCount();
    GetTaskCount();
    custbycord();


    var userdata = {
        params: { userdata: CONFIG.user.description }
    }

    $http.get("WebService.asmx/GetUserPermissions", userdata)
        .then(function (response) {

            //alert(response.data.split('"').join(''));
            if (response.data.split('"').join('') == "admin")
                $scope.profile = false;
            else $scope.profile = true;
        });

    $scope.UserSettings = function () {
        $scope.changepass1 = true;
        $scope.chngpass = false;
        var dat = {
            params: { User: CONFIG.user.description }
        }

        $http.get("WebService.asmx/GetUserInfo", dat, null)
            .then(function (response) {
                console.log(response);
                $scope.username = response.data.Username;
                $scope.userprofile = response.data.Type;
                $scope.useremail = response.data.Email;

                dat = {
                    params: { User: response.data.Id }
                }


                $http.get("WebService.asmx/GetDepName", dat, null)
                    .then(function (response) {
                        $scope.userdep = response.data.Name;
                    })
            })

        $scope.include = "views/settings.aspx";
    }

    $scope.changepass = function () {
        $scope.changepass1 = false;
        $scope.chngpass = true;
    }

    $scope.changenewpass = function () {

        var dat = {
            params: { oldpass: this.oldpass, username: CONFIG.user.description }
        }
        var dat2 = {
            params: { newpass: this.newpass, username: CONFIG.user.description }
        }

        $http.get("WebService.asmx/checkOldPass", dat, null)
            .then(function (response) {
                if (response.data == "False")
                    alert("סיסמא ישנה שגויה");
                if (response.data == "True") {
                    $http.get("WebService.asmx/ChangeNewPassword", dat2, null)
                        .then(function (response) {
                            if (response.data == "True") {
                                alert("הסיסמא שונתה בהצלחה");
                                $scope.include = 'views/Main.aspx';
                                $scope.lastcust = 'views/LastCust.aspx';
                                $scope.lasttask = 'views/LastTask.aspx';
                                GetLastCusts();
                                GetLastTasks();
                                GetCustCount();
                                GetProjCount();
                                GetTaskCount();
                                custbycord();
                            }
                            if (response.data == "False")
                                alert("תקלה, הסיסמא לא שונתה.");
                        })
                }
            })
        
    }
                
            
          



    $scope.mainclc = function (value) {
        switch (value) {
            case '1':

                $scope.include = 'views/Main.aspx';
                $scope.lastcust = 'views/LastCust.aspx';
                $scope.lasttask = 'views/LastTask.aspx';
                GetLastCusts();
                GetLastTasks();
                GetCustCount();
                GetProjCount();
                GetTaskCount();
                custbycord();


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
$scope.submitproj = function (data) {
    
    data.startDate = data.startDate.toDateString();
    data.time = data.time.toTimeString();
    if (data.finaltime != null)
        data.finaltime = data.finaltime.toTimeString();

    var category = [];
    category[0] = data.projname;
    if (data.inp1 == true) {
        category[1] = "1";
    }

    if (data.inp2 == true) {
        category[2] = "2";
    }

    if (data.inp3 == true) {
        category[3] = "3";
    }

    if (data.inp4 == true) {
        category[4] = "4";
    }

    if (data.inp5 == true) {
        category[5] = "5";
    }

    if (data.inp6 == true) {
        category[6] = "6";
    }

    if (data.inp7 == true) {
        category[7] = "7";
    }



    var categories = { data: category };
    var dat = { data: data };



    $http.post("WebService.asmx/SetProj", dat, null)
        .then(function (response) {
            if (response.data.d == "exist") {
                alert("פרויקט בשם זה כבר קיים במערכת, אנא בחר שם אחר");
            }
            if (response.data.d == "ok") {
                $http.post("WebService.asmx/SetCategeryProj", categories, null)
                    .then(function (response) {
                    });
                alert("פרויקט חדש נוסף בהצלחה");
                $scope.include = "views/NotFinProjList.aspx";
                GetNotFinAllProjects();
            }
            if (response.data.d == "error") alert("תקלה בהכנסת נתונים, אנא בדוק את הנתונים");
        });
    setTimeout(function () {
        $scope.data = null;
    }, 2000);
    
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




$scope.submitCust = function (data) {
    var category = [];
    category[0] = data.id;
    if (data.inp1 == true) {
        category[1] = "1";
    }

    if (data.inp2 == true) {
        category[2] = "2";
    }

    if (data.inp3 == true) {
        category[3] = "3";
    }

    if (data.inp4 == true) {
        category[4] = "4";
    }

    if (data.inp5 == true) {
        category[5] = "5";
    }

    if (data.inp6 == true) {
        category[6] = "6";
    }

    if (data.inp7 == true) {
        category[7] = "7";
    }



    var categories = { data: category };
    var dat = { data: data };


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
            if (response.data.d == "ok") {
                $http.post("WebService.asmx/SetCustomerCategory", categories, null)
                    .then(function (response) {
                        alert("לקוח חדש נוסף בהצלחה");
                        $scope.include = "views/CustList.aspx";
                        GetAllCustomers();
                    });
            }
            else {
                alert("נתונים לא תקינים/חסרים, אנא בדוק את הנתונים שהכנסת");
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
                if ($scope.include == 'TaskList.aspx') GetAllOpenTasks();
                else GetClosedTasks();

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



$scope.showReport = function () {



    let reporttype = $scope.data.ReportType;
    let option = $scope.data.option;


    if (reporttype == "customer" && option == "department") {

        $scope.monbarlabels = ['ינואר', 'פברואר', 'מרץ', 'אפריל', 'מאי', 'יוני', 'יולי', 'אוגוסט', 'ספטמבר', 'אוקטובר', 'נובמבר', 'דצמבר'];
        $scope.monbarseries = ['השכלה גבוהה', 'חיילים משוחררים', 'מנהל מרכז צעירים', 'פעיליות חברתית', 'תעסוקה'];

        $scope.monqualabels = ['ראשון', 'שני', 'שלישי', 'רביעי'];
        $scope.monquaseries = ['השכלה גבוהה', 'חיילים משוחררים', 'מנהל מרכז צעירים', 'פעילות חברתית', 'תעסוקה'];

        $scope.quarterchart = true;
        $scope.monthchart = false;

        $scope.monquachartdata = null;
        $scope.monbarchartdata = null;
        $scope.include = 'views/charts/MonthBarChart.aspx';

        PostCustDepMon();
        PostCustDepQua();
    }

    if (reporttype == "customer" && option == "category") {

        $scope.labels = ['לימודים', 'מלגות לימודים', 'מציאת עבודה', 'כספים', 'זכויות לחיילים משוחררים', 'פסיכומטרי', 'משפחה והורות'];
        $scope.CustomerCategory = true;
        $scope.ProjectCategory = false;
        $scope.PartProj = false;
        $scope.chartdata = null;
        $scope.include = 'views/charts/GenericChart.aspx';
        PostCustCat();

    }

    if (reporttype == "project" && option == "department") {
        $scope.monbarlabels = ['ינואר', 'פברואר', 'מרץ', 'אפריל', 'מאי', 'יוני', 'יולי', 'אוגוסט', 'ספטמבר', 'אוקטובר', 'נובמבר', 'דצמבר'];
        $scope.monbarseries = ['השכלה גבוהה', 'חיילים משוחררים', 'מנהל מרכז צעירים', 'פעיליות חברתית', 'תעסוקה'];

        $scope.monqualabels = ['ראשון', 'שני', 'שלישי', 'רביעי'];
        $scope.monquaseries = ['השכלה גבוהה', 'חיילים משוחררים', 'מנהל מרכז צעירים', 'פעילות חברתית', 'תעסוקה'];

        $scope.quarterchart = true;
        $scope.monthchart = false;

        $scope.monquachartdata = null;
        $scope.monbarchartdata = null;
        $scope.include = 'views/charts/MonthBarChart.aspx';
        PostProjDepMon();
        PostProjDepQua();

    }
    if (reporttype == "project" && option == "category") {

        $scope.labels = ['לימודים', 'מלגות לימודים', 'מציאת עבודה', 'כספים', 'זכויות לחיילים משוחררים', 'פסיכומטרי', 'משפחה והורות'];

        $scope.CustomerCategory = false;
        $scope.ProjectCategory = true;
        $scope.PartProj = false;
        $scope.chartdata = null;
        $scope.include = 'views/charts/GenericChart.aspx';
        PostProjCat();

    }
    if (reporttype == "project" && option == "projparticipants") {
        $scope.labels = ['השכלה גבוהה', 'חיילים משוחררים', 'מנהל מרכז צעירים', 'פעילות חברתית', 'תעסוקה'];
        $scope.barseries = ['צפי', 'בפועל'];

        $scope.CustomerCategory = false;
        $scope.ProjectCategory = false;
        $scope.PartProj = true;
        $scope.chartdata = null;
        $scope.include = 'views/charts/GenericChart.aspx';
        PostProjParticipants();

    }
    if (reporttype == "task" && option == "department") {
        $scope.monbarlabels = ['ינואר', 'פברואר', 'מרץ', 'אפריל', 'מאי', 'יוני', 'יולי', 'אוגוסט', 'ספטמבר', 'אוקטובר', 'נובמבר', 'דצמבר'];
        $scope.monbarseries = ['השכלה גבוהה', 'חיילים משוחררים', 'מנהל מרכז צעירים', 'פעיליות חברתית', 'תעסוקה'];

        $scope.monqualabels = ['ראשון', 'שני', 'שלישי', 'רביעי'];
        $scope.monquaseries = ['השכלה גבוהה', 'חיילים משוחררים', 'מנהל מרכז צעירים', 'פעילות חברתית', 'תעסוקה'];

        $scope.quarterchart = true;
        $scope.monthchart = false;

        $scope.monquachartdata = null;
        $scope.monbarchartdata = null;

        $scope.include = 'views/charts/MonthBarChart.aspx';
        PostTaskDepMon();
        PostTaskDepQua();
    }

}

function PostCustDepMon() {
    $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        }
          
    }
    var dat = { dep: "5" };
    $http.post("WebService.asmx/CustDepMon", dat, null)
        .then(function (response) {
            var jan1 = response.data.d[0];
            var feb1 = response.data.d[1];
            var mer1 = response.data.d[2];
            var apr1 = response.data.d[3];
            var may1 = response.data.d[4];
            var jun1 = response.data.d[5];
            var jul1 = response.data.d[6];
            var aug1 = response.data.d[7];
            var sep1 = response.data.d[8];
            var oct1 = response.data.d[9];
            var nov1 = response.data.d[10];
            var dec1 = response.data.d[11];
            dat = { dep: "2" };
            $http.post("WebService.asmx/CustDepMon", dat, null)
                .then(function (response) {
                    var jan2 = response.data.d[0];
                    var feb2 = response.data.d[1];
                    var mer2 = response.data.d[2];
                    var apr2 = response.data.d[3];
                    var may2 = response.data.d[4];
                    var jun2 = response.data.d[5];
                    var jul2 = response.data.d[6];
                    var aug2 = response.data.d[7];
                    var sep2 = response.data.d[8];
                    var oct2 = response.data.d[9];
                    var nov2 = response.data.d[10];
                    var dec2 = response.data.d[11];
                    dat = { dep: "4" };
                    $http.post("WebService.asmx/CustDepMon", dat, null)
                        .then(function (response) {
                            var jan3 = response.data.d[0];
                            var feb3 = response.data.d[1];
                            var mer3 = response.data.d[2];
                            var apr3 = response.data.d[3];
                            var may3 = response.data.d[4];
                            var jun3 = response.data.d[5];
                            var jul3 = response.data.d[6];
                            var aug3 = response.data.d[7];
                            var sep3 = response.data.d[8];
                            var oct3 = response.data.d[9];
                            var nov3 = response.data.d[10];
                            var dec3 = response.data.d[11];
                            dat = { dep: "6" };
                            $http.post("WebService.asmx/CustDepMon", dat, null)
                                .then(function (response) {
                                    var jan4 = response.data.d[0];
                                    var feb4 = response.data.d[1];
                                    var mer4 = response.data.d[2];
                                    var apr4 = response.data.d[3];
                                    var may4 = response.data.d[4];
                                    var jun4 = response.data.d[5];
                                    var jul4 = response.data.d[6];
                                    var aug4 = response.data.d[7];
                                    var sep4 = response.data.d[8];
                                    var oct4 = response.data.d[9];
                                    var nov4 = response.data.d[10];
                                    var dec4 = response.data.d[11];
                                    dat = { dep: "3" };
                                    $http.post("WebService.asmx/CustDepMon", dat, null)
                                        .then(function (response) {
                                            var jan5 = response.data.d[0];
                                            var feb5 = response.data.d[1];
                                            var mer5 = response.data.d[2];
                                            var apr5 = response.data.d[3];
                                            var may5 = response.data.d[4];
                                            var jun5 = response.data.d[5];
                                            var jul5 = response.data.d[6];
                                            var aug5 = response.data.d[7];
                                            var sep5 = response.data.d[8];
                                            var oct5 = response.data.d[9];
                                            var nov5 = response.data.d[10];
                                            var dec5 = response.data.d[11];

                                            $scope.monbarchartdata = [
                                                [jan1, feb1, mer1, apr1, may1, jun1, jul1, aug1, sep1, oct1, nov1, dec1],
                                                [jan2, feb2, mer2, apr2, may2, jun2, jul2, aug2, sep2, oct2, nov2, dec2],
                                                [jan3, feb3, mer3, apr3, may3, jun3, jul3, aug3, sep3, oct3, nov3, dec3],
                                                [jan4, feb4, mer4, apr4, may4, jun4, jul4, aug4, sep4, oct4, nov4, dec4],
                                                [jan5, feb5, mer5, apr5, may5, jun5, jul5, aug5, sep5, oct5, nov5, dec5]
                                            ];
                                        })
                                })
                        })
                })
        });
}


function PostCustDepQua() {
    $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        },
        legend: {
            display: true
        }
    }
    var dat = { dep: "5" };
    $http.post("WebService.asmx/CustDepQua", dat, null)
        .then(function (response) {
            var fir1 = response.data.d[0];
            var sec1 = response.data.d[1];
            var thi1 = response.data.d[2];
            var fou1 = response.data.d[3];

            dat = { dep: "2" };
            $http.post("WebService.asmx/CustDepQua", dat, null)
                .then(function (response) {
                    var fir2 = response.data.d[0];
                    var sec2 = response.data.d[1];
                    var thi2 = response.data.d[2];
                    var fou2 = response.data.d[3];
                    dat = { dep: "4" };
                    $http.post("WebService.asmx/CustDepQua", dat, null)
                        .then(function (response) {
                            var fir3 = response.data.d[0];
                            var sec3 = response.data.d[1];
                            var thi3 = response.data.d[2];
                            var fou3 = response.data.d[3];
                            dat = { dep: "6" };
                            $http.post("WebService.asmx/CustDepQua", dat, null)
                                .then(function (response) {
                                    var fir4 = response.data.d[0];
                                    var sec4 = response.data.d[1];
                                    var thi4 = response.data.d[2];
                                    var fou4 = response.data.d[3];
                                    dat = { dep: "3" };
                                    $http.post("WebService.asmx/CustDepQua", dat, null)
                                        .then(function (response) {
                                            var fir5 = response.data.d[0];
                                            var sec5 = response.data.d[1];
                                            var thi5 = response.data.d[2];
                                            var fou5 = response.data.d[3];

                                            $scope.monquachartdata = [
                                                [fir1, sec1, thi1, fou1],
                                                [fir2, sec2, thi2, fou2],
                                                [fir3, sec3, thi3, fou3],
                                                [fir4, sec4, thi4, fou4],
                                                [fir5, sec5, thi5, fou5]
                                            ];
                                        })
                                })
                        })
                })
        });
}
function PostCustCat() {
    $scope.labels = ['לימודים', 'מלגות לימודים', 'מציאת עבודה', 'כספים', 'זכויות לחיילים משוחררים', 'פסיכומטרי', 'משפחה והורות'];
    $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        }
    }
    $scope.color = [{
        backgroundColor: [' rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)', 'rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)']
    }]
    $http.post("WebService.asmx/CustByCat", null, null)
        .then(function (response) {
            var Cat1 = response.data.d[0];
            var Cat2 = response.data.d[1];
            var Cat3 = response.data.d[2];
            var Cat4 = response.data.d[3];
            var Cat5 = response.data.d[4];
            var Cat6 = response.data.d[3];
            var Cat7 = response.data.d[4];

            $scope.chartdata = [
                [Cat1, Cat2, Cat3, Cat4, Cat5, Cat6, Cat7]
            ];
        })



}
function PostProjDepMon() {
    $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        },
        legend: {
            display: true
        }
    }
    var dat = { dep: "5" };
    $http.post("WebService.asmx/ProjDepMon", dat, null)
        .then(function (response) {
            var jan1 = response.data.d[0];
            var feb1 = response.data.d[1];
            var mer1 = response.data.d[2];
            var apr1 = response.data.d[3];
            var may1 = response.data.d[4];
            var jun1 = response.data.d[5];
            var jul1 = response.data.d[6];
            var aug1 = response.data.d[7];
            var sep1 = response.data.d[8];
            var oct1 = response.data.d[9];
            var nov1 = response.data.d[10];
            var dec1 = response.data.d[11];
            dat = { dep: "2" };
            $http.post("WebService.asmx/ProjDepMon", dat, null)
                .then(function (response) {
                    var jan2 = response.data.d[0];
                    var feb2 = response.data.d[1];
                    var mer2 = response.data.d[2];
                    var apr2 = response.data.d[3];
                    var may2 = response.data.d[4];
                    var jun2 = response.data.d[5];
                    var jul2 = response.data.d[6];
                    var aug2 = response.data.d[7];
                    var sep2 = response.data.d[8];
                    var oct2 = response.data.d[9];
                    var nov2 = response.data.d[10];
                    var dec2 = response.data.d[11];
                    dat = { dep: "4" };
                    $http.post("WebService.asmx/ProjDepMon", dat, null)
                        .then(function (response) {
                            var jan3 = response.data.d[0];
                            var feb3 = response.data.d[1];
                            var mer3 = response.data.d[2];
                            var apr3 = response.data.d[3];
                            var may3 = response.data.d[4];
                            var jun3 = response.data.d[5];
                            var jul3 = response.data.d[6];
                            var aug3 = response.data.d[7];
                            var sep3 = response.data.d[8];
                            var oct3 = response.data.d[9];
                            var nov3 = response.data.d[10];
                            var dec3 = response.data.d[11];
                            dat = { dep: "6" };
                            $http.post("WebService.asmx/ProjDepMon", dat, null)
                                .then(function (response) {
                                    var jan4 = response.data.d[0];
                                    var feb4 = response.data.d[1];
                                    var mer4 = response.data.d[2];
                                    var apr4 = response.data.d[3];
                                    var may4 = response.data.d[4];
                                    var jun4 = response.data.d[5];
                                    var jul4 = response.data.d[6];
                                    var aug4 = response.data.d[7];
                                    var sep4 = response.data.d[8];
                                    var oct4 = response.data.d[9];
                                    var nov4 = response.data.d[10];
                                    var dec4 = response.data.d[11];
                                    dat = { dep: "3" };
                                    $http.post("WebService.asmx/ProjDepMon", dat, null)
                                        .then(function (response) {
                                            var jan5 = response.data.d[0];
                                            var feb5 = response.data.d[1];
                                            var mer5 = response.data.d[2];
                                            var apr5 = response.data.d[3];
                                            var may5 = response.data.d[4];
                                            var jun5 = response.data.d[5];
                                            var jul5 = response.data.d[6];
                                            var aug5 = response.data.d[7];
                                            var sep5 = response.data.d[8];
                                            var oct5 = response.data.d[9];
                                            var nov5 = response.data.d[10];
                                            var dec5 = response.data.d[11];

                                            $scope.monbarchartdata = [
                                                [jan1, feb1, mer1, apr1, may1, jun1, jul1, aug1, sep1, oct1, nov1, dec1],
                                                [jan2, feb2, mer2, apr2, may2, jun2, jul2, aug2, sep2, oct2, nov2, dec2],
                                                [jan3, feb3, mer3, apr3, may3, jun3, jul3, aug3, sep3, oct3, nov3, dec3],
                                                [jan4, feb4, mer4, apr4, may4, jun4, jul4, aug4, sep4, oct4, nov4, dec4],
                                                [jan5, feb5, mer5, apr5, may5, jun5, jul5, aug5, sep5, oct5, nov5, dec5]
                                            ];
                                        })
                                })
                        })
                })
        });
}
function PostProjDepQua() {

    $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        },
        legend: {
            display: true
        }
    }
    var dat = { dep: "5" };
    $http.post("WebService.asmx/ProjDepQua", dat, null)
        .then(function (response) {
            var fir1 = response.data.d[0];
            var sec1 = response.data.d[1];
            var thi1 = response.data.d[2];
            var fou1 = response.data.d[3];

            dat = { dep: "2" };
            $http.post("WebService.asmx/ProjDepQua", dat, null)
                .then(function (response) {
                    var fir2 = response.data.d[0];
                    var sec2 = response.data.d[1];
                    var thi2 = response.data.d[2];
                    var fou2 = response.data.d[3];
                    dat = { dep: "4" };
                    $http.post("WebService.asmx/ProjDepQua", dat, null)
                        .then(function (response) {
                            var fir3 = response.data.d[0];
                            var sec3 = response.data.d[1];
                            var thi3 = response.data.d[2];
                            var fou3 = response.data.d[3];
                            dat = { dep: "6" };
                            $http.post("WebService.asmx/ProjDepQua", dat, null)
                                .then(function (response) {
                                    var fir4 = response.data.d[0];
                                    var sec4 = response.data.d[1];
                                    var thi4 = response.data.d[2];
                                    var fou4 = response.data.d[3];
                                    dat = { dep: "3" };
                                    $http.post("WebService.asmx/ProjDepQua", dat, null)
                                        .then(function (response) {
                                            var fir5 = response.data.d[0];
                                            var sec5 = response.data.d[1];
                                            var thi5 = response.data.d[2];
                                            var fou5 = response.data.d[3];

                                            $scope.monquachartdata = [
                                                [fir1, sec1, thi1, fou1],
                                                [fir2, sec2, thi2, fou2],
                                                [fir3, sec3, thi3, fou3],
                                                [fir4, sec4, thi4, fou4],
                                                [fir5, sec5, thi5, fou5]
                                            ];
                                        })
                                })
                        })
                })
        });
}
function PostProjCat() {
    $scope.labels = ['לימודים', 'מלגות לימודים', 'מציאת עבודה', 'כספים', 'זכויות לחיילים משוחררים', 'פסיכומטרי', 'משפחה והורות'];
    $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        }
    }
    $scope.color = [{
        backgroundColor: [' rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)', 'rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)', ' rgba(0,0,255,0.3)']
    }]
    $http.post("WebService.asmx/ProjByCat", null, null)
        .then(function (response) {
            var Cat1 = response.data.d[0];
            var Cat2 = response.data.d[1];
            var Cat3 = response.data.d[2];
            var Cat4 = response.data.d[3];
            var Cat5 = response.data.d[4];
            var Cat6 = response.data.d[3];
            var Cat7 = response.data.d[4];

            $scope.chartdata = [
                [Cat1, Cat2, Cat3, Cat4, Cat5, Cat6, Cat7]
            ];
        })



}
function PostProjParticipants() {
    $scope.labels = ['חיילים משוחררים', 'תעסוקה', 'מנהל מרכז צעירים', 'השכלה גבוהה', 'פעילות חברתית'];
    $scope.barseries = ['צפי', 'בפועל'];
    $scope.options = {
        yAxes: [{

            beginAtZero: true
        }],
        legend: {
            display: true
        }
    }
    $scope.color = [{ //first dataset colors, for each bar
        backgroundColor: [
            'rgba(255, 0, 0, 0.8)',
            'rgba(255, 0, 0, 0.8)',
            'rgba(255, 0, 0, 0.8)',
            'rgba(255, 0, 0, 0.8)',
            'rgba(255, 0, 0, 0.8)',
        ]
    },
    { //second dataset colors, for each bar
        backgroundColor: [
            'rgba(0, 0, 255, 0.8)',
            'rgba(0, 0, 255, 0.8)',
            'rgba(0, 0, 255, 0.8)',
            'rgba(0, 0, 255, 0.8)',
            'rgba(0, 0, 255, 0.8)',
        ]
    }];
    var dat = { dep: "2" };
    $http.post("WebService.asmx/ProjParticipants", dat, null)
        .then(function (response) {
            var fir1 = response.data.d[0];
            var sec1 = response.data.d[1];

            dat = { dep: "6" };
            $http.post("WebService.asmx/ProjParticipants", dat, null)
                .then(function (response) {
                    var fir2 = response.data.d[0];
                    var sec2 = response.data.d[1];

                    dat = { dep: "3" };
                    $http.post("WebService.asmx/ProjParticipants", dat, null)
                        .then(function (response) {
                            var fir3 = response.data.d[0];
                            var sec3 = response.data.d[1];

                            dat = { dep: "5" };
                            $http.post("WebService.asmx/ProjParticipants", dat, null)
                                .then(function (response) {
                                    var fir4 = response.data.d[0];
                                    var sec4 = response.data.d[1];

                                    dat = { dep: "4" };
                                    $http.post("WebService.asmx/ProjParticipants", dat, null)
                                        .then(function (response) {
                                            var fir5 = response.data.d[0];
                                            var sec5 = response.data.d[1];


                                            $scope.chartdata = [
                                                [fir1, fir2, fir3, fir4, fir5],
                                                [sec1, sec2, sec3, sec4, sec5]

                                            ];
                                        })
                                })
                        })
                })

        })
}

function PostTaskDepMon() {
    $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        },
        legend: {
            display: true
        }
    }
    var dat = { dep: "5" };
    $http.post("WebService.asmx/TaskDepMon", dat, null)
        .then(function (response) {
            var jan1 = response.data.d[0];
            var feb1 = response.data.d[1];
            var mer1 = response.data.d[2];
            var apr1 = response.data.d[3];
            var may1 = response.data.d[4];
            var jun1 = response.data.d[5];
            var jul1 = response.data.d[6];
            var aug1 = response.data.d[7];
            var sep1 = response.data.d[8];
            var oct1 = response.data.d[9];
            var nov1 = response.data.d[10];
            var dec1 = response.data.d[11];
            dat = { dep: "2" };
            $http.post("WebService.asmx/TaskDepMon", dat, null)
                .then(function (response) {
                    var jan2 = response.data.d[0];
                    var feb2 = response.data.d[1];
                    var mer2 = response.data.d[2];
                    var apr2 = response.data.d[3];
                    var may2 = response.data.d[4];
                    var jun2 = response.data.d[5];
                    var jul2 = response.data.d[6];
                    var aug2 = response.data.d[7];
                    var sep2 = response.data.d[8];
                    var oct2 = response.data.d[9];
                    var nov2 = response.data.d[10];
                    var dec2 = response.data.d[11];
                    dat = { dep: "4" };
                    $http.post("WebService.asmx/TaskDepMon", dat, null)
                        .then(function (response) {
                            var jan3 = response.data.d[0];
                            var feb3 = response.data.d[1];
                            var mer3 = response.data.d[2];
                            var apr3 = response.data.d[3];
                            var may3 = response.data.d[4];
                            var jun3 = response.data.d[5];
                            var jul3 = response.data.d[6];
                            var aug3 = response.data.d[7];
                            var sep3 = response.data.d[8];
                            var oct3 = response.data.d[9];
                            var nov3 = response.data.d[10];
                            var dec3 = response.data.d[11];
                            dat = { dep: "6" };
                            $http.post("WebService.asmx/TaskDepMon", dat, null)
                                .then(function (response) {
                                    var jan4 = response.data.d[0];
                                    var feb4 = response.data.d[1];
                                    var mer4 = response.data.d[2];
                                    var apr4 = response.data.d[3];
                                    var may4 = response.data.d[4];
                                    var jun4 = response.data.d[5];
                                    var jul4 = response.data.d[6];
                                    var aug4 = response.data.d[7];
                                    var sep4 = response.data.d[8];
                                    var oct4 = response.data.d[9];
                                    var nov4 = response.data.d[10];
                                    var dec4 = response.data.d[11];
                                    dat = { dep: "3" };
                                    $http.post("WebService.asmx/TaskDepMon", dat, null)
                                        .then(function (response) {
                                            var jan5 = response.data.d[0];
                                            var feb5 = response.data.d[1];
                                            var mer5 = response.data.d[2];
                                            var apr5 = response.data.d[3];
                                            var may5 = response.data.d[4];
                                            var jun5 = response.data.d[5];
                                            var jul5 = response.data.d[6];
                                            var aug5 = response.data.d[7];
                                            var sep5 = response.data.d[8];
                                            var oct5 = response.data.d[9];
                                            var nov5 = response.data.d[10];
                                            var dec5 = response.data.d[11];

                                            $scope.monbarchartdata = [
                                                [jan1, feb1, mer1, apr1, may1, jun1, jul1, aug1, sep1, oct1, nov1, dec1],
                                                [jan2, feb2, mer2, apr2, may2, jun2, jul2, aug2, sep2, oct2, nov2, dec2],
                                                [jan3, feb3, mer3, apr3, may3, jun3, jul3, aug3, sep3, oct3, nov3, dec3],
                                                [jan4, feb4, mer4, apr4, may4, jun4, jul4, aug4, sep4, oct4, nov4, dec4],
                                                [jan5, feb5, mer5, apr5, may5, jun5, jul5, aug5, sep5, oct5, nov5, dec5]
                                            ];
                                        })
                                })
                        })
                })
        });
}


function PostTaskDepQua() {
    $scope.options = {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    stepSize: 1
                }
            }]
        },
        legend: {
            display: true
        }
    }
    var dat = { dep: "5" };
    $http.post("WebService.asmx/TaskDepQua", dat, null)
        .then(function (response) {
            var fir1 = response.data.d[0];
            var sec1 = response.data.d[1];
            var thi1 = response.data.d[2];
            var fou1 = response.data.d[3];

            dat = { dep: "2" };
            $http.post("WebService.asmx/TaskDepQua", dat, null)
                .then(function (response) {
                    var fir2 = response.data.d[0];
                    var sec2 = response.data.d[1];
                    var thi2 = response.data.d[2];
                    var fou2 = response.data.d[3];
                    dat = { dep: "4" };
                    $http.post("WebService.asmx/TaskDepQua", dat, null)
                        .then(function (response) {
                            var fir3 = response.data.d[0];
                            var sec3 = response.data.d[1];
                            var thi3 = response.data.d[2];
                            var fou3 = response.data.d[3];
                            dat = { dep: "6" };
                            $http.post("WebService.asmx/TaskDepQua", dat, null)
                                .then(function (response) {
                                    var fir4 = response.data.d[0];
                                    var sec4 = response.data.d[1];
                                    var thi4 = response.data.d[2];
                                    var fou4 = response.data.d[3];
                                    dat = { dep: "3" };
                                    $http.post("WebService.asmx/TaskDepQua", dat, null)
                                        .then(function (response) {
                                            var fir5 = response.data.d[0];
                                            var sec5 = response.data.d[1];
                                            var thi5 = response.data.d[2];
                                            var fou5 = response.data.d[3];

                                            $scope.monquachartdata = [
                                                [fir1, sec1, thi1, fou1],
                                                [fir2, sec2, thi2, fou2],
                                                [fir3, sec3, thi3, fou3],
                                                [fir4, sec4, thi4, fou4],
                                                [fir5, sec5, thi5, fou5]
                                            ];
                                        })
                                })
                        })
                })
        });
}

function custbycord() {
    $scope.custbycordlables = ['חיילים משוחררים', 'תעסוקה', 'מנהל מרכז צעירים', 'השכלה גבוהה', 'פעילות חברתית'];
    $scope.custpiecolors = [{ backgroundColor: ['#8B82AC', '#4092AA', '#109984', '#56964F', '#938A27'] }];
    $scope.custoptions = {
        legend: { display: true },
       
    };

    $http.post("WebService.asmx/CustByCord", null, null)
        .then(function (response) {
            var fir = response.data.d[0];
            var sec = response.data.d[1];
            var thi = response.data.d[2];
            var fou = response.data.d[3];
            var fiv = response.data.d[4];

            $scope.custbycorddata = [
                [fir, sec, thi, fou, fiv]
            ];
        })



}







$scope.chartswitch = function (value) {

    if (value == "quarter") {
        $scope.quarterchart = true;
        $scope.monthchart = false;
    }

    if (value == "month") {
        $scope.quarterchart = false;
        $scope.monthchart = true;
    }

    if (value == "year") {
        $scope.quarterchart = false;
        $scope.monthchart = false;
    }
}


$scope.sendmail = function (mail) {
    var dat = { data: mail };
    $http.post("WebService.asmx/sendmail", dat, null)
        .then(function (response) {
            if (response.data.d == "ok") {
                alert("המסרים הועברו בהצלחה!")
            }
            else {
                alert(response.data.d);
            }
        })
    }



    $scope.print = function () {
        $window.print();
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



