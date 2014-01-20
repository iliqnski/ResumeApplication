using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeApplication.Web.Admin
{
    public partial class EditWorkExperience : System.Web.UI.Page
    {
        /// <summary>
        /// Triggered when the pahe loads.
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
            this.GridViewWorkExperience.DataSource = xmlData.Tables["workPlace"];
            this.GridViewWorkExperience.DataBind();
            this.GridViewWorkExperience.ShowFooter = true;
        }

        /// <summary>
        /// Handler for GridViewWorkExperience RowCancelingEdit event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewWorkExperience_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.GridViewWorkExperience.EditIndex = -1;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewWorkExperience RowEditing event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewWorkExperience_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridViewWorkExperience.ShowFooter = false;
            this.GridViewWorkExperience.EditIndex = e.NewEditIndex;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewWorkExperience RowDeleting event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewWorkExperience_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewDataBind();
            DataSet xmlData = new DataSet();
            xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            xmlData.Tables["workPlace"].Rows[e.RowIndex].Delete();
            xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            GridViewDataBind();
            Response.Redirect("EditWorkExperience.aspx");
        }

        /// <summary>
        /// Handler for GridViewWorkExperience RowUpdating event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewWorkExperience_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (this.Page.IsValid)
            {
                string startDate = ((TextBox)this.GridViewWorkExperience.Rows[e.RowIndex].FindControl("TextBoxStartDate")).Text;
                string endDate = ((TextBox)this.GridViewWorkExperience.Rows[e.RowIndex].FindControl("TextBoxEndDate")).Text;
                string occupation = ((TextBox)this.GridViewWorkExperience.Rows[e.RowIndex].FindControl("TextBoxOccupation")).Text;
                string employerName = ((TextBox)this.GridViewWorkExperience.Rows[e.RowIndex].FindControl("TextBoxEmployerName")).Text;
                string location = ((TextBox)this.GridViewWorkExperience.Rows[e.RowIndex].FindControl("TextBoxLocation")).Text;
                string sector = ((TextBox)this.GridViewWorkExperience.Rows[e.RowIndex].FindControl("TextBoxSector")).Text;
                string responsibilities = ((TextBox)this.GridViewWorkExperience.Rows[e.RowIndex].FindControl("TextBoxResponsibilities")).Text;

                this.GridViewWorkExperience.EditIndex = -1;
                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                xmlData.Tables["workPlace"].Rows[e.RowIndex]["startDate"] = startDate;
                xmlData.Tables["workPlace"].Rows[e.RowIndex]["endDate"] = endDate;
                xmlData.Tables["workPlace"].Rows[e.RowIndex]["occupation"] = occupation;
                xmlData.Tables["workPlace"].Rows[e.RowIndex]["employerName"] = employerName;
                xmlData.Tables["workPlace"].Rows[e.RowIndex]["location"] = location;
                xmlData.Tables["workPlace"].Rows[e.RowIndex]["sector"] = sector;
                xmlData.Tables["workPlace"].Rows[e.RowIndex]["responsibilities"] = responsibilities;

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditWorkExperience.aspx");
            }
        }

        /// <summary>
        /// Handler for GridViewWorkExperience RowCommand event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewWorkExperience_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertData" && this.Page.IsValid)
            {
                string startDate = ((TextBox)this.GridViewWorkExperience.FooterRow.FindControl("TextBoxStartDateInsert")).Text;
                string endDate = ((TextBox)this.GridViewWorkExperience.FooterRow.FindControl("TextBoxEndDateInsert")).Text;
                string occupation = ((TextBox)this.GridViewWorkExperience.FooterRow.FindControl("TextBoxOccupationInsert")).Text;
                string employerName = ((TextBox)this.GridViewWorkExperience.FooterRow.FindControl("TextBoxEmployerNameInsert")).Text;
                string location = ((TextBox)this.GridViewWorkExperience.FooterRow.FindControl("TextBoxLocationInsert")).Text;
                string sector = ((TextBox)this.GridViewWorkExperience.FooterRow.FindControl("TextBoxSectorInsert")).Text;
                string responsibilities = ((TextBox)this.GridViewWorkExperience.FooterRow.FindControl("TextBoxResponsibilitiesInsert")).Text;

                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));

                DataRow drInsert = xmlData.Tables["workPlace"].NewRow();
                drInsert["startDate"] = startDate;
                drInsert["endDate"] = endDate;
                drInsert["occupation"] = occupation;
                drInsert["employerName"] = employerName;
                drInsert["location"] = location;
                drInsert["sector"] = sector;
                drInsert["responsibilities"] = responsibilities;
                DataRow drParent = xmlData.Tables["workPlaces"].Rows[0];
                drInsert.SetParentRow(drParent);
                xmlData.Tables["workPlace"].Rows.Add(drInsert);

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditWorkExperience.aspx");
            }
        }
    }
}