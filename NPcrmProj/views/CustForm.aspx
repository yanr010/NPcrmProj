<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustForm.aspx.cs" Inherits="NPcrmProj.views.CustForm" %>

<div style="background-color:rgb(250, 250, 250)">
    
    <div class="text-center p-3">
        <h2>טופס אינטק - שאלון הכרות</h2>
    </div>
    
 <ul class="nav nav-tabs nav-justified">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#home">פרטים אישיים</a>
  </li>
    <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#education">השכלה</a>
  </li>

  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#MilitaryService">שירות צבאי</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#employment">תעסוקה</a>
  </li>
<li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#ReasonforArrival">סיבת הגעה</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#Conclusions">מסקנות</a>
  </li>
</ul>
<div id="myTabContent" class="tab-content"   style="background-color:rgb(240, 240, 240)">
  <div class="tab-pane fade show active" id="home" >
                        <form class="well form-horizontal text-right">
                            <fieldset>
                                <br>
                                <div class="form-group row">
                                <label for="firstName" class="col-sm-2 col-form-label">שם פרטי<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="firstName" name="firstName" placeholder="שם פרטי" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="lastName" class="col-sm-2 col-form-label">שם משפחה<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="lastName" name="lastName" placeholder="שם משפחה" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="id" class="col-sm-2 col-form-label">תעודת זהות<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="id" name="id" placeholder="תעודת זהות" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="Email" class="col-sm-2 col-form-label">כתובת דוא"ל<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"> <input id="Email" name="Email" placeholder="מייל" type="email" class="form-control"  required="true">
                                        </div>
                                        </div>
                                    </div>
                                 <div class="form-group row">
                                    <label for="mobile" class="col-md-2 control-label">טלפון נייד<span style="color:red">   *</span></label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="mobile" name="mobile" placeholder="טלפון נייד" class="form-control" type="number" maxlength="10" name="mobile" required="true"></div>
                                    </div>
                                    
                                </div>
                                <div class="form-group row">
                                    <label for="gender" class="col-md-2 control-label">מין<span style="color:red">   *</span></label>
                                    <div class="col-md-2 inputGroupContainer" required="true">
                                        <input type="radio" name="gender" value="male"> זכר
                                        <input type="radio" name="gender" value="female"> נקבה
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <label for="birthDate" class="col-md-2 control-label">תאריך לידה<span style="color:red">   *</span></label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="birthDate" name="birthDate" placeholder="תאריך לידה" class="form-control" type="date" name="birthDate" min="1000-01-01"
                                        max="3000-12-31" class="form-control"  required="true"></div>
                                    </div>
                                    
                                </div>
                               
                                 
                                     <div class="form-group row">
                                    <label for="city" class="col-sm-2 col-form-label">עיר<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="city" name="city" placeholder="עיר" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                     <div class="form-group row">
                                    <label for="address" class="col-sm-2 col-form-label">כתובת<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="address" name="address" placeholder="כתובת" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 
                                 
                                
                               
                                
                               
                                
                                
                            </fieldset>
                        </form>
    </div>
  <div class="tab-pane fade" id="education"  style="background-color:rgb(240, 240, 240)">
                        <form class="well form-horizontal text-right">
                            <fieldset>
                                <br>
                                <div class="form-group row">
                                    <label for="yearsofEducation" class="col-sm-2 col-form-label">מספר שנות לימוד</label>
                                    <div class="col-md-2 inputGroupContainer">
                                        <div class="input-group"><input id="yearsofEducation" name="yearsofEducation" placeholder="מספר שנות לימוד" class="form-control" required="false" value="" type="number">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="Education" class="col-md-2 control-label">בגרות<span style="color:red">   *</span></label>
                                    <div class="col-md-2 inputGroupContainer">
                                        <input type="radio" name="Education" value="1"> מלאה
                                        <input type="radio" name="Education" value="0"> חלקית
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="Student" class="col-md-2 control-label">סטודנט</label>
                                    <div class="col-md-2 inputGroupContainer">
                                        <input type="radio" name="partnerWork" value="1" >כן
                                        <input type="radio" name="partnerWork" value="0"> לא
                                    </div>
                                   
                                </div>
                                 
                               
                                 <div class="form-group row">
                                    <label for="AcademicDegree" class="col-sm-2 col-form-label">בעל תואר אקדמי במקצוע</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="AcademicDegree" name="AcademicDegree" placeholder="תואר אקדמי" class="form-control" required="false" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="qualification" class="col-sm-2 col-form-label">בעל הכשרה מקצועית בתחום</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"> <input id="qualification" name="qualification" placeholder="תחום הכשרה" type="email" class="form-control"  required="false">
                                      </div>
                                        </div>
                                    </div>
                            </fieldset>
                        </form>
                  
    </div>
     
     <div class="tab-pane fade" id="MilitaryService"  style="background-color:rgb(240, 240, 240)">
                        <form class="well form-horizontal text-right">
                            <fieldset>
                                <br>
                                <div class="form-group row">
                                    <label for="militaryService" class="col-sm-2 col-form-label">סוג שירות<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="militaryService">
                                                <option>צבאי</option>
                                                 <option>לאומי</option>
                                                 <option>אזרחי</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="role" class="col-sm-2 col-form-label">תפקיד</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="role" name="role" placeholder="תפקיד" class="form-control" required="false" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 
                                
                               
                 
                                  
                            </fieldset>
                        </form>
                
    </div>
     <div class="tab-pane fade" id="employment"  style="background-color:rgb(240, 240, 240)">
     
                        <form class="well form-horizontal text-right">
                            <fieldset>
                                <br>
                                  <div class="form-group row">
                                    <label for="workStatus" class="col-sm-2 control-label">סטטוס<span style="color:red">   *</span></label>
                                    <div class="col-sm-2 inputGroupContainer">
                                        <input type="radio" name="license" value="1" > עובד
                                        <input type="radio" name="license" value="0" > לא עובד
                                    </div>
                                   
                                </div>
                                 
                                   
                                
                            </fieldset>
                        </form>
    </div>
    <div class="tab-pane fade" id="ReasonforArrival" style="background-color:rgb(240, 240, 240)">
                        <form class="well form-horizontal text-right">
                            <fieldset>
                                <br>
                                 <div class="form-group float-right mb-3">
                                 <label for="Services" class="col-sm-right-2 col-form-label">שירותים רלוונטים<span style="color:red">   *</span></label>
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services1" name="Services1">
                                     <label class="custom-control-label" for="Services1">מציאת עבודה </label>
                                    </div>
                               <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services2" name="Services2">
                                     <label class="custom-control-label" for="Services2">כספים</label>
                                    </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services3" name="Services3">
                                    <label class="custom-control-label" for="Services3">מלגות לימודים</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services4" name="Services4">
                                    <label class="custom-control-label" for="Services4"> לימודים</label>
                                </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services5" name="5">
                                    <label class="custom-control-label" for="Services5">זכויות של חיילים משוחררים</label>
        
                                </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services6" name="Services6">
                                     <label class="custom-control-label" for="Services6">קורסי פסיכומטרי </label>
                                    </div>
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services7" name="Services7">
                                     <label class="custom-control-label" for="Services7">משפחה והורות </label>
                                    </div>
                                
                                </div>
                                 <div class="form-group float-right mb-3">
                                 <label for="Directions" class="col-sm-right-2 col-form-label">דרך הגעה למרכז צעירים:</label>
                                    <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Directions1" name="Directions1">
                                     <label class="custom-control-label" for="Directions1">פרסום בעיתון או בדואר</label>
                                    </div>
                                 <div class="custom-control custom-checkbox">
                                   <input type="checkbox" class="custom-control-input" id="Directions2" name="Directions2">
                                     <label class="custom-control-label" for="Directions2">פייסבוק</label>
                                </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Directions3" name="Directions3">
                                    <label class="custom-control-label" for="Directions3">המצלת חברים</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Directions4" name="Directions4">
                                    <label class="custom-control-label" for="Directions4"> אתר האינטרנט youngs-maalot.co.il</label>
                                </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Directions5" name="Directions5">
                                    <label class="custom-control-label" for="Directions5">אחר</label>
                                     <div class="input-group"><input id="Directions5" name="Directionד5" class="form-control" required="false" value="" type="text">
                                </div>
                                </div>
                                </div>
                            </fieldset>
                        </form>
        
    </div>
    <div class="tab-pane fade" id="Conclusions" style="background-color:rgb(240, 240, 240)">
                        <form class="well form-horizontal text-right">
                            <fieldset>
                                <br>
                                 <div class="form-group row">
                                     <label for="Summary" class="col-sm-2 col-form-label">  סיכום פגישה<span style="color:red">   *</span></label>
                                     <textarea class="form-control col-sm-8" id="Summary" rows="6"></textarea>
                                </div>
                                 
                    
                                <div class="form-group float-right mb-3 col-sm-right-6">
                                 <label for="distribution" class="col-sm-right-2 col-form-label">קבלת מידע באמצעות<span style="color:red">   *</span></label>
                                    <div class="custom-control custom-checkbox">
                                   
                                    <input type="checkbox" class="custom-control-input" id="distribution1" name="distribution1">
                                     <label class="custom-control-label" for="distribution1">SMS</label>
                                    </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="distribution2" name="distribution2">
                                    <label class="custom-control-label" for="distribution2">Mail</label>

                                </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="distribution3" name="distribution3">
                                    <label class="custom-control-label" for="distribution3">Whatsapp</label>
                                </div>
                               
                                </div>
                                
                            </fieldset>
                        </form>
    </div>
    </div>
    </div>

