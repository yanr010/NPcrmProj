using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.IO;
using System.Collections.ObjectModel;
using System.Net.Mail;
using System.Net;
using NPcrmProj;

namespace NPcrmProj
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public bool SetProj()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);


#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {
                    var d = data.data;
                    string projname = Convert.ToString(d["projname"]);
                    var rec = db.Projects.Where(i => i.Name == projname).FirstOrDefault();
                    if (rec == null)
                    {
                        Project newproj = new Project();
#pragma warning restore CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
                        int id = db.Projects.Max(i => i.Id) + 1;
                        newproj.Id = id;
                        newproj.CreateDate = DateTime.Now;
                        newproj.Name = Convert.ToString(d["projname"]);
                        newproj.Description = Convert.ToString(d["description"]);
                        newproj.StartDate = Convert.ToDateTime(d["startDate"]);
                        string datet = Convert.ToString(d["time"]);
                        string[] times = datet.Split(':');
                        datet = times[0] + ":" + times[1];
                        DateTime timez = Convert.ToDateTime(datet);
                        TimeSpan time = timez.TimeOfDay;
                        newproj.Time = time;
                        string ftime = Convert.ToString(d["finaltime"]);
                        if (ftime != null)
                        {
                            times = ftime.Split(':');
                            datet = times[0] + ":" + times[1];
                            timez = Convert.ToDateTime(datet);
                            time = timez.TimeOfDay;
                            newproj.FinalTime = time;
                        }
                        newproj.Participant = Convert.ToString(d["participant"]);
                        newproj.Responsible = "רכזת תעסוקה"; //Convert.ToString(d["responsible"]);
                        newproj.ProjectCost = Convert.ToInt32(d["projectCost"]);
                        db.Projects.Add(newproj);
                        db.SaveChanges();
                    }
                    else
                    {
                        return false;
                    }
                    return true;
                }
            }
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public bool SetCategeryProj()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);


#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {
                    var d = data.data;
                    string projname = Convert.ToString(d[0]);
                    var rec = db.Projects.Where(i => i.Name == projname).FirstOrDefault();
                    if (rec != null)
                    {
                        int id = rec.Id;
                        Collection<string> categories = new Collection<string>();
                        int cnt = 0;
                        foreach (var s in d)
                            if (s.ToString() != "")
                            {
                                categories.Add(s.ToString());
                                cnt++;
                            }

                        for (int i = 1; i < cnt; i++)
                        {
                            db.Database.ExecuteSqlCommand("insert into CategoryProject(CategoryId, ProjectId) values (@cat,@id)", new SqlParameter("@cat", categories[i]), new SqlParameter("@id", id));

                        }

                        db.SaveChanges();
                    }
                    else
                    {
                        return false;
                    }
                    return true;
                }
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool EditProj(string Name, string Description, string Participant, string ProjectCost)
        {
            try
            {
#pragma warning disable CS0219 // The variable 'log' is assigned but its value is never used
                string log = "";
#pragma warning restore CS0219 // The variable 'log' is assigned but its value is never used
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                var result = db.Projects.SingleOrDefault(p => p.Name == Name);
                if (result != null)
                {
                    result.Description = Description;
                    result.Participant = int.Parse(Participant);
                    result.ProjectCost = int.Parse(ProjectCost);
                    db.SaveChanges();
                }

                return true;
            }
#pragma warning disable CS0168 // The variable 'e' is declared but never used
            catch (Exception e)
#pragma warning restore CS0168 // The variable 'e' is declared but never used
            {
                return false;
            }


        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool EditParticipant(string Name, string ActualParticipant)
        {
            try
            {
#pragma warning disable CS0219 // The variable 'log' is assigned but its value is never used
                string log = "";
#pragma warning restore CS0219 // The variable 'log' is assigned but its value is never used
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                var result = db.Projects.SingleOrDefault(p => p.Name == Name);
                if (result != null)
                {
                    result.ActualParticipant = int.Parse(ActualParticipant);
                    db.SaveChanges();
                }

                return true;
            }
#pragma warning disable CS0168 // The variable 'e' is declared but never used
            catch (Exception e)
#pragma warning restore CS0168 // The variable 'e' is declared but never used
            {
                return false;
            }


        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetFinAllProjects()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

#pragma warning disable CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
            List<Project> projects = db.Projects.SqlQuery("select * from Projects where Projects.StartDate < @date", new SqlParameter("@date", DateTime.Now)).ToList();
#pragma warning restore CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
            string json = JsonConvert.SerializeObject(projects);


            Context.Response.Write(json);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string DeleteProj(string Name)
        {
            try
            {
                string log = "";
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                dbEntities db = new dbEntities();
                Project proj = db.Projects.FirstOrDefault(i => i.Name == Name);
#pragma warning restore CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
                int id = proj.Id;
                db.Projects.Remove(proj);
                //db.Entry(proj).State = System.Data.Entity.EntityState.Deleted;
                //  db.Projects.SqlQuery("delete from Project where Project.Id = @id", new SqlParameter("@id", id));
                db.SaveChanges();
                log += "id= " + id;

                return log;
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }


        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetNotFinAllProjects()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

#pragma warning disable CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
            List<Project> projects = db.Projects.SqlQuery("select * from Projects where Projects.StartDate >= @date", new SqlParameter("@date", DateTime.Now)).ToList();
#pragma warning restore CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
            string json = JsonConvert.SerializeObject(projects);


            Context.Response.Write(json);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public string SetCust()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);


#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {
                    var d = data.data;
                    int id = Convert.ToInt32(d["id"]);
                    string email = Convert.ToString(d["email"]);
                    string mobile = Convert.ToString(d["mobile"]);

                    var rec = db.Customers.Where(i => i.Id == id).FirstOrDefault();
                    if (rec != null && rec.Id == id)
                    {
                        return "id";
                    }

                    rec = db.Customers.Where(i => i.Email == email).FirstOrDefault();
                    if (rec != null && rec.Email == email)
                    {
                        return "mail";
                    }

                    rec = db.Customers.Where(i => i.Mobile == mobile).FirstOrDefault();
                    if (rec != null && rec.Mobile == mobile)
                    {
                        return "mobile";
                    }
                    //try
                    //{
                    if (rec == null)
                    {
                        Customer newCust = new Customer();
#pragma warning restore CS0246 // The type or namespace name 'Customers' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'Customers' could not be found (are you missing a using directive or an assembly reference?)
                        newCust.Id = Convert.ToInt32(d["id"]);
                        newCust.CreateDate = DateTime.Now;
                        newCust.FirstName = Convert.ToString(d["firstName"]);
                        newCust.LastName = Convert.ToString(d["lastName"]);
                        newCust.Gender = Convert.ToString(d["gender"]);
                        newCust.BirthDate = Convert.ToDateTime(d["birthDate"]);
                        newCust.Mobile = Convert.ToString(d["mobile"]);
                        newCust.Email = Convert.ToString(d["email"]);
                        newCust.Address = Convert.ToString(d["address"]);
                        newCust.City = Convert.ToString(d["city"]);
                        newCust.Education = Convert.ToBoolean(d["Education"]);
                        newCust.Student = Convert.ToBoolean(d["student"]);
                        newCust.Studyfield = Convert.ToString(d["studyFields"]);
                        newCust.MilitaryService = Convert.ToString(d["militaryService"]);
                        newCust.WorkStatus = Convert.ToBoolean(d["work"]);
                        newCust.Summary = Convert.ToString(d["Summary"]);
                        newCust.Department = Convert.ToString(d["department"]);
                        db.Customers.Add(newCust);
                        db.SaveChanges();

                    }
                    //}


                    //catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
                    //{
                    //    Exception raise = dbEx;
                    //    foreach (var validationErrors in dbEx.EntityValidationErrors)
                    //    {
                    //        foreach (var validationError in validationErrors.ValidationErrors)
                    //        {
                    //            string message = string.Format("{0}:{1}",
                    //                validationErrors.Entry.Entity.ToString(),
                    //                validationError.ErrorMessage);
                    //            // raise a new exception nesting
                    //            // the current instance as InnerException
                    //            raise = new InvalidOperationException(message, raise);
                    //        }
                    //    }
                    //    throw raise;

                    //}

                }
            }
            return "ok";
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public bool SetCustomerCategory()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);


