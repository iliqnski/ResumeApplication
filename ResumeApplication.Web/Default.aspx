<%@ Page
    Title="Home Page"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Default.aspx.cs"
    Inherits="ResumeApplication.Web._Default" %>

<asp:Content
    ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <asp:XmlDataSource
        ID="XmlDataSourceResume"
        runat="server"
        DataFile="App_Data/resume-copy.xml"
        XPath="catalog/resume" />

    <asp:Repeater
        ID="PersonalInfo"
        runat="server"
        DataSourceID="XmlDataSourceResume">
        <ItemTemplate>
            <div class="row">
                <div class="col-md-3 personalInfo">
                    <span class="definition">Personal Information</span>
                </div>
                <div class="col-md-9 fullName">
                    <h3><%#: XPath("personalInformation/fullName") %></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9 col-md-offset-3">
                    <img src="Content/images/address.png" alt="address" />
                    <span><%#: XPath("personalInformation/address") %></span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9 col-md-offset-3">
                    <img src="Content/images/phone.png" alt="phone" />
                    <span><%#: XPath("personalInformation/phone") %></span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9 col-md-offset-3 email">
                    <img src="Content/images/email.png" alt="email" />
                    <span><%#: XPath("personalInformation/email") %></span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9 col-md-offset-3 nationality">
                <span>
                    <span class="small-definition">Sex
                    </span>
                    <%#: XPath("personalInformation/sex") %>
                    <span class="small-definition">|
                    </span>
                </span>
                <span>
                    <span class="small-definition">Date of birth
                    </span>
                    <%#: XPath("personalInformation/birthDate") %>
                    <span class="small-definition">|
                    </span>
                </span>
                <span>
                    <span class="small-definition">Nationality
                    </span>
                    <%#: XPath("personalInformation/nationality") %>
                </span>
            </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <span class="definition">Prefered Job</span>
                </div>
                <div class="col-md-9 preferedJob">
                    <h4><%#: XPath("personalInformation/preferedJob") %></h4>
                </div>
            </div>

            <div class="row buttons">
                <div class="col-md-1 col-md-offset-3">
                    <a href="Admin/EditPersonalInformation.aspx" class="btn btn-primary btn-sm">Edit</a>
                </div>
            </div>
           
            <div class="row">
                <div class="col-md-3">
                    <span class="definition">Work Experience</span>
                </div>
                <div class="col-md-9">
                    <hr class="separator" />
                </div>
            </div>

            <asp:Repeater
                ID="RepeaterWorkPlace"
                runat="server"
                DataSource='<%#XPathSelect("workPlaces/workPlace")%>'>
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="small-definition">
                                <%#: XPath("startDate") %>
                                -
                                <%#: XPath("endDate") %>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <h4 class="small-definition"><%#: XPath("occupation") %></h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3 employerName">
                            <b><%#: XPath("employerName") %></b>,&nbsp;<span><%#: XPath("location") %></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <li><%#: XPath("responsibilities") %></li>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3 sector">
                            <span class="small-definition">Business or sector&nbsp;</span>
                            <span><%#: XPath("sector") %></span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="row work-experience-button">
                <div class="col-md-1 col-md-offset-3">
                    <a href="Admin/EditWorkExperience.aspx" class="btn btn-primary btn-sm">Edit</a>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <span class="definition">Education And Training</span>
                </div>
                <div class="col-md-9">
                    <hr class="separator" />
                </div>
            </div>

            <asp:Repeater
                ID="RepeaterCourses"
                runat="server"
                DataSource='<%# XPathSelect("educationalCourses/educationalCourse")%>'>
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-3">
                            <span class="small-definition">
                                <%#: XPath("startDate") %>
                                -
                                <%#: XPath("endDate") %>
                            </span>
                        </div>
                        <div class="col-md-9">
                            <h4 class="small-definition"><%#: XPath("qualification") %></h4>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <span><%#: XPath("organization") %></span>
                        </div>
                        <div class="col-md-9 col-md-offset-3 speciality">
                            <li><%#: XPath("speciality") %></li>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="row buttons">
                <div class="col-md-1 col-md-offset-3">
                    <a href="Admin/EditCourses.aspx" class="btn btn-primary btn-sm">Edit</a>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <span class="definition">Personal Skills</span>
                </div>
                <div class="col-md-9">
                    <hr class="separator" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <span class="small-definition">Languages</span>
                </div>
                <div class="col-md-9 language-img">
                    <img src="Content/images/languages.png" alt="languages-image" />
                </div>
            </div>
            <asp:Repeater
                ID="RepeaterLanguages"
                runat="server"
                DataSource='<%# XPathSelect("languages/language")%>'>
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <li><%#: XPath("name") %></li>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="row buttons-skills">
                <div class="col-md-1 col-md-offset-3">
                    <a href="Admin/EditLanguages.aspx" class="btn btn-primary btn-sm">Edit Languages</a>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <span class="small-definition">Other Skills</span>
                </div>
                <div class="col-md-9 otherSkills-img">
                    <img src="Content/images/personal-skills.png" alt="personal-skills-image" />
                </div>
            </div>
            <asp:Repeater
                ID="RepeaterPersonalSkills"
                runat="server"
                DataSource='<%# XPathSelect("personalSkills/personalSkill")%>'>
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <li><%#: XPath("name") %></li>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="row buttons-skills">
                <div class="col-md-1 col-md-offset-3">
                    <a href="Admin/EditSkills.aspx" class="btn btn-primary btn-sm">Edit Skills</a>
                </div>
            </div>

            <div class="row additional-information">
                <div class="col-md-3">
                    <span class="definition">Additional Information</span>
                </div>
                <div class="col-md-9">
                    <hr class="separator" />
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3">
                    <span class="small-definition">Projects</span>
                </div>
                <div class="col-md-9 projects-img">
                    <img src="Content/images/projects.png" alt="projects-image" />
                </div>
            </div>
            <asp:Repeater
                ID="RepeaterProjects"
                runat="server"
                DataSource='<%# XPathSelect("projects/project")%>'>
                <ItemTemplate>
                    <div class="row">
                        <div class="col-md-9 col-md-offset-3">
                            <li><a href='<%#: XPath("name") %>'><%#: XPath("name") %></a></li>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="row buttons-projects">
                <div class="col-md-1 col-md-offset-3">
                    <a href="Admin/EditProjects.aspx" class="btn btn-primary btn-sm">Edit</a>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</asp:Content>