<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LastCust.aspx.cs" Inherits="NPcrmProj.views.LastCust" %>

<div class="container mt-3">

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
            <tr class="text-center" ng-repeat="customer in customers | orderBy:sortType:sortReverse">
                <td>{{customer.Id}}</td>
                <td>{{customer.FirstName}}</td>
                <td>{{customer.LastName}}</td>
                <td>{{customer.Mobile}}</td>
                <td>{{customer.Email}}</td>



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
