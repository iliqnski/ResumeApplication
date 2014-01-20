<%@ Page
    Title="Edit Skills"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="EditSkills.aspx.cs"
    Inherits="ResumeApplication.Web.Admin.EditSkills" %>

<asp:Content
    ID="ContentEditSkills"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <asp:GridView
        ID="GridViewOtherSkills"
        runat="server"
        AutoGenerateColumns="false"
        ShowFooter="true"
        OnRowCancelingEdit="GridViewOtherSkills_RowCancelingEdit"
        OnRowEditing="GridViewOtherSkills_RowEditing"
        OnRowDeleting="GridViewOtherSkills_RowDeleting"
        OnRowUpdating="GridViewOtherSkills_RowUpdating"
        OnRowCommand="GridViewOtherSkills_RowCommand"
        CellPadding="5"
        HeaderStyle-BackColor="#428BCA"
        CssClass="grid">
        <Columns>
            <asp:TemplateField HeaderText="Skill description">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                            ID="LabelOtherSkills"
                            runat="server"
                            Text='<%#: Eval("name") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                        ID="TextBoxOtherSkills"
                        runat="server"
                        Text='<%# Bind("name") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidatorOtherSkills"
                        runat="server"
                        ControlToValidate="TextBoxOtherSkills"
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
                        ID="TextBoxOtherSkillsInsert"
                        runat="server" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidatorOtherSkillsInsert"
                        runat="server"
                        ControlToValidate="TextBoxOtherSkillsInsert"
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