<%@ Page 
    Title="Edit Personal Information" 
    Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="EditPersonalInformation.aspx.cs" 
    Inherits="ResumeApplication.Web.Admin.EditPersonalInformation" %>

<asp:Content 
    ID="ContentEditPersonalInformation" 
    ContentPlaceHolderID="MainContent" 
    runat="server">

    <asp:Panel
         ID="PanelEditPersonalInformation"
         runat="server"
         CssClass="panel-personalInformation">
        <div class="row">
            <div class="col-md-12">
                <h3>Edit Personal Information</h3>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
               <asp:Label
                    ID="LabelFullName" 
                    runat="server"  
                    Text="Full Name:" 
                    AssociatedControlID="TextBoxFullName" 
                    CssClass="col-sm-4" />         
               <div class="col-sm-8">
                    <asp:TextBox 
                         ID="TextBoxFullName" 
                         runat="server"  
                         CssClass="form-control"/>
                </div>
                <asp:RequiredFieldValidator
                     ID="RequiredFullName"
                     runat="server"
                     Display="None"
                     ControlToValidate="TextBoxFullName"
                     ErrorMessage="Full Name Required" />
            </div>
        </div>
        <div class="form-group">
            <div class="row">
               <asp:Label
                    ID="LabelEditAddress" 
                    runat="server"  
                    Text="Address:" 
                    AssociatedControlID="TextBoxAddress" 
                    CssClass="col-sm-4" />     
                <div class="col-sm-8">
                    <asp:TextBox 
                         ID="TextBoxAddress" 
                         runat="server"  
                         CssClass="form-control"/>
                </div>
                <asp:RequiredFieldValidator
                     ID="RequiredFieldValidatorAddress"
                     runat="server"
                     Display="None"
                     ControlToValidate="TextBoxAddress"
                     ErrorMessage="Address Required" />
            </div>
        </div>
        <div class="form-group">
            <div class="row">
               <asp:Label
                    ID="LabelPhone" 
                    runat="server"  
                    Text="Phone:" 
                    AssociatedControlID="TextBoxPhone" 
                    CssClass="col-sm-4" />
            
                <div class="col-sm-8">
                    <asp:TextBox 
                         ID="TextBoxPhone" 
                         runat="server"  
                         CssClass="form-control"/>
                </div>
                <asp:RequiredFieldValidator
                     ID="RequiredFieldValidatorPhone"
                     runat="server"
                     ControlToValidate="TextBoxPhone"
                     Display="None"
                     ErrorMessage="Phone Number Required" />

            </div>
        </div>
        <div class="form-group">
            <div class="row">
               <asp:Label
                    ID="LabelEmail" 
                    runat="server"  
                    Text="Email:" 
                    AssociatedControlID="TextBoxEmail" 
                    CssClass="col-sm-4" />
                <div class="col-sm-8">
                    <asp:TextBox 
                         ID="TextBoxEmail" 
                         runat="server"  
                         CssClass="form-control"/>
                </div>
                <asp:RequiredFieldValidator
                        ID="RequiredFieldValidatorEmail"
                        runat="server"
                        ControlToValidate="TextBoxEmail"
                        Display="None"
                        ErrorMessage="Email Address Required" />
                <asp:RegularExpressionValidator   
                        ID="RegularExpressionValidatorEmail"  
                        runat="server"   
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  
                        ControlToValidate="TextBoxEmail"  
                        Display="None"
                        ErrorMessage="Invalid email address!"/>  
            </div>
        </div>
        <div class="form-group">
            <div class="row">
               <asp:Label
                    ID="LabelSex" 
                    runat="server"  
                    Text="Sex:" 
                    AssociatedControlID="TextBoxSex" 
                    CssClass="col-sm-4" />
            
                <div class="col-sm-8">
                    <asp:TextBox 
                         ID="TextBoxSex" 
                         runat="server"  
                         CssClass="form-control"/>
                </div>
                <asp:RequiredFieldValidator
                     ID="RequiredFieldValidatorSex"
                     runat="server"
                     ControlToValidate="TextBoxSex"
                     Display="None"
                     ErrorMessage="Sex Field Required" />
            </div>
        </div>
        <div class="form-group">
            <div class="row">
               <asp:Label
                    ID="LabelBirthDate" 
                    runat="server"  
                    Text="Date of birth:" 
                    AssociatedControlID="TextBoxBirthDate" 
                    CssClass="col-sm-4" />
                <div class="col-sm-8">
                    <asp:TextBox 
                         ID="TextBoxBirthDate" 
                         runat="server"  
                         CssClass="form-control datepicker"/>
                </div>
                <asp:RequiredFieldValidator
                     ID="RequiredFieldValidatorBirthDate"
                     runat="server"
                     ControlToValidate="TextBoxBirthDate"
                     Display="None"
                     ErrorMessage="Birth Date Required" />
            </div>
        </div>
        <div class="form-group">
            <div class="row">
               <asp:Label
                    ID="LabelNationality" 
                    runat="server"  
                    Text="Nationality:" 
                    AssociatedControlID="TextBoxNationality" 
                    CssClass="col-sm-4" />
            
                <div class="col-sm-8">
                    <asp:TextBox 
                         ID="TextBoxNationality" 
                         runat="server"  
                         CssClass="form-control"/>
                </div>
                <asp:RequiredFieldValidator
                     ID="RequiredFieldValidatorNationality"
                     runat="server"
                     Display="None"
                     ControlToValidate="TextBoxNationality"
                     ErrorMessage="Nationality Field Required" />
            </div>
        </div>
        <div class="form-group">
            <div class="row">
               <asp:Label
                    ID="LabelPreferedJob" 
                    runat="server"  
                    Text="Prefered Job:" 
                    AssociatedControlID="TextBoxPreferedJob" 
                    CssClass="col-sm-4" />
            
                <div class="col-sm-8">
                    <asp:TextBox 
                         ID="TextBoxPreferedJob" 
                         runat="server"  
                         CssClass="form-control"/>
                </div>
                <asp:RequiredFieldValidator
                     ID="RequiredFieldValidatorPreferedJob"
                     runat="server"
                     Display="None"
                     ControlToValidate="TextBoxPreferedJob"
                     ErrorMessage="Prefered Job Required" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <asp:LinkButton
                     ID="LinkButtonSave"
                     runat="server"
                     Text="Save"
                     OnClick="LinkButtonSave_Click"
                     CssClass="btn btn-primary btn-sm" />
                <asp:LinkButton
                     ID="LinkButtonCancel"
                     runat="server"
                     Text="Cancel"
                     CausesValidation="false"
                     OnClick="LinkButtonCancel_Click"
                     CssClass="btn btn-primary btn-sm" />
            </div>
        </div>
        <asp:ValidationSummary 
             ShowMessageBox="true" 
             ShowSummary="false" 
             ForeColor="Red" 
             runat="server" 
             ID="validationSummary"/>
    </asp:Panel>
</asp:Content>