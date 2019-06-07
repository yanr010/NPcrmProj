using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace NPcrmProj
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                logfail.Visible = false;



                if (Request.Cookies["userid"] != null)

                    uname.Value = Request.Cookies["userid"].Value;

                if (Request.Cookies["pwd"] != null)

                    psw.Attributes.Add("value", Request.Cookies["pwd"].Value);
                if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                    rememberme.Checked = true;
            }
            else
            {
                // בצע את שאר הפעולות
            }
        }

        protected void enterclc(object sender, EventArgs e)
        {

            merkazEntities DB = new merkazEntities();




            var auth = DB.Users.FirstOrDefault(i => i.Username == uname.Value && i.Password == psw.Value);

            if (auth == null)
            {
                logfail.Visible = true;
                Session.Clear();
            }
            else
            {
                if (rememberme.Checked == true)
                {
                    Response.Cookies["userid"].Value = uname.Value;
                    Response.Cookies["pwd"].Value = psw.Value;
                    Response.Cookies["userid"].Expires = DateTime.Now.AddDays(15);
                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(15);
                }

                else

                {

                    Response.Cookies["userid"].Expires = DateTime.Now.AddDays(-1);

                    Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-1);

                }

                Session["login"] = uname.Value;
                Session.Timeout = 120;
                Response.Redirect("Default.aspx");
            }

        }
    }
}