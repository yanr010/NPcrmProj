﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustForm.aspx.cs" Inherits="NPcrmProj.views.CustForm" %>

<div class="text-center p-3">
        <h2>טופס אינטק - שאלון הכרות</h2>
    </div>
    
  <div style="background-color:rgb(240, 240, 240)">
                        <form class="well form-horizontal text-right border">
                            <fieldset>
                                <H5>פרטים אישיים:</H5>
                                <div class="form-group row">
                                <label for="firstName" class="col-sm-2 col-form-label">שם פרטי<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.firstName" placeholder="שם פרטי" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="lastName" class="col-sm-2 col-form-label">שם משפחה<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.lastName" placeholder="שם משפחה" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="id" class="col-sm-2 col-form-label">תעודת זהות<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.id" placeholder="תעודת זהות" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="Email" class="col-sm-2 col-form-label">כתובת דוא"ל<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"> 
                                            <input ng-model="data.email" placeholder="מייל" type="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control"  required="true">
                                        </div>
                                        </div>
                                    </div>
                                 <div class="form-group row">
                                    <label for="mobile" class="col-md-2 control-label">טלפון נייד<span style="color:red">   *</span></label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.mobile" placeholder="טלפון נייד" class="form-control" type="text" maxlength="10" pattern="\d*" name="mobile" required="true"></div>
                                    </div>
                                    
                                </div>
                                <div class="form-group row">
                                    <label for="gender" class="col-md-2 control-label">מין<span style="color:red">   *</span></label>
                                    <div class="col-md-2 inputGroupContainer" required="true">
                                      
                                          <input  ng-model="data.gender" type="radio" value="male"> זכר
                                        <input  ng-model="data.gender" type="radio" value="female"> נקבה
                                       
                                      
                                    </div>
                                   
                                </div>
                                <div class="form-group row">
                                    <label for="birthDate" class="col-md-2 control-label">תאריך לידה<span style="color:red">   *</span></label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.birthDate" placeholder="תאריך לידה" class="form-control" type="date" name="birthDate" min="1000-01-01"
                                        max="3000-12-31" class="form-control"  required="true"></div>
                                    </div>
                                    
                                </div>
        
                                 
                                     <div class="form-group row">
                                    <label for="city" class="col-sm-2 col-form-label">עיר<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.city" placeholder="עיר" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                     <div class="form-group row">
                                    <label for="address" class="col-sm-2 col-form-label">כתובת<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input ng-model="data.address" placeholder="כתובת" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                         
                                
                            </fieldset>
                        </form>
    </div>
    <div style="background-color:rgb(245, 245, 245")>
                        <form class="well form-horizontal text-right border">
                            <fieldset>
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
                                            <input ng-model="data.studyField" placeholder="תחום לימודים" type="text" class="form-control"  required="false">
                                      </div>
                                        </div>
                                    </div>
                                 <div class="form-group row">
                                    <label for="AcademicDegree" class="col-sm-2 col-form-label">בעל תואר אקדמי במקצוע</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="data.AcademicDegree" placeholder="תואר אקדמי" class="form-control" required="false" value="" type="text">
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
                                            <input ng-model="data.role" placeholder="תפקיד" class="form-control" required="false" value="" type="text">
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
  
                            </fieldset>
                        </form>
    </div>
    <div style="background-color:rgb(240, 240, 240)">
                        <form class="well form-horizontal text-right border">
                            <fieldset>
                                <br>
                                <H5>סיבת הגעה</H5>
                                      <div class="form-group text-right">
                <label for="Services" class="col-sm-right-2 col-form-label">שירותים רלוונטים<span style="color: red">   *</span></label>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp1" class="custom-control-input" id="Services1" name="Services1">
                    <label class="custom-control-label" ng-model="data.work" for="Services1">מציאת עבודה </label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp2" class="custom-control-input" id="Services2" name="Services2">
                    <label class="custom-control-label" ng-model="data.finance" for="Services2">כספים</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp3" class="custom-control-input" id="Services3" name="Services3">
                    <label class="custom-control-label" ng-model="data.milgotedu" for="Services3">מלגות לימודים</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp4" class="custom-control-input" id="Services4" name="Services4">
                    <label class="custom-control-label" ng-model="data.edu" for="Services4">לימודים</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp5" class="custom-control-input" id="Services5" name="5">
                    <label class="custom-control-label" ng-model="data.former" for="Services5">זכויות של חיילים משוחררים</label>

                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp6" class="custom-control-input" id="Services6" name="Services6">
                    <label class="custom-control-label" ng-model="data.psycho" for="Services6">קורסי פסיכומטרי </label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" ng-model="data.inp7" class="custom-control-input" id="Services7" name="Services7">
                    <label class="custom-control-label" ng-model="data.family" for="Services7">משפחה והורות </label>
                </div>
            </div>
                               <div class="form-group row">
                                    <label for="department" class="col-sm-2 col-form-label">השתייכות למחלקה<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" ng-model="data.department">
                                                <option>השכלה גבוהה</option>
                                                 <option>חיילים משוחררים</option>
                                                <option>פעליות חברתית</option>
                                                <option>תעסוקה</option>
                                                 <option>מנהל מרכז צעירים</option>
                                            </select>
                                        </div>
                                        </div>
                                     </div>
                                </div>
                      
                            </fieldset>
                        </form>
        
    </div>
    <div style="background-color:rgb(245, 245, 245)">
                        <form class="well form-horizontal text-right border">
                            <fieldset>
                                <br>
                                  <H5>מסקנות:</H5>
                                 <div class="form-group row">
                                     <label for="Summary" class="col-sm-2 col-form-label">  סיכום פגישה<span style="color:red">   *</span></label>
                                     <textarea class="form-control col-sm-8" ng-model="data.Summary" rows="6"></textarea>
                                </div>
                                   <br>
                                <div class="col-sm-10 text-left">
                               <button ng-click="submitCust()" class="btn btn-primary btn-lg">אישור</button>
                                </div>
                            </fieldset>
                        </form>
    </div>
     

