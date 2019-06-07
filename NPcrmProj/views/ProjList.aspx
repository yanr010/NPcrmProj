<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjList.aspx.cs" Inherits="NPcrmProj.views.ProjList" %>

<div>

    <table class="table">
        <thead class="thead-light">
            <tr>
                <th>#</th>
                <th>שם פרוייקט</th>
                <th>תיאור</th>
                <th>תאריך התחלה</th>
                <th>זמן התחלה</th>
                <th>זמן סיום</th>
                <th>תדירות</th>
            </tr>
        </thead>


        <tr ng-repeat="project in projects">
            <td>{{project.Id}}</td>
            <td>{{project.Name}}</td>
            <td>{{project.Description}}</td>
            <td>{{project.StartDate | date:'shortDate'}}</td>
            <td>{{project.Time}}</td>
            <td>{{project.FinalTime}}</td>
            <td>{{project.Frequency}}</td>

        </tr>


    </table>



    <div class="loading-spiner-holder text-center p-5" data-loading>
        <button class="btn btn-primary">
            <span class="spinner-border spinner-border-sm"></span>
            טוען...
        </button>
    </div>

</div>
