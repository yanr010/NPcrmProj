﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProj.aspx.cs" Inherits="NPcrmProj.views.EditProj" %>

<span class="far fa-arrow-alt-circle-right fa-2x" href="#" ng-click="mainclc('6')" style="float: right; cursor: pointer; padding: 8px;"></span>
<div class="text-center p-2">
    <i class="fas fa-edit fa-2x">&nbsp&nbsp<span">עריכת פרויקט</span></i>
</div>

<div style="background-color:rgb(240, 240, 240)">
    <form class="well form-horizontal">
        <fieldset>
            <div class="form-group row">
                <label for="projName" class="col-sm-2 col-form-label">שם פרויקט</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input type="text" ng-model="projname" placeholder="שם פרויקט" class="form-control" required="true" disabled>
                    </div>
                </div>
            </div>


            <div class="form-group row">
                <label for="description" class="col-sm-2 col-form-label">הסבר קצר ורקע לאירוע</label>
                <textarea class="form-control col-sm-8" ng-model="description" rows="6" required="true" disabled></textarea>
            </div>

            <div class="form-group row">
                <label for="startDate" class="col-sm-2 col-form-label">תאריך האירוע</label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="startDate" name="startDate" placeholder="תאריך האירוע" class="form-control" required="true"  value="" type="text" disabled>
                    </div>
                </div>
            </div>






            <div class="form-group row">
                <label for="time" class="col-sm-2 col-form-label">שעת התחלה</label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="time" name="time" placeholder="שעת התחלה" class="form-control" required="true"  value="" type="text" disabled>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label for="finaltime" class="col-sm-2 col-form-label">שעת סיום</label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="finaltime" name="finaltime" placeholder="שעת סיום" class="form-control" value="" type="text" disabled>
                    </div>
                </div>

            </div>
            <div class="form-group row">
                <label for="participant" class="col-sm-2 col-form-label">צפי משתתפים</label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="participant" name="ed.participant" placeholder="צפי משתתפים" class="form-control" required="true" value="" type="text" disabled>
                    </div>
                </div>

            </div>


            <div class="form-group row">
                <label for="participant" class="col-sm-2 col-form-label">אחריות</label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="responsible" name="responsible" placeholder="צפי משתתפים" class="form-control" required="true" value="" type="text" disabled>
                    </div>
                </div>

            </div>

           

            <div class="form-group row">
                <label for="projectCost" class="col-sm-2 col-form-label">עלות הקורס</label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="projectCost" name="projectCost" placeholder="עלות הקורס" class="form-control" required="true"  value="" type="text" disabled>
                    </div>
                </div>
            </div>

            <div class="form-group row">
                <label for="participant" class="col-sm-2 col-form-label">כמות משתתפים שהגיעו</label>
                <div class="col-md-2 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="ActualParticipant" class="form-control" required="true" value="" type="number" min="0">
                    </div>
                </div>

            </div>
            <div class="loading-spiner-holder text-center p-5" data-loading>
        <button class="btn btn-primary">
            <span class="spinner-border spinner-border-sm"></span>
           מעדכן פרויקט...
        </button>
    </div>



            <br>
            <div class="col-sm-10 text-left">
                <button ng-click="ParticipantProj()" class="btn btn-primary btn-lg">שמור שינויים</button>
            </div>

        </fieldset>

    </form>

</div>