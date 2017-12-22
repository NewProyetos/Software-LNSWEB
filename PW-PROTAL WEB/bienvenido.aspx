<%@ Page Title="" Language="C#" MasterPageFile="~/Mast_pages1.Master" AutoEventWireup="true" CodeBehind="bienvenido.aspx.cs" Inherits="PW_PROTAL_WEB.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
   Lesa Web | HOME
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
  
    <p>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/WEB-LESASAC.png" Style="vertical-align: -webkit-baseline-middle;" />
            </p>
    <div  id ="login"><h1>Bienvenido</h1>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </p> </div>

</asp:Content>
