<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="NPcrmProj.views.Email" %>

<form>
<div class="text-right" style="padding:5px;" runat="server">
    <h2>משלוח מסר ללקוחות</h2>

    <div class="form-group">
        <img src="pics/mail.svg" style="width: 20%; float: left;">

        <label for="exampleFormControlSelect1" class="text-right" >קטגוריית לקוחות</label>
        <select class="form-control col-sm-2 col-form-label" ng-model="mail.cat" style="width: 200px;">
            <option value="1">לימודים</option>
            <option value="2">מלגות לימודים</option>
            <option value="3">מציאת עבודה</option>
            <option value="4">כספים</option>
            <option value="5">זכויות לחיילים משוחררים</option>
            <option value="6">פסיכומטרי</option>
            <option value="7">משפחה והורות</option>
        </select>
    </div>
    <div class="form-group">
        <label for="exampleFormControlInput1">כותרת ההודעה</label>
        <input type="text" class="form-control" ng-model="mail.subject" placeholder="" style="width: 70%;">
    </div>

    <div class="form-group">
        <label for="exampleFormControlTextarea1">תוכן ההודעה</label>
        <textarea class="form-control" ng-model="mail.body" rows="3" style="width: 70%;"></textarea>
        <button type="button" class="btn btn-primary" ng-click="sendmail(mail)"  style="float: left;">שלח</button>
        
        
    </div>

</div>
    </form>