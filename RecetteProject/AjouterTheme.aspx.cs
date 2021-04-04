using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecetteProject.Models;

namespace RecetteProject
{
    public partial class AjouterTheme : System.Web.UI.Page
    {
        private GestionRectteEntities DbContext;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Request.Form["themeCode"] != null && Request.Form["themeCode"] != null && Request.Form["themeDesc"] != null)
                {
                    string code = Request.Form["themeCode"].ToString();
                    string nom = Request.Form["themeName"].ToString();
                    string des = Request.Form["themeDesc"].ToString();
                    using (DbContext = new GestionRectteEntities())
                    {
                        Theme newTheme = new Theme()
                        {
                            CodeTheme = Convert.ToInt32(code),
                            NomTheme = nom,
                            Description = des
                        };
                        DbContext.Themes.Add(newTheme);
                        DbContext.SaveChanges();
                    }
                }
            }
            catch (Exception)
            {

            }

        }
    }
}