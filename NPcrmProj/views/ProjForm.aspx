<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjForm.aspx.cs" Inherits="NPcrmProj.views.ProjForm" %>

<div  class="text-center" style="background-color: rgb(240, 240, 240)" >
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
                                <input type="text" ng-model="data.projname"  placeholder="שם פרויקט" class="form-control" required="true" oninvalid="this.setCustomValidity('נא להכניס שם פרויקט')" oninput="setCustomValidity('')" >
                            </div>
                        </div>
                    </div>


                    <div class="form-group row">
                        <label for="description" class="col-sm-2 col-form-label">הסבר קצר ורקע לאירוע<span style="color: red">   *</span></label>
                        <textarea class="form-control col-sm-8" ng-model="data.description" rows="6" required="true" oninvalid="this.setCustomValidity('נא להכניס הסבר')" oninput="setCustomValidity('')"></textarea>
                    </div>
                    <div class="form-group row">
                        <label for="startDate" class="col-sm-2 col-form-label">תאריך האירוע<span style="color: red">   *</span></label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.startDate" name="startDate" placeholder="תאריך האירוע" class="form-control" required="true" oninvalid="this.setCustomValidity('נא לבחור תאריך האירוע')" oninput="setCustomValidity('')" value="" type="date">
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="frequency" class="col-sm-2 col-form-label">תדירות האירוע<span style="color: red">   *</span></label>
                        <div class="col-md-3 inputGroupContainer">
                            <div class="form-group">
                                <select class="form-control" ng-model="data.frequency" required="true" oninvalid="this.setCustomValidity('יש לבחור תדירות')" oninput="setCustomValidity('')">
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
                                <input ng-model="data.finalDate" name="finalDate" placeholder="תאריך סיום" class="form-control" value="" type="date">
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="location" class="col-sm-2 col-form-label">מיקום<span style="color: red">   *</span></label>
                        <div class="col-md-3 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.location" name="location" placeholder="מיקום" class="form-control" required="true" oninvalid="this.setCustomValidity('נא להכניס מיקום')" oninput="setCustomValidity('')" value="" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="time" class="col-sm-2 col-form-label">שעת התחלה<span style="color: red">   *</span></label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.time" name="time" placeholder="שעת התחלה" class="form-control" required="true" oninvalid="this.setCustomValidity('נא להכניס שעת התחלה')" oninput="setCustomValidity('')" value="" type="time">
                            </div>
                        </div>

                    </div>

                    <div class="form-group row">
                        <label for="finaltime" class="col-sm-2 col-form-label">שעת סיום</label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.finaltime" name="finaltime" placeholder="שעת סיום" class="form-control" value="" type="time">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="participant" class="col-sm-2 col-form-label">צפי משתתפים<span style="color: red">   *</span></label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.participant" name="participant" placeholder="צפי משתתפים" class="form-control" required="true" oninvalid="this.setCustomValidity('נא להכניס צפי משתתפים')" oninput="setCustomValidity('')" value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="responsible" class="col-sm-2 col-form-label">אחריות<span style="color: red">   *</span></label>
                        <div class="col-md-3 inputGroupContainer">
                            <div class="form-group">
                                <select class="form-control" ng-model="data.responsible">
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
                        <textarea class="form-control col-sm-8" ng-model="data.format" rows="3"></textarea>
                    </div>
                    <div class="form-group row">
                        <label for="refreshments" class="col-sm-2 col-form-label">עלות כיבוד לפתיחת הקורס</label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.refreshments" name="refreshments" placeholder="עלות כיבוד" class="form-control" value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="projectCost" class="col-sm-2 col-form-label">עלות הקורס<span style="color: red">   *</span></label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.projectCost" name="projectCost" placeholder="עלות הקורס" class="form-control" required="true" oninvalid="this.setCustomValidity('נא להכניס עלות קורס')" oninput="setCustomValidity('')" value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="extraCost" class="col-sm-2 col-form-label">עלות נוספות</label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.extraCost" name="extraCost" placeholder="עלות נוספות" class="form-control"  value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="fees" class="col-sm-2 col-form-label">דמי רצינות</label>
                        <div class="col-md-2 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.fees" name="fees" placeholder="דמי רצינות" class="form-control"  value="" type="number">
                            </div>
                        </div>

                    </div>
                    <div class="form-group row">
                        <label for="budget" class="col-sm-2 col-form-label">סעיף תקציבי<span style="color: red">   *</span></label>
                        <div class="col-md-3 inputGroupContainer">
                            <div class="input-group">
                                <input ng-model="data.budget" name="budget" placeholder="סעיף תקציבי" class="form-control" required="true" oninvalid="this.setCustomValidity('נא להכניס סעיף תקציבי')" oninput="setCustomValidity('')" value="" type="text">
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="col-sm-10 text-left">
                        <button ng-click="submitproj()" class="btn btn-primary btn-lg">אישור</button>
                    </div>
                </fieldset>

            </form>

        </div>