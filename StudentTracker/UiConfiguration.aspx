<%@ Page Title="Look" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UiConfiguration.aspx.cs" Inherits="StudentTracker.UiConfiguration" meta:resourcekey="PageResource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Literal runat="server" ID="StudentsHeader" Text="Configure Look" meta:resourcekey="StudentsHeaderResource"></asp:Literal></h2>
    <hr />
    <div class="ui-config-cont row">
        <div class="col-md-4">
            <h4>
                <asp:Literal runat="server" ID="SelectColoursHeader" Text="Select Colours" meta:resourcekey="SelectColoursHeaderResource"></asp:Literal></h4>
            <hr />
            <div class="col-md-12">
                <label><asp:Literal runat="server" ID="BagColourLabel" Text="Background colour:" meta:resourcekey="BagColourLabelResource"></asp:Literal></label>
            </div>
            <div class="col-md-12">
                <div class=" input-group bg-colour-picker colour-input">
                    <input type="text" value="" class="form-control" aria-describedby="bg-picked-color-addon" id="selected-bg-color"/>
                    <span class="input-group-addon" id="bg-picked-color-addon"><i></i></span>
                </div>
            </div>
            <div class="col-md-12">
                <label><asp:Literal runat="server" ID="hdColourLabel" Text="Header colour:" meta:resourcekey="hdColourLabelResource"></asp:Literal></label>
            </div>
            <div class="col-md-12">
                <div class="input-group hd-colour-picker colour-input">
                    <input type="text" value="" class="form-control" aria-describedby="hd-picked-color-addon" id="selected-hd-color"/>
                    <span class="input-group-addon" id="hd-picked-picked-color-addon"><i></i></span>
                </div>
            </div>
            <div class="col-md-12">
                <asp:Button runat="server" ID="ApplyStyleButton" Text="Apply" CssClass="btn btn-success" OnClick="ApplyColours" meta:resourcekey="ApplyStyleButtonResource"></asp:Button>
            </div>
            <asp:TextBox runat="server" Id="bgColorTxt" CssClass="hidden" meta:resourcekey="bgColorTxtResource"></asp:TextBox>
            <asp:TextBox runat="server" Id="hdColorTxt" CssClass="hidden" meta:resourcekey="hdColorTxtResource"></asp:TextBox>
        </div>
        <div class="col-md-8">
            <h4>
                <asp:Literal runat="server" ID="Literal1" Text="Preview" meta:resourcekey="Literal1Resource"></asp:Literal></h4>
            <hr />
            <div class="preview-cont">
                <div class="col-md-12">
                    <div id="preview-header" class="navbar navbar-inverse row">
                        <div class="container">
                            <div class="navbar-header">
                                <div class="navbar-brand">Student Tracker </div>
                            </div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li><a><asp:Literal runat="server" ID="prevNavHome" Text="Home" meta:resourcekey="prevNavHomeResource"></asp:Literal></a></li>
                                    <li><a><asp:Literal runat="server" ID="prevNavAbout" Text="About" meta:resourcekey="prevNavAboutResource"></asp:Literal></a></li>
                                    <li><a><asp:Literal runat="server" ID="PrevNavStudents" Text="Students" meta:resourcekey="PrevNavStudentsResource"></asp:Literal></a></li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a><asp:Literal runat="server" ID="prevNavRegister" Text="Register" meta:resourcekey="prevNavRegisterResource"></asp:Literal></a></li>
                                    <li><a><asp:Literal runat="server" ID="prevNavLogin" Text="Log In" meta:resourcekey="prevNavLoginResource"></asp:Literal></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="preview-body">
                    <div class="col-md-12">
                        <div class="jumbotron">
                            <h2>Student Tracker</h2>
                            <p class="lead">
                                <asp:Literal runat="server" ID="LandingPageDescription" Text="Student Tracker - service to check students progress in studying" meta:resourcekey="PrevPageDescriptionResource"></asp:Literal>
                            </p>
                        </div>
                    </div>
                    <hr />
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <p>&copy; <%: DateTime.Now.Year %> - Student Tracker</p>
                        </div>
                        <div class="text-right col-md-3 col-md-offset-3">
                            <div class="dropdown">
                                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <asp:Literal runat="server" ID="LanguageDB" Text="Language" meta:resourcekey="LanguageDBResource"></asp:Literal><span class="caret"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
