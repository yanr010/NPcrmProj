<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Email.aspx.cs" Inherits="NPcrmProj.views.Email" %>


<div class="text-right" style="padding:5px;">
    <h2>משלוח מסר ללקוחות</h2>

    <div class="form-group">
        <img src="pics/mail.svg" style="width: 20%; float: left;">

        <label for="exampleFormControlSelect1" class="text-right" >קטגוריית לקוחות</label>
        <select class="form-control col-sm-2 col-form-label"" id="exampleFormControlSelect1" style="width: 15%;">
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
        <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="" style="width: 70%;">
    </div>

    <div class="form-group">
        <label for="exampleFormControlTextarea1">תוכן ההודעה</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="width: 70%;"></textarea>
        <button type="button" class="btn btn-primary" style="float: left;">שלח</button>
    </div>

</div>
