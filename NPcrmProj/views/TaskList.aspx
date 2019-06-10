<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="NPcrmProj.views.TaskList" %>

<h1 class="text-center p-2">משימות</h1>


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
                <th><a href="#" ng-click="sortType = 'Name'; sortReverse = !sortReverse">שם
                        <span ng-show="sortType == 'Name' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Name' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'Description'; sortReverse = !sortReverse">תיאור
                        <span ng-show="sortType == 'Description' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Description' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'FinalDate'; sortReverse = !sortReverse">תאריך סיום
                        <span ng-show="sortType == 'FinalDate' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'FinalDate' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                
                
            </tr>
        </thead>

        <tbody id="myTable">
            <tr class="text-center" ng-repeat="task in tasks | orderBy:sortType:sortReverse">
                <td>{{task.Name}}</td>
                <td>{{task.Description}}</td>
                <td>{{task.FinalDate | date:'shortDate'}}</td>
                <td><a class="far fa-edit fa-2x" href="#"></a></td>
                <td><a class="far fa-trash-alt fa-2x" href="#"></a></td>

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
