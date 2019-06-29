<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="NPcrmProj.views.settings" %>

<div class="text-center p-2">
    <i class="fas fa-cog fa-2x">&nbsp&nbsp<span">פרטי משתמש</span></i>
</div>


<div align="right" style="background-color: rgb(240, 240, 240)">
    <form class="well form-horizontal">
        <fieldset>
            <div class="form-group row">
                <label for="taskName" class="col-sm-2 col-form-label">שם משתמש</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="username" class="form-control" type="text" disabled>
                    </div>
                </div>
            </div>

                  <div class="form-group row">
                <label for="taskName" class="col-sm-2 col-form-label">הרשאה</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="userprofile" class="form-control" type="text" disabled>
                    </div>
                </div>
            </div>

                  <div class="form-group row">
                <label for="taskName" class="col-sm-2 col-form-label">דואר אלקטרוני</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="useremail" class="form-control" type="text" disabled>
                    </div>
                </div>
            </div>

                  <div class="form-group row">
                <label for="taskName" class="col-sm-2 col-form-label">מחלקה</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="userdep" class="form-control"  type="text" disabled>
                    </div>
                </div>
            </div>


            <br>



            <div class="col-sm-10" ng-if="changepass1">
                <button ng-click="changepass()" class="btn btn-primary btn-lg">שינוי סיסמא</button>
            </div>
            <div ng-if="chngpass">
            <div class="form-group row">
                <label for="taskName" class="col-sm-2 col-form-label">סיסמא ישנה</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="oldpass" class="form-control"  type="text" >
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="taskName" class="col-sm-2 col-form-label">סיסמא חדשה</label>
                <div class="col-md-4 inputGroupContainer">
                    <div class="input-group">
                        <input ng-model="newpass" class="form-control"  type="text" >
                    </div>
                </div>
            </div>


            <div class="col-sm-10">
                <button ng-click="changenewpass()" class="btn btn-primary btn-lg">שנה סיסמא</button>
            </div>
                </div>
        </fieldset>
    </form>

</div>