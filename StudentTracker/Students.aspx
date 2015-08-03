<%@ Page Title="Students" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Students.aspx.cs" Inherits="StudentTracker.Students" meta:resourcekey="PageResource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="container">
        <div id="demo">
            <h2><asp:Literal runat="server" ID="StudentsHeader" Text="Students" meta:resourcekey="StudentsHeaderResource"></asp:Literal></h2>
            <hr/>
            <table id="myDataTable" class="display hidden hover" >
                <thead>
                    <tr>
                        <th>ID</th>
                        <th><asp:Literal runat="server" ID="StudentsTableFirstName" Text="First Name" meta:resourcekey="StudentsTableFirstNameResource"></asp:Literal></th>
                        <th><asp:Literal runat="server" ID="StudentsTableLastName" Text="First Name" meta:resourcekey="StudentsTableLastNameResource"></asp:Literal></th>
                        <th><asp:Literal runat="server" ID="StudentsTableSex" Text="Sex" meta:resourcekey="StudentsTableSexResource"></asp:Literal></th>
                        <th><asp:Literal runat="server" ID="StudentsTableAge" Text="Age" meta:resourcekey="StudentsTableAgeResource"></asp:Literal></th>
                        <th>CoursesHidden</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th>ID</th>
                        <th><asp:Literal runat="server" ID="StudentsTableFirstNameFooter" Text="First Name" meta:resourcekey="StudentsTableFirstNameResource"></asp:Literal></th>
                        <th><asp:Literal runat="server" ID="StudentsTableLastNameFooter" Text="First Name" meta:resourcekey="StudentsTableLastNameResource"></asp:Literal></th>
                        <th><asp:Literal runat="server" ID="StudentsTableSexFooter" Text="Sex" meta:resourcekey="StudentsTableSexResource"></asp:Literal></th>
                        <th><asp:Literal runat="server" ID="StudentsTableAgeFooter" Text="Age" meta:resourcekey="StudentsTableAgeResource"></asp:Literal></th>
                        <th>CoursesHidden</th>
                        <th></th>
                        <th></th>
                    </tr>
                </tfoot>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
