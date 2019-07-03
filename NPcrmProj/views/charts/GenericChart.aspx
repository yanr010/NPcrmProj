<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenericChart.aspx.cs" Inherits="NPcrmProj.views.charts.GenericChart" %>
<fieldset>
       <span class="fas fa-print fa-2x" href="#" ng-click="print()" style="float: left; cursor: pointer; padding: 29px;"></span>

   <span class="far fa-arrow-alt-circle-right fa-2x" href="#" ng-click="mainclc('2')" style="float: right; cursor: pointer; padding: 29px;"></span>
   <div class="container p-4">

        <div class="text-center" ng-if="CustomerCategory">
            <h2>לקוחות לפי קטגוריות</h2>
            <canvas id="bar1" class="chart chart-bar"
                chart-data="chartdata" chart-labels="labels" chart-options="options" chart-colors="color" legend="true"></canvas>
        </div>
       <div class="text-center" ng-if="ProjectCategory">
            <h2>פרויקטים לפי קטגוריות</h2>
            <canvas id="bar2" class="chart chart-bar"
                chart-data="chartdata" chart-labels="labels" chart-options="options" chart-colors="color" legend="true"</canvas>
        </div>
         

       <div class="text-center" ng-if="PartProj">
         
            <h2>משתתפים בפרוייקט לפי מחלקה</h2>
           <canvas id="bar1" class="chart chart-bar"
                chart-data="chartdata" chart-labels="labels" chart-series="barseries" chart-options="options" chart-colors="color" legend="true"></canvas>
        </div>
       </div>
      
</fieldset>
<div class="loading-spiner-holder text-center p-5" data-loading>
    <button class="btn btn-primary">
        <span class="spinner-border spinner-border-sm"></span>
        טוען... נא להמתין בסבלנות
    </button>
</div>