using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using ResumeApplication.Web.Models;

namespace ResumeApplication.Web.Admin
{
    public partial class EditPersonalInformation : System.Web.UI.Page
    {
        /// <summary>
        /// Triggered when the page loads.
        /// </summary>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(Server.MapPath("~/App_Data/resume-copy.xml"));
                string xpathQuery = "catalog/resume/personalInformation";
                XmlNode personalInformationNode = xmlDoc.SelectSingleNode(xpathQuery);

                string fullName = personalInformationNode.GetChildText("fullName");
                string address = personalInformationNode.GetChildText("address");
                string phone = personalInformationNode.GetChildText("phone");
                string email = personalInformationNode.GetChildText("email");
                string sex = personalInformationNode.GetChildText("sex");
                string birthDate = personalInformationNode.GetChildText("birthDate");
                string nationality = personalInformationNode.GetChildText("nationality");
                string preferedJob = personalInformationNode.GetChildText("preferedJob");

                this.TextBoxFullName.Text = fullName;
                this.TextBoxAddress.Text = address;
                this.TextBoxPhone.Text = phone;
                this.TextBoxEmail.Text = email;
                this.TextBoxSex.Text = sex;
                this.TextBoxBirthDate.Text = birthDate;
                this.TextBoxNationality.Text = nationality;
                this.TextBoxPreferedJob.Text = preferedJob;
            }
        }

        /// <summary>
        /// Handler for the Save button click event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void LinkButtonSave_Click(object sender, EventArgs e)
        {
            if (this.Page.IsValid)
            {
                XmlDocument xmlDoc = new XmlDocument();
                xmlDoc.Load(Server.MapPath("~/App_Data/resume-copy.xml"));
                string xpathQuery = "catalog/resume/personalInformation";
                XmlNode personalInformationNode = xmlDoc.SelectSingleNode(xpathQuery);

                string fullName = this.TextBoxFullName.Text;
                string address = this.TextBoxAddress.Text;
                string phone = this.TextBoxPhone.Text;
                string email = this.TextBoxEmail.Text;
                string sex = this.TextBoxSex.Text;
                string birthDate = this.TextBoxBirthDate.Text;
                string nationality = this.TextBoxNationality.Text;
                string preferedJob = this.TextBoxPreferedJob.Text;

                personalInformationNode.SelectSingleNode("fullName").InnerText = fullName;
                personalInformationNode.SelectSingleNode("address").InnerText = address;
                personalInformationNode.SelectSingleNode("phone").InnerText = phone;
                personalInformationNode.SelectSingleNode("email").InnerText = email;
                personalInformationNode.SelectSingleNode("sex").InnerText = sex;
                personalInformationNode.SelectSingleNode("birthDate").InnerText = birthDate;
                personalInformationNode.SelectSingleNode("nationality").InnerText = nationality;
                personalInformationNode.SelectSingleNode("preferedJob").InnerText = preferedJob;

                xmlDoc.Save(Server.MapPath("~/App_Data/resume-copy.xml"));
                Response.Redirect("../Default.aspx");
            }
        }

        /// <summary>
        /// Handler for the Cancel button click event.
        /// </summary>
        /// <param name="sender">Event sender</param>
        /// <param name="e">Event arguments</param>
        protected void LinkButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }
    }
}