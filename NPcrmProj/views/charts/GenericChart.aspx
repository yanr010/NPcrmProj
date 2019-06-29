﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GenericChart.aspx.cs" Inherits="NPcrmProj.views.charts.GenericChart" %>
<fieldset>
   <div class="container p-4">

        <div class="text-center" ng-if="CustomerCategory">
            <h2>לקוחות לפי קטגוריות</h2>
            <canvas id="bar1" class="chart chart-bar" 
                chart-data="chartdata" chart-labels="labels" chart-options="options" ></canvas>
        </div>
       <div class="text-center" ng-if="ProjectCategory">
            <h2>פרוייקטים לפי קטגוריות</h2>
            <canvas id="bar2" class="chart chart-bar"
                chart-data="chartdata" chart-labels="labels" chart-options="options"</canvas>
        </div>
       </div>
      
</fieldset>
<div class="loading-spiner-holder text-center p-5" data-loading>
    <button class="btn btn-primary">
        <span class="spinner-border spinner-border-sm"></span>
        טוען... נא להמתין בסבלנות
    </button>
</div>