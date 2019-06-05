<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustForm.aspx.cs" Inherits="NPcrmProj.views.CustForm" %>

<div style="background-color:rgb(250, 250, 250)">
    <div class="text-center">
        <img src="pics/merkaz.jpg" style="width:100px;height:100px;">
        <img src="pics/maalot.jpg" style="width:100px;height:90px;">
    </div>
    <div class="text-center">
        <h2>מרכז צעירים ורשות מקדמת תעסוקה - טופס אינטק - שאלון הכרות</h2>
    </div>
    
 <ul class="nav nav-tabs nav-justified">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#home">פרטים אישיים</a>
  </li>
    <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#education">השכלה</a>
  </li>
 <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#language">שפות</a>
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
                                    <label for="immigrationCountry" class="col-md-2 control-label">ארץ מוצא</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <span class="input-group-addon" style="max-width: 100%;"><i class="glyphicon glyphicon-list"></i>
                                            </span>
                                            <select class="selectpicker countrypicker"></select>
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="immigrationDate" class="col-sm-2 col-form-label">תאריך עלייה</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="immigrationDate" name="immigrationDate" placeholder="תאריך עלייה" class="form-control" required="false" value="" type="Date">
                                        </div>
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
                                 <div class="form-group row">
                                    <label for="status" class="col-md-2 col-form-label">מצב משפחתי<span style="color:red">   *</span></label>
                                    <div class="col-md-2 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="status">
                                                <option>רווק/ה</option>
                                                <option>נשוי/נשואה</option>
                                                <option>אלמן/ה</option>
                                                <option>גרוש/ה</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="children" class="col-sm-2 col-form-label">מספר ילדים</label>
                                    <div class="col-md-2 inputGroupContainer">
                                        <div class="input-group"><input id="children" name="children" placeholder="מספר ילדים" class="form-control" value="" type="number" min="0" required="false">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="license" class="col-sm-2 control-label">רשיון</label>
                                    <div class="col-sm-2 inputGroupContainer">
                                        <input type="radio" name="license" value="1" > כן
                                        <input type="radio" name="license" value="0" > לא
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <label for="car" class="col-md-2 control-label">רכב</label>
                                    <div class="col-md-2 inputGroupContainer">
                                        <input type="radio" name="car" value="1" > כן
                                        <input type="radio" name="car" value="0"> לא
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <label for="licenseType" class="col-sm-2 col-form-label">סוג רשיון</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="licenseType">
                                                <option>פרטי</option>
                                                 <option>עד 12 טון</option>
                                                 <option>עד 15 טון</option>
                                                 <option>מעל 15 טון</option>
                                             
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="partnerWork" class="col-md-2 control-label">בן/בת זוג עובד</label>
                                    <div class="col-md-2 inputGroupContainer">
                                        <input type="radio" name="partnerWork" value="1" >כן
                                        <input type="radio" name="partnerWork" value="0"> לא
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <label for="healthStatus" class="col-sm-2 col-form-label">מצב בריאותי</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="healthStatus">
                                               <option>בריא</option>
                                                <option>חולה כרוני</option>
                                                <option>מוגבל</option>
                                                <option>נכה</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="allowance" class="col-sm-2 col-form-label">מקבל קצבה חודשית</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="allowance">
                                              <option>אבטלה</option>
                                                <option>נכות</option>
                                                <option>הבטחת הכנסה</option>
                                            </select>
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
                                    <label for="year" class="col-sm-2 col-form-label">שנת לימוד</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="year" name="year" placeholder="שנת לימוד" class="form-control" required="false" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="University" class="col-sm-2 col-form-label">מקום לימוד</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="University" name="University" placeholder="מקום לימוד" class="form-control" required="false" value="" type="number">
                                        </div>
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
     <div class="tab-pane fade" id="language"  style="background-color:rgb(240, 240, 240)">
                        <form class="well form-horizontal text-right">
                            <fieldset>
                                <br>
                                <div class="form-group row">
                                    <label for="hebrew" class="col-sm-2 col-form-label">עברית<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="hebrew">
                                                <option>שפת אם</option>
                                                 <option>רמה טובה מאוד</option>
                                                 <option>רמה טובה</option>
                                                 <option>בינוני</option>
                                                <option>חלש</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                   <div class="form-group row">
                                    <label for="english" class="col-sm-2 col-form-label">אנגלית<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="english">
                                                <option>שפת אם</option>
                                                 <option>רמה טובה מאוד</option>
                                                 <option>רמה טובה</option>
                                                 <option>בינוני</option>
                                                <option>חלש</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                   <div class="form-group row">
                                    <label for="arabic" class="col-sm-2 col-form-label">ערבית</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="arabic">
                                                <option>שפת אם</option>
                                                 <option>רמה טובה מאוד</option>
                                                 <option>רמה טובה</option>
                                                 <option>בינוני</option>
                                                <option>חלש</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                   <div class="form-group row">
                                    <label for="russian" class="col-sm-2 col-form-label">רוסית</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="russian">
                                                <option>שפת אם</option>
                                                 <option>רמה טובה מאוד</option>
                                                 <option>רמה טובה</option>
                                                 <option>בינוני</option>
                                                <option>חלש</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="language1" class="col-sm-2 col-form-label">אחר</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="language1" name="language1" placeholder="אחר" class="form-control" required="false" value="" type="text">
                                        </div>
                                    </div>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="hebrew">
                                                <option>שפת אם</option>
                                                 <option>רמה טובה מאוד</option>
                                                 <option>רמה טובה</option>
                                                 <option>בינוני</option>
                                                <option>חלש</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="language2" class="col-sm-2 col-form-label">אחר</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="language1" name="language2" placeholder="אחר" class="form-control" required="false" value="" type="text">
                                        </div>
                                    </div>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="hebrew">
                                                <option>שפת אם</option>
                                                 <option>רמה טובה מאוד</option>
                                                 <option>רמה טובה</option>
                                                 <option>בינוני</option>
                                                <option>חלש</option>
                                            </select>
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
                                 <div class="form-group row">
                                    <label for="recruitmentDate" class="col-md-2 control-label">תאריך גיוס</label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="recruitmentDate" name="recruitmentDate" placeholder="תאריך גיוס" class="form-control" type="date" name="birthDate" min="1000-01-01"
                                        max="3000-12-31" class="form-control"  required="false"></div>
                                    </div>
                                    
                                </div>
                                <div class="form-group row">
                                    <label for="serviceType" class="col-sm-2 col-form-label">סוג חיול</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="serviceType">
                                                <option>לוחם</option>
                                                 <option>תומך לחימה</option>
                                                 <option>שירות כללי</option>
                                            </select>
                                        </div>
                                        </div>
                                </div>
                                <div class="form-group row">
                                    <label for="releaseDate" class="col-md-2 control-label">תאריך שחרור</label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="releaseDate" name="releaseDate" placeholder="תאריך שחרור" class="form-control" type="date" name="birthDate" min="1000-01-01"
                                        max="3000-12-31" class="form-control"  required="false"></div>
                                    </div>
                                    
                                </div>
                 
                                   <div class="form-group row">
                                    <label for="releaseReason" class="col-sm-2 col-form-label">סיבת שחרור</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" id="releaseReason">
                                                <option>תום שירות</option>
                                                 <option>טעמי בריאות</option>
                                                 <option>אחר</option>
                                            </select>
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
                                 <div class="form-group row">
                                    <label for="lastWork" class="col-sm-2 col-form-label">מקום עבודה אחרון</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="lastWork" name="lastWork" placeholder="מקום עבודה" class="form-control" required="false" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                      <div class="form-group row">
                                    <label for="work3Month" class="col-sm-2 control-label">האם עבד ב-3 חודשים אחרונים?<span style="color:red">   *</span></label>
                                    <div class="col-sm-2 inputGroupContainer">
                                        <input type="radio" name="license" value="1" > כן
                                        <input type="radio" name="license" value="0" > לא
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <label for="month2Years" class="col-sm-2 col-form-label">כמה חודשים עבד בשנתיים האחרונות?</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input id="month2Years" name="month2Years" placeholder="מספר חודשים" class="form-control" required="false" value="" type="number">
                                        </div>
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
                                     <label class="custom-control-label" for="Services1">סיוע בחיפוש עבודה/ בניית קורות חיים/ הכנה לראיון עבודה/ אמצעים לחיפוש עבודה</label>
                                    </div>
                                 <div class="custom-control custom-checkbox">
                                   <input type="checkbox" class="custom-control-input" id="Services2" name="Services2">
                                     <label class="custom-control-label" for="Services2">קורסים: עברית/ אנגלית/ פסיכומטרי/ הכשרה מקצועית/ אחר</label>
                                </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services3" name="Services3">
                                    <label class="custom-control-label" for="Services3">מידע על מלגות לימודים</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services4" name="Services4">
                                    <label class="custom-control-label" for="Services4"> ייעוץ לימודים אקדמאיים, תחום לימודים, מקום, תנאי קבלה וכו'</label>
                                </div>
                                 <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="Services5" name="5">
                                    <label class="custom-control-label" for="Services5">מידע על זכויות של חיילים משוחררים ובנית שירות לאומי ואזרחי</label>
        
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
                                 <div class="form-group row ">
                                     <label for="Jobs"class="col-sm-2 col-form-label">  משרות לשליחה</label>
                                     <textarea class="form-control col-sm-8" id="Jobs" rows="6"></textarea>
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

