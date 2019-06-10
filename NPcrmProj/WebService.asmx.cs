﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Data.SqlClient;

namespace NPcrmProj
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        public string GetProj()
        {
            return "Hello World";
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetAllProjects()
        {
            dEntities db = new dEntities();

            System.Data.Entity.DbSet<Project> projects = db.Projects;
            string json = JsonConvert.SerializeObject(projects);


            Context.Response.Write(json);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetAllCustomers()
        {
            dEntities db = new dEntities();

            System.Data.Entity.DbSet<Customer> projects = db.Customers;
            string json = JsonConvert.SerializeObject(projects);


            Context.Response.Write(json);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetAllTasks()
        {
            dEntities db = new dEntities();

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

