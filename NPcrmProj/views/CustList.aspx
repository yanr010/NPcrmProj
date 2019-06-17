<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustList.aspx.cs" Inherits="NPcrmProj.views.CustList" %>

<div class="text-center p-2">
    <i class="fas fa-users fa-2x">&nbsp&nbsp<span">רשימת לקוחות</span></i>
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
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr class="text-center">
                <th><a href="#" ng-click="sortType = 'Id'; sortReverse = !sortReverse">ת"ז
                        <span ng-show="sortType == 'Id' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Id' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'FirstName'; sortReverse = !sortReverse">שם פרטי
                        <span ng-show="sortType == 'FirstName' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'FirstName' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'LastName'; sortReverse = !sortReverse">שם משפחה
                        <span ng-show="sortType == 'LastName' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'LastName' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'Mobile'; sortReverse = !sortReverse">מספר סלולרי
                        <span ng-show="sortType == 'Mobile' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Mobile' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>
                <th><a href="#" ng-click="sortType = 'Email'; sortReverse = !sortReverse">Email
                        <span ng-show="sortType == 'Email' && !sortReverse" class="fas fa-caret-down"></span>
                    <span ng-show="sortType == 'Email' && sortReverse" class="fas fa-caret-up"></span>
                </a></th>


            </tr>
        </thead>

        <tbody id="myTable">
            <tr class="text-center" dir-paginate="customer in customers | orderBy:sortType:sortReverse | filter:searchText | itemsPerPage:5">
                <td>{{customer.Id}}</td>
                <td>{{customer.FirstName}}</td>
                <td>{{customer.LastName}}</td>
                <td>{{customer.Mobile}}</td>
                <td>{{customer.Email}}</td>
                <td>
                    <button type="button" class="far fa-edit fa-2x" href="#" ng-click="editCust(customer)"></button>
                </td>
                <td>
                    <button type="button" class="far fa-trash-alt fa-2x" href="#" ng-click="delCust(customer)"></button>
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


