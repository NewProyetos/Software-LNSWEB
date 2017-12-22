using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_PROTAL_WEB
{
    public partial class dteLente : System.Web.UI.Page
    {
        int cantidad;

        string cliente =Productos.cliente;
        string cod_cliente = Productos.codigo_clie;

        public static string odesfera;
        public static string odcilindro;
        public static string odeje;
        public static string odadicion;
        public static string odprisma;

        public static string oiesfera;
        public static string oicilindro;
        public static string oieje;
        public static string oiadicion;
        public static string oiprisma;

        public static string paciente;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (cod_cliente == null || cod_cliente == string.Empty || cod_cliente == "")
                {
                    Response.Redirect("~/index.aspx");
                }

                else
                {
                    if (!IsPostBack)
                    {
                        cargar_informacion_cookies();
                    }
                }
            }
                   
            
            }

        protected void TextBox11_TextChanged(object sender, EventArgs e)
        {

        }

        protected void chkod_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            paciente = TextBox11.Text;

            odesfera = TextBox1.Text;
            odcilindro = TextBox2.Text;
            odeje = TextBox3.Text;
            odadicion = TextBox4.Text;
            odprisma = TextBox5.Text;

            oiesfera = TextBox6.Text;
            oicilindro =TextBox7.Text;
            oieje = TextBox8.Text;
            oiadicion = TextBox9.Text;
            oiprisma = TextBox10.Text;

#region cookies...
          /*  HttpCookie paciente = new HttpCookie("paciente_");*/
            //HttpCookie formula = new HttpCookie("formula_");

            //paciente["ODES"] = TextBox1.Text;
            //paciente["ODCI"] = TextBox2.Text;
            //paciente["ODEJ"] = TextBox3.Text;
            //paciente["ODAD"] = TextBox4.Text;
            //paciente["ODPR"] = TextBox5.Text;

            //paciente["OIES"] = TextBox6.Text;
            //paciente["OICI"] = TextBox7.Text;
            //paciente["OIEJ"] = TextBox8.Text;
            //paciente["OIAD"] = TextBox9.Text;
            //paciente["OIPR"] = TextBox10.Text;
            //paciente["Paciente"] = TextBox11.Text;



            ///paciente["cantidad_"] = Convert.ToString(cantidad);

            ///Response.Cookies.Add(formula);
            /*Response.Cookies.Add(paciente);*/
#endregion cookies...
            string trim = paciente.Trim();

            if (trim.Length == 0)
            {
                ///mensaje que no termino de completar el nombre del cliente...
                Response.Write("<script>alert('Por favor, escriba el paciente o el número de orden segun su optica')</script>");
            }
            else
            {
                Response.Redirect("dteProductos.aspx");
            }
        }

        private void cargar_informacion_cookies()
        {
            TextBox11.Text = paciente;

             TextBox1.Text = odesfera;
             TextBox2.Text = odcilindro;
             TextBox3.Text = odeje;
             TextBox4.Text = odadicion;
             TextBox5.Text = odprisma;

             TextBox6.Text = oiesfera;
             TextBox7.Text = oicilindro;
             TextBox8.Text = oieje;
             TextBox9.Text = oiadicion;
             TextBox10.Text = oiprisma;
#region cookies...
            /*HttpCookie datos_lente = Request.Cookies["paciente_"];
           // HttpCookie formula_ = new HttpCookie("formula_");


            if (datos_lente != null)
            {
                TextBox11.Text = datos_lente["Paciente"];

                TextBox1.Text = datos_lente["ODES"];
                TextBox2.Text = datos_lente["ODCI"];
                TextBox3.Text = datos_lente["ODEJ"];
                TextBox4.Text = datos_lente["ODAD"];
                TextBox5.Text = datos_lente["ODPR"];

                TextBox6.Text = datos_lente["OIES"];
                TextBox7.Text = datos_lente["OICI"];
                TextBox8.Text = datos_lente["OIEJ"];
                TextBox9.Text = datos_lente["OIAD"];
                TextBox10.Text = datos_lente["OIPR"];
            //    cantidad = Convert.ToInt32(datos_lente["cantidad_"]);
            */
#endregion cookies...
            
    
        }
    }
}