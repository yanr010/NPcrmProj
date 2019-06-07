<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskForm.aspx.cs" Inherits="NPcrmProj.views.TaskForm" %>
<div>
<div class="text-center">
        <h2>משימה חדשה</h2>
    </div>


    <div align="right" style="background-color:rgb(240, 240, 240)">
                        <form class="well form-horizontal">
                            <fieldset>
                                <div class="form-group row">
                                    <label for="taskName" class="col-sm-2 col-form-label">שם משימה<span style="color:red">   *</span></label>
                                    <div class="col-md-4 inputGroupContainer">
                                        <div class="input-group"><input id="taskName" name="taskName" placeholder="שם משימה" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                         
                                    
                            <div class="form-group row">
                                     <label for="description" class="col-sm-2 col-form-label"> תיאור משימה<span style="color:red">   *</span></label>
                                     <textarea class="form-control col-sm-6" id="description" rows="3"></textarea>
                                </div>
                                   <div class="form-group row">
                                    <label for="finalDate" class="col-sm-2 col-form-label">תאריך לביצוע<span style="color:red">   *</span></label>
                                    <div class="col-md-2 inputGroupContainer">
                                        <div class="input-group"><input id="finalDate" name="finalDate" placeholder="תאריך לביצוע" class="form-control" required="true" value="" type="date"></div>
                                    </div>
                                  </div>
                                
                               
                                 <div class="form-group row">
                                    <label for="responsible" class="col-sm-2 col-form-label">אחראי<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="responsible">
                                                <option>מנהל מרכז צעירים</option>
                                                <option>רכזת מעורבות חברתית</option>
                                                <option>רכזת חיילים משוחררים</option>
                                                <option>רכזת תעסוקה</option>
                                                <option>רכזת להשכלה גבוהה</option>
                                                <option>אחר</option>
                                            </select>

                                        </div>
                                    </div>
                                    
                                </div>

                                <div class="form-group row">
                                    <label for="project" class="col-sm-2 col-form-label">פרויקט</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select> ng-model="selectedName" ng-option="x for x in Projects" </select>
                                         </div>
                                  </div>
                                </div>
                                      <div class="form-group row">
                                    <label for="customer" class="col-sm-2 col-form-label">לקוח</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select> ng-model="selectedName" ng-option="x for x in Customers" </select>
                                         </div>
                                  </div>
                                </div>
                                <br>
                                <div class="col-sm-10 text-left">
                                   <button type="submit" class="btn btn-primary btn-lg">אישור</button>
                                </div>
                            </fieldset>
                        </form>
                 
    </div>

    </div>