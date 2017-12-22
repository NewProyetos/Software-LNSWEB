using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PW_PROTAL_WEB
{
    public partial class bsBusquedaFrm : System.Web.UI.Page
    {
        string codigo_cliente = Productos.codigo_clie;
        string cliente = Productos.cliente;
        string esquema = Productos.esquema;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (codigo_cliente == null || codigo_cliente == string.Empty || codigo_cliente == "")
            {
                 Response.Redirect("~/index.aspx");
               
            }
            else
            {
                Label1.Text = cliente;
                cargar_tabla();
            }
        }

        private void cargar_tabla()
        {
            if (!IsPostBack)
            {
                LESA_services.LservicesClient cliente = new LESA_services.LservicesClient();
                LESA_services.listado_pedido data_lista = new LESA_services.listado_pedido();
                data_lista.Cod_cliente = codigo_cliente;
                data_lista.Esquema = esquema;

                int count = cliente.MostrarPedidos(data_lista).Sum(l => l.Cod_orden.Count());

                if (count > 0)
                {
                    ///  tb = cliente.MostrarPedidos(data_lista);
                    GridView1.DataSource = cliente.MostrarPedidos(data_lista);
                    GridView1.DataBind();

                    GridView1.UseAccessibleHeader = true;
                    GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

                }
                else
                {
                    Response.Redirect("~/bienvenido.aspx");

                }
            }
        }

        protected void btnSecion_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/index.aspx");  

        }
    }
}