using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace YazılımProje.Controllers
{
    public class AController : Controller
    {
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Session["Adm"] == null)
            {
                filterContext.Result = new RedirectResult("/Home/Login/");
                return;
            }
            base.OnActionExecuting(filterContext);
        }

    }
}
