using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.SqlServer.Server;
using StudentTracker.BLL;
using StudentTracker.Domain.Concrete;
using StudentTracker.Domain.Entities;
using StudentTracker.StudentTrackerService;

namespace StudentTracker
{
    public partial class EditStudent : System.Web.UI.Page
    {
        public int Id
        {
            get
            {
                return string.IsNullOrEmpty(Request.QueryString["Id"])
                    ? -1
                    : int.Parse(Request.QueryString["Id"]);
            }
        }

        private StudentInfo currentStudent = new StudentInfo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Id == -1)
                {
                    Server.Transfer("~/Students.aspx");
                }
                using (var client = new StudentsManagerClient())
                {
                    this.StudentName.Text = client.GetStudentFullName(Id);
                }
                LoadCourses();
            }
        }

        private void LoadCourses()
        {
            using (StudentsManagerClient client = new StudentsManagerClient())
            {
                CoursesGrid.DataSource = client.GetStudentsCourses(Id);
                CoursesGrid.DataBind();
            }          
        }

        public StudentInfo SelectStudent()
        {
            using(var client = new StudentsManagerClient())
            {
                this.currentStudent = client.GetStudent(this.Id);
                return currentStudent;
            }
        }

        public void UpdateStudent(int id)
        {
            TryUpdateModel(currentStudent);
            using (var client = new StudentsManagerClient())
            {
                client.UpdateStudent(currentStudent.Id, currentStudent.FirstName, currentStudent.LastName, currentStudent.Age.ToString(), currentStudent.Sex);
            }
        }

        protected void StudentForm_OnItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            string firstName = ((TextBox) this.StudentForm.FindControl("txtFirstName")).Text;
            string lastName = ((TextBox)this.StudentForm.FindControl("txtLastName")).Text;
            string sex = ((DropDownList) this.StudentForm.FindControl("ddlSex")).SelectedValue;
            string age = ((TextBox) this.StudentForm.FindControl("txtAge")).Text;

            using (var client = new StudentsManagerClient())
            {
                client.UpdateStudent(Id, firstName, lastName, age, sex);
            }
        }

        protected void OnDataBound(object sender, EventArgs e)
        {
            string sex = string.Empty;
            using (var client = new StudentsManagerClient())
            {
                sex = client.GetStudentsSex(Id);
            }
            DropDownList ddlSex = (DropDownList)this.StudentForm.FindControl("ddlSex");
            ddlSex.Items.Add(new ListItem("Female", "Female"));
            ddlSex.Items.Add(new ListItem("Male", "Male"));
            ddlSex.SelectedValue = sex;
            ddlSex.DataBind();
        }

        public void Update()
        {
            Server.Transfer("~/Students.aspx");
        }

        protected void CancelButtonClick(object sender, EventArgs e)
        {
           this.StudentForm.DataBind();
        }

        protected void ApplyForCourses(object sender, EventArgs e)
        {
            foreach (GridViewRow row in CoursesGrid.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox applyBox = row.FindControl("ApplyCheckBox") as CheckBox;
                    if (applyBox != null)
                    {
                        Label labelRow = row.FindControl("CourseId") as Label;
                        string courseId = labelRow == null ? string.Empty : labelRow.Text;
                        using (var client = new StudentsManagerClient())
                        {
                            if (applyBox.Checked)
                            {
                                client.ApplyForCourse(Id, int.Parse(courseId));
                            }
                            else
                            {
                                client.LeaveCourse(Id, int.Parse(courseId));
                            }
                        }
                    }
                }
            }
            LoadCourses();
        }

        protected void CancelFromApplication(object sender, EventArgs e)
        {
            LoadCourses();
        }
    }
}