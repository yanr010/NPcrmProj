<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustByCat.aspx.cs" Inherits="NPcrmProj.views.charts.CustByCat" %>

<div class="text-center">

    <canvas id="custbar" class="chart chart-bar"
        chart-data="data" chart-labels="lables" ></canvas>
</div>



<div class="loading-spiner-holder text-center p-5" data-loading>
    <button class="btn btn-primary">
        <span class="spinner-border spinner-border-sm"></span>
        טוען...
    </button>
</div>
