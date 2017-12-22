using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_PROTAL_WEB
{
    public partial class Mast_pages1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ///Response.Redirect("Menu.aspx");
        }

        protected void btnSecion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/index.aspx");  
        }
    }
}