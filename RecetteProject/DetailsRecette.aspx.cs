using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecetteProject.Models;

namespace RecetteProject
{
    public partial class DetailsRecette : System.Web.UI.Page
    {
        private GestionRectteEntities DbContext;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Display UserName and Totla User Online
            lblTotalUser.InnerText = string.Format("Total User Online: {0}", Application["TotalUsersOnline"].ToString());
            if (Request.Cookies["UserRecetteSite"].Value == null)
            {
                lblUserName.InnerText = string.Format("Bonjour {0}", Session["userName"].ToString());
            }
            else
            {
                lblUserName.InnerText = string.Format("Bonjour {0}", Request.Cookies["UserRecetteSite"].Value);
            }

            try
            {
                using (DbContext = new GestionRectteEntities())
                {
                    Ingrédients.DataSource = DbContext.Ingredients.Select(ing => new { ing.NomIng }).ToList();
                    Ingrédients.DataBind();

                    IngControlsTxt.DataSource = DbContext.Ingredients.ToList();
                    IngControlsTxt.DataBind();

                    string recetteId = Request.QueryString["numrecette"].ToString();
                    Recette findedRecette = DbContext.Recettes.Find(Convert.ToInt32(recetteId));
                    lblReceteName.InnerText = findedRecette.NomRec.ToString();
                }
            }
            catch (Exception)
            {

            }
        }
    }
}