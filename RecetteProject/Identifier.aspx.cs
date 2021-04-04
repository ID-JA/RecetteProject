using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RecetteProject
{
    public partial class Identifier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void BtnSubmit_Click(object sernder, EventArgs e)
        {
            if (Request.Browser.Cookies)
            {
                HttpCookie cookie = new HttpCookie("UserRecetteSite")
                {
                    Name = "UserRecetteSite",
                    Expires = DateTime.Now.AddDays(90),
                    Value = IdentifierUser.Value,
                };
                Response.Cookies.Add(cookie);
                Response.Redirect("Demarrer.aspx?userName=" + IdentifierUser.Value);
            }
        }
    }
}