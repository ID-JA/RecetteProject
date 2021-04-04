using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RecetteProject.Models;

namespace RecetteProject
{
    public partial class CreerRecette : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                // Fill ddlThemes
                try
                {
                    using (DbContext = new GestionRectteEntities())
                    {
                        ddlTheme.DataSource = DbContext.Themes.ToList();
                        ddlTheme.DataTextField = "NomTheme";
                        ddlTheme.DataValueField = "CodeTheme";
                        ddlTheme.DataBind();

                    }
                }
                catch (Exception)
                {


                }
            }
        }

        private void ClearControls()
        {
            txtnomRecette.Value = "";
            txtMethodPrepara.Value = "";
            txtTimePrepara.Value = "";
        }

        protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblTheme.InnerText = ddlTheme.SelectedItem.Text;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            try
            {
                // Get Image
                string imageName = null;
                if (ImageUpload.HasFile)
                {
                    string fileName = ImageUpload.FileName.ToString();
                    ImageUpload.PostedFile.SaveAs(Server.MapPath("~/Images/Recettes/") + fileName);
                    FileInfo fileInfo = new FileInfo(fileName);
                    imageName = fileInfo.Name.ToString();
                }
                else
                {
                    string fullPath = Server.MapPath("~/Images/DefaultRecette.jpg");
                    string[] arrPath = fullPath.Split('\\');
                    imageName = arrPath[arrPath.Length - 1];
                }
                // Get Time
                string[] splitTime = txtTimePrepara.Value.Split(':');
                
                //Response.Write("<script>alert('" + time[1] + "');</script>");
                using (DbContext = new GestionRectteEntities())
                {
                    Recette newRecette = new Recette()
                    {
                        NomRec = txtnomRecette.Value,
                        DateCreationRec = DateTime.Now,
                        Difficulte = RadioButtonList1.SelectedItem.Value.ToString(),
                        TempsPreparation = Convert.ToInt32(splitTime[1]),
                        MethodePreparation = txtMethodPrepara.Value,
                        Photo = imageName,
                        CodeTheme = Convert.ToInt32(ddlTheme.SelectedItem.Value)
                    };
                    DbContext.Recettes.Add(newRecette);
                    DbContext.SaveChanges();
                    ClearControls();
                    Response.Redirect("DetailsRecette.aspx?numrecette=" + newRecette.NumRecette);
                }
            }
            catch (Exception)
            {

              
            }
        }
    }
}