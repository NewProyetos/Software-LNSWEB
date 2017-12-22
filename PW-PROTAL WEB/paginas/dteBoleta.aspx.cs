using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;

namespace PW_PROTAL_WEB.paginas
{
    
    public partial class dtBoletas : System.Web.UI.Page
    {
        string orden;
        string empresa = index.Esquemas_;
        /// dteFormula...
        string paciente_ = dteLente.paciente;
        string cod_cliente = Productos.codigo_clie;
        string cliente = Productos.cliente;
        string odesfera_ = dteLente.odesfera;
        string odcilindro_ = dteLente.odcilindro ;
        string odeje_ = dteLente.odeje;
        string odadicion_ = dteLente.odadicion;
        string odprisma_ = dteLente.odprisma;
        string oiesfera_ = dteLente.oiesfera;
        string oicilindro_ = dteLente.oicilindro;
        string oieje_ = dteLente.oieje;
        string oiadicion_ = dteLente.oiadicion;
        string oiprisma_ = dteLente.oiprisma;

        /// dtProductos...
        DataTable tbl_producto = dteProductos.tbl_producto;

        /// dteproducto
        string Dnp = dteAro.Dnp_;
        string frame_fit = dteAro.Fame_fit_;
        string Ao = dteAro.Ao_;
        string Ap = dteAro.Ap_;
        string Dist_vertice = dteAro.Dist_vertice_;
        string Pantoscopico = dteAro.Panatoscopico_;
        string Panoramico = dteAro.Panoramico_;
        string Corredor = dteAro.Corredor_;

        string Modelo_aro = dteAro.Modelo_aro_;
        string Material_aro = dteAro.Material_aro_;
        string Color_aro = dteAro.Color_aro_;
        string Tipo_aro = dteAro.Tipo_aro_;
        string Horizontal = dteAro.Horizontal_;
        string Vertical = dteAro.Vertical_;
        string Puente = dteAro.Puente_;
        string Diagonal = dteAro.Diagonal_;

        string Observaciones = dteAro.Observaciones_;


        protected void Page_Load(object sender, EventArgs e)
        {
          
                if (!IsPostBack)
                {
                    lblOptica_env.Text = cliente;
                    lblCodigo_env.Text = cod_cliente;
                    cargar_info();
                    llenar_tabla_html();
                }
              
            
        }

        private void cargar_info()
        {
            ///dteFormula...
            lblPaciente_env.Text = paciente_;           ///1

            lblODEsfera_env.Text = odesfera_;
            lblODCilindro_env.Text = odcilindro_;
            lblODEje_env.Text = odeje_;
            lblODAdicion_env.Text = odadicion_;
            lblODPrisma_env.Text = odprisma_;           ///5

            lblOIEsfera_env.Text = oiesfera_;
            lblOICilindro_env.Text = oicilindro_;
            lblOIEje_env.Text = oieje_;
            lblOIAdicion_env.Text = oiadicion_;
            lblOIPrisma_env.Text = oiprisma_;           ///5

            ///dteAro...
            lblDnp_env.Text = Dnp;
            lblAO_env.Text = frame_fit;
            lblAP_env.Text = Ap;
            lblVertice_env.Text = Dist_vertice;
            lblPanoramico_env.Text = Panoramico;
            lblPantoscopico_env.Text = Pantoscopico;
            lblCorredor_env.Text = Corredor;            ///7

            lblModeloAro_env.Text = Modelo_aro;
            lblMaterialAro_env.Text = Material_aro;
            lblColorAro_env.Text = Color_aro;
            lblTipoAro_env.Text = Tipo_aro;
            lblHorizontal_env.Text = Horizontal;
            lblVertical_env.Text = Vertical;
            lblPuente_env.Text = Puente;
            lblDiagonal_env.Text = Diagonal;           ///8
            lblObservacion_env.Text = Observaciones;

        }

        private void llenar_tabla_html()
        {
            //Building an HTML string.
            StringBuilder html = new StringBuilder();

            //Table start.
            html.Append("<table id = 'productos_tbl'>");

            //Building the Header row.
            html.Append("<tr>");
            foreach (DataColumn column in tbl_producto.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");

            //Building the Data rows.
            foreach (DataRow row in tbl_producto.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in tbl_producto.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }

            //Table end.
            html.Append("</table>");

            //Append the HTML string to Placeholder.
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
                LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
                LESA_services.insert_encabezado insert = new LESA_services.insert_encabezado();
                LESA_services.insert_complementos comple = new LESA_services.insert_complementos();
                LESA_services.insert_articulos_ art = new LESA_services.insert_articulos_();

                insert.Empresa = empresa;
                insert.Cliente = cod_cliente;           //lblOptica_env.Text;
                insert.Paciente = paciente_;            //lblPaciente_env.Text;

                #region comentado
                /**** insert.Odesf = odesfera_;               //lblODEsfera_env.Text;
                         insert.Odcil = odcilindro_;             //lblODCilindro_env.Text;
                         insert.Odeje = odeje_;                  //lblODEje_env.Text;
                         insert.Odadd = odadicion_;              //lblODAdicion_env.Text;
                         insert.Odpris = odprisma_;              //lblODPrisma_env.Text; ///         

                         insert.Oiesf = oiesfera_;               //lblOIEsfera_env.Text;
                         insert.Oicil = oicilindro_;             //lblOICilindro_env.Text;
                         insert.Oieje = oieje_;                  //lblOIEje_env.Text;
                         insert.Oiadd = oiadicion_;              //lblOIAdicion_env.Text;
                         insert.Oipris = oiprisma_;              //lblOIPrisma_env.Text;             
            
                         ///detalles del aro...
                         insert.Dnp = Dnp;                       //lblDnp_env.Text;
                         insert.Ap = Ap;                         //lblAP_env.Text;
            
                         insert.Framefit = frame_fit;            //lblFit_env.Text;
                         insert.Ao = Ao;                         //lblAO_env.Text;
                         insert.Vertice = Dist_vertice;          //lblVertice_env.Text;
                         insert.Pano = Panoramico;               //lblPanoramico_env.Text;
                         insert.Pantosco = Pantoscopico;         //lblPantoscopico_env.Text;
                         insert.Corredor = Corredor;             //lblCorredor_env.Text;
            
                         insert.Marca_aro = Modelo_aro;          //lblModeloAro_env.Text; /// verificaar este campos porque hay dudas...
                         insert.Material_aro = Material_aro;     //lblMaterialAro_env.Text;
                         insert.Tipoaro = Tipo_aro;
                         insert.Color_aro = Color_aro;           //lblColorAro_env.Text;
                         insert.Montaje = Tipo_aro;              //lblTipoAro_env.Text;
                         insert.Horizontal = Horizontal;         //lblHorizontal_env.Text;
                         insert.Vertical = Vertical;             //lblVertical_env.Text;
                         insert.Puente = Puente;                 //lblPuente_env.Text;
                         insert.Diagonal = Diagonal;             //lblDiagonal_env.Text;
            
                         insert.Observaciones = Observaciones;   //lblObservacion_env.Text;

                                     int num_part = 0;
                                      for (int p = 0; p < tbl_producto.Rows.Count; p++)
                                      {
           
                                          num_part = num_part + 1;
                                     
                                          DataRow rp = tbl_producto.Rows[p];
                                          string codigo_clave = Convert.ToString(rp["CODIGO"]);
                                          string cantidad_clave = Convert.ToString(rp["CANT"]);
                                          string precio_clave = Convert.ToString(rp["PRECIO_UNITARIO"]);

                                    
                                          insert.Orden = orden;
                                          insert.Codigo = codigo_clave;
                                          insert.Cantidad = codigo_clave;
                                          insert.Num_par = num_part;
                                      }
                 */
                #endregion comentado


                orden = ls.ingresando_encabezado(insert);

                if (orden == "1")
                {
                    Response.Write("<script>alert('encontramos una orden que ya existe con esas caracteristicas, por favor verificar...')</script>");
                }
                else
                {
                    string ords = orden.Substring(0, 2);
                    #region ...
                    if (ords == "0")
                    {
                        ///no ingreso...
                        Response.Write("<script>alert('No ingreso la orden, por favor volver a inentarlo...')</script>");

                    }
                    else if (ords == "1")
                    {
                        Response.Write("<script>alert('ya existe una orden con ese nombre de paciente puedes revisarlo en la pagina de busqueda para confirmar...')</script>");
                    }

                    else if (ords == "OR")
                    {


                        comple.Empresa = empresa;
                        comple.Orden = orden;

                        ////formula...
                        comple.Odesf = odesfera_;               //lblODEsfera_env.Text;
                        comple.Odcil = odcilindro_;             //lblODCilindro_env.Text;
                        comple.Odeje = odeje_;                  //lblODEje_env.Text;
                        comple.Odadd = odadicion_;              //lblODAdicion_env.Text;
                        comple.Odpris = odprisma_;              //lblODPrisma_env.Text; ///         

                        comple.Oiesf = oiesfera_;               //lblOIEsfera_env.Text;
                        comple.Oicil = oicilindro_;             //lblOICilindro_env.Text;
                        comple.Oieje = oieje_;                  //lblOIEje_env.Text;
                        comple.Oiadd = oiadicion_;              //lblOIAdicion_env.Text;
                        comple.Oipris = oiprisma_;              //lblOIPrisma_env.Text;             

                        ///detalles del aro...
                        comple.Dnp = Dnp;                       //lblDnp_env.Text;
                        comple.Ap = Ap;                         //lblAP_env.Text;

                        comple.Framefit = frame_fit;            //lblFit_env.Text;
                        comple.Ao = Ao;                         //lblAO_env.Text;
                        comple.Vertice = Dist_vertice;          //lblVertice_env.Text;
                        comple.Pano = Panoramico;               //lblPanoramico_env.Text;
                        comple.Pantosco = Pantoscopico;         //lblPantoscopico_env.Text;
                        comple.Corredor = Corredor;             //lblCorredor_env.Text;

                        comple.Marca_aro = Modelo_aro;          //lblModeloAro_env.Text; /// verificaar este campos porque hay dudas...
                        comple.Material_aro = Material_aro;     //lblMaterialAro_env.Text;
                        comple.Tipoaro = Tipo_aro;
                        comple.Color_aro = Color_aro;           //lblColorAro_env.Text;
                        comple.Montaje = Tipo_aro;              //lblTipoAro_env.Text;
                        comple.Horizontal = Horizontal;         //lblHorizontal_env.Text;
                        comple.Vertical = Vertical;             //lblVertical_env.Text;
                        comple.Puente = Puente;                 //lblPuente_env.Text;
                        comple.Diagonal = Diagonal;             //lblDiagonal_env.Text;

                        comple.Observaciones = Observaciones;   //lblObservacion_env.Text;

                        if (ls.insertando_complemento(comple) == 0)
                        {
                            ///ingreso
                            ///productos..
                            if (tbl_producto.Rows.Count == 0)
                            {
                                Response.Redirect("~/bienvenido.aspx");
                            }
                            else
                            {
                                int num_part = 0;
                                int ingreso = 0;
                                for (int p = 0; p < tbl_producto.Rows.Count; p++)
                                {

                                    num_part = num_part + 1;

                                    DataRow rp = tbl_producto.Rows[p];
                                    string codigo_clave = Convert.ToString(rp["CODIGO"]);
                                    string cantidad_clave = Convert.ToString(rp["CANT"]);
                                    string precio_clave = Convert.ToString(rp["PRECIO_UNITARIO"]);

                                    art.Empresa = empresa;
                                    art.Orden = orden;
                                    art.Codigo = codigo_clave;
                                    art.Cantidad = cantidad_clave;
                                    art.Precio = precio_clave;
                                    art.Num_par = num_part;

                                    ingreso = ls.insertando_articulos(art);
                                }

                                if (ingreso == 1)
                                {
                                    Response.Write("<script>alert('Se dio un imprevisto a la hora de guardar su orden,por favor le pedimos que llame servicio al cliente para veririfacar su orden...')</script>");
                                    
                                }
                                else
                                {
                                   Response.Write("<script>alert('Gracias, por preferirnos, su nueva orden es: " + orden + "')</script>");
                                    Response.Redirect("~/bienvenido.aspx");
                                }

                            }


                        }
                        else
                        {
                            Response.Write("<script>alert('Perdio la conexion, por favor le pedimos volver a realizar su pedido...')</script>");
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('No se completo el pedido por favor llamar a atencion al cliente, para verificar...')</script>");
                    }
                    #endregion ...
                }
        }
        
    }
}