<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro Clientes</title>
    <link href="../css/StyleSheetTable.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,700" />
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 449px">

    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" class="container">
            <Columns>
                <asp:BoundField DataField="COD_ORDEN" HeaderText="CODIGO ORDEN" SortExpression="COD_ORDEN" />
                <asp:BoundField DataField="PACIENTE" HeaderText="PACIENTE" SortExpression="PACIENTE" />
                <asp:BoundField DataField="ETAPA_LAB" HeaderText="ETAPA LABORATORIO" ReadOnly="True" SortExpression="ETAPA_LAB" />
                <asp:BoundField DataField="Tiempo Faltante" HeaderText="TIEMPO RESTANTE" SortExpression="Tiempo Faltante" ReadOnly="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OPTICADBConnectionString %>" SelectCommand="SELECT  EN.[COD_ORDEN],  
   EN.PACIENTE,
       DET.LABORATORIO_ETAPA AS ETAPA_LAB,
     EN.CVE_CLIE AS CLIENTE_OPTICA,
	 &quot;Tiempo Faltante&quot; =   
      CASE   
         WHEN DET.LABORATORIO_ETAPA =  'ANULADO' THEN 'No cuenta'  
         WHEN DET.LABORATORIO_ETAPA =  'RECEPCI”N' THEN 'No cuenta' 
		 WHEN DET.LABORATORIO_ETAPA =  'BODEGA' THEN '4 Días' 
		 WHEN DET.LABORATORIO_ETAPA =  'TALLADO' THEN '3 Días' 
		 WHEN DET.LABORATORIO_ETAPA =  'RECUBRIMIENTO' THEN '2 Días' 
		 WHEN DET.LABORATORIO_ETAPA =  'BISELADO' THEN '24 Horas'
		 WHEN DET.LABORATORIO_ETAPA =  'CONTROL CALIDAD' THEN '12 Horas'
		 WHEN DET.LABORATORIO_ETAPA =  'FACTURACION' THEN 'Ya en camino'
         ELSE 'No cuenta'  
      END   
      
  FROM [dbo].[LNS.PEDIDO_ENC] AS EN

   LEFT JOIN (SELECT CASE WHEN  ESTADO_LAB  = 'ANULADO' THEN 'ANULADO'
                                        WHEN  [ESTADO_LAB]  = 'RECEPCI”N' THEN 'RECEPCI”N'  
                                       WHEN  ESTADO_LAB  = 'BODEGA' THEN 'BODEGA' 
                                         WHEN  CM.NOMBRE  = 'TALLADO' THEN 'TALLADO'
                                        WHEN  CM.NOMBRE  = 'RECUBRIMIENTO' THEN 'RECUBRIMIENTO'
                                        WHEN  CM.NOMBRE  = 'BISELADO' THEN 'BISELADO'
                                         WHEN  CM.NOMBRE  = 'CONTROL CALIDAD' THEN 'CONTROL CALIDAD'
                                         WHEN  [ESTADO_LAB]  = 'FACTURACION' THEN 'FACTURACION'
 
                                     END as 'LABORATORIO_ETAPA'
 
                                     ,COD_ORDEN
                                     ,NOMBRE
 
                    FROM [dbo].[LNS.PEDIDO_ENC] AS PED_ENC
 
       LEFT JOIN (SELECT TB.[ID_LAB] 
                            ,TB.[ID_ORDER] ,LB.NOMBRE
                           FROM [dbo].[LNS.MARCACION] AS TB 
                            
                            LEFT JOIN [dbo].[LNS.ETAPAS_LAB] as LB 
                            ON TB.[ID_LAB] = LB.[ID_ETAPA] 
                            where TB.ESTADO = 'P') as CM 
 
ON PED_ENC.[COD_ORDEN] = CM.[ID_ORDER] ) as DET 
ON EN.COD_ORDEN = DET.COD_ORDEN
 
WHERE [CVE_CLIE] Like @username AND CAST(datediff(HOUR,FECHA_IN,GETDATE()) as int) &lt;= 240  ---&gt; 10 dÌas segun Carlos Abondano.
 
ORDER BY [FECHA_IN] DESC">
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="username" Type="String" DefaultValue="1" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
