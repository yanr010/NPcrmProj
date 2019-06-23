﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthBarChart.aspx.cs" Inherits="NPcrmProj.views.Charts" %>

<fieldset>
    <div class="btn-group float-right p-5" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-secondary" ng-click="chartswitch('quarter')">רבעוני</button>
        <button type="button" class="btn btn-secondary" ng-click="chartswitch('month')">חודשי</button>
        <button type="button" class="btn btn-secondary" ng-click="chartswitch('year')">שנתי</button>
    </div>



    <div class="container p-4">

        <div class="text-center" ng-if="quarterchart">
            <h2>רבעוני</h2>
            <canvas id="bar2" class="chart chart-bar"
                chart-data="monquachartdata" chart-labels="monqualabels" chart-series="monquaseries"></canvas>
        </div>


        <div class="text-center" ng-if="monthchart">
            <h2>חודשי</h2>
            <canvas id="bar1" class="chart chart-bar"
                chart-data="monbarchartdata" chart-labels="monbarlabels" chart-series="monbarseries"></canvas>
        </div>


    </div>

</fieldset>


<div class="loading-spiner-holder text-center p-5" data-loading>
    <button class="btn btn-primary">
        <span class="spinner-border spinner-border-sm"></span>
        טוען... נא להמתין בסבלנות
    </button>
</div>