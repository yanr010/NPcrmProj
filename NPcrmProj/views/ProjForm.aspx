<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjForm.aspx.cs" Inherits="NPcrmProj.views.ProjForm" %>

<div class="text-center" style="background-color: rgb(240, 240, 240)">
        <img src="pics/merkaz.jpg" style="width:100px;height:100px;">
    </div>
    <div class="text-center">
        <h2>כרטיס פרויקט</h2>
    </div>

        <div>
            <form class="well form-horizontal" style="background-color: rgb(250, 250, 250)">
                <fieldset>
                    <div class="form-group row">
                        <label for="projName" class="col-sm-2 col-form-label">שם פרויקט<span style="color: red">   *</span></label>
                        <div class="col-md-4 inputGroupContainer">
                            <div class="input-group">
                                <input id="projName" name="projName" placeholder="שם פרויקט" class="form-control" required="true" value="" type="text">
                            </div>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="description" class="col-sm-2 col-form-label">הסבר קצר ורקע לאירוע<span style="color: red">   *</span></label>
                        <textarea class="form-control col-sm-8" id="description" rows="6"></textarea>
                    </div>
                    <div class="form-group row">
                        <label for="startDate" class="col-sm-2 col-form-label">תאריך האירוע<span style="color: red">   *</span></label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input id="startDate" name="startDate" placeholder="תאריך האירוע" class="form-control" required="true" value="" type="date">
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="frequency" class="col-sm-2 col-form-label">תדירות האירוע<span style="color: red">   *</span></label>
                        <div class="col-md-3 inputGroupContainer">
                            <div class="form-group">
                                <select class="form-control" id="frequency">
                                    <option>חד פעמי</option>
                                    <option>שבועי</option>
                                    <option>פעמיים בשבוע</option>
                                    <option>חודשי</option>
                                    <option>שנתי</option>
                                    <option>אחר</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="finalDate" class="col-sm-2 col-form-label">תאריך סיום</label>
                        <div class="col-md-3 inputGroupContainer">
                            <div class="input-group">
                                <input id="finalDate" name="finalDate" placeholder="תאריך סיום" class="form-control" required="false" value="" type="date">
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="location" class="col-sm-2 col-form-label">מיקום<span style="color: red">   *</span></label>
                        <div class="col-md-3 inputGroupContainer">
                            <div class="input-group">
                                <input id="location" name="location" placeholder="מיקום" class="form-control" required="true" value="" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="time" class="col-sm-2 col-form-label">שעת התחלה<span style="color: red">   *</span></label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input id="time" name="time" placeholder="שעת התחלה" class="form-control" required="true" value="" type="time">
                            </div>
                        </div>

                    </div>

                    <div class="form-group row">
                        <label for="finaltime" class="col-sm-2 col-form-label">שעת סיום</label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input id="finaltime" name="finaltime" placeholder="שעת סיום" class="form-control" required="false" value="" type="time">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="participant" class="col-sm-2 col-form-label">צפי משתתפים<span style="color: red">   *</span></label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input id="participant" name="participant" placeholder="צפי משתתפים" class="form-control" required="true" value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="responsible" class="col-sm-2 col-form-label">אחריות<span style="color: red">   *</span></label>
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
                        <label for="format" class="col-sm-2 col-form-label">מבנה האירוע</label>
                        <textarea class="form-control col-sm-8" id="format" rows="3"></textarea>
                    </div>
                    <div class="form-group row">
                        <label for="refreshments" class="col-sm-2 col-form-label">עלות כיבוד לפתיחת הקורס</label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input id="refreshments" name="refreshments" placeholder="עלות כיבוד" class="form-control" required="false" value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="projectCost" class="col-sm-2 col-form-label">עלות הקורס<span style="color: red">   *</span></label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input id="projectCost" name="projectCost" placeholder="עלות הקורס" class="form-control" required="true" value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="extraCost" class="col-sm-2 col-form-label">עלות נוספות</label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input id="extraCost" name="extraCost" placeholder="עלות נוספות" class="form-control" required="false" value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="fees" class="col-sm-2 col-form-label">דמי רצינות</label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input id="fees" name="fees" placeholder="דמי רצינות" class="form-control" required="false" value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="budget" class="col-sm-2 col-form-label">סעיף תקציבי<span style="color: red">   *</span></label>
                        <div class="col-md-3 inputGroupContainer">
                            <div class="input-group">
                                <input id="budget" name="budget" placeholder="סעיף תקציבי" class="form-control" required="true" value="" type="text">
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
