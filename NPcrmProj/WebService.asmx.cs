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
                        times = ftime.Split(':');
                        datet = times[0] + ":" + times[1];
                        timez = Convert.ToDateTime(datet);
                        time = timez.TimeOfDay;
                        newproj.FinalTime = time;
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
                            if (s.ToString() != "") {
                                categories.Add(s.ToString());
                                cnt++;
                            } 

                        for(int i=1; i < cnt; i++)
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
                log += "id= " + id ;
                
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
        public void GetAllCustomers()
        {
            dbEntities db = new dbEntities();

            System.Data.Entity.DbSet<Customer> customers = db.Customers;
            string json = JsonConvert.SerializeObject(customers);


            Context.Response.Write(json);
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

        public string AddProject(dynamic obj)
        {
            return "Hello World";
        }
    }
}

