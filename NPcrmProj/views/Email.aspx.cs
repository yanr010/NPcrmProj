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
    public partial class Email : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }

        protected void SendMail(object sender, EventArgs e)
        {
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("npcrmproject@gmail.com", "crmproj987");
            MailMessage msgobj = new MailMessage();
            msgobj.To.Add("yanr010@gmail.com ");
            msgobj.From = new MailAddress("npcrmproject@gmail.com");
            msgobj.Subject = "את יודעת למה לא מעניין אותי כלום?";
            msgobj.Body = "כי המייל הזה הגיע דרך הקוד וזה עובד :D";
            client.Send(msgobj);

        }
    }
}