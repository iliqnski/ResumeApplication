using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeApplication.Web.Admin
{
    public partial class EditSkills : System.Web.UI.Page
    {
        /// <summary>
        /// Triggered when the page loads.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                GridViewDataBind();
            }
        }

        /// <summary>
        /// Additional method for data binding
        /// </summary>
        private void GridViewDataBind()
        {
            DataSet xmlData = new DataSet();
            xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            this.GridViewOtherSkills.DataSource = xmlData.Tables["personalSkill"];
            this.GridViewOtherSkills.DataBind();
            this.GridViewOtherSkills.ShowFooter = true;
        }

        /// <summary>
        /// Handler for GridViewOtherSkills RowCancelingEdit event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewOtherSkills_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.GridViewOtherSkills.EditIndex = -1;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewOtherSkills RowEditing event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewOtherSkills_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridViewOtherSkills.ShowFooter = false;
            this.GridViewOtherSkills.EditIndex = e.NewEditIndex;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewOtherSkills RowDeleting event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewOtherSkills_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewDataBind();
            DataSet xmlData = new DataSet();
            xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            xmlData.Tables["personalSkill"].Rows[e.RowIndex].Delete();
            xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            GridViewDataBind();
            Response.Redirect("EditSkills.aspx");
        }

        /// <summary>
        /// Handler for GridViewOtherSkills RowUpdating event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewOtherSkills_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (this.Page.IsValid)
            {
                string skillName = ((TextBox)this.GridViewOtherSkills.Rows[e.RowIndex].FindControl("TextBoxOtherSkills")).Text;

                this.GridViewOtherSkills.EditIndex = -1;
                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                xmlData.Tables["personalSkill"].Rows[e.RowIndex]["name"] = skillName;

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditSkills.aspx");
            }
        }

        /// <summary>
        /// Handler for GridViewOtherSkills RowCommand event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewOtherSkills_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertData" && this.Page.IsValid)
            {
                string skillName = ((TextBox)this.GridViewOtherSkills.FooterRow.FindControl("TextBoxOtherSkillsInsert")).Text;

                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));

                DataRow drInsert = xmlData.Tables["personalSkill"].NewRow();
                drInsert["name"] = skillName;
                DataRow drParent = xmlData.Tables["personalSkills"].Rows[0];
                drInsert.SetParentRow(drParent);
                xmlData.Tables["personalSkill"].Rows.Add(drInsert);

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditSkills.aspx");
            }
        }
    }
}