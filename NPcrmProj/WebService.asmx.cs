﻿using System;
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


                using (dbEntities db = new dbEntities())
                {
                    var d = data.data;
                    string projname = Convert.ToString(d["projname"]);
                    var rec = db.Projects.Where(i => i.Name == projname).FirstOrDefault();
                    if (rec == null)
                    {
                        Project newproj = new Project();
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
                        if(ftime != null)
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


                using (dbEntities db = new dbEntities())
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
                            db.Database.ExecuteSqlCommand("insert into CategoryProject(CategoryName, ProjectId) values (@cat,@id)", new SqlParameter("@cat", categories[i]), new SqlParameter("@id", id));

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
                string log = "";
                dbEntities db = new dbEntities();
                var result = db.Projects.SingleOrDefault(p => p.Name == Name);
                if (result != null)
                {
                    result.Description = Description;
                    result.Participant = Participant;
                    result.ProjectCost = int.Parse(ProjectCost);
                    db.SaveChanges();
                }

                return true;
            }
            catch (Exception e)
            {
                return false;
            }


        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetFinAllProjects()
        {
            dbEntities db = new dbEntities();

            List<Project> projects = db.Projects.SqlQuery("select * from Projects where Projects.StartDate < @date", new SqlParameter("@date", DateTime.Now)).ToList();
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
                dbEntities db = new dbEntities();
                Project proj = db.Projects.FirstOrDefault(i => i.Name == Name);
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
            dbEntities db = new dbEntities();

            List<Project> projects = db.Projects.SqlQuery("select * from Projects where Projects.StartDate >= @date", new SqlParameter("@date", DateTime.Now)).ToList();
            string json = JsonConvert.SerializeObject(projects);


            Context.Response.Write(json);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public bool SetCust()
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
                    var d = data.data;
                    int id = Convert.ToInt32(d["id"]);
                    var rec = db.Customers.Where(i => i.Id == id).FirstOrDefault();

                    try
                    {
                        if (rec == null)
                        {
                            Customer newCust = new Customer();
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
        public string DeleteCust(int Id)
        {
            try
            {
                string log = "";
                dbEntities db = new dbEntities();
                Customer cust = db.Customers.FirstOrDefault(i => i.Id == Id);
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
            dbEntities db = new dbEntities();

            System.Data.Entity.DbSet<Customer> customers = db.Customers;
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


                using (dbEntities db = new dbEntities())
                {


                    var d = data.data;
                    string name = Convert.ToString(d["taskName"]);
                    var rec = db.Tasks.Where(i => i.Name == name).FirstOrDefault();

                    try
                    {
                        if (rec == null)
                        {

                            Task newTask = new Task();
                            int id = db.Tasks.Max(i => i.Id) + 1;
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
        public void GetAllTasks()
        {
            dbEntities db = new dbEntities();

            System.Data.Entity.DbSet<Task> tasks = db.Tasks;
            string json = JsonConvert.SerializeObject(tasks);


            Context.Response.Write(json);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetLastCusts()
        {
            dbEntities db = new dbEntities();

            var custs = db.Customers.SqlQuery("select top(5) * from Customers order by CreateDate DESC");
            string json = JsonConvert.SerializeObject(custs);


            Context.Response.Write(json);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetLastTasks()
        {
            dbEntities db = new dbEntities();

            var tasks = db.Tasks.SqlQuery("select top(5) * from Tasks order by CreateDate DESC");
            string json = JsonConvert.SerializeObject(tasks);


            Context.Response.Write(json);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public string AddProject(dynamic obj)
        {
            return "Hello World";
        }
    }
}

