<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LastTask.aspx.cs" Inherits="NPcrmProj.views.LastTask" %>


<div class="container mt-3">

    
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