#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {
                    var d = data.data;
                    int tempId = Convert.ToInt32(d[0]);
                    var rec = db.Customers.Where(i => i.Id == tempId).FirstOrDefault();
                    if (rec != null)
                    {
                        int id = rec.Id;
                        Collection<string> categories = new Collection<string>();
                        int cnt = 0;
                        foreach (var s in d)
                            if (s.ToString() != "")
                            {
                                categories.Add(s.ToString());
                                cnt++;
                            }

                        for (int i = 1; i < cnt; i++)
                        {
                            db.Database.ExecuteSqlCommand("insert into CustomerCategory(CustomerID, CategoryID) values (@id,@cat)", new SqlParameter("@id", id), new SqlParameter("@cat", categories[i]));

                        }

                        db.SaveChanges();
                    }
                    else
                    {
                        return false;
                    }
                    return true;
                }
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool EditCust(string FirstName, string LastName, int Id, string Email, string Mobile, string Gender, string City, string Address
            , string Education, string Student, string StudyField, string AcademicDegree, string MilitaryService, string WorkStatus, string Department, string Summary)
        {
            try
            {
#pragma warning disable CS0219 // The variable 'log' is assigned but its value is never used
                string log = "";
#pragma warning restore CS0219 // The variable 'log' is assigned but its value is never used
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                var result = db.Customers.SingleOrDefault(p => p.Id == Id);
                if (result != null)
                {
                    result.FirstName = FirstName;
                    result.LastName = LastName;
                    result.Gender = Gender;
                    result.Mobile = Mobile;
                    result.Email = Email;
                    result.Address = Address;
                    result.City = City;
                    result.Education = Boolean.Parse(Education);
                    result.Student = Boolean.Parse(Student);
                    result.Studyfield = StudyField;
                    result.MilitaryService = MilitaryService;
                    result.WorkStatus = Boolean.Parse(WorkStatus);
                    result.Summary = Summary;
                    result.Department = Department;
                    db.SaveChanges();

                }

                return true;
            }
#pragma warning disable CS0168 // The variable 'e' is declared but never used
            catch (Exception e)
#pragma warning restore CS0168 // The variable 'e' is declared but never used
            {
                return false;
            }


        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string DeleteCust(int Id)
        {
            try
            {
                string log = "";
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                dbEntities db = new dbEntities();
                Customer cust = db.Customers.FirstOrDefault(i => i.Id == Id);
#pragma warning restore CS0246 // The type or namespace name 'Customers' could not be found (are you missing a using directive or an assembly reference?)
                db.Customers.Remove(cust);
                db.SaveChanges();

                return log;
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }


        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetAllCustomers()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

#pragma warning disable CS0246 // The type or namespace name 'Customers' could not be found (are you missing a using directive or an assembly reference?)
            System.Data.Entity.DbSet<Customer> customers = db.Customers;
#pragma warning restore CS0246 // The type or namespace name 'Customers' could not be found (are you missing a using directive or an assembly reference?)
            string json = JsonConvert.SerializeObject(customers);


            Context.Response.Write(json);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public bool SetTask()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);


#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {


                    var d = data.data;
                    string name = Convert.ToString(d["taskName"]);
                    var rec = db.Tasks.Where(i => i.Name == name).FirstOrDefault();

                    try
                    {
                        if (rec == null)
                        {
                            int id = 0;
                            Task newTask = new Task();
#pragma warning restore CS0246 // The type or namespace name 'Tasks' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'Tasks' could not be found (are you missing a using directive or an assembly reference?)
                            if (db.Tasks.FirstOrDefault(i => i.Id == 1) == null) id = 1;
                            else id = db.Tasks.Max(i => i.Id) + 1;
                            newTask.Id = id;
                            newTask.CreateDate = DateTime.Now;
                            newTask.Name = Convert.ToString(d["taskName"]);
                            newTask.FinalDate = Convert.ToDateTime(d["finalDate"]);
                            newTask.Description = Convert.ToString(d["description"]);
                            newTask.Department = Convert.ToString(d["department"]);
                            newTask.Done = Convert.ToBoolean(false);
                            db.Tasks.Add(newTask);
                            db.SaveChanges();
                        }
                        else return false;
                    }
                    catch (System.Data.Entity.Validation.DbEntityValidationException dbEx)
                    {
                        Exception raise = dbEx;
                        foreach (var validationErrors in dbEx.EntityValidationErrors)
                        {
                            foreach (var validationError in validationErrors.ValidationErrors)
                            {
                                string message = string.Format("{0}:{1}",
                                    validationErrors.Entry.Entity.ToString(),
                                    validationError.ErrorMessage);
                                // raise a new exception nesting
                                // the current instance as InnerException
                                raise = new InvalidOperationException(message, raise);
                            }
                        }
                        throw raise;

                    }

                }

            }
            return true;



        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool EditTask(string Name, string Description, string Department)
        {
            try
            {
#pragma warning disable CS0219 // The variable 'log' is assigned but its value is never used
                string log = "";
#pragma warning restore CS0219 // The variable 'log' is assigned but its value is never used
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                var result = db.Tasks.SingleOrDefault(p => p.Name == Name);
                if (result != null)
                {
                    result.Description = Description;
                    result.Department = Department;
                    db.SaveChanges();
                }

                return true;
            }
#pragma warning disable CS0168 // The variable 'e' is declared but never used
            catch (Exception e)
#pragma warning restore CS0168 // The variable 'e' is declared but never used
            {
                return false;
            }


        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool DoneTask(string Name)
        {
            try
            {
#pragma warning disable CS0219 // The variable 'log' is assigned but its value is never used
                string log = "";
#pragma warning restore CS0219 // The variable 'log' is assigned but its value is never used
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                var result = db.Tasks.SingleOrDefault(p => p.Name == Name);
                if (result != null)
                {
                    result.Done = true;
                    db.SaveChanges();
                }

                return true;
            }
#pragma warning disable CS0168 // The variable 'e' is declared but never used
            catch (Exception e)
#pragma warning restore CS0168 // The variable 'e' is declared but never used
            {
                return false;
            }


        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string DeleteTask(int Id)
        {
            try
            {
                string log = "";
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                dbEntities db = new dbEntities();
                Task task = db.Tasks.FirstOrDefault(i => i.Id == Id);
#pragma warning restore CS0246 // The type or namespace name 'Tasks' could not be found (are you missing a using directive or an assembly reference?)
                db.Tasks.Remove(task);
                db.SaveChanges();

                return log;
            }
            catch (Exception e)
            {
                return e.Message.ToString();
            }


        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetAllOpenTasks()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

            var tasks = db.Tasks.SqlQuery("select * from Tasks where done = 'false'");
            string json = JsonConvert.SerializeObject(tasks);


            Context.Response.Write(json);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetClosedTasks()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

            var tasks = db.Tasks.SqlQuery("select * from Tasks where done = 'true'");
            string json = JsonConvert.SerializeObject(tasks);


            Context.Response.Write(json);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetLastCusts()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

            var custs = db.Customers.SqlQuery("select top(5) * from Customers order by CreateDate DESC");
            string json = JsonConvert.SerializeObject(custs);


            Context.Response.Write(json);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetLastTasks()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

            var tasks = db.Tasks.SqlQuery("select top(5) * from Tasks order by FinalDate DESC");
            string json = JsonConvert.SerializeObject(tasks);


            Context.Response.Write(json);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetCustCount()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

            var custs = db.Customers;
            var count = custs.Count();
            string json = JsonConvert.SerializeObject(count);


            Context.Response.Write(json);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetProjCount()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

#pragma warning disable CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
            List<Project> projects = db.Projects.SqlQuery("select * from Projects where Projects.StartDate >= @date", new SqlParameter("@date", DateTime.Now)).ToList();
#pragma warning restore CS0246 // The type or namespace name 'Projects' could not be found (are you missing a using directive or an assembly reference?)
            var count = projects.Count();
            string json = JsonConvert.SerializeObject(count);


            Context.Response.Write(json);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetTaskCount()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

            var tasks = db.Tasks.Where(t => t.Done == false);
            var count = tasks.Count();
            string json = JsonConvert.SerializeObject(count);


            Context.Response.Write(json);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void IdValidation(int Id)
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

            var val = db.Customers.FirstOrDefault(i => i.Id == Id);

            if (val == null) Context.Response.Write(true);
            else Context.Response.Write(false);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void EmailValidation(string email)
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            dbEntities db = new dbEntities();
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)

            var val = db.Customers.FirstOrDefault(i => i.Email == email);

            if (val == null) Context.Response.Write(true);
            else Context.Response.Write(false);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] CustDepMon()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);

#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {
                    string dep = Convert.ToString(data["dep"]);
                    int[] arr = new int[12];
                    for (int i = 0; i < 12; i++)
                    {
                        arr[i] = db.Customers.SqlQuery("select * from Customers where MONTH(CreateDate) = @i and Year(CreateDate)=Year(@date) and Department = @dep", new SqlParameter("@i", i + 1), new SqlParameter("@date", DateTime.Now), new SqlParameter("@dep", dep)).Count();
                    }
                    return arr;
                }
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] CustDepQua()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);

#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {
                    string dep = Convert.ToString(data["dep"]);
                    int[] arr = new int[4];
                    for (int i = 0; i < 4; i++)
                    {
                        arr[i] = db.Customers.SqlQuery("select * from Customers where DATEPART(quarter, CreateDate)=@i and Year(CreateDate)=Year(@date) and Department = @dep", new SqlParameter("@i", i + 1), new SqlParameter("@date", DateTime.Now), new SqlParameter("@dep", dep)).Count();
                    }
                    return arr;
                }
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] CustByCord()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            {
                int[] arr = new int[5];
                for (int i = 0; i < 5; i++)
                {
                    arr[i] = db.Customers.SqlQuery("select * from Customers where Department=@i", new SqlParameter("@i", i + 2)).Count();
                }
                return arr;
            }
        }
        
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] ProjDepMon()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);

