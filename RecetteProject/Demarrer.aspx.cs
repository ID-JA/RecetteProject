using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecetteProject
{
    public partial class Demarrer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(Request.Cookies["UserRecetteSite"].Value))
            {
                Session["userName"] = Request.QueryString["userName"].ToString();
                lblUserName.InnerText = string.Format("Boujour {0}", Session["userName"].ToString());

            }
            else
            {

                lblUserName.InnerText = string.Format("Boujour {0}", Request.Cookies["UserRecetteSite"].Value);
            }
        }
    }
}