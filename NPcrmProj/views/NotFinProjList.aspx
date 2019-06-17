<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotFinProjList.aspx.cs" Inherits="NPcrmProj.views.NotFinProjList" %>


<div class="text-center p-2">
    <i class="fas fa-project-diagram fa-2x">&nbsp&nbsp<span">פרוייקטים עתידיים</span></i>
</div>

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
    <table ng-table="NotFinProjTable" class="table table-bordered">
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
            <tr class="text-center" dir-paginate="project in projects | orderBy:sortType:sortReverse | filter:searchText | itemsPerPage:7">
                <td>{{project.Name}}</td>
                <td>{{project.StartDate | date:'shortDate'}}</td>
                <td>{{project.Time}}</td>
                <td>{{project.FinalTime}}</td>
                <td>{{project.Responsible}}</td>
                <td>
                    <button type="button" class="far fa-edit fa-2x" href="#" ng-click="editproj(project)"></button>
                </td>
                <td>
                    <button type="button" class="far fa-trash-alt fa-2x" href="#" ng-click="delproj(project)"></button>
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

