<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="NPcrmProj.views.Main" %>




<div class="container-fluid p-4">

    <div class="row">
        <div class="col-2 mx-3">
            <h3 class="text-center">סה"כ במערכת</h3>
            <ul class="list-group">
                <li class="list-group-item d-flex justify-content-between align-items-center">לקוחות
    <span class="badge badge-primary badge-pill">{{custcount}}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">פרוייקטים עתידיים
    <span class="badge badge-primary badge-pill">{{projcount}}</span>
                </li>
                <li class="list-group-item d-flex justify-content-between align-items-center">משימות פתוחות
    <span class="badge badge-primary badge-pill">{{taskcount}}</span>
                </li>
            </ul>
        </div>
        <div class="col border mx-3">
            <div ng-include="custbycord">

            </div>
        </div>
        <div class="col border mx-3">Column</div>
        <div class="w-100 p-5"></div>
        <div class="col border mx-3">
            <h2 class="text-center">לקוחות חדשים</h2>
            <div ng-include="lastcust"></div>
        </div>
        <div class="col border mx-3">
            <h2 class="text-center">משימות חדשות</h2>
            <div ng-include="lasttask"></div>
        </div>
    </div>
</div>



