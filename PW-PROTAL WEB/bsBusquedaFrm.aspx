<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bsBusquedaFrm.aspx.cs" Inherits="PW_PROTAL_WEB.bsBusquedaFrm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
      <script src="../Jquery/jquery-1.12.4.js"></script>
    <script src="../Jquery/jquery.dataTables.min.js"></script>
    <link href="../Jquery/jquery.dataTables.min.css" rel="stylesheet" />

    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" rel="stylesheet" />

    <title>Busqueda - Ordenes</title>

   <script>
       $(function () {
           $("#GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });
    </script>
    <link href="clases/body_mp1.css" rel="stylesheet" />
    <link href="../clases/subMenu.css" rel="stylesheet" />
   
    
    <!--MV: Estilo-->
    <link rel="stylesheet" href="~/css/StyleSheetMenu.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="~/css/StyleSheetMenuBotones.css" media="screen" type="text/css" />
    <link rel="icon" href="~/img/favicon.png" type="image/png" sizes="128x128" />
</head>
<body>
   <form id="form1" runat="server">
        <!--Aqui comienza el menú--> 
        <div id="menu">
            <!--MV: Inserción de contenido para visualización desktop y mobile del menú-->
            <nav>
                <asp:Image ID="imgLogo" runat="server" ImageUrl="~/img/IsoLogo-Lesa.png" Width="160px" />
                <input type="checkbox" id="nav" class="hidden" />
                <label for="nav" class="nav-open"><i></i><i></i><i></i></label>
                <div class="nav-container">
                    <asp:Image ID="imgLogoWhite" runat="server" ImageUrl="~/img/IsoLogoLesa-blanco.png" Width="160px" />
                    <ul>
                        <li><asp:Button ID="Button1" runat="server" Text="Inicio" PostBackUrl="~/bienvenido.aspx" /></li>
                        <li><asp:Button ID="Button2" runat="server" Text="Nuevo Pedido" PostBackUrl="~/paginas/dteLente.aspx" /></li>
                        <li><asp:Button ID="Button3" runat="server" Text="Busqueda" PostBackUrl="~/bsBusquedaFrm.aspx" /></li>
                        <li><asp:Button ID="Button4" runat="server" Text="Cerrar Sesion" PostBackUrl="~/index.aspx" /></li>
                        <br />
                        <li class="contact"><a href="tel:22017788">Teléfono: (+503) 2201-7788</a></li>
                        <li class="contact"><a href="mailto:sac@lesa.bz">Correo: sac@lesa.bz</a></li>
                    </ul>
                </div>
            </nav>
        </div>
        
        
    <div>
     <br />
        <br />
       <div id="Lentes_">
            <h2 class="sub_boleta">ORDENES</h2>
            <h5 id="indicacion"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></h5>
        </div>
 <div class="table-container">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns ="False">
       
        <Columns>
            <asp:BoundField DataField="Cod_orden" HeaderText="ORDEN" />
            <asp:BoundField DataField="Pacienete" HeaderText="PACIENTE/ORDEN OPTICA" />
            <asp:BoundField DataField="Caja" HeaderText="CAJA" />
            <asp:BoundField DataField="Fecha_ingreso" HeaderText="FECHA INGRESO" />
            <asp:BoundField DataField="Estado" HeaderText="PROCESO" />
            <asp:BoundField DataField="Tiempo" HeaderText="TIEMPO DE ESPERA" />
        </Columns>
        </asp:GridView>
    </div>
    </div>


    </form>
    <footer id="footer">
        <br />
        Distribución a Centroamérica y el Caribe / Llámanos: <a href="tel:22017788">(+503) 2201-7788</a> o escríbenos: <a href="mailto:sac@lesa.bz">sac@lesa.bz</a>
        <br />
        <br />
        <asp:Image ID="Image2" runat="server" ImageUrl="~/img/WEB-LESAABAJO.png" Width="100%" />
    </footer>
 
</body>
</html>
