<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StudentTracker._Default" meta:resourcekey="HomePage" %>

<%@ Import Namespace="Resources" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>
            <asp:Literal runat="server" ID="LandingPageHeader" Text="Student Tracker" meta:resourcekey="LandingPageHeaderResource"></asp:Literal></h1>
        <p class="lead">
            <asp:Literal runat="server" ID="LandingPageDescription" Text="Student Tracker - service to check students progress in studying" meta:resourcekey="LandingPageDescriptionResource"></asp:Literal>
        </p>
    </div>
</asp:Content>
