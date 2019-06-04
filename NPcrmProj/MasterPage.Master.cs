using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPcrmProj
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                navbar.Visible = false;
                logfail.Visible = false;
                
                
            }
            else
            {
                // בצע את שאר הפעולות
            }
            
        }
        
        protected void enterclc(object sender, EventArgs e)
        {
            
            dbEntities DB = new dbEntities();
            
            


            var auth = DB.Users.FirstOrDefault(i => i.Username == uname.Value && i.Password == psw.Value);
            
            if(auth == null)
            {
                logfail.Visible = true;
                
            }
            else
            {
                
                login.Visible = false;
                navbar.Visible = true;
            }
 
        }

        

    }
}