<%@ Page Title="Edit Student" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditStudent.aspx.cs" Inherits="StudentTracker.EditStudent" Culture="auto" meta:resourcekey="PageResource" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        <asp:Literal runat="server" ID="StudentName"></asp:Literal></h3>
    <hr />
    <div>
        <h4>
            <asp:Literal runat="server" ID="PersonalInfoHeader" Text="Personal information" meta:resourcekey="PersonalInfoHeaderResource"></asp:Literal></h4>
        <div class="col-md-12 form-horizontal">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <asp:FormView runat="server"
                        ID="StudentForm"
                        RenderOuterTable="False"
                        ItemType="StudentTracker.StudentTrackerService.StudentInfo"
                        DataKeyNames="Id"
                        DefaultMode="Edit"
                        SelectMethod="SelectStudent"
                        OnItemUpdating="StudentForm_OnItemUpdating"
                        OnDataBound="OnDataBound"
                        UpdateMethod="Update">
                        <EditItemTemplate>
                            <div class="form-group" id="studentFirstName">
                                <label for="txtFirstName" class="col-sm-2 control-label">
                                    <asp:Literal runat="server" ID="lblFirstName" Text="First Name:" meta:resourcekey="lblFirstNameResource"></asp:Literal></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtFirstName" CssClass="form-control student-edit-first-name" oninput="return validateName()" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group" id="studentLastName">
                                <label for="txtLastName" class="col-sm-2 control-label">
                                    <asp:Literal runat="server" ID="lblLastName" Text="Last Name:" meta:resourcekey="lblLastNameResource"></asp:Literal></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtLastName" CssClass="form-control" oninput="return validateLastName()" Text='<%# Eval("LastName") %>'></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="ddlSex" class="col-sm-2 control-label">
                                    <asp:Literal runat="server" ID="lblSex" Text="Sex:" meta:resourcekey="lblSexResource"></asp:Literal></label>
                                <div class="col-sm-2">
                                    <asp:DropDownList runat="server" ID="ddlSex" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group" id="studentAge">
                                <label for="txtAge" class="col-sm-2 control-label">
                                    <asp:Literal runat="server" ID="lblAge" Text="Age:" meta:resourcekey="lblAgeResource"></asp:Literal></label>
                                <div class="col-sm-10">
                                    <asp:TextBox runat="server" ID="txtAge" CssClass="form-control" oninput="return validateAge()" Text='<%# Eval("Age") %>'></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <asp:Button runat="server" CssClass="btn btn-primary" CommandName="Update" Text="Save" ID="SaveBtn" meta:resourcekey="SaveBtnResource" />
                                    <asp:Button runat="server" CssClass="btn btn-primary" OnClick="CancelButtonClick" Text="Cancel" meta:resourcekey="ButtonResource" />
                                </div>
                            </div>
                        </EditItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <hr />
        <h4>
            <asp:Literal runat="server" ID="CoursesHeader" Text="Courses" meta:resourcekey="CoursesHeaderResource"></asp:Literal></h4>
        <div class="col-md-12">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div>
                        <asp:GridView runat="server"
                            ID="CoursesGrid"
                            AutoGenerateColumns="False"
                            CssClass="table table-hover table-bordered table-striped table-responsive">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" Visible="False">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="CourseId" Text='<%# Eval("Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Course Name" meta:resourcekey="ColCourseNameResource">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="CourseName" Text='<%# Eval("CourseName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assigned students" meta:resourcekey="ColAssignedStudents">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="AssignedStudents" Text='<%# Eval("AssignedStudents") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Maximum Amount of Students" meta:resourcekey="ColMaxAmount">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="MaxAmountOfStudents" Text='<%# Eval("MaxStudents") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Leave Course" meta:resourcekey="ColLeave">
                                    <ItemTemplate>
                                        <asp:CheckBox runat="server" ID="ApplyCheckBox" Checked='<%# Eval("IsAppliedFor") %>' Enabled='<%# Eval("IsActive") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Button runat="server" ID="ApplyForCoursesButton" CssClass="btn btn-primary" Text="Save" OnClick="ApplyForCourses" meta:resourcekey="ApplyForCoursesButtonResource" />
                        <asp:Button runat="server" ID="CancelApplyButton" CssClass="btn btn-primary" Text="Cancel" OnClick="CancelFromApplication" meta:resourcekey="CancelApplyButtonResource" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
