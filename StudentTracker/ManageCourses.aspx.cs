using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Resources;
using StudentTracker.BLL;
using StudentTracker.Domain.Concrete;
using StudentTracker.Domain.Entities;
using StudentTracker.StudentTrackerService;
namespace StudentTracker
{
    public partial class ManageCourses : Page
    {
        public bool IsSaveNewCourse
        {
            get { return (bool)ViewState["SaveNew"]; }
            set { ViewState["SaveNew"] = value; } 
        }

        public int EditingRowNumber
        {
            get { return (int)ViewState["EditingRowNumber"]; }
            set { ViewState["EditingRowNumber"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CoursesGrid.ShowFooter = false;
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            using (CoursesManagerClient client = new CoursesManagerClient())
            {
                CoursesGrid.DataSource = client.GetCourses();
                IsSaveNewCourse = !client.GetCourses().Any();
                CoursesGrid.DataBind();
            }
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["ondblclick"] = Page.ClientScript.GetPostBackClientHyperlink(CoursesGrid,
                    "Edit$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";
            }
        }

        protected void AddCourse(object sender, EventArgs e)
        {
            ErrorMessage.Visible = false;            
            CoursesGrid.ShowFooter = true;
            DeleteButton.Enabled = false;                     
            ErrorMessage.Visible = false;
            IsSaveNewCourse = true;
            CoursesGrid.EditIndex = -1;  
            CoursesGrid.Columns[3].HeaderText = LocalizedText.ActionColumnHeader;           
            LoadCourses();
        }

        protected void CancelAdding(object sender, EventArgs e)
        {
            CancelAdding();
        }

        protected void SaveNewCourse(object sender, EventArgs e)
        {
            AddNewCourse();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            ErrorMessage.Visible = false;            
            DeleteButton.Enabled = false;                        
            CoursesGrid.ShowFooter = false;
            ErrorMessage.Visible = false;
            IsSaveNewCourse = false;
            CoursesGrid.Columns[3].HeaderText = LocalizedText.ActionColumnHeader;
            EditingRowNumber = e.NewEditIndex;
            CoursesGrid.EditIndex = e.NewEditIndex;
            LoadCourses();
        }

        protected void UpdateCourse(object sender, EventArgs e)
        {
            Update();
        }

        protected void CancelEditing(object sender, EventArgs e)
        {
            CancelEditing();
        }

        protected void DeleteCourses(object sender, EventArgs e)
        {
            ErrorMessage.Visible = false;
            foreach (GridViewRow row in CoursesGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox checkRow = row.Cells[0].FindControl("DeleteCheckBox") as CheckBox;
                    if (checkRow != null && checkRow.Checked)
                    {
                        Label labelRow = row.Cells[1].FindControl("CourseId") as Label;
                        string courseId = labelRow == null ? string.Empty : labelRow.Text;
                        using (CoursesManagerClient client = new CoursesManagerClient())
                        {
                            client.DeleteCourse(courseId);
                        }
                    }
                }
            }
            LoadCourses();
        }

        protected void AddCourseToEmpty(object sender, EventArgs e)
        {
            ErrorMessage.Visible = false;
            string courseName = ((TextBox) CoursesGrid.Controls[0].Controls[0].FindControl("txtCourseName")).Text.Trim();
            string maxNumber = ((TextBox) CoursesGrid.Controls[0].Controls[0].FindControl("txtMaxAssigned")).Text.Trim();
            using (var client = new CoursesManagerClient())
            {
                client.AddCourse(new Course { CourseName = courseName, MaxNumberOfStudents = int.Parse(maxNumber) });
            }
            LoadCourses();
        }

        protected void GeneralCancel(object sender, EventArgs e)
        {
            CancelAdding();
            CancelEditing();
        }

        protected void GeneralSaving(object sender, EventArgs e)
        {
            if (IsSaveNewCourse)
            {
                AddNewCourse();
            }
            else
            {
                Update();
            }
        }

        private void CancelAdding()
        {
            CoursesGrid.Columns[3].HeaderText = LocalizedText.DeleteColumnHeader;
            CoursesGrid.ShowFooter = false;
            DeleteButton.Enabled = true;
            LoadCourses();
        }

        private void CancelEditing()
        {
            CoursesGrid.Columns[3].HeaderText = LocalizedText.DeleteColumnHeader;
            CoursesGrid.EditIndex = -1;
            LoadCourses();
            DeleteButton.Enabled = true;
        }

        private void Update()
        {
            string id =
                ((Label) CoursesGrid.Rows[EditingRowNumber].FindControl("CourseId")).Text.Trim();
            string courseName =
                ((TextBox) CoursesGrid.Rows[EditingRowNumber].FindControl("txtCourseName")).Text.Trim
                    ();
            string maxCapacity =
                ((TextBox) CoursesGrid.Rows[EditingRowNumber].FindControl("txtMaxAssigned")).Text
                    .Trim();
            using (var client = new CoursesManagerClient())
            {
                if (!client.UpdateCourse(id, courseName, maxCapacity))
                {
                    string.Format("{1} [{0}] {2}.",
                        courseName, LocalizedText.DublicateCourseNamePartOne, LocalizedText.DublicateCourseNamePartTwo);
                    ErrorMessage.Visible = true;
                }
            }
            CoursesGrid.Columns[3].HeaderText = LocalizedText.DeleteColumnHeader;
            CoursesGrid.EditIndex = -1;
            DeleteButton.Enabled = true;
            LoadCourses();
        }

        private void AddNewCourse()
        {
            ErrorMessage.Visible = false;
            string courseName = ((TextBox) CoursesGrid.FooterRow.FindControl("txtCourseName")).Text.Trim();
            string maxNumber = ((TextBox) CoursesGrid.FooterRow.FindControl("txtMaxAssigned")).Text.Trim();
            using (var client = new CoursesManagerClient())
            {
                if (!client.AddCourse(new Course { CourseName = courseName, MaxNumberOfStudents = int.Parse(maxNumber) }))
                {
                    ErrorMessage.Text = string.Format("Course can not be added. Course with the name [{0}] already exists.",
                        courseName);
                    ErrorMessage.Visible = true;
                }
            }
            DeleteButton.Enabled = true;
            CoursesGrid.ShowFooter = false;
            CoursesGrid.Columns[3].HeaderText = LocalizedText.DeleteColumnHeader;
            LoadCourses();
        }
    }
}