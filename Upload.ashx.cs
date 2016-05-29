using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CountryCity
{
    /// <summary>
    /// Summary description for Upload
    /// </summary>
    public class Upload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpPostedFile uploads = context.Request.Files["upload"];
            string ckEditorFuncNum = context.Request["CKEditorFuncNum"];
            string file = System.IO.Path.GetFileName(uploads.FileName);
            uploads.SaveAs(context.Server.MapPath(".") + "\\Images\\" + file);
            string url = "../Images/" + file;
            context.Response.Write("<script>window.parent.CKEDITOR.tools.callFunction(" + ckEditorFuncNum + ", \"" + url + "\");</script>");
            context.Response.End();  
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}