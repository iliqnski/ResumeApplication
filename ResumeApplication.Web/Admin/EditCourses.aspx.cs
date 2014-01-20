using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ResumeApplication.Web.Admin
{
    public partial class EditCourses : System.Web.UI.Page
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
            this.GridViewCourses.DataSource = xmlData.Tables["educationalCourse"];
            this.GridViewCourses.DataBind();
            this.GridViewCourses.ShowFooter = true;
        }

        /// <summary>
        /// Handler for GridViewCourses RowEditing event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewCourses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridViewCourses.ShowFooter = false;
            this.GridViewCourses.EditIndex = e.NewEditIndex;
            GridViewDataBind();
        }

        /// <summary>
        /// Handler for GridViewCourses RowDeleting event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewDataBind();
            DataSet xmlData = new DataSet();
            xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            xmlData.Tables["educationalCourse"].Rows[e.RowIndex].Delete();
            xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
            GridViewDataBind();
            Response.Redirect("EditCourses.aspx");
        }

        /// <summary>
        /// Handler for GridViewCourses RowUpdating event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (this.Page.IsValid)
            {
                string startDate = ((TextBox)this.GridViewCourses.Rows[e.RowIndex].FindControl("TextBoxStartDate")).Text;
                string endDate = ((TextBox)this.GridViewCourses.Rows[e.RowIndex].FindControl("TextBoxEndDate")).Text;
                string qualification = ((TextBox)this.GridViewCourses.Rows[e.RowIndex].FindControl("TextBoxQualification")).Text;
                string organization = ((TextBox)this.GridViewCourses.Rows[e.RowIndex].FindControl("TextBoxOrganization")).Text;
                string speciality = ((TextBox)this.GridViewCourses.Rows[e.RowIndex].FindControl("TextBoxSpeciality")).Text;

                this.GridViewCourses.EditIndex = -1;
                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                xmlData.Tables["educationalCourse"].Rows[e.RowIndex]["startDate"] = startDate;
                xmlData.Tables["educationalCourse"].Rows[e.RowIndex]["endDate"] = endDate;
                xmlData.Tables["educationalCourse"].Rows[e.RowIndex]["organization"] = organization;
                xmlData.Tables["educationalCourse"].Rows[e.RowIndex]["qualification"] = qualification;
                xmlData.Tables["educationalCourse"].Rows[e.RowIndex]["speciality"] = speciality;

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditCourses.aspx");
            }
        }

        /// <summary>
        /// Handler for GridViewCourses RowCommand event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertData" && this.Page.IsValid)
            {
                string startDate = ((TextBox)this.GridViewCourses.FooterRow.FindControl("TextBoxStartDateInsert")).Text;
                string endDate = ((TextBox)this.GridViewCourses.FooterRow.FindControl("TextBoxEndDateInsert")).Text;
                string qualification = ((TextBox)this.GridViewCourses.FooterRow.FindControl("TextBoxQualificationInsert")).Text;
                string organization = ((TextBox)this.GridViewCourses.FooterRow.FindControl("TextBoxOrganizationInsert")).Text;
                string speciality = ((TextBox)this.GridViewCourses.FooterRow.FindControl("TextBoxSpecialityInsert")).Text;

                GridViewDataBind();
                DataSet xmlData = new DataSet();
                xmlData.ReadXml(Server.MapPath("~/App_Data/resume-copy.xml"));

                DataRow drInsert = xmlData.Tables["educationalCourse"].NewRow();
                drInsert["startDate"] = startDate;
                drInsert["endDate"] = endDate;
                drInsert["qualification"] = qualification;
                drInsert["organization"] = organization;
                drInsert["speciality"] = speciality;
                DataRow drParent = xmlData.Tables["educationalCourses"].Rows[0];
                drInsert.SetParentRow(drParent);
                xmlData.Tables["educationalCourse"].Rows.Add(drInsert);

                xmlData.WriteXml(Server.MapPath("~/App_Data/resume-copy.xml"));
                GridViewDataBind();
                Response.Redirect("EditCourses.aspx");
            }
        }

        /// <summary>
        /// Handler for GridViewCourses RowCancelingEdit event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void GridViewCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.GridViewCourses.EditIndex = -1;
            GridViewDataBind();
        }
    }
}