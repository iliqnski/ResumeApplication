<%@ Page
    Title="Edit Courses" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="EditCourses.aspx.cs" 
    Inherits="ResumeApplication.Web.Admin.EditCourses" %>

<asp:Content 
     ID="ContentEditCourses" 
     ContentPlaceHolderID="MainContent" 
     runat="server">

    <asp:GridView
         ID="GridViewCourses"
         runat="server"
         AutoGenerateColumns="false"
         ShowFooter="true"
         OnRowCancelingEdit="GridViewCourses_RowCancelingEdit"
         OnRowEditing="GridViewCourses_RowEditing"
         OnRowDeleting="GridViewCourses_RowDeleting"
         OnRowUpdating="GridViewCourses_RowUpdating"
         OnRowCommand="GridViewCourses_RowCommand"
         CellPadding="5"
         HeaderStyle-BackColor="#428BCA"
         CssClass="grid">
        <Columns>
            <asp:TemplateField HeaderText="Organization Name">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelOrganization"
                             runat="server"
                             Text='<%#: Eval("organization") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxOrganization"
                         runat="server"
                         Text='<%# Bind("organization") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorOrganization"
                         runat="server"
                         ControlToValidate="TextBoxOrganization"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button 
                        ID="ButtonInsert"
                        runat="server"
                        Text="Create New"
                        CssClass="btn btn-primary btn-xs"
                        CommandName="InsertData" />
                    <asp:TextBox
                         ID="TextBoxOrganizationInsert"
                         runat="server"/>
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorOrganizationInsert"
                         runat="server"
                         ControlToValidate="TextBoxOrganizationInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qualification">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelQualification"
                             runat="server"
                             Text='<%#: Eval("qualification") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxQualification"
                         runat="server"
                         Text='<%# Bind("qualification") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorQualification"
                         runat="server"
                         ControlToValidate="TextBoxQualification"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox
                         ID="TextBoxQualificationInsert"
                         runat="server"/>
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorQualificationInsert"
                         runat="server"
                         ControlToValidate="TextBoxQualificationInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Speciality">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelSpeciality"
                             runat="server"
                             Text='<%#: Eval("speciality") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxSpeciality"
                         runat="server"
                         Text='<%# Bind("speciality") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorSpeciality"
                         runat="server"
                         ControlToValidate="TextBoxSpeciality"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox
                         ID="TextBoxSpecialityInsert"
                         runat="server" />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorSpecialityInsert"
                         runat="server"
                         ControlToValidate="TextBoxSpecialityInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Start Date">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelStartDate"
                             runat="server"
                             Text='<%#: Eval("startDate") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxStartDate"
                         runat="server"
                         CssClass="datepicker"
                         Text='<%# Bind("startDate") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorStartDate"
                         runat="server"
                         ControlToValidate="TextBoxStartDate"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox
                         ID="TextBoxStartDateInsert"
                         CssClass="datepicker"
                         runat="server" />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorStartDateInsert"
                         runat="server"
                         ControlToValidate="TextBoxStartDateInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="End Date">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelEndDate"
                             runat="server"
                             Text='<%#: Eval("endDate") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxEndDate"
                         runat="server"
                         CssClass="datepicker"
                         Text='<%# Bind("endDate") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorEndDate"
                         runat="server"
                         ControlToValidate="TextBoxEndDate"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox
                         ID="TextBoxEndDateInsert"
                         CssClass="datepicker"
                         runat="server" />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorEndDateInsert"
                         runat="server"
                         ControlToValidate="TextBoxEndDateInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:CommandField 
                 ControlStyle-CssClass="btn btn-primary btn-xs" 
                 HeaderText="Edit" 
                 ShowEditButton="true" />
            <asp:TemplateField HeaderText="Delete">
	            <ItemTemplate>
		            <asp:Button 
                         ID="deleteButton" 
                         runat="server" 
                         CommandName="Delete" 
                         Text="Delete" 
                         CssClass="btn btn-primary btn-xs"
                         OnClientClick="return confirm('Are you sure?');" />
	            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <a href="../Default.aspx" class="btn btn-primary btn-sm back">Back to resume</a>
</asp:Content>