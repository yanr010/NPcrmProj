<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustByCord.aspx.cs" Inherits="NPcrmProj.views.charts.CustByCord" %>

<div class="text-center">

    <canvas id="custpie" class="chart chart-pie"
        chart-data="custbycorddata" chart-labels="custbycordlables" chart-options="custoptions" chart-dataset-override="custpiecolors"></canvas>
</div>



<div class="loading-spiner-holder text-center p-5" data-loading>
    <button class="btn btn-primary">
        <span class="spinner-border spinner-border-sm"></span>
        טוען...
    </button>
</div>
