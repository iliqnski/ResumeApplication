<%@ Page
    Title="Edit Languages"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="EditLanguages.aspx.cs"
    Inherits="ResumeApplication.Web.Admin.EditLanguages" %>

<asp:Content
    ID="ContentEditLanguages"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <asp:GridView
        ID="GridViewLanguages"
        runat="server"
        AutoGenerateColumns="false"
        ShowFooter="true"
        OnRowCancelingEdit="GridViewLanguages_RowCancelingEdit"
        OnRowEditing="GridViewLanguages_RowEditing"
        OnRowDeleting="GridViewLanguages_RowDeleting"
        OnRowUpdating="GridViewLanguages_RowUpdating"
        OnRowCommand="GridViewLanguages_RowCommand"
        CellPadding="5"
        HeaderStyle-BackColor="#428BCA"
        CssClass="grid">
        <Columns>
            <asp:TemplateField HeaderText="Language Name">
                <ItemTemplate>
                    <div class="cut-text-container">
                        <asp:Label
                            ID="LabelLanguage"
                            runat="server"
                            Text='<%#: Eval("name") %>' />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox
                        ID="TextBoxLanguage"
                        runat="server"
                        Text='<%# Bind("name") %>' />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidatorLanguage"
                        runat="server"
                        ControlToValidate="TextBoxLanguage"
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
                        ID="TextBoxLanguageInsert"
                        runat="server" />
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidatorLanguageInsert"
                        runat="server"
                        ControlToValidate="TextBoxLanguageInsert"
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