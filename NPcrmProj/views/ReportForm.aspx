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
                                            <select class="form-control" id="reportType" required="true">
                                                <option>לקוחות</option>
                                                <option>פרויקטים</option>
                                                <option>רכזות</option>
                                                <option>משימות</option>
                                            </select>

                                        </div>
                                    </div>
                                </div>
                                    
                               <div class="form-group row">
                                    <label for="period" class="col-sm-2 col-form-label">תקופה</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="period" required="true">
                                                <option></option>
                                                <option>שבועי</option>
                                                <option>חודשי</option>
                                                <option>רבעון</option>
                                                <option>שנתי</option>
                                            </select>
                                            
                                        </div>
                                    </div>
                                    </div>
                                    
                                   <div class="form-group row">
                                       <label class="col-sm-2 col-form-label">מתאריך</label>
                                       <div class="input-group col-md-2 inputGroupContainer"><input id="startDate" name="startDate" placeholder="תאריך התחלתי" class="form-control" value="" type="date"></div>
                                       <label class="col-sm-2 col-form-label">עד תאריך</label>
                                       <div class="input-group col-md-2 inputGroupContainer"><input id="finalDate" name="finalDate" placeholder="תאריך סופי" class="form-control" value="" type="date"></div>
                                  </div>
                                
                       
                                 <div class="col-sm-10 text-left">
                                     <button ng-click="showReport()" class="btn btn-primary btn-lg">הצגת דו"ח</button>
                                </div>
                            </fieldset>
                        </form>
                 
    </div>