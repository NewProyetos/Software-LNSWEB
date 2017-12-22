<%@ Page Title="" Language="C#" MasterPageFile="~/paginas/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="dteAro.aspx.cs" Inherits="PW_PROTAL_WEB.dteAro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 id ="sub_titulos"> Detalles del Aro a enviar</h2>
    <h5 id="indicacion">Si llena estos campos, recuerde enviar el aro </h5>

    <div id="detalles_1">
        <table id ="aros_detalles" style="width: 100%;">
            <tr>
                <th>DNP</th>
                <td>
                    <asp:TextBox ID="txtdnp" runat="server"></asp:TextBox></td>
                <th>Distancia vertice</th>
                <td>
                    <asp:TextBox ID="txtdistancia_vertice" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Frame Fit</th>
                <td>
                    <asp:TextBox ID="txtframe_fit" runat="server"></asp:TextBox></td>
                <th>Angulo Pantoscopico</th>
                <td>
                    <asp:TextBox ID="txtpantoscopico" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>AO</th>
                <td>
                    <asp:TextBox ID="txtao" runat="server"></asp:TextBox></td>
                <th>Angulo Panoramico</th>
                <td>
                    <asp:TextBox ID="txtpanoramico" runat="server"></asp:TextBox></td>
            </tr>
            <tr> 
                <th>Ap</th>
                <td>
                    <asp:TextBox ID="txtap" runat="server"></asp:TextBox></td>
                <th>Corredor</th>
                <td>
                    <asp:TextBox ID="txtCorredor" runat="server"></asp:TextBox></td>
                
                </tr>
        </table>
    </div>
    <br />
    <div id="detalles_2">
        <table style="width: 100%;">
            <tr>
                <th>Modelo Aro</th>
                <td>
                    <asp:TextBox ID="txtmodelo_aro" runat="server"></asp:TextBox></td>
                <th>Horizontal</th>
                <td>
                    <asp:TextBox ID="txthorizontal" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Material de Aro</th>
                <td>
                    <asp:TextBox ID="txtmaterial_aro" runat="server"></asp:TextBox></td>
                <th>Vertical</th>
                <td>
                    <asp:TextBox ID="txtvertical" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Color de aro</th>
                <td>
                    <asp:TextBox ID="txtcolor_aro" runat="server"></asp:TextBox></td>
                <th>Puente</th>
                <td>
                    <asp:TextBox ID="txtpuente" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <th>Tipo de Aro</th>
                <td>
                    <div id ="seleccion_prod_lente">
                    <asp:DropDownList ID="DblistTipoAro" runat="server" AutoPostBack="True">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>CERRADO</asp:ListItem>
                        <asp:ListItem>AL AIRE</asp:ListItem>
                        <asp:ListItem>SEMI AL AIRE</asp:ListItem>
                        </asp:DropDownList></div></td>
                <th>Diagonal</th>
                <td>
                    <asp:TextBox ID="txtdiagonal" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        <br />
                    <asp:Label ID="lblobservaciones" runat="server" Text="Observaciones: "></asp:Label>
                    <asp:TextBox ID="txtObservaciones" runat="server" Width="379px"></asp:TextBox>
                
    </div>
    <div id="botones_mov">
        <asp:Button ID="btnAnterior" runat="server" Text="Anterior" OnClick="btnAnterior_Click" />
    <asp:Button ID="btnSigueinte" runat="server" Text="Siguiente" OnClick="btnSigueinte_Click" />
    </div>
     
</asp:Content>
