using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using StudentTracker.BLL;
using StudentTracker.Domain.Concrete;

namespace StudentTracker
{
    public partial class Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static object AjaxHandler()
        {          
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            using (var client = new StudentTrackerService.StudentsManagerClient())
            {
                var output = serializer.Serialize(client.GetStudents());
                return output;
            }           
        }
    }
}