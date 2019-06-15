<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="NPcrmProj.views.Main" %>




<div class="container-fluid p-2">
  
  <div class="row">
    <div class="col border">
        <h2 class="text-center">לקוחות חדשים</h2>
        <div ng-include="lastcust"></div>
    </div>
    <div class="col border">
        <h2 class="text-center">משימות חדשות</h2>
        <div ng-include="lasttask"></div>
    </div>
    <div class="w-100"></div>
    <div class="col border">Column</div>
    <div class="col border">Column</div>
  </div>
</div>



