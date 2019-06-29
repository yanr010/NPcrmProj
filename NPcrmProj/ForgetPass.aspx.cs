using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NPcrmProj.views
{
    public partial class ForgetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                logfail.Visible = false;
                ressuc.Visible = false;

            }
            else
            {
                // בצע את שאר הפעולות
            }
        }

        protected void enterdat(object sender, EventArgs e)
        {

            dbEntities DB = new dbEntities();



            var auth = DB.Users.FirstOrDefault(i => i.Username == uname.Value && i.Email == email.Value);

            if (auth == null)
            {
                logfail.Visible = true;
                Session.Clear();
            }
            else
            {
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                client.EnableSsl = true;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential("npcrmproject@gmail.com", "crmproj987");
                MailMessage msgobj = new MailMessage();
                string yourpass = "סיסמתך היא: ";



                msgobj.To.Add(auth.Email);
                msgobj.From = new MailAddress("npcrmproject@gmail.com");
                msgobj.Subject = "שחזור סיסמא מרכז צעירים";
                msgobj.Body = yourpass  + auth.Password;
                client.Send(msgobj);

                ressuc.Visible = true;

            }



        }
    }

}