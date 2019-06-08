<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjList.aspx.cs" Inherits="NPcrmProj.views.ProjList" %>

<div class="container mt-3">
    
        <form>
            <div class="form-group">
                <div class="input-group">
                    <div class="input-group-addon"><i class="fas fa-search fa-2x"></i> </div>
                    <input class="form-control" id="myInput" type="text" placeholder="חיפוש...">
                </div>
            </div>
        </form>

    
    <br>
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr>
                <th>
                    <a href="#" ng-click="sortType = 'Id'; sortReverse = !sortReverse">#
                        <span ng-show="sortType == 'Id' && !sortReverse" class="fas fa-caret-down"></span>
                        <span ng-show="sortType == 'Id' && sortReverse" class="fas fa-caret-up"></span>
                    </a>
                </th>
                <th><a href="#" ng-click="sortType = 'Name'; sortReverse = !sortReverse">שם פרוייקט
                        <span ng-show="sortType == 'Name' && !sortReverse" class="fas fa-caret-down"></span>
                        <span ng-show="sortType == 'Name' && sortReverse" class="fas fa-caret-up"></span>
                    </a></th>
                <th><a href="#" ng-click="sortType = 'Description'; sortReverse = !sortReverse">תיאור
                        <span ng-show="sortType == 'Description' && !sortReverse" class="fas fa-caret-down"></span>
                        <span ng-show="sortType == 'Description' && sortReverse" class="fas fa-caret-up"></span>
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
                <th><a href="#" ng-click="sortType = 'Frequency'; sortReverse = !sortReverse">תדירות
                        <span ng-show="sortType == 'Frequency' && !sortReverse" class="fas fa-caret-down"></span>
                        <span ng-show="sortType == 'Frequency' && sortReverse" class="fas fa-caret-up"></span>
                    </a></th>
            </tr>
        </thead>

        <tbody id="myTable">
            <tr ng-repeat="project in projects | orderBy:sortType:sortReverse">
                <td>{{project.Id}}</td>
                <td>{{project.Name}}</td>
                <td>{{project.Description}}</td>
                <td>{{project.StartDate | date:'shortDate'}}</td>
                <td>{{project.Time}}</td>
                <td>{{project.FinalTime}}</td>
                <td>{{project.Frequency}}</td>

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
