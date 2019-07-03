<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthBarChart.aspx.cs" Inherits="NPcrmProj.views.Charts" %>
       <span class="fas fa-print fa-2x" href="#" ng-click="print()" style="float: left; cursor: pointer; padding: 29px;"></span>

<fieldset>
      <span class="far fa-arrow-alt-circle-right fa-2x" href="#" ng-click="mainclc('2')" style="float: right; cursor: pointer; padding: 29px;"></span>
    <div class="btn-group float-right p-5" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary" ng-click="chartswitch('quarter')">רבעוני</button>
        <button type="button" class="btn btn-secondary" ng-click="chartswitch('month')">חודשי</button>
         </div>



    <div class="container p-4">

        <div class="text-center" ng-if="quarterchart">
            <div ng-if="custindepartment"><h1>לקוחות במחלקות</h1></div>
            <div ng-if="projindepartment"><h1>פרוייקטים במחלקות</h1></div>
            <h2>רבעוני ({{year}})</h2>
            <canvas id="bar2" class="chart chart-bar" style="height: 300px !important; width: 100% !important;"
                chart-data="monquachartdata" chart-labels="monqualabels" chart-series="monquaseries" chart-options="options" chart-colors="color"></canvas>
        </div>


        <div class="text-center" ng-if="monthchart">
            <div ng-if="custindepartment"><h1>לקוחות במחלקות</h1></div>
            <div ng-if="projindepartment"><h1>פרוייקטים במחלקות</h1></div>
            <h2>חודשי ({{year}})</h2>
            <canvas id="bar1" class="chart chart-bar" style="height: 300px !important; width: 100% !important;"
                chart-data="monbarchartdata" chart-labels="monbarlabels" chart-series="monbarseries" chart-options="options" chart-colors="color"></canvas>
        </div>

        </div>

</fieldset>


<div class="loading-spiner-holder text-center p-5" data-loading>
    <button class="btn btn-primary">
        <span class="spinner-border spinner-border-sm"></span>
        טוען... נא להמתין בסבלנות
    </button>
</div>
