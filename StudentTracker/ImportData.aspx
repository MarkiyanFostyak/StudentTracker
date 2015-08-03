<%@ Page Title="Import Data" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ImportData.aspx.cs" Inherits="StudentTracker.ImportData" meta:resourcekey="PageResource1" %>

<asp:Content ID="UploadBox" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="Grids">
        <Triggers>
            <asp:PostBackTrigger ControlID="UploadButton" />
        </Triggers>
        <ContentTemplate>
            <h2>
                <asp:Literal runat="server" ID="ImportStudentsDataHeader" Text="Import Data" meta:resourcekey="ImportStudentsDataHeaderResource"></asp:Literal></h2>
            <hr />
            <div class="input-group upload-cont col-md-12">
                <div class="col-md-12 upload-conrtol">
                    <h4>
                        <asp:Literal runat="server" ID="ImportDataHeader" Text="Upload file:" meta:resourcekey="ImportDataHeaderResource"></asp:Literal></h4>
                </div>
                <div class="col-md-12 upload-conrtol">
                    <asp:FileUpload ID="FileUploadControl" runat="server" CssClass="file" />
                </div>
                <div class="col-md-12 upload-conrtol">
                    <asp:Button runat="server" ID="UploadButton" Text="Upload" OnClick="LoadFile" CssClass="btn btn-default" meta:resourcekey="UploadButtonResource" />
                </div>
                <div class="col-md-12 upload-conrtol">
                    <asp:Label runat="server" ID="StatusLabel" Text="Upload status: " Font-Size="14pt" meta:resourcekey="StatusLabelResource" />
                </div>
            </div>
            <asp:Panel runat="server" Visible="False" ID="GridPannel">
                <asp:Panel runat="server" ID="ValidGridPannel">
                    <hr />
                    <h2>
                        <asp:Literal runat="server" ID="ImportedValidRecordsLabel" Text="Imported valid records:" meta:resourcekey="ImportedValidRecordsLabelResource"></asp:Literal></h2>
                    <asp:GridView runat="server"
                        ID="UploadedStudents"
                        GroupItemCount="1"
                        EmptyDataText="There are no valid data records to display."
                        AutoGenerateColumns="False"
                        CssClass="table table-hover table-bordered" meta:resourcekey="UploadedStudentsResource">
                        <Columns>
                            <asp:TemplateField HeaderText="First Name" meta:resourcekey="FirstNameColumn">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="FirstNaem" Text='<%# Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name" meta:resourcekey="LastNameColumn">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LastName" Text='<%# Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sex" meta:resourcekey="SexColumn">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Sex" Text='<%# Eval("Sex") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Age" meta:resourcekey="AgeColumn">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Age" Text='<%# Eval("Age") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
                <asp:Panel runat="server" ID="InvalidGridPannel" Visible="False">
                    <hr />
                    <h2>
                        <asp:Literal runat="server" ID="InvalidRecordsLabel" Text="Invalid records:" meta:resourcekey="InvalidRecordsLabelResource"></asp:Literal></h2>
                    <asp:GridView runat="server"
                        ID="InvalidRecords"
                        GroupItemCount="1"
                        EmptyDataText="There are no data records to display."
                        AutoGenerateColumns="False"
                        CssClass="table table-hover table-bordered" meta:resourcekey="InvalidRecordsResource">
                        <Columns>
                            <asp:TemplateField HeaderText="First Name" meta:resourcekey="FirstNameColumn">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="FirstName" Text='<%# Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name" meta:resourcekey="LastNameColumn">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="LastName" Text='<%# Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sex" meta:resourcekey="SexColumn">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Sex" Text='<%# Eval("Sex") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Age" meta:resourcekey="AgeColumn">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Age" Text='<%# Eval("Age") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Comment" meta:resourcekey="CommnetColumn">
                                <ItemStyle Width="25%"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="Comment" Text='<%# Eval("Comment") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

