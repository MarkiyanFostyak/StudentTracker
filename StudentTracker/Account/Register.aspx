<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StudentTracker.Account.Register" meta:resourcekey="PageResource1" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" meta:resourcekey="ErrorMessageResource1" />
    </p>

    <div class="form-horizontal">
        <h4><asp:Literal runat="server" ID="RegisterHEader" Text ="Create a new account." meta:resourcekey="RegisterHEaderResource1"></asp:Literal></h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" meta:resourcekey="ValidationSummaryResource1" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label" meta:resourcekey="LabelResource1">User name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="UserName" CssClass="form-control" meta:resourcekey="UserNameResource1" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                    CssClass="text-danger" ErrorMessage="The user name field is required." meta:resourcekey="RequiredFieldValidatorResource1" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label" meta:resourcekey="LabelResource2">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" meta:resourcekey="PasswordResource1" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." meta:resourcekey="RequiredFieldValidatorResource2" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label" meta:resourcekey="LabelResource3">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" meta:resourcekey="ConfirmPasswordResource1" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." meta:resourcekey="RequiredFieldValidatorResource3" />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." meta:resourcekey="CompareValidatorResource1" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" meta:resourcekey="ButtonResource1" />
            </div>
        </div>
    </div>
</asp:Content>
