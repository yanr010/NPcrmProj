<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportForm.aspx.cs" Inherits="NPcrmProj.views.ReportForm" %>

<div align="right">
        
    <div class="text-center p-2">
    <i class="fas fa-chart-pie fa-2x">&nbsp&nbsp<span">דוחות</span></i>
</div>
          


                        <form class="well form-horizontal" style="background-color:rgb(240, 240, 240)">
                            <fieldset>
                                <div class="form-group row">
                                    <label for="reportType" class="col-sm-2 col-form-label">סוג דו"ח<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" ng-model="data.ReportType"  required>
                                                <option value="customer">לקוחות</option>
                                                <option value="project">פרויקטים</option>
                                                <option value="task">משימות</option>
                                            </select>

                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="reportType" class="col-sm-2 col-form-label">לפי<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                       <div ng-switch="data.ReportType">
                                      <div ng-switch-when="customer" >
                                        <select class="form-control" required="true" ng-model="data.option">
                                                <option value="department">מחלקות</option>
                                                <option value="category">קטגוריות</option>
                                            </select>
                                      </div>
                                        </div>
                                         <div ng-switch="data.ReportType">
                                      <div ng-switch-when="project">
                                        <select class="form-control" required="true" ng-model="data.option">
                                                <option value="department">מחלקות</option>
                                                <option value="category">קטגוריות</option>
                                            <option value="projparticipants">משתתפים בפרויקט</option>
                                            </select>
                                      </div>
                                             </div>
                                              <div ng-switch="data.ReportType">
                                      <div ng-switch-when="task">
                                        <select class="form-control" required="true" ng-model="data.option">
                                                <option value="department">מחלקות</option>
                                            <option value="unfinished">פתוחות</option>
                                            </select>
                                      </div>
                                          </div>
                                                
                                             </div>
                                        </div>
                                     </div>
<%--                                        <div class="form-group row">
                                    <label for="period" class="col-sm-2 col-form-label">תקופה</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" ng-model="data.period" required="true">
                                                <option value="month">חודשי</option>
                                                <option value="quarter">רבעוני</option>
                                                <option value="year">שנתי</option>
                                            </select>
                                            
                                        </div>
                                    </div>
                                    </div>--%>
                                    
                       
                                 <div class="col-sm-10 text-left">
                                     <button ng-click="showReport()" class="btn btn-primary btn-lg">הצגת דו"ח</button>
                                </div>
                            </fieldset>
                        </form>
                 
    </div>