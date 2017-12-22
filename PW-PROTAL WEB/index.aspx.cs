using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_PROTAL_WEB
{
    public partial class index : System.Web.UI.Page
    {
        string usuario;
        string contra;
        string codClie_;
        string validacion;
        public static string cod_clie_;
        public static string agrupacion_;
        public static string Esquemas_;
            int resultado;
            string regresos_;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

         public bool IsNumeric(object Expression)
        {
            bool isNum;
            double retNum;
            isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
            return isNum;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            

            LESA_services.LservicesClient lc = new LESA_services.LservicesClient();
            LESA_services.login_PW data_apli = new LESA_services.login_PW();

            data_apli.Usuario_ = txtUsername.Text;
            data_apli.Contras_ = txtPassword.Text;

                var art = lc.LOGIN_PW(data_apli);

                string[] codigo = art.Select(n => n.Codigo_).ToArray();

                foreach (string cod_cliente_ in codigo)
                {
                    cod_clie_ = cod_cliente_;
                }

                string[] agrup = art.Select(n => n.Agrupacion_).ToArray();

                foreach (string agrupacion in agrup)
                {
                    agrupacion_ = agrupacion;
                }

                string[] esquem = art.Select(n => n.Esquemas_).ToArray();

                foreach (string Esquema in esquem)
                {
                    Esquemas_ = Esquema;
                }

                string[] reg = art.Select(n => n.Regreso_).ToArray();

                foreach (string regg in reg)
                {
                    regresos_ = regg;
                }

               /* if (IsNumeric(regresos_))
                {*/
                    if (regresos_ != "1")
                    {
                        string script = "alert(\"" + regresos_ + "\");";
                        ScriptManager.RegisterStartupScript(this, GetType(),
                                              "ServerControlScript", script, true);
                    }
                    else
                    {
                       
                        Session["username"] = txtUsername.Text;
                        usuario = txtUsername.Text;
                        string script = "alert(\"Sea Bienvenido!\");";
                        ScriptManager.RegisterStartupScript(this, GetType(),
                                              "ServerControlScript", script, true);

                        FormsAuthentication.RedirectFromLoginPage(data_apli.Usuario_, false);
                        Response.Redirect("bienvenido.aspx");
                    }
               /* }
                else if (validacion == null || validacion == "")
                {
                    string script = "alert(\"verifique sus credenciales!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                }
                else
                {
                    string texto = Convert.ToString(validacion);
                    string script = "alert(\"" + texto + "!\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);

                }*/
            }
        public String CurrentCity
        {
            get
            {
                return txtUsername.Text;
            }
        }
           
    }
}