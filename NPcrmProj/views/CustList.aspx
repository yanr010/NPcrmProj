<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustList.aspx.cs" Inherits="NPcrmProj.views.CustList" %>

<div class="container mt-3">

    <form>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon"><i class="fas fa-search fa-2x"></i></div>
                <input class="form-control" id="myInput" type="text" placeholder="חיפוש...">
            </div>
        </div>
    </form>


    <br>
    <table class="table table-bordered">
        <thead class="thead-light">
            <tr class="text-center">
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
            <tr class="text-center" ng-repeat="customer in customers | orderBy:sortType:sortReverse">
                <td>{{customer.FirstName}}</td>
                <td>{{customer.LastName}}</td>
                <td>{{customer.Mobile}}</td>
                <td>{{customer.Email}}</td>
                <td><i class="far fa-edit fa-2x"></i></td>
                <td><i class="far fa-trash-alt fa-2x"></i></td>

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
