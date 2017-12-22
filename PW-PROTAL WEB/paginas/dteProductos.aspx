<%@ Page Title="" Language="C#" MasterPageFile="~/paginas/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="dteProductos.aspx.cs" Inherits="PW_PROTAL_WEB.dteProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Lentes_">
         <h2 id ="sub_titulos"> Productos</h2>
         <h5 id="indicacion">puedes seleccionar un tipo de lente un tipo de aro u solo un tipo de servico...</h5>
    </div>
    <div id="productos" >
        <table id="tableProdPedido" style="width: 100%;">

            <tr>
                <td>
                    <div id="Cantidad">
                        <table id="cant_rbt">
                           <h5 id="H1"><asp:Label ID="Label6" runat="server" Text="Selecciona que ojo va aprocesar: "></asp:Label></h5>
                            <tr>
                                <td><asp:RadioButton ID="rbtOD" runat="server" Text="OD" GroupName="rbtCantidades" OnCheckedChanged="rbtOD_CheckedChanged" /></td>
                                <td><asp:RadioButton ID="rbtOI" runat="server" Text="OI" GroupName="rbtCantidades" OnCheckedChanged="rbtOI_CheckedChanged" /></td>
                                <td><asp:RadioButton ID="rbtAO" runat="server" Text="AO" GroupName="rbtCantidades" OnCheckedChanged="rbtAO_CheckedChanged" /></td>
                            </tr>
                        </table>

                    </div>

                     <div id="seleccion_prod_lente"> 
                     <asp:Label ID="Label1" runat="server" Text="Familia: "></asp:Label>
                     <asp:DropDownList ID="DblistLentes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DblistLentes_SelectedIndexChanged"></asp:DropDownList>
                     <br />
                     <asp:Label ID="Label2" runat="server" Text="Grupos: "></asp:Label>
                     <asp:DropDownList ID="DblistGrupos_lentes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DblistGrupos_lentes_SelectedIndexChanged">
                     </asp:DropDownList>
                     <br />
                     <asp:Label ID="Label3" runat="server" Text="Diseños: "></asp:Label>
                     <asp:DropDownList ID="DBlistDisenos_lentes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DBlistDisenos_lentes_SelectedIndexChanged">
                     </asp:DropDownList>
                     <br />
                     <asp:Label ID="Label4" runat="server" Text="Material: "></asp:Label>
                     <asp:DropDownList ID="DblistMaterial_lentes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DblistMaterial_lentes_SelectedIndexChanged">
                     </asp:DropDownList>
                     <br />
                     <asp:Label ID="Label5" runat="server" Text="Color: "></asp:Label>
                     <asp:DropDownList ID="DblistColor_lentes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DblistColor_lentes_SelectedIndexChanged">
                     </asp:DropDownList>
                         </div>
                     <br />
                     <asp:Label ID="lblLente" runat="server"></asp:Label>
                      &nbsp;<asp:Label ID="lbldescripcion" runat="server"></asp:Label>
&nbsp;
                                              
                    <div id="precio_x_producto">
                        <table id="cant_prod">
                           precio por unidad:
                            <tr>
                                 
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="$"></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label8" runat="server"></asp:Label></td>
                            </tr>
                            
                        </table>
                        <table id="cantidad_">
                            precio por cantidad:
                            <tr>
                                
                                <td>
                                    <asp:Label ID="lblsimbolo3" runat="server" Text="$"></asp:Label></td>
                                <td>
                                    <asp:Label ID="lblprecio_pordcant" runat="server"></asp:Label></td>
                            </tr>
                           
                        </table>
                    </div>
                     </td>
                </tr>
               <tr>
                     <th><h2 class="sub_boleta">Servicios</h2></th>
            </tr>
            <tr>
                <td >
                     <asp:DropDownList ID="DblistServicios" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DblistServicios_SelectedIndexChanged" style="height: 22px"></asp:DropDownList>
                     <br />
                    <asp:Label ID="lblServicos" runat="server"></asp:Label>
                    &nbsp;<asp:Label ID="lblsimbolo1" runat="server" Text="$"></asp:Label>
                     <asp:Label ID="lblprecio_servicio" runat="server"></asp:Label>
                     <br />
                </td>
                </tr>
            <tr>
                <th><h2 class="sub_boleta">Aros</h2></th>
            </tr>
            <tr>
                 <td>
                     <asp:DropDownList ID="DblistAros" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DblistAros_SelectedIndexChanged"></asp:DropDownList>
                     <br />
                     <asp:Label ID="lblAros" runat="server"></asp:Label>
                     &nbsp;<asp:Label ID="lblsimbolo2" runat="server" Text="$"></asp:Label>
                     <asp:Label ID="lblprecio_aro" runat="server"></asp:Label>
                     <br />
                 </td>
              
            </tr>
            
        </table>
    </div>

    <div id="botones_mov">
        <asp:Button ID="agregar_prod1" runat="server" Text="Agregar los productos seleccionados" OnClick="agregar_prod1_Click" Width="332px" />
                    
    
    <div id="tabla_prodductos">
        
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                  
    </div>
   

    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        <asp:Button ID="btnAnteriro" runat="server" Text="Anterior" OnClick="btnAnteriro_Click" Height="26px" />
        <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" OnClick="btnSiguiente_Click" style="height: 26px" />
    </div>
</asp:Content>
