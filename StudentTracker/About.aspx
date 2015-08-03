<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="StudentTracker.About" meta:resourcekey="PageResource" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><asp:Literal runat="server" ID="AboutHeader" Text="About Student Tracker" meta:resourcekey="AboutHeaderResource"></asp:Literal></h3>
    <p><asp:Literal runat="server" ID="AboutDescription" Text="This is service to track students progress in passing courses." meta:resourcekey="AboutDescriptionResource"></asp:Literal></p>
</asp:Content>
