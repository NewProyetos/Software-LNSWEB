using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_PROTAL_WEB
{
    public partial class Productos : System.Web.UI.Page
    {
        public static string cliente;
        public static string codigo_clie = index.cod_clie_;
        public static string esquema = index.Esquemas_;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                if (codigo_clie == null || codigo_clie == string.Empty || codigo_clie == "")
                {
                    Response.Redirect("~/index.aspx");
                }
                else
                {
                    datos_cliente();
                }
          
            
        }

        private void datos_cliente()
        {
            LESA_services.LservicesClient lc = new LESA_services.LservicesClient();
            LESA_services.datos_cliente dtclie = new LESA_services.datos_cliente();

            dtclie.Codigo_cliente = codigo_clie;
            dtclie.Esquema = esquema;
            
            var art = lc.Datos_cliente(dtclie);

            string[] articulo = art.Select(n => n.Nombre_cliente).ToArray();

            foreach (string articulo_tra in articulo)
            {
                cliente = articulo_tra;
            }

            Label1.Text = cliente;

        }

       
    }
}