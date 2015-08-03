<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCourses.aspx.cs" Inherits="StudentTracker.ManageCourses" EnableEventValidation="false" meta:resourcekey="PageResource1" %>

<asp:Content ID="CoursesContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <h2>
                <asp:Literal runat="server" ID="ManageCoursesHeader" Text="Manage Courses" meta:resourcekey="ManageCoursesHeaderResource"></asp:Literal></h2>
            <hr />
            <asp:Label runat="server" Font-Size="16pt" ID="ErrorMessage" CssClass="text-danger upload-conrtol" Visible="False"></asp:Label>
            <div class="btn-group btn-group-justified button-group-div " role="group">
                <asp:Button runat="server" CssClass="btn btn-primary" ID="AddButton" Text="Add" OnClick="AddCourse" Width="25%" meta:resourcekey="AddButtonResource"></asp:Button>
                <asp:Button runat="server" CssClass="btn btn-primary" ID="DeleteButton" Text="Delete" OnClick="DeleteCourses" Width="25%" meta:resourcekey="DeleteButtonResource"></asp:Button>
                <asp:Button runat="server" CssClass="btn btn-primary saveBtn disabled" ID="SaveButton" Text="Save" OnClick="GeneralSaving" Width="25%" meta:resourcekey="SaveButtonResource"></asp:Button>
                <asp:Button runat="server" CssClass="btn btn-primary" ID="CancelButton" Text="Cancel" OnClick="GeneralCancel" Width="25%" meta:resourcekey="CancelButtonResource"></asp:Button>
            </div>
            <div class="gridview-cont">
                <asp:GridView runat="server"
                    ID="CoursesGrid"
                    AutoGenerateColumns="False"
                    CssClass="table table-hover table-bordered flexible-table"
                    OnRowDataBound="OnRowDataBound"
                    OnRowEditing="OnRowEditing">
                    <EmptyDataTemplate>
                        <div class="col-md-12">
                            <h3 class="text-center">
                                <asp:Literal runat="server" ID="InvalidRecordsLabel" Text="There are no courses added." meta:resourcekey="InvalidRecordsLabelResource"></asp:Literal></h3>
                            <br />
                        </div>
                        <div class="col-md-12">
                            <form class="form-inline">
                                <div class="col-md-2">
                                    <h4>
                                        <asp:Literal runat="server" ID="EmptyListHeader" Text="Add new course:" meta:resourcekey="EmptyListHeaderResource"></asp:Literal></h4>
                                </div>
                                <div class="form-group courseNamegroup col-md-4">
                                    <div class="col-md-2 label-adding text-right">
                                        <label for="txtCourseName">
                                            <asp:Literal runat="server" ID="NameLabel" Text="Name:" meta:resourcekey="NameLabelResource1"></asp:Literal></label>
                                    </div>
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="txtCourseName" CssClass="form-control" onclick="return validateCourseName()" oninput="return validateCourseName()"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="form-group maxNumberGroup col-md-5">
                                    <div class="col-md-4 label-adding text-right">
                                        <label for="txtMaxAssigned">
                                            <asp:Literal runat="server" ID="MaxStudentsLabel" Text="Max students:" meta:resourcekey="MaxStudentsLabelResource"></asp:Literal></label>
                                    </div>
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" ID="txtMaxAssigned" CssClass="form-control" onclick="return validateNewNumber()" oninput="return validateNewNumber()"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-1">
                                    <asp:LinkButton runat="server" ID="AddNewCourseToEmptyButton" Text="Add" OnClick="AddCourseToEmpty" CssClass="btn btn-default disabled saveBtn" meta:resourcekey="AddButtonResource"></asp:LinkButton>
                                </div>
                            </form>
                        </div>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:TemplateField HeaderText="Course Name" meta:resourcekey="CourseNameColumn">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="CourseName" Text='<%# Eval("CourseName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="form-group courseNamegroup">
                                    <asp:TextBox ID="txtCourseName" CssClass="form-control" Width="300px" MaxLength="25" runat="server" Text='<%# Eval("CourseName") %>' onclick="return validateCourseName()" oninput="return validateCourseName(event)"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <div class="form-group courseNamegroup">
                                    <asp:TextBox ID="txtCourseName" Width="300px" CssClass="form-control" MaxLength="25" runat="server" onclick="return validateCourseName()" oninput="return validateCourseName()"></asp:TextBox>
                                </div>
                            </FooterTemplate>
                            <ItemStyle Width="45%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Currently Assigned" meta:resourcekey="CurrAssignedColumn">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="CurrAssigned" Text='<%# Eval("CurrentlyAssigned") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCurerentAmount" runat="server" CssClass="form-control" Text='<%# Eval("CurrentlyAssigned") %>' ReadOnly="True"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtCurerentAmount" runat="server" CssClass="form-control" Text="0" ReadOnly="True"></asp:TextBox>
                            </FooterTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Maximum Amount of Students" meta:resourcekey="MaxAssignedColumn">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="MaxAssigned" Text='<%# Eval("MaxAssigned") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="form-group maxNumberGroup">
                                    <asp:TextBox ID="txtMaxAssigned" CssClass="form-control" Width="100px" MaxLength="3" runat="server" Text='<%# Eval("MaxAssigned") %>' onclick="return validateExistingNumber()" oninput="return validateExistingNumber()"></asp:TextBox>
                                </div>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <div class="form-group maxNumberGroup">
                                    <asp:TextBox ID="txtMaxAssigned" CssClass="form-control" Width="100px" MaxLength="3" runat="server" onclick="return validateNewNumber()" oninput="return validateNewNumber()"></asp:TextBox>
                                </div>
                            </FooterTemplate>
                            <ItemStyle Width="20%" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" meta:resourcekey="DeleteColumnResource">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="DeleteCheckBox" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton Text="Update" runat="server" CssClass="btn btn-default saveBtn" OnClick="UpdateCourse" meta:resourcekey="UpdateButtonRecource" />
                                <asp:LinkButton Text="Cancel" runat="server" CssClass="btn btn-default" OnClick="CancelEditing" meta:resourcekey="CancelButtonResource" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Button runat="server" CssClass="btn btn-default disabled saveBtn" ID="SaveNewCourseButton" Text="Save" OnClick="SaveNewCourse" meta:resourcekey="SaveButtonResource"></asp:Button>
                                <asp:Button runat="server" CssClass="btn btn-default" ID="CancelButton" Text="Cancel" OnClick="CancelAdding" meta:resourcekey="CancelButtonResource"></asp:Button>
                            </FooterTemplate>
                            <ItemStyle Width="10px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Course Name" Visible="False" meta:resourcekey="CourseNameColumn">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="CourseId" Text='<%# Eval("Id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:LinkButton ID="hiddenLink" runat="server"></asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
