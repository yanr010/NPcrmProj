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

        public string SetProj()
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
                        string id = db.Projects.Max(i => i.Id);
                        int idint = int.Parse(id) + 1;
                        id = String.Format("{0,0}", idint);
                        newproj.Id = id;
                        newproj.CreateDate = Convert.ToDateTime(DateTime.Now);
                        newproj.Name = Convert.ToString(d["projname"]);
                        newproj.Description = Convert.ToString(d["description"]);
                        newproj.StartDate = Convert.ToDateTime(d["startDate"]);
                        DateTime datet = Convert.ToDateTime(d["time"]);
                        TimeSpan time = datet.TimeOfDay;
                        newproj.Time = time;
                        DateTime datetf = Convert.ToDateTime(d["finaltime"]);
                        TimeSpan timef = datet.TimeOfDay;
                        newproj.FinalTime = timef;
                        newproj.Participant = Convert.ToString(d["participant"]);
                        newproj.Responsible = "2"; //Convert.ToString(d["responsible"]);
                        newproj.ProjectCost = Convert.ToInt32(d["projectCost"]);
                        db.Projects.Add(newproj);
                        db.SaveChanges();
                    
                    }

                    return "Oh YEAH";


                }

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
                string id = proj.Id;
                id = id.Trim();
              //  db.Projects.Remove(proj);
              db.Entry(proj).State = System.Data.Entity.EntityState.Deleted;
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

