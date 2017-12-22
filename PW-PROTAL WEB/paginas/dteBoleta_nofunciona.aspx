<%@ Page Title="" Language="C#" MasterPageFile="~/paginas/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="dteBoleta_nofunciona.aspx.cs" Inherits="PW_PROTAL_WEB.dtBoleta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>BOLETA</h2>
    <h4>Por favor verifique la informacion que se le pesenta, de lo contrario le pedimos que regrese a la paginas anterior y modifique la informacion</h4>
    <div id="enc_pagina">
        Datos Generales
        <table id="datos">
            <tr>
                <td>
                    <asp:Label ID="lblOptica" runat="server" Text="Optica: "></asp:Label>
                    <asp:Label ID="lblOptica_env" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="lblCodigo_env" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPaciente_" runat="server" Text="Paciente: "></asp:Label>
                    <asp:Label ID="lblPaciente_env" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
           
        </table>
    </div>

    <div id="detalles_cuerpo">
        Datos de Formula
        <table id="formula_rx">
            <tr>
                
                <td></td>
                <th>ESFERA</th>
                <th>CILINDRO</th>
                <th>EJE</th>
                <th>ADICION</th>
                <th>PRISMA</th>
            </tr>
            <tr>
                
                <th>OD</th>
                <td>
                    <asp:Label ID="lblODEsfera_env" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblODCilindro_env" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblODEje_env" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblODAdicion_env" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblODPrisma_env" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
               
                <th>OI</th>
                <td>
                    <asp:Label ID="lblOIEsfera_env" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOICilindro_env" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOIEje_env" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOIAdicion_env" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblOIPrisma_env" runat="server" Text="Label"></asp:Label></td>
            </tr>
            
        </table>

        Datos de Producto
        <table id="List_producto">
            <tr>
                <th>n°</th>
                <th>Codigo</th>
                <th>Cantidad</th>
                <th>Producto</th>
            </tr>
             <tr>
                <td></td>
                <td>
                    <asp:Label ID="lblcodigo_prod1" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblcant_prod1" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lbldesc_prod1" runat="server" Text="Label"></asp:Label></td>
            </tr>
             <tr>
                <td></td>
                <td>
                    <asp:Label ID="lblcodigo_prod2" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblcant_prod2" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lbldesc_prod2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="lblcodigo_prod3" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lblcant_prod3" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:Label ID="lbldesc_prod3" runat="server" Text="Label"></asp:Label></td>
            </tr>

        </table>
        
        Datos Extras del Lente
        <table id ="aros_detalles">
            <tr>
                <th>DNP</th>
                <td>
                    <asp:Label ID="lblDnp_env" runat="server" Text="Label"></asp:Label> </td>
                <th>Distancia vertice</th>
                <td>
                    <asp:Label ID="lblVertice_env" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <th>Frame Fit</th>
                <td>
                    <asp:Label ID="lblFit_env" runat="server" Text="Label"></asp:Label>
                    </td>
                <th>Angulo Pantoscopico</th>
                <td>
                    <asp:Label ID="lblPantoscopico_env" runat="server" Text="Label"></asp:Label>
                    </td>
            </tr>
            <tr>
                <th>AO</th>
                <td>
                    <asp:Label ID="lblAO_env" runat="server" Text="Label"></asp:Label></td>
                <th>Angulo Panoramico</th>
                <td>
                    <asp:Label ID="lblPanoramico_env" runat="server" Text="Label"></asp:Label></td>
                    
            </tr>
            <tr> 
                <th>AP</th>
                <td>
                    <asp:Label ID="lblAP_env" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
        </table>
  
        <table id="Aros_sobre">
            <tr>
                <th>Modelo Aro</th>
                <td>
                    <asp:Label ID="lblModeloAro_env" runat="server" Text="Label"></asp:Label>
                    </td>
                <th>Horizontal</th>
                <td>
                    <asp:Label ID="lblHorizontal_env" runat="server" Text="Label"></asp:Label>
                    </td>
            </tr>
            <tr>
                <th>Material de Aro</th>
                <td>
                    <asp:Label ID="lblMaterialAro_env" runat="server" Text="Label"></asp:Label>
                    </td>
                <th>Vertical</th>
                <td>
                    <asp:Label ID="lblVertical_env" runat="server" Text="Label"></asp:Label>
                    </td>
            </tr>
            <tr>
                <th>Color de aro</th>
                <td>
                    <asp:Label ID="lblColorAro_env" runat="server" Text="Label"></asp:Label></td>
                <th>Puente</th>
                <td>
                    <asp:Label ID="lblPuente_env" runat="server" Text="Label"></asp:Label>
                    </td>
            </tr>
            <tr>
                <th>Tipo de Aro</th>
                <td>
                    <asp:Label ID="lblTipoAro_env" runat="server" Text="Label"></asp:Label>
                    </td>
                <th>Diagonal</th>
                <td>
                    <asp:Label ID="lblDiagonal_env" runat="server" Text="Label"></asp:Label>
                    </td>
            </tr>
        </table>
    </div>

    <div id="pie_pagina">
       
    </div>
    <div id="botones_mov">
    </div>

</asp:Content>
