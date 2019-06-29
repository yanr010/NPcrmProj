<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskForm.aspx.cs" Inherits="NPcrmProj.views.TaskForm" %>

<span class="far fa-arrow-alt-circle-right fa-2x" href="#" ng-click="mainclc('7')" style="float: right; cursor: pointer; padding: 8px;"></span>
<div class="text-center p-2">
    <i class="fas fa-edit fa-2x">&nbsp&nbsp<span">עריכת משימה</span></i>
</div>


<div align="right" style="background-color: rgb(240, 240, 240)">
    <form class="well form-horizontal">
        <fieldset>
            <div class="form-group row">
                <label for="taskName" class="col-sm-2 col-form-label">שם משימה<span style="color: red">   *</span></label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="taskName"  class="form-control" required="true" value="" type="text" disabled>
                    </div>
                </div>
            </div>


            <div class="form-group row">
                <label for="description" class="col-sm-2 col-form-label">תיאור משימה<span style="color: red">   *</span></label>
                <textarea class="form-control col-sm-6" ng-model="description" rows="3"></textarea>
            </div>
            <div class="form-group row">
                <label for="finalDate" class="col-sm-2 col-form-label">תאריך לביצוע<span style="color: red">   *</span></label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="finalDate"  class="form-control" required="true" value="" type="text" disabled></div>
                </div>
            </div>


            <div class="form-group row">
                <label for="department" class="col-sm-2 col-form-label">אחראי<span style="color: red">   *</span></label>
                <div class="col-md-3 inputGroupContainer">
                    <div class="form-group">
                        <select class="form-control" ng-model="department">
                            <option>השכלה גבוהה</option>
                            <option>חיילים משוחררים</option>
                            <option>פעליות חברתית</option>
                            <option>תעסוקה</option>
                            <option>מנהל מרכז צעירים</option>
                        </select>

                    </div>
                </div>

            </div>
            <br>
            <div class="loading-spiner-holder text-center p-5" data-loading>
                <button class="btn btn-primary">
                    <span class="spinner-border spinner-border-sm"></span>
                    מעדכן משימה...
                </button>
            </div>


            <div class="col-sm-10 text-left">
                <button ng-click="submitEditTask()" class="btn btn-primary btn-lg">שמור שינויים</button>
            </div>
        </fieldset>
    </form>

</div>
