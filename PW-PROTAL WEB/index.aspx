<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PW_PROTAL_WEB.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Sign In</title>
    <link href="../css/StyleSheetLogin.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../css/style.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="../css/font-awesome.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,700" />
    <link rel="icon" href="../img/favicon.png" type="image/png" sizes="128x128" />
</head>   
<body>
    <asp:Image ID="Image2" runat="server" Height="108px" ImageUrl="~/img/IsoLogoLesa-blanco.png" Width="185px" />
    <div class="container">
        <div id="login">
    <form id="form1" runat="server">
        <fieldset class="clearfix">
        <asp:Image ID="Image1" runat="server" Height="143px" ImageUrl="~/img/LogoLEsa.png" />
        <br /><br />
        <p><span class="fontawesome-user"></span><asp:TextBox ID="txtUsername" runat="server" autocomplete="off"></asp:TextBox>
        <p><span class="fontawesome-lock"></span><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="off"></asp:TextBox>
        <br />
        <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Acceder" />
        <br />
        <br />
        <asp:Label ID="lblMsg" runat="server" Font-Size="X-Large" ForeColor="White"></asp:Label>
        </fieldset>
    </form>
    </div>
    </div>
</body>
</html>