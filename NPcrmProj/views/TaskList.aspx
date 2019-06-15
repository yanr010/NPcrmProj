<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="NPcrmProj.views.TaskList" %>

<h1 class="text-center p-2">משימות</h1>


<div class="container mt-3">

    <form>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fas fa-search fa-2x pl-1"></i></div>
                <input class="form-control" ng-model="searchText" id="myInput" type="text" placeholder="חיפוש...">
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
                <th><a href="#" ng-click="sortType = 'Done'; sortReverse = !sortReverse">בוצע
                        <span ng-show="sortType == 'Done' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Done' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>


            </tr>
        </thead>

        <tbody id="myTable">
            <tr class="text-center" dir-paginate="task in tasks | orderBy:sortType:sortReverse | filter:searchText | itemsPerPage:5">
                <td>{{task.Name}}</td>
                <td>{{task.Description}}</td>
                <td>{{task.FinalDate | date:'shortDate'}}</td>
                 <td>{{task.Done}}</td>
                <td>
                    <button type="button" class="fa fa-check fa-2x" href="#" ng-click="doneTask(task)"></button>
                </td>
             <td>
                    <button type="button" class="far fa-edit fa-2x" href="#" ng-click="editTask(task)"></button>
                </td>
                <td>
                    <button type="button" class="far fa-trash-alt fa-2x" href="#" ng-click="delTask(task)"></button>
                </td>
                
            </tr>
        </tbody>

    </table>

    <div class="text-center">
        <dir-pagination-controls id="pagination" max-size="5" direction-links="true" boundary-links="true"></dir-pagination-controls>
    </div>

    <div class="loading-spiner-holder text-center p-5" data-loading>
        <button class="btn btn-primary">
            <span class="spinner-border spinner-border-sm"></span>
            טוען...
        </button>
    </div>

</div>

