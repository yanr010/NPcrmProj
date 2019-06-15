<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustForm.aspx.cs" Inherits="NPcrmProj.views.CustForm" %>

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
                                            <input ng-model="firstName" class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="lastName" class="col-sm-2 col-form-label">שם משפחה<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="lastName"  class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="id" class="col-sm-2 col-form-label">תעודת זהות<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="id"  class="form-control" maxlength="10" pattern="[0-9]" required="true" value="" type="text" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="Email" class="col-sm-2 col-form-label">כתובת דוא"ל<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"> 
                                            <input ng-model="email" type="email"  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" class="form-control"  required="true">
                                        </div>
                                        </div>
                                    </div>
                                 <div class="form-group row">
                                    <label for="mobile" class="col-md-2 control-label">טלפון נייד<span style="color:red">   *</span></label>
                                     <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="mobile" class="form-control" type="tel" maxlength="10" pattern="[0-9]" name="mobile" required="true"></div>
                                    </div>
                                    
                                </div>
                                    
                                 
                                     <div class="form-group row">
                                    <label for="city" class="col-sm-2 col-form-label">עיר<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="city"  class="form-control" required="true" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                     <div class="form-group row">
                                    <label for="address" class="col-sm-2 col-form-label">כתובת<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"><input ng-model="address" class="form-control" required="true" value="" type="text">
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
                                        
                                        <input ng-model="Education" type="radio"  ng-value="true"> מלאה
                                        <input ng-model="Education" type="radio" ng-value="false"> חלקית
                                      
                                        
                                    </div>
                                </div>
                                 <div class="form-group row">
                                    <label for="Student" class="col-md-2 control-label">סטודנט</label>
                                    <div class="col-md-2 inputGroupContainer">
                                        
                                            <input ng-model="student" type="radio"   ng-value="true" >כן
                                        <input ng-model="student" type="radio" ng-value="false"> לא
                                      
                                    </div>
                                   
                                </div>
                                 
                                      <div class="form-group row">
                                    <label for="studyField" class="col-sm-2 col-form-label">תחום לימודים</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group"> 
                                            <input ng-model="studyField" type="text" class="form-control"  required="false">
                                      </div>
                                        </div>
                                    </div>
                                 <div class="form-group row">
                                    <label for="AcademicDegree" class="col-sm-2 col-form-label">בעל תואר אקדמי במקצוע</label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="input-group">
                                            <input ng-model="AcademicDegree" class="form-control" required="false" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                         
          
                                <div class="form-group row">
                                    <label for="militaryService" class="col-sm-2 col-form-label">סוג שירות<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" ng-model="militaryService">
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
                                            <input ng-model="role"  class="form-control" required="false" value="" type="text">
                                        </div>
                                    </div>
                                </div>
                                 
                            
                                  <div class="form-group row">
                                    <label for="workStatus" class="col-sm-2 control-label">סטטוס<span style="color:red">   *</span></label>
                                    <div class="col-sm-2 inputGroupContainer">
                                        
                                           <input ng-model="work" type="radio"   ng-value="true" > עובד
                                        <input ng-model="work" type="radio"   ng-value="false" > לא עובד
                                      
                                  
                                    </div>
                                   
                                </div>
  

                               <div class="form-group row">
                                    <label for="department" class="col-sm-2 col-form-label">השתייכות למחלקה<span style="color:red">   *</span></label>
                                    <div class="col-md-3 inputGroupContainer">
                                        <div class="form-group">
                                            <select class="form-control" ng-model="department">
                                                <option>השכלה גבוהה</option>
                                                 <option>חיילים משוחררים</option>
                                                <option>פעליות חברתית</option>
                                                <option>תעסוקה</option>
                                                 <option>מנהל מרכז צעירים</option>
                                            </select>
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
                                     <textarea class="form-control col-sm-8" ng-model="Summary" rows="6"></textarea>
                                </div>
                                   <br>
                                <div class="col-sm-10 text-left">
                               <button ng-click="submitEditCustomer()" class="btn btn-primary btn-lg">שמור שינויים</button>
                                </div>
                            </fieldset>
                        </form>
    </div>
     


