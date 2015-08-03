using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.Office.Interop.Excel;
using StudentTracker.BLL;
using StudentTracker.Domain.Entities;
using OfficeOpenXml;
using Resources;
using StudentTracker.StudentTrackerService;

namespace StudentTracker
{
    public partial class ImportData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            StatusLabel.Visible = false;
            InvalidGridPannel.Visible = false;
        }

        protected void LoadFile(object sender, EventArgs e)
        {
            RawStudentInfo[] rawStudents = new RawStudentInfo[] { };
            RawStudentInfo[] validStudents = new RawStudentInfo[] { };
            StudentTrackerService.InvalidRecord[] invalidRecords = new StudentTrackerService.InvalidRecord[] { };
            string path = String.Empty;
            if (FileUploadControl.HasFile && (Path.GetExtension(FileUploadControl.FileName) == ".xlsx" || Path.GetExtension(FileUploadControl.FileName) == ".xls"))
            {
                try
                {
                    ExcelFileParser parser = new ExcelFileParser(FileUploadControl.PostedFile.InputStream);
                    List<RawStudentInfo> rawStudentsInforamtion = new List<RawStudentInfo>();
                    foreach (var record in parser.StudentsRowInformation)
                    {
                        rawStudentsInforamtion.Add(new RawStudentInfo { FirstName = record.FirstName, LastName = record.LastName, Age = record.Age, Sex = record.Sex });
                    }
                    rawStudents = rawStudentsInforamtion.ToArray();
                    using (var client = new StudentsManagerClient())
                    {
                        ExcelDocumentImportResult result = client.GetRecords(rawStudents, System.Threading.Thread.CurrentThread.CurrentCulture.Name);
                        validStudents = result.ValidRecords;
                        invalidRecords = result.InvalidRecords;
                    }
                    StatusLabel.Text = LocalizedText.UploadStatusSuccess;
                }
                catch (Exception)
                {
                    StatusLabel.Text = LocalizedText.UploadedStatusFailed;
                }
                finally
                {
                    UploadedStudents.DataSource = validStudents;
                    UploadedStudents.DataBind();
                    if (invalidRecords.Any())
                    {
                        InvalidRecords.DataSource = invalidRecords;
                        InvalidRecords.DataBind();
                        InvalidGridPannel.Visible = true;
                    }
                    else
                    {
                        InvalidRecords.DataSource = null;
                        InvalidRecords.DataBind();
                        InvalidGridPannel.Visible = false;
                    }
                    GridPannel.Visible = true;
                    if (validStudents.Any())
                    {
                        using (StudentTrackerService.StudentsManagerClient client = new StudentTrackerService.StudentsManagerClient())
                        {
                            client.SaveStudents(validStudents);
                        }
                    }
                }
            }
            else
            {
                StatusLabel.Text = LocalizedText.UploadStatusWrongFormat;
            }
            StatusLabel.Visible = true;
        }
    }
}
