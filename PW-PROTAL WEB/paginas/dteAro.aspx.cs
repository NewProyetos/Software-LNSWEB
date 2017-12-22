using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_PROTAL_WEB
{
    public partial class dteAro : System.Web.UI.Page
    {
        string cod_cliente = Productos.codigo_clie;
        public static string Dnp_;
        public static string Fame_fit_;
        public static string Ao_;
        public static string Ap_;
        public static string Dist_vertice_;
        public static string Panatoscopico_;
        public static string Panoramico_;
        public static string Corredor_;

        public static string Modelo_aro_;
        public static string Material_aro_;
        public static string Color_aro_;
        public static string Tipo_aro_;
        public static string Horizontal_;
        public static string Vertical_;
        public static string Puente_;
        public static string Diagonal_;

        public static string Observaciones_ ;

        protected void Page_Load(object sender, EventArgs e)
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

        protected void btnAnterior_Click(object sender, EventArgs e)
        {
            guardar_cookies();
            Response.Redirect("dteProductos.aspx");
            
        }

        protected void btnSigueinte_Click(object sender, EventArgs e)
        {
            // HttpCookie medidas_aro = new HttpCookie("medidas_aro_");
            guardar_cookies();
            Response.Redirect("dteBoLeta.aspx");
            
        }

        private void guardar_cookies()
        {
            Dnp_ = txtdnp.Text;
            Fame_fit_ = txtframe_fit.Text;
            Ao_ = txtao.Text;
            Ap_ = txtap.Text;
            Dist_vertice_ = txtdistancia_vertice.Text;
            Panoramico_= txtpanoramico.Text;
            Panatoscopico_ = txtpantoscopico.Text;
            Corredor_ = txtCorredor.Text;

            Modelo_aro_ = txtmodelo_aro.Text;
            Material_aro_ = txtmaterial_aro.Text;
            Color_aro_ = txtcolor_aro.Text;
            Tipo_aro_ = DblistTipoAro.Text;

            Horizontal_ = txthorizontal.Text;
            Vertical_ = txtvertical.Text;
            Puente_ = txtpuente.Text;
            Diagonal_ = txtdiagonal.Text;

            Observaciones_ = txtObservaciones.Text;

#region cookies..
            /*
            HttpCookie detalle = new HttpCookie("detalle_");

            detalle["DNP"] = txtdnp.Text;
            detalle["FRAME"] = txtframe_fit.Text;
            detalle["AO"] = txtao.Text;
            detalle["AP"] = txtap.Text;
            detalle["VERTICE"] = txtdistancia_vertice.Text;
            detalle["PANTOSCOPICO"] = txtpantoscopico.Text;
            detalle["PANORAMICO"] = txtpanoramico.Text;

            detalle["MODELO"] = txtmodelo_aro.Text;
            detalle["MATERIAL"] = txtmaterial_aro.Text;
            detalle["COLOR"] = txtcolor_aro.Text;
           // detalle["TIPO"] = txttipo_aro.Text;
            detalle["HORIZONTAL"] = txthorizontal.Text;
            detalle["VERTICAL"] = txtvertical.Text;
            detalle["PUENTE"] = txtpuente.Text;
            detalle["DIAGONAL"] = txtdiagonal.Text;

            // Response.Cookies.Add(medidas_aro);
            Response.Cookies.Add(detalle);
            */
#endregion cookies...

        }
        
        private void cargar_informacion_cookies()
        {
             txtdnp.Text = Dnp_;
             txtframe_fit.Text = Fame_fit_;
             txtao.Text = Ao_;
             txtap.Text = Ap_;
             txtdistancia_vertice.Text = Dist_vertice_;
             txtpanoramico.Text = Panoramico_;
             txtpantoscopico.Text = Panatoscopico_;
             txtCorredor.Text = Corredor_;

             txtmodelo_aro.Text = Modelo_aro_;
             txtmaterial_aro.Text = Material_aro_;
             txtcolor_aro.Text = Color_aro_;
             DblistTipoAro.Text = Tipo_aro_;
             txthorizontal.Text = Horizontal_;
             txtvertical.Text = Vertical_;
             txtpuente.Text = Puente_;
             txtdiagonal.Text = Diagonal_;

             txtObservaciones.Text =Observaciones_;
             
#region cookies...
            /*
           // HttpCookie medidas_aro = new HttpCookie("medidas_aro_");
            HttpCookie detalle_ = Request.Cookies["detalle_"];

            if (detalle_ != null)
            {
                txtdnp.Text = detalle_["DNP"];
                txtframe_fit.Text = detalle_["FRAME"];
                txtao.Text = detalle_["AO"];
                txtap.Text = detalle_["AP"];
                txtdistancia_vertice.Text = detalle_["VERTICE"];
                txtpantoscopico.Text = detalle_["PANTOSCOPICO"];
                txtpanoramico.Text = detalle_["PANORAMICO"];

                txtmodelo_aro.Text = detalle_["MODELO"];
                txtmaterial_aro.Text = detalle_["MATERIAL"];
                txtcolor_aro.Text = detalle_["COLOR"];
               // txttipo_aro.Text = detalle_["TIPO"];
                txthorizontal.Text = detalle_["HORIZONTAL"];
                txtvertical.Text = detalle_["VERTICAL"];
                txtpuente.Text = detalle_["PUENTE"];
                txtdiagonal.Text = detalle_["DIAGONAL"];
             * */
#endregion cookies...
            
        }
    }
}