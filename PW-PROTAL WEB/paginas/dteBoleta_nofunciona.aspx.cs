using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_PROTAL_WEB
{
    public partial class dtBoleta : System.Web.UI.Page
    {
        Table tbl = new Table();
       

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie paciente_ = Request.Cookies["paciente_"];
            HttpCookie detalle = Request.Cookies["detalle_"];
            HttpCookie producto_ = Request.Cookies["producto_"];
            

            if (paciente_ != null)
            {
                lblPaciente_env.Text =  paciente_["Paciente"];

                lblODEsfera_env.Text = paciente_["ODES"];
                lblODCilindro_env.Text = paciente_["ODCI"];
                lblODEje_env.Text = paciente_["ODEJ"];
                lblODAdicion_env.Text = paciente_["ODAD"];
                lblODPrisma_env.Text = paciente_["ODPR"];

                lblOIEsfera_env.Text = paciente_["OIES"];
                lblOICilindro_env.Text = paciente_["OICI"];
                lblOIEje_env.Text = paciente_["OIEJ"];
                lblOIAdicion_env.Text = paciente_["OIAD"];
                lblOIPrisma_env.Text = paciente_["OIPR"];
                
            }

            if (producto_ != null)
            {
                lblcodigo_prod1.Text = producto_["codLente"];
                lbldesc_prod1.Text = producto_["prod_lente"];

                lblcodigo_prod2.Text = producto_["COD_ARO"];
                lbldesc_prod2.Text = producto_["ARO"];

                lblcodigo_prod3.Text = producto_["COD_SERVICIOS"];
                lbldesc_prod3.Text = producto_["SERVICIOS"];
                    
            }

            if (detalle != null)
            {
               // Label2.Text = detalle["DNP"];
                lblDnp_env.Text = detalle["DNP"];
                lblFit_env.Text = detalle["FRAME"];
                lblAO_env.Text = detalle["AO"];
                lblAP_env.Text = detalle["AP"];
                lblVertice_env.Text = detalle["VERTICE"];
                lblPantoscopico_env.Text = detalle["PANTOSCOPICO"];
                lblPanoramico_env.Text = detalle["PANORAMICO"];
                lblModeloAro_env.Text = detalle["MODELO"];
                lblMaterialAro_env.Text = detalle["MATERIAL"];
                lblColorAro_env.Text = detalle["COLOR"];
                lblTipoAro_env.Text = detalle["TIPO"];
                lblHorizontal_env.Text = detalle["HORIZONTAL"];
                lblVertical_env.Text = detalle["VERTICAL"];
                lblPuente_env.Text = detalle["PUENTE"];
                lblDiagonal_env.Text = detalle["DIAGONAL"];
                
            }


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        { 
        }

        private void guardar()
        {
 
        }
    }
}