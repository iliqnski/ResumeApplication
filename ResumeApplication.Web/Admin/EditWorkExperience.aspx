<%@ Page 
    Title="Edit Work Experience" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="EditWorkExperience.aspx.cs" 
    Inherits="ResumeApplication.Web.Admin.EditWorkExperience" %>

<asp:Content 
     ID="ContentEditWorkExperience" 
     ContentPlaceHolderID="MainContent" 
     runat="server">

    <asp:GridView
         ID="GridViewWorkExperience" 
         runat="server"
         AutoGenerateColumns="false"
         ShowFooter="true"
         OnRowCancelingEdit="GridViewWorkExperience_RowCancelingEdit"
         OnRowEditing="GridViewWorkExperience_RowEditing"
         OnRowDeleting="GridViewWorkExperience_RowDeleting"
         OnRowUpdating="GridViewWorkExperience_RowUpdating"
         OnRowCommand="GridViewWorkExperience_RowCommand"
         CellPadding="5"
         HeaderStyle-BackColor="#428BCA"
         CssClass="grid">
        <Columns>
            <asp:TemplateField HeaderText="Employer Name">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelEmployerName"
                             runat="server"
                             Text='<%#: Eval("employerName") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxEmployerName"
                         runat="server"
                         Text='<%# Bind("employerName") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorEmployerName"
                         runat="server"
                         ControlToValidate="TextBoxEmployerName"
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
                         ID="TextBoxEmployerNameInsert"
                         runat="server"/>
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorInsertEmployerName"
                         runat="server"
                         ControlToValidate="TextBoxEmployerNameInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Occupation">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelOccupation"
                             runat="server"
                             Text='<%#: Eval("occupation") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxOccupation"
                         runat="server"
                         Text='<%# Bind("occupation") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorOccupation"
                         runat="server"
                         ControlToValidate="TextBoxOccupation"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox
                         ID="TextBoxOccupationInsert"
                         runat="server"/>
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorInsertOccupation"
                         runat="server"
                         ControlToValidate="TextBoxOccupationInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Responsibilities">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelResponsibilities"
                             runat="server"
                             Text='<%#: Eval("responsibilities") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxResponsibilities"
                         runat="server"
                         Text='<%# Bind("responsibilities") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorResponsibilities"
                         runat="server"
                         ControlToValidate="TextBoxResponsibilities"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox
                         ID="TextBoxResponsibilitiesInsert"
                         runat="server" />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorResponsibilitiesInsert"
                         runat="server"
                         ControlToValidate="TextBoxResponsibilitiesInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Loaction">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelLocation"
                             runat="server"
                             Text='<%#: Eval("location") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxLocation"
                         runat="server"
                         Text='<%# Bind("location") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorLocation"
                         runat="server"
                         ControlToValidate="TextBoxLocation"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox
                         ID="TextBoxLocationInsert"
                         runat="server" />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorLocationInsert"
                         runat="server"
                         ControlToValidate="TextBoxLocationInsert"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sector">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                             ID="LabelSector"
                             runat="server"
                             Text='<%#: Eval("sector") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                         ID="TextBoxSector"
                         runat="server"
                         Text='<%# Bind("sector") %>' />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorSector"
                         runat="server"
                         ControlToValidate="TextBoxSector"
                         ForeColor="Red"
                         Font-Size="X-Large"
                         ErrorMessage="*" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox
                         ID="TextBoxSectorInsert"
                         runat="server" />
                    <asp:RequiredFieldValidator
                         ID="RequiredFieldValidatorSectorInsert"
                         runat="server"
                         ControlToValidate="TextBoxSectorInsert"
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