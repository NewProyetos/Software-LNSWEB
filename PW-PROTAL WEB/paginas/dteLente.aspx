<%@ Page Title="" Language="C#" MasterPageFile="~/paginas/NestedMasterPage1.master" AutoEventWireup="true" CodeBehind="dteLente.aspx.cs" Inherits="PW_PROTAL_WEB.dteLente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <link href="clases/body_mp1.css" rel="stylesheet" />
    <link href="clases/formula.css" rel="stylesheet" />
    <script src="scrip/validacion_formulas.js"></script>


        <div id="contenido">
             <div class="content">
                 <h2 id ="sub_titulos"> FORMULA</h2>

            <div id="paciente">
                <asp:Label ID="lblpaciente" runat="server" Text="Escribir el nombre del paciente:"></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox11" runat="server" OnTextChanged="TextBox11_TextChanged" placeholder="Ingrese el nombre de su paciente, con el número de su orden..." Width="546px"></asp:TextBox>
            </div>

        <div id="frmfomula">
       <table id="tbformula" >
      
         <thead>
            <tr>
                <td style="width: 73px">
                    </td>
                <th scope="col"><asp:Label ID="lblesfera" runat="server" Text="Esfera"></asp:Label></th>
            
                <th scope="col"><asp:Label ID="lblcilindro" runat="server" Text="Cilindro"></asp:Label></th>
                <th scope="col"><asp:Label ID="lbleje" runat="server" Text="Eje"></asp:Label></th>
                <th scope="col"><asp:Label ID="lbladicion" runat="server" Text="Adicion"></asp:Label></th>
                <th scope="col"><asp:Label ID="lblprisma" runat="server" Text="Prisma"></asp:Label></th>
            </tr>
         </thead>
         <tbody>
            <tr>
                <th data-label="OD"><asp:Label ID="lblod" runat="server" Text="OD"></asp:Label>
                    </th>
                <td data-label="Esfera"><asp:TextBox ID="TextBox1" runat="server" placeholder="+0.25/0.25"></asp:TextBox>
                </td>
                <td data-label="Cilindro"><asp:TextBox ID="TextBox2" runat="server" placeholder="-0.25"></asp:TextBox>
                </td>
                <td data-label="Eje"><asp:TextBox ID="TextBox3" runat="server" placeholder="0° a 180°"></asp:TextBox>
                </td>
                <td data-label="Adicion"><asp:TextBox ID="TextBox4" runat="server" placeholder="+1.00 a +3.00"></asp:TextBox>
                </td >
                <td data-label="Prisma"><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
             
            <tr>
                <th scope="row" data-label="OI" >
                    <asp:Label ID="lbloi" runat="server" Text="OI"></asp:Label>
                </th>
                <td data-label="Esfera">
                    <asp:TextBox ID="TextBox6" runat="server" placeholder="+0.25/-0.25"></asp:TextBox>
                </td>
                <td data-label="Cilindro">
                    <asp:TextBox ID="TextBox7" runat="server" placeholder="-0.25"></asp:TextBox>
                </td>
                <td data-label="Eje">
                    <asp:TextBox ID="TextBox8" runat="server" placeholder="0° a 180°"></asp:TextBox>
                </td>
                <td data-label="Adicion">
                    <asp:TextBox ID="TextBox9" runat="server" placeholder="+1.00 a +3.00"></asp:TextBox>
                </td>
                <td data-label="Prisma">
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                </td>
            </tr>
         </tbody>
        </table>
        
        </div>
            <br />
            <div id="botones_mov">
                <asp:Button ID="btnSiguiente" runat="server" Text="Siguiente" OnClick="Button1_Click" />
            </div>
        </div>
             </div>
    </asp:Content>
