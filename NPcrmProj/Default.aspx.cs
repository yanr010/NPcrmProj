using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPcrmProj
{
    public partial class Default : System.Web.UI.Page
    {
        public string userauth;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["login"] == null)
            {
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
            else
            {

                this.userauth = (string)Session["login"];
                
            }




        }
    }
}