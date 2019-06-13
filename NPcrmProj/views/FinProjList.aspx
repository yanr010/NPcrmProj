<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinProjList.aspx.cs" Inherits="NPcrmProj.views.ProjList" %>

<h1 class="text-center p-2">פרוייקטים שהסתיימו</h1>


<div class="container mt-3">

    <form>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fas fa-search fa-2x pl-1"></i></div>
                <input class="form-control" id="myInput" type="text" placeholder="חיפוש...">
            </div>
        </div>
    </form>


    <br>
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr class="text-center">
                <th><a href="#" ng-click="sortType = 'Name'; sortReverse = !sortReverse">שם פרוייקט
                        <span ng-show="sortType == 'Name' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Name' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'StartDate'; sortReverse = !sortReverse">תאריך התחלה
                        <span ng-show="sortType == 'StartDate' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'StartDate' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'Time'; sortReverse = !sortReverse">זמן התחלה
                        <span ng-show="sortType == 'Time' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Time' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'FinalTime'; sortReverse = !sortReverse">זמן סיום
                        <span ng-show="sortType == 'FinalTime' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'FinalTime' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'Responsible'; sortReverse = !sortReverse">אחריות
                        <span ng-show="sortType == 'Responsible' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Responsible' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                
            </tr>
        </thead>

        <tbody id="myTable">
            <tr class="text-center" ng-repeat="project in projects | orderBy:sortType:sortReverse">
                <td>{{project.Name}}</td>
                <td>{{project.StartDate | date:'shortDate'}}</td>
                <td>{{project.Time}}</td>
                <td>{{project.FinalTime}}</td>
                <td>{{project.Responsible}}</td>


            </tr>
        </tbody>

    </table>



    <div class="loading-spiner-holder text-center p-5" data-loading>
        <button class="btn btn-primary">
            <span class="spinner-border spinner-border-sm"></span>
            טוען...
        </button>
    </div>

</div>

<script>
    $(document).ready(function () {
        $("#myInput").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>
