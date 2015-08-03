using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using StudentTracker.Domain.Concrete;

namespace StudentTracker
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Database.SetInitializer(new StudentDbInitializer());
            RouteTable.Routes.MapPageRoute("StudentEdit", "EditStudent/{id}", "~/EditStudent");
        }

        public void Application_BeginRequest(Object sender, EventArgs e)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["CultureInfo"];
            if (cookie != null && cookie.Value != null)
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(cookie.Value);
                Thread.CurrentThread.CurrentCulture = new CultureInfo(cookie.Value);
            }
            else
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo("en");
                Thread.CurrentThread.CurrentCulture = new CultureInfo("en");
            }
        }
    }
}