<%@ Page Title="" Language="C#" MasterPageFile="~/paginas/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="dteBoleta.aspx.cs" Inherits="PW_PROTAL_WEB.paginas.dtBoletas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 id ="sub_titulos">BOLETA</h2>
    <h4 id="indicacion">Por favor verifique la informacion que se le pesenta, de lo contrario le pedimos que regrese a la paginas anterior y modifique la informacion</h4>
    <div id="enc_pagina">
        <h2 class="sub_boleta">Datos Generales</h2>
        <div id="detalles_1">
        <table id="datos" style="width: 100%;">
            <tr>
                <td>
                    <asp:Label ID="lblOptica" runat="server" Text="Optica: "></asp:Label>
                    <asp:Label ID="lblOptica_env" runat="server" Text="" placeholder=""></asp:Label>
                    <br />
                    <asp:Label ID="lblCodigo_env" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblPaciente_" runat="server" Text="Paciente: "></asp:Label>
                    <asp:Label ID="lblPaciente_env" runat="server" Text=""></asp:Label>
                </td>
            </tr>
           
        </table>
            </div>
    </div>

    <div id="detalles_cuerpo">
        <h2 class="sub_boleta">Datos de Formula</h2>
        <table id="formula_rx" style="width: 100%;">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">
                            <asp:Label ID="Label1" runat="server" Text="Esfera"></asp:Label></th>
                        <th scope="col">
                            <asp:Label ID="Label2" runat="server" Text="Cilindro"></asp:Label></th>
                        <th scope="col">
                            <asp:Label ID="Label3" runat="server" Text="Eje"></asp:Label></th>
                        <th scope="col">
                            <asp:Label ID="Label4" runat="server" Text="Adicion"></asp:Label></th>
                        <th scope="col">
                            <asp:Label ID="Label5" runat="server" Text="Prisma"></asp:Label></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td data-label="OD">OD</td>
                        <td data-label="Esfera">
                            <asp:Label ID="lblODEsfera_env" runat="server" Text=""></asp:Label></td>
                        <td data-label="Cilindro">
                            <asp:Label ID="lblODCilindro_env" runat="server" Text=""></asp:Label></td>
                        <td data-label="Eje">
                            <asp:Label ID="lblODEje_env" runat="server" Text=""></asp:Label></td>
                        <td data-label="Adicion">
                            <asp:Label ID="lblODAdicion_env" runat="server" Text=""></asp:Label></td>
                        <td data-label="Prisma">
                            <asp:Label ID="lblODPrisma_env" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td scope="row" data-label="OI">OI</td>
                        <td data-label="Esfera">
                            <asp:Label ID="lblOIEsfera_env" runat="server" Text=""></asp:Label></td>
                        <td data-label="Cilindro">
                            <asp:Label ID="lblOICilindro_env" runat="server" Text=""></asp:Label></td>
                        <td data-label="Eje">
                            <asp:Label ID="lblOIEje_env" runat="server" Text=""></asp:Label></td>
                        <td data-label="Adicion">
                            <asp:Label ID="lblOIAdicion_env" runat="server" Text=""></asp:Label></td>
                        <td data-label="Prisma">
                            <asp:Label ID="lblOIPrisma_env" runat="server" Text=""></asp:Label></td>
                    </tr>
                </tbody>
            </table>

        <h2 class="sub_boleta">Datos de Producto</h2>
        <div id="prod">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </div>

        <h2 class="sub_boleta">Datos Extras del Lente</h2>
        <table id ="aros_detalles">
            <tr>
                <th>DNP</th>
                <td>
                    <asp:Label ID="lblDnp_env" runat="server" Text=""></asp:Label> </td>
                <th>Distancia vertice</th>
                <td>
                    <asp:Label ID="lblVertice_env" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <th>Frame Fit</th>
                <td>
                    <asp:Label ID="lblFit_env" runat="server" Text=""></asp:Label>
                    </td>
                <th>Angulo Pantoscopico</th>
                <td>
                    <asp:Label ID="lblPantoscopico_env" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
            <tr>
                <th>AO</th>
                <td>
                    <asp:Label ID="lblAO_env" runat="server" Text=""></asp:Label></td>
                <th>Angulo Panoramico</th>
                <td>
                    <asp:Label ID="lblPanoramico_env" runat="server" Text=""></asp:Label></td>
                    
            </tr>
            <tr> 
                <th>AP</th>
                <td>
                    <asp:Label ID="lblAP_env" runat="server" Text=""></asp:Label>
                    </td>
                
                <th>Correrdor</th>
                <td>
                    <asp:Label ID="lblCorredor_env" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
            
               
        </table>
  
        <table id="Aros_sobre">
            <tr>
                <th>Modelo Aro</th>
                <td>
                    <asp:Label ID="lblModeloAro_env" runat="server" Text=""></asp:Label>
                    </td>
                <th>Horizontal</th>
                <td>
                    <asp:Label ID="lblHorizontal_env" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
            <tr>
                <th>Material de Aro</th>
                <td>
                    <asp:Label ID="lblMaterialAro_env" runat="server" Text=""></asp:Label>
                    </td>
                <th>Vertical</th>
                <td>
                    <asp:Label ID="lblVertical_env" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
            <tr>
                <th>Color de aro</th>
                <td>
                    <asp:Label ID="lblColorAro_env" runat="server" Text=""></asp:Label></td>
                <th>Puente</th>
                <td>
                    <asp:Label ID="lblPuente_env" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
            <tr>
                <th>Tipo de Aro</th>
                <td>
                    <asp:Label ID="lblTipoAro_env" runat="server" Text=""></asp:Label>
                    </td>
                <th>Diagonal</th>
                <td>
                    <asp:Label ID="lblDiagonal_env" runat="server" Text=""></asp:Label>
                    </td>
            </tr>
        </table>
        <h2 class="sub_boleta">
        <asp:Label ID="lblobservaciones" runat="server" Text="Observaciones:  "></asp:Label>
            </h2>
        <asp:Label ID="lblObservacion_env" runat="server" Text=""></asp:Label>
    </div>

    <div id="botones_mov">
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" OnClick="Button1_Click" />
    </div>
</asp:Content>