#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {
                    string dep = Convert.ToString(data["dep"]);
                    int[] arr = new int[12];
                    for (int i = 0; i < 12; i++)
                    {
                        arr[i] = db.Projects.SqlQuery("select * from Projects where Month(StartDate) = @i and Year(StartDate)=Year(@date) and Responsible = @dep", new SqlParameter("@i", i + 1), new SqlParameter("@date", DateTime.Now), new SqlParameter("@dep", dep)).Count();
                    }
                    return arr;
                }
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] CustByCat()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            {
                int[] arr = new int[7];
                for (int i = 0; i < 7; i++)
                {
                    arr[i] = db.Customers.SqlQuery("select * from Customers, CustomerCategory where Id=CustomerID and CategoryID=@i", new SqlParameter("@i", i + 1)).Count();
                }
                return arr;
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] ProjDepQua()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);

#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
                {
                    string dep = Convert.ToString(data["dep"]);
                    int[] arr = new int[5];
                    for (int i = 0; i < 5; i++)
                    {
                        arr[i] = db.Projects.SqlQuery("select * from Projects where DATEPART(quarter, StartDate)=@i and Year(StartDate)=Year(@date) and Responsible = @dep", new SqlParameter("@i", i + 1), new SqlParameter("@date", DateTime.Now), new SqlParameter("@dep", dep)).Count();
                    }
                    return arr;
                }
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] ProjByCat()
        {
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning disable CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            using (dbEntities db = new dbEntities())
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
#pragma warning restore CS0246 // The type or namespace name 'dbEntities' could not be found (are you missing a using directive or an assembly reference?)
            {
                int[] arr = new int[7];
                for (int i = 0; i < 7; i++)
                {
                    arr[i] = db.Projects.SqlQuery("select * from Projects, CategoryProject where Id=ProjectId and CategoryId=@i", new SqlParameter("@i", i + 1)).Count();
                }
                return arr;
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public double[] ProjParticipants()
        {

            using (dbEntities db = new dbEntities())

            {
                double[] arr = new double[5];
                for (int i = 0; i < 5; i++)
                {
                    var part = db.Database.SqlQuery<int>("select Participant from Projects where responsible=@i", new SqlParameter("@i", i + 1)).Sum();
                    var Actual = db.Database.SqlQuery<int>("select ActualParticipant from Projects where responsible=@i", new SqlParameter("@i", i + 1)).Sum();
                    if(Actual!=0 && part!=0)
                    arr[i] = (double)Actual / (double)part;
                }
                return arr;
            }
        }



        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] TaskDepMon()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);


                using (dbEntities db = new dbEntities())

                {
                    string dep = Convert.ToString(data["dep"]);
                    int[] arr = new int[12];
                    for (int i = 0; i < 12; i++)
                    {
                        arr[i] = db.Tasks.SqlQuery("select * from Tasks where Month(FinalDate) = @i and Department = @dep", new SqlParameter("@i", i + 1), new SqlParameter("@dep", dep)).Count();
                    }
                    return arr;
                }
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int[] TaskDepQua()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);


                using (dbEntities db = new dbEntities())

                {
                    string dep = Convert.ToString(data["dep"]);
                    int[] arr = new int[4];
                    for (int i = 0; i < 4; i++)
                    {
                        arr[i] = db.Tasks.SqlQuery("select * from Tasks where DATEPART(quarter, FinalDate)=@i and Department = @dep", new SqlParameter("@i", i + 1), new SqlParameter("@dep", dep)).Count();
                    }
                    return arr;
                }
            }
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string sendmail()
        {
            using (var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = System.Text.Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);


                using (dbEntities db = new dbEntities())

                {
                    string category = Convert.ToString(data.data["cat"]);
                    string msubject = Convert.ToString(data.data["subject"]);
                    string mbody = Convert.ToString(data.data["body"]);

                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    client.EnableSsl = true;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("npcrmproject@gmail.com", "crmproj987");
                    MailMessage msgobj = new MailMessage();

                    var emails = db.Database.SqlQuery<string>("Select distinct Email from Customers, CustomerCategory where Id=CustomerID and categoryID=@cat", new SqlParameter("@cat", category)).ToList();
                    try
                    {
                        for (var i = 0; i < emails.Count(); i++)
                        {
                            msgobj.To.Add(emails[i]);
                            msgobj.From = new MailAddress("npcrmproject@gmail.com");
                            msgobj.Subject = msubject;
                            msgobj.Body = mbody;
                            client.Send(msgobj);
                        }
                    }
                    catch(Exception e)
                    {
                        return e.Message;
                    }
                    return "ok";
                }
            }
        }

        

    }


}


