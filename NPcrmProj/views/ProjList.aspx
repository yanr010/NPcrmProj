<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjList.aspx.cs" Inherits="NPcrmProj.views.ProjList" %>

<div>
    <table ng-repeat="project in projects">
        <tr>
            <td>{{project.Id}}</td>
            <td>{{project.Name}}</td>
            <td>{{project.Description}}</td>
            <td>{{project.StartDate | date:'yyyy-MM-dd HH:mm:ss Z'}}</td>
            <td>{{project.Time}}</td>
            <td>{{project.FinalTime}}</td>
            <td>{{project.Frequency}}</td>

        </tr>
    </table>

</div>
