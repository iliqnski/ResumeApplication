using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeApplication.Web.Admin
{
    public partial class EditLanguages : System.Web.UI.Page
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
            this.GridViewLanguages.DataSource = xmlData.Tables["language"];
            this.GridViewLanguages.DataBind();
            this.GridViewLanguages.ShowFooter = true;
        }

        /// <summary>
        /// Handler for GridViewLanguages RowCancelingEdit event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewLanguages_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.GridViewLanguages.EditIndex = -1;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewLanguages RowEditing event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewLanguages_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridViewLanguages.ShowFooter = false;
            this.GridViewLanguages.EditIndex = e.NewEditIndex;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewLanguages RowDeleting event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewLanguages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewDataBind();
            DataSet xmlData = new DataSet();
            xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            xmlData.Tables["language"].Rows[e.RowIndex].Delete();
            xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            GridViewDataBind();
            Response.Redirect("EditLanguages.aspx");
        }

        /// <summary>
        /// Handler for GridViewLanguages RowUpdating event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewLanguages_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (this.Page.IsValid)
            {
                string languageName = ((TextBox)this.GridViewLanguages.Rows[e.RowIndex].FindControl("TextBoxLanguage")).Text;

                this.GridViewLanguages.EditIndex = -1;
                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                xmlData.Tables["language"].Rows[e.RowIndex]["name"] = languageName;

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditLanguages.aspx");
            }
        }

        /// <summary>
        /// Handler for GridViewLanguages RowCommand event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewLanguages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertData" && this.Page.IsValid)
            {
                string languageName = ((TextBox)this.GridViewLanguages.FooterRow.FindControl("TextBoxLanguageInsert")).Text;

                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));

                DataRow drInsert = xmlData.Tables["language"].NewRow();
                drInsert["name"] = languageName;
                DataRow drParent = xmlData.Tables["languages"].Rows[0];
                drInsert.SetParentRow(drParent);
                xmlData.Tables["language"].Rows.Add(drInsert);

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditLanguages.aspx");
            }
        }
    }
}