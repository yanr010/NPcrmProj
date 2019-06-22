<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskForm.aspx.cs" Inherits="NPcrmProj.views.TaskForm" %>

<div class="text-center">
    <h2>משימה חדשה</h2>
</div>


<div align="right" style="background-color: rgb(240, 240, 240)">
    <form class="well form-horizontal">
        <fieldset>
            <div class="form-group row">
                <label for="taskName" class="col-sm-2 col-form-label">שם משימה<span style="color: red">   *</span></label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="data.taskName" placeholder="שם משימה" class="form-control" required="true" value="" type="text">
                    </div>
                </div>
            </div>


            <div class="form-group row">
                <label for="description" class="col-sm-2 col-form-label">תיאור משימה<span style="color: red">   *</span></label>
                <textarea class="form-control col-sm-6" ng-model="data.description" rows="3"></textarea>
            </div>
            <div class="form-group row">
                <label for="finalDate" class="col-sm-2 col-form-label">תאריך לביצוע<span style="color: red">   *</span></label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="data.finalDate" placeholder="תאריך לביצוע" class="form-control" required="true" value="" type="date">
                    </div>
                </div>
            </div>


            <div class="form-group row">
                <label for="department" class="col-sm-2 col-form-label">אחראי<span style="color: red">   *</span></label>
                <div class="col-md-3 inputGroupContainer">
                    <div class="form-group">
                        <select class="form-control" ng-model="data.department">
                            <option value="5">השכלה גבוהה</option>
                            <option value="2">חיילים משוחררים</option>
                            <option value="4">פעילות חברתית</option>
                            <option value="6">תעסוקה</option>
                            <option value="3">מנהל מרכז צעירים</option>
                        </select>

                    </div>
                </div>

            </div>
            <br>
            <div class="loading-spiner-holder text-center p-5" data-loading>
                <button class="btn btn-primary">
                    <span class="spinner-border spinner-border-sm"></span>
                    מוסיף משימה חדשה...
                </button>
            </div>


            <div class="col-sm-10 text-left">
                <button ng-click="submitTask()" class="btn btn-primary btn-lg">אישור</button>
            </div>
        </fieldset>
    </form>

</div>
