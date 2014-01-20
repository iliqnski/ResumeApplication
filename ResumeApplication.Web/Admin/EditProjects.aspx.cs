using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeApplication.Web.Admin
{
    public partial class EditProjects : System.Web.UI.Page
    {
        /// <summary>
        /// Triggered when the page loads
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
            this.GridViewProjects.DataSource = xmlData.Tables["project"];
            this.GridViewProjects.DataBind();
            this.GridViewProjects.ShowFooter = true;
        }

        /// <summary>
        /// Handler for GridViewProjects RowCancelingEdit event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewProjects_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.GridViewProjects.EditIndex = -1;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewProjects RowEditing event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewProjects_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridViewProjects.ShowFooter = false;
            this.GridViewProjects.EditIndex = e.NewEditIndex;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewProjects RowDeleting event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewProjects_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewDataBind();
            DataSet xmlData = new DataSet();
            xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            xmlData.Tables["project"].Rows[e.RowIndex].Delete();
            xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            GridViewDataBind();
            Response.Redirect("EditProjects.aspx");
        }

        /// <summary>
        /// Handler for GridViewProjects RowUpdating event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewProjects_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (this.Page.IsValid)
            {
                string projectUrl = ((TextBox)this.GridViewProjects.Rows[e.RowIndex].FindControl("TextBoxProject")).Text;

                this.GridViewProjects.EditIndex = -1;
                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                xmlData.Tables["project"].Rows[e.RowIndex]["name"] = projectUrl;

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
            }
        }

        /// <summary>
        /// Handler for GridViewProjects RowCommand event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewProjects_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertData" && this.Page.IsValid)
            {
                string projectUrl = ((TextBox)this.GridViewProjects.FooterRow.FindControl("TextBoxProjectInsert")).Text;

                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));

                DataRow drInsert = xmlData.Tables["project"].NewRow();
                drInsert["name"] = projectUrl;
                DataRow drParent = xmlData.Tables["projects"].Rows[0];
                drInsert.SetParentRow(drParent);
                xmlData.Tables["project"].Rows.Add(drInsert);

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditProjects.aspx");
            }
        }
    }
}