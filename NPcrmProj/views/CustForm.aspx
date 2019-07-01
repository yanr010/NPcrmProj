<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustForm.aspx.cs" Inherits="NPcrmProj.views.CustForm" %>

<div class="text-center p-3">
        <h2>הוספת לקוח חדש</h2>
    </div>
    <div>
        <form class="well form-horizontal text-right border">
                            <fieldset>
  <div style="background-color:rgb(240, 240, 240)">
                        
                                <H5>פרטים אישיים:</H5>
                                <div class="form-group row">
                                <label class="col-sm-2 col-form-label">שם פרטי<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.firstName" placeholder="שם פרטי" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">שם משפחה<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.lastName" placeholder="שם משפחה" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label class="col-sm-2 col-form-label">תעודת זהות<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.id" ng-style="idval" ng-change="IdValidation(data)" placeholder="תעודת זהות" class="form-control" required value="" type="text"
                                                oninvalid="this.setCustomValidity('תעודת זהות לא תקינה')" oninput="setCustomValidity('')">
                                            &nbsp&nbsp<span ng-show="idred"><p class="text-danger">תעודת זהות קיימת במערכת</p></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="Email" class="col-sm-2 col-form-label">כתובת דוא"ל<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"> 
                                            <input ng-model="data.email" ng-style="emailval" ng-change="EmailValidation(data)" placeholder="מייל" type="text" class="form-control"  required
                                                oninvalid="this.setCustomValidity('מייל לא תקין')" oninput="setCustomValidity('')">
                                            &nbsp&nbsp<span ng-show="emailred"><p class="text-danger">אימייל זה קיים במערכת</p></span>
                                        </div>
                                        </div>
                                    </div>
                                 <div class="form-group row">
                                    <label for="mobile" class="col-md-2 control-label">טלפון נייד<span style="color:red">   *</span></label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.mobile" placeholder="טלפון נייד" class="form-control" type="tel" name="mobile" required
                                                oninvalid="this.setCustomValidity('טלפון לא תקין')" oninput="setCustomValidity('')"></div>
                                    </div>
                                    
                                </div>
                                <div class="form-group row">
                                    <label for="gender" class="col-md-2 control-label">מין<span style="color:red">   *</span></label>
                                    <div class="col-md-2 inputGroupContainer" required>
                                      
                                          <input  ng-model="data.gender" type="radio" value="male"> זכר
                                        <input  ng-model="data.gender" type="radio" value="female"> נקבה
                                       
                                      
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <label for="birthDate" class="col-md-2 control-label">תאריך לידה<span style="color:red">   *</span></label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.birthDate" placeholder="תאריך לידה" class="form-control" type="date" name="birthDate" min="1000-01-01"
                                        max="3000-12-31" class="form-control"  required></div>
                                    </div>
                                    
                                </div>
        
                                 
                                     <div class="form-group row">
                                    <label for="city" class="col-sm-2 col-form-label">עיר<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.city" placeholder="עיר" class="form-control" required value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                     <div class="form-group row">
                                    <label for="address" class="col-sm-2 col-form-label">כתובת<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input ng-model="data.address" placeholder="כתובת" class="form-control" required value="" type="text">
                                        </div>
                                    </div>
                                </div>
                         
                                
                            
    </div>
    <div style="background-color:rgb(245, 245, 245")>
                        
                                <br>
                                <H5>פרטים נוספים:</H5>
                         
                                 <div class="form-group row">
                                    <label for="Education" class="col-md-2 control-label">בגרות<span style="color:red">   *</span></label>
                                    <div class="col-md-2 inputGroupContainer" >
                                        
                                        <input ng-model="data.Education" type="radio"  value="true"> מלאה
                                        <input ng-model="data.Education" type="radio" value="false"> חלקית
                                      
                                        
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="Student" class="col-md-2 control-label">סטודנט</label>
                                    <div class="col-md-2 inputGroupContainer">
                                        
                                            <input ng-model="data.student" type="radio"  value="true" >כן
                                        <input ng-model="data.student" type="radio"value="false"> לא
                                      
                                    </div>
                                   
                                </div>
                                 
                                      <div class="form-group row">
                                    <label for="studyField" class="col-sm-2 col-form-label">תחום לימודים</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"> 
                                            <input ng-model="data.studyField" placeholder="תחום לימודים" type="text" class="form-control"  required>
                                      </div>
                                        </div>
                                    </div>
                                 <div class="form-group row">
                                    <label for="AcademicDegree" class="col-sm-2 col-form-label">בעל תואר אקדמי במקצוע</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.AcademicDegree" placeholder="תואר אקדמי" class="form-control" required value="" type="text">
                                        </div>
                                    </div>
                                </div>
                         
          
                                <div class="form-group row">
                                    <label for="militaryService" class="col-sm-2 col-form-label">סוג שירות<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" ng-model="data.militaryService">
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
                                        <div class="input-group">
                                            <input ng-model="data.role" placeholder="תפקיד" class="form-control" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 
                            
                                  <div class="form-group row">
                                    <label for="workStatus" class="col-sm-2 control-label">סטטוס<span style="color:red">   *</span></label>
                                    <div class="col-sm-2 inputGroupContainer">
                                        
                                           <input ng-model="data.work" type="radio"  value="true" > עובד
                                        <input ng-model="data.work" type="radio"  value="false" > לא עובד
                                      
                                  
                                    </div>
                                   
                                </div>
  
                            
    </div>
    <div style="background-color:rgb(240, 240, 240)">
                        
                                <br>
                                <H5>סיבת הגעה</H5>
                                      <div class="form-group text-right">
                <label for="Services" class="col-sm-right-2 col-form-label">שירותים רלוונטים<span style="color: red">   *</span></label>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp1" class="custom-control-input" id="Services1" name="Services1">
                    <label class="custom-control-label" for="Services1">מציאת עבודה </label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp2" class="custom-control-input" id="Services2" name="Services2">
                    <label class="custom-control-label" for="Services2">כספים</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp3" class="custom-control-input" id="Services3" name="Services3">
                    <label class="custom-control-label" for="Services3">מלגות לימודים</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp4" class="custom-control-input" id="Services4" name="Services4">
                    <label class="custom-control-label" for="Services4">לימודים</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp5" class="custom-control-input" id="Services5" name="5">
                    <label class="custom-control-label" for="Services5">זכויות של חיילים משוחררים</label>

                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp6" class="custom-control-input" id="Services6" name="Services6">
                    <label class="custom-control-label" for="Services6">קורסי פסיכומטרי </label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp7" class="custom-control-input" id="Services7" name="Services7">
                    <label class="custom-control-label" for="Services7">משפחה והורות </label>
                </div>
            </div>
                               <div class="form-group row">
                                    <label for="department" class="col-sm-2 col-form-label">השתייכות למחלקה<span style="color:red">   *</span></label>
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
                                </div>
        
                      
                            
        
    <div style="background-color:rgb(245, 245, 245)">
                        
                                <br>
                                  <H5>מסקנות:</H5>
                                 <div class="form-group row">
                                     <label for="Summary" class="col-sm-2 col-form-label">  סיכום פגישה<span style="color:red">   *</span></label>
                                     <textarea class="form-control col-sm-8" ng-model="data.Summary" rows="6"></textarea>
                                </div>
                                   <br>
                                <div class="col-sm-10 text-left">
                               <button ng-click="submitCust(data)" class="btn btn-primary btn-lg">אישור</button>
                                </div>
                           
    </div>
        </fieldset>
                        </form>
</div>
     

