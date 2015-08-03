using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using StudentTracker.Domain.Concrete;
using StudentTracker.Domain.Entities;
using StudentTracker.StudentTrackerService;

namespace StudentTracker
{
    public partial class UiConfiguration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User == null || !System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Account/Register");
            }
            if (!IsPostBack)
            {
                string bgColour = "#ffffff";
                string hdColour = "#101010";
                if (System.Web.HttpContext.Current.User != null)
                {
                    var currentUserId = User.Identity.GetUserId();
                    using (var client = new StudentTrackerService.StudentsManagerClient())
                    {
                        var settings = client.GetUiColours(currentUserId);
                        bgColour = settings.BackgroundColour;
                        hdColour = settings.HeaderColour;
                    }
                }
                bgColorTxt.Text = bgColour;
                hdColorTxt.Text = hdColour;
            }
        }

        protected void ApplyColours(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User != null)
            {
                var currentUserId = User.Identity.GetUserId();
                string bgColour = bgColorTxt.Text;
                string hdColour = hdColorTxt.Text;
                using (var client = new StudentTrackerService.StudentsManagerClient())
                {
                    client.SetUiColours(currentUserId, bgColour, hdColour);
                }
                Response.Redirect("~/UiConfiguration.aspx");
            }
        }
    }
}