<%@ Page
    Title="Edit Projects"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="EditProjects.aspx.cs"
    Inherits="ResumeApplication.Web.Admin.EditProjects" %>

<asp:Content
    ID="ContentEditProjects"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <asp:GridView
        ID="GridViewProjects"
        runat="server"
        AutoGenerateColumns="false"
        ShowFooter="true"
        OnRowCancelingEdit="GridViewProjects_RowCancelingEdit"
        OnRowEditing="GridViewProjects_RowEditing"
        OnRowDeleting="GridViewProjects_RowDeleting"
        OnRowUpdating="GridViewProjects_RowUpdating"
        OnRowCommand="GridViewProjects_RowCommand"
        CellPadding="5"
        HeaderStyle-BackColor="#428BCA"
        CssClass="grid">
        <Columns>
            <asp:TemplateField HeaderText="Project Url">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                            ID="LabelProjects"
                            runat="server"
                            Text='<%#: Eval("name") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                        ID="TextBoxProject"
                        runat="server"
                        Text='<%# Bind("name") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidatorProject"
                        runat="server"
                        ControlToValidate="TextBoxProject"
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
                        ID="TextBoxProjectInsert"
                        runat="server" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidatorProjectInsert"
                        runat="server"
                        ControlToValidate="TextBoxProjectInsert"
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