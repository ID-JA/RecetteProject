using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace RecetteProject
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["TotalUsersOnline"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/Sessions/info.txt");
            using (StreamWriter writer = File.AppendText(path))
            {
                writer.WriteLine("\n\n\nSession ID:" + Session.SessionID + "\nDate Login:" + DateTime.Now.ToString());
            };
            Application.Lock();
            Application["TotalUsersOnline"] = (int)Application["TotalUsersOnline"] + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/Sessions/info.txt");
            using (StreamWriter writer = File.AppendText(path))
            {
                writer.WriteLine("\n\n\nSession ID:" + Session.SessionID + "\nDate Login:" + DateTime.Now.ToString());
            }
        }

        protected void Application_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["TotalUsersOnline"] = (int)Application["TotalUsersOnline"] - 1;
            Application.UnLock();
        }
    }
}