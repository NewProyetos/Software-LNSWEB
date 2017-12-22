using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Configuration;


namespace PW_PROTAL_WEB
{
    public partial class dteProductos : System.Web.UI.Page
    {
       public static DataTable tbl_producto = new DataTable();
       string cod_cliente = Productos.codigo_clie;
       // string Descrip_lente;
        string codigo_lente;
        string descri_lente;
        string precio_lente;

        string codigo_aro;
        string descri_aro;
        string precio_aro;

        string codigo_servicio;
        string descri_servicio;
        string precio_servicio;

        int cantidad_;
        string precio;
        string cantidad_otro = "1";
        



        protected void Page_Load(object sender, EventArgs e)
        {
          
                if (!IsPostBack)
                {
                    tbl_producto.Clear();
                    tbl_producto.Rows.Clear();
                   
                    if (tbl_producto.Rows.Count == 0)
                    {
                        tbl_producto.Clear();
                        tbl_producto.Rows.Clear();
                        tbl_producto.Columns.Add("CODIGO", typeof(string));
                        tbl_producto.Columns.Add("CANT", typeof(string));
                        tbl_producto.Columns.Add("DESCRIPCION", typeof(string));
                        tbl_producto.Columns.Add("PRECIO_UNITARIO", typeof(string));
                    }

                    // Validate initially to force asterisks
                    // to appear before the first roundtrip.
                    llenar_cmbLentes();
                    llenar_cmbServicios();
                    llenar_cmbAros();

                    cargar_informacion_cookies();
                }
                
            

        }

   
        ///  Llenamos e combo de familias de los lentes...
        private void llenar_cmbLentes()
        {
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.familia_lentes art_lentes = new LESA_services.familia_lentes();

            DblistLentes.DataSource = ls.Familia_lentes(art_lentes);
            DblistLentes.DataTextField = "Articulo_";
            DblistLentes.DataValueField = "Articulo_";
            DblistLentes.DataBind();
            DblistLentes.Items.Insert(0, new ListItem("--Seleccione alguno--", "0"));
        }
        /// llenamos el combo de grupos de lentes....
        private void llenar_cmbGrupos()
        {
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.grupos_lentes group_lents = new LESA_services.grupos_lentes();

            group_lents.Familia_ = DblistLentes.Text;
            var grouped = ls.Grupo_lentes(group_lents).GroupBy(u => u.Grupos_);

            DblistGrupos_lentes.DataSource = grouped.Select(n => n.Key);
            DblistGrupos_lentes.DataBind();
            DblistGrupos_lentes.Items.Insert(0, new ListItem("--Seleccione alguno--", "0"));
        }
        /// llenamos el combo de diseños de lentes...
        private void llenar_cmbDisenos()
        {
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.diseños_lentes dise_lents = new LESA_services.diseños_lentes();

            dise_lents.Familia_ = DblistLentes.Text;
            dise_lents.Grupos_ = DblistGrupos_lentes.Text;

            var grouped = ls.Diseño_entes(dise_lents).GroupBy(u => u.Diseño_);

            DBlistDisenos_lentes.DataSource = grouped.Select(n => n.Key);
            DBlistDisenos_lentes.DataBind();
            DBlistDisenos_lentes.Items.Insert(0, new ListItem("--Seleccione alguno--", "0"));
        }
        /// llenamos el combo de materiales de lentes...
        private void llenar_cmbMateriales()
        {
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.materiales_lentes material_lents = new LESA_services.materiales_lentes();

            material_lents.Familia_ = DblistLentes.Text;
            material_lents.Grupos_ = DblistGrupos_lentes.Text;
            material_lents.Diseño_ = DBlistDisenos_lentes.Text;

            var grouped = ls.Material_lente(material_lents).GroupBy(u => u.Material_);

            DblistMaterial_lentes.DataSource = grouped.Select(n => n.Key);
            DblistMaterial_lentes.DataBind();
            DblistMaterial_lentes.Items.Insert(0, new ListItem("--Seleccione alguno--", "0"));
        }
        /// llenamos el combo de los colores de lentes..
        private void llenar_cmbColor()
        {
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.color_lentes color_lents = new LESA_services.color_lentes();

            color_lents.Familia_ = DblistLentes.Text;
            color_lents.Grupos_ = DblistGrupos_lentes.Text;
            color_lents.Deseños_ = DBlistDisenos_lentes.Text;
            color_lents.Materiales_ = DblistMaterial_lentes.Text;
            
            var grouped = ls.color_lente(color_lents).GroupBy(u => u.Color_);

            DblistColor_lentes.DataSource = grouped.Select(n => n.Key);
            DblistColor_lentes.DataBind();
            DblistColor_lentes.Items.Insert(0, new ListItem("--Seleccione alguno--", "0"));
        }


        /// familia lentes...
        protected void DblistLentes_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            llenar_cmbGrupos();
            
            //confirmar_seleccion_cmbLentes();
            //this.agregar_prod1.Enabled = true;
        }
        /// grupo lentes...
        protected void DblistGrupos_lentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenar_cmbDisenos();
        }
        /// diseños lentes..
        protected void DBlistDisenos_lentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenar_cmbMateriales();
        }
        /// material lentes...
        protected void DblistMaterial_lentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            llenar_cmbColor();
        }
        /// color lentes...
        protected void DblistColor_lentes_SelectedIndexChanged(object sender, EventArgs e)
        {
            confirmar_seleccion_cmbLentes();
            this.agregar_prod1.Enabled = true;
        }

        /// confirmamos el lente seleccionado...
        private void confirmar_seleccion_cmbLentes()
        {
            seleccion_cantidad();
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.confir_lentes confirmar_lentes = new LESA_services.confir_lentes();

            confirmar_lentes.Familia_ = DblistLentes.Text;
            confirmar_lentes.Grupos_ = DblistGrupos_lentes.Text;
            confirmar_lentes.Diseño_ = DBlistDisenos_lentes.Text;
            confirmar_lentes.Material_ = DblistMaterial_lentes.Text;
            confirmar_lentes.Color_ = DblistColor_lentes.Text;

             var codigo = ls.confirmar_lentes(confirmar_lentes);

            string[] cod_lente = codigo.Select(n => n.Codigo_lente).ToArray();

            foreach (string articulo_cod in cod_lente)
            {
                codigo_lente = articulo_cod;
            }

            string[] descrip = codigo.Select(n => n.Descripcion_lente).ToArray();

            foreach (string descripcion_art in descrip)
            {
                descri_lente = descripcion_art;
            }

            ///string codigo_Arti = Codigo_lente;

            //string nombre_lente = Descrip_lente;
            /*
            string script = "alert(\" " + nombre_lente + "\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
            */

            lblLente.Text = codigo_lente;
            lbldescripcion.Text = descri_lente;
            precio_cantidad_producto(codigo_lente);
            Double total = (Convert.ToDouble(cantidad_) * Convert.ToDouble(precio));
            lblprecio_pordcant.Text = Convert.ToString(total);
            Label8.Text = precio;
            
        }


        ///  Llenar segundo combo de productos servicios...
        private void llenar_cmbServicios()
        {
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.listado_servicios art_servicio = new LESA_services.listado_servicios();

            DblistServicios.DataSource = ls.Listado_servicios(art_servicio);
            DblistServicios.DataTextField = "Servicios_";
            DblistServicios.DataValueField = "Servicios_";
            DblistServicios.DataBind();
            DblistServicios.Items.Insert(0, new ListItem("--Seleccione alguno--", "0"));

            
        }

        protected void DblistServicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            confirmar_seleccion_cmbServicios();
            ///this.agregar_prod2.Enabled = true;
        }

        private void confirmar_seleccion_cmbServicios()
        {
            cantidad_ = 1;

            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.confir_servicio confirmar_servicio = new LESA_services.confir_servicio();

            confirmar_servicio.Descripcion_servicio = DblistServicios.Text;

            var codigo = ls.confirmar_servicios(confirmar_servicio);

            string[] codigo_art = codigo.Select(n => n.Codigo_servicio).ToArray();

            foreach (string articulo_cod in codigo_art)
            {
                codigo_servicio = articulo_cod;
            }

            precio_cantidad_producto(codigo_servicio);

            lblServicos.Text = codigo_servicio;
            lblprecio_servicio.Text = precio;
           

        }


        ///  Llenar tercer combo de productos Aros...
        private void llenar_cmbAros()
        {
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.listado_Aros art_aro = new LESA_services.listado_Aros();

            DblistAros.DataSource = ls.Listado_aros(art_aro);
            DblistAros.DataTextField = "Aros_";
            DblistAros.DataValueField = "Aros_";
            DblistAros.DataBind();
            DblistAros.Items.Insert(0, new ListItem("--Seleccione alguno--", "0"));

        }

        protected void DblistAros_SelectedIndexChanged(object sender, EventArgs e)
        {
            confirmar_seleccion_cmbAros();
           /// this.agregar_prod3.Enabled = true;
        }

        private void confirmar_seleccion_cmbAros()
        {
            cantidad_ = 1;

            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.confir_aros confirmar_aro = new LESA_services.confir_aros();

            confirmar_aro.Descripcion_aro = DblistAros.Text;

            var codigo = ls.confirmar_aro(confirmar_aro);

            string[] codigo_art = codigo.Select(n => n.Codigo_aro).ToArray();

            foreach (string articulo_cod in codigo_art)
            {
                codigo_aro = articulo_cod;
            }

            precio_cantidad_producto(codigo_aro);

            lblAros.Text = codigo_aro;
            lblprecio_aro.Text = precio;
            
        }
       



        /// verificacion de la cantidad
        private void seleccion_cantidad()
        {

            if (rbtOD.Checked == true || rbtOI.Checked == true )
            {
                cantidad_ = 1;
            }
            else if (rbtAO.Checked == true)
            {
                cantidad_ = 2;
            }
            else
            {
                cantidad_ = 0;
                Response.Write("<script>alert('Por favor, seleccione si que ojo va aprocesar(OD, OI, AMBOS)...')</script>");
            }

        }

        ///  obtenemos el precio del producto 
        private void precio_prod(string codigo_lente, string clv_list)
        {
            ///obtenemos el precio exacto del producto
            LESA_services.LservicesClient ls = new LESA_services.LservicesClient();
            LESA_services.precio_producto pre = new LESA_services.precio_producto();

            pre.Cod_articulo_ = codigo_lente;
            pre.Cod_listado_precios_ = clv_list;

            var codigo = ls.Precio_productos(pre);

            string[] codigo_art = codigo.Select(n => n.Precio_).ToArray();

            foreach (string articulo_cod in codigo_art)
            {
                precio = articulo_cod;
            }

          
        }

        /// multiplicando la cantidad con el precio...
        private void precio_cantidad_producto(string codigo_lente)
        {
           
            if (cantidad_ == 0)
            {
                //no se puede mostrar el precio ...
                Response.Write("<script>alert('Por favor, seleccione si que ojo va aprocesar(OD, OI, AMBOS)...')</script>");
            }
            else
            {

                string clv_list = "1";
                precio_prod(codigo_lente, clv_list);
               
            }
        }




        /// seleccion de la cantidad para mostrar el precio segun la cantidad...
        protected void rbtOD_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        protected void rbtOI_CheckedChanged(object sender, EventArgs e)
        {
        }

        protected void rbtAO_CheckedChanged(object sender, EventArgs e)
        {
           
        }



        /// botones de interacion entra las paginas...
        protected void btnAnteriro_Click(object sender, EventArgs e)
        {
            guardar_cookies();
            Response.Redirect("dteLente.aspx");
        }

        protected void btnSiguiente_Click(object sender, EventArgs e)
        {
            if (tbl_producto.Rows.Count == 0)
            {
                Response.Write("<script>alert('Por favor, seleccione alguno de  nuestros productos, Lente/ Servicios/ Aro, para continuar...')</script>");
            }
            else
            {
                Response.Redirect("dteAro.aspx");
            }
            guardar_cookies();
           
        }

        private void guardar_cookies()
        {/*
           
            HttpCookie producto = new HttpCookie("producto_");
            HttpCookie cantidad_s = new HttpCookie("cantidad_");
          

           Session["tbl_prod"] = tbl_producto;
            
            producto["prod_lente"] = DblistLentes.Text;
            producto["codLente"]  = lblLente.Text;

            string aros_des =  DblistAros.Text;
            string aros_cod = lblAros.Text;

            string serv_des = DblistServicios.Text;
            string serv_cod = lblServicos.Text;

            producto["ARO"] = aros_des;
            producto["COD_ARO"] = aros_cod ;

            producto["SERVICIOS"] = serv_des;
            producto["COD_SERVICIOS"] = serv_cod;
            cantidad_ = Convert.ToInt32(cantidad_s["cantidad_"]);

            if (cantidad_ == 1)
            {
              //  rbtUno_cant.Checked = true;
            }
            else if (cantidad_ == 2)
            {
              //  rbtDos_cant.Checked = true;
            }

           
            
            ///tbl_producto.Rows.Add();

            Response.Cookies.Add(producto);*/
        }

        private void cargar_informacion_cookies()
        {
          /*/  HttpCookie cantidades = Request.Cookies["cantidad_"];
            HttpCookie producto_ = Request.Cookies["producto_"];

            if (producto_ != null)
            {
                DblistLentes.Text = producto_["LENTE"];
                lblLente.Text = producto_["COD_LENTE"];

                DblistAros.Text = producto_["ARO"];
                lblAros.Text = producto_["COD_ARO"];

                DblistServicios.Text = producto_["SERVICIOS"];
                lblServicos.Text = producto_["COD_SERVICIOS"];
            }

            if (cantidades != null)
            {
                cantidad_ =Convert.ToInt32(cantidades["cantidad_"]);
            }
            */
        }

        protected void agregar_prod1_Click(object sender, EventArgs e)
        {
            ///primero se tiene que guardar en un datatable
            ///despues se tiene que mostrar la datatable en un tabla html

            tbl_producto.Rows.Clear();
            ////se adicionara el lente....
            descri_lente = lbldescripcion.Text;
            codigo_lente = lblLente.Text;
            precio_lente = Label8.Text;

            descri_aro = DblistAros.Text;
            codigo_aro = lblAros.Text;
            precio_aro = lblprecio_aro.Text;

            descri_servicio = DblistServicios.Text;
            codigo_servicio = lblServicos.Text;
            precio_servicio = lblprecio_servicio.Text;

           
            if (codigo_lente != "" || codigo_lente != string.Empty || codigo_lente == null)
            {
                seleccion_cantidad();
                if (cantidad_ == 0)
                {
                    Response.Write("<script>alert('Por favor, seleccione si que ojo va aprocesar(OD, OI, AMBOS)...')</script>");
                }
                else
                {
                    tbl_producto.Rows.Add(codigo_lente, cantidad_, descri_lente, precio_lente);
                }
            }
                if (codigo_servicio != string.Empty || codigo_servicio != "")
                {
                    tbl_producto.Rows.Add(codigo_servicio, cantidad_otro, descri_servicio, precio_servicio);
                }
                if (codigo_aro != string.Empty || codigo_aro != "")
                {
                    tbl_producto.Rows.Add(codigo_aro, cantidad_otro, descri_aro, precio_aro);
                }
            

           
            llenar_tabla_html();
        }

        protected void agregar_prod2_Click(object sender, EventArgs e)
        {/*
            tbl_producto.Clear();
            ////se adicionara el servicios....
            descri_lente = DblistLentes.Text;
            codigo_lente = lblLente.Text;
            precio_lente = precio;
            descri_aro = DblistAros.Text;
            codigo_aro = lblAros.Text;
            descri_servicio = DblistServicios.Text;
            codigo_servicio = lblServicos.Text;

            if (codigo_lente != string.Empty || codigo_lente != "")
            {
                seleccion_cantidad();
                tbl_producto.Rows.Add(codigo_lente, cantidad_, descri_lente, precio_lente);
            }
            if (codigo_servicio != string.Empty || codigo_servicio != "")
            {
                tbl_producto.Rows.Add(codigo_servicio, cantidad_otro, descri_servicio, precio_servicio);
            }
            if (codigo_aro != string.Empty || codigo_aro != "")
            {
                tbl_producto.Rows.Add(codigo_aro, cantidad_otro, descri_aro, precio_aro);
            }
         ///   this.agregar_prod2.Enabled = false;

            llenar_tabla_html();
            lblMensaje.Text = "Para continuar, dar clic al boton siguiente...";
          * */
        }

        protected void agregar_prod3_Click(object sender, EventArgs e)
        {

            tbl_producto.Clear();
            ////se adicionara el aros....
            descri_lente = DblistLentes.Text;
            codigo_lente = lblLente.Text;
            descri_aro = DblistAros.Text;
            codigo_aro = lblAros.Text;
            descri_servicio = DblistServicios.Text;
            codigo_servicio = lblServicos.Text;

            if (codigo_lente != string.Empty || codigo_lente != "")
            {
                tbl_producto.Rows.Add(codigo_lente, cantidad_, descri_lente);
            }
            if (codigo_servicio != string.Empty || codigo_servicio != "")
            {
                tbl_producto.Rows.Add(codigo_servicio, cantidad_otro, descri_servicio);
            }
            if (codigo_aro != string.Empty || codigo_aro != "")
            {
                tbl_producto.Rows.Add(codigo_aro, cantidad_otro, descri_aro);
            }
           /// this.agregar_prod3.Enabled = false;

            llenar_tabla_html();
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

        
    } 
}