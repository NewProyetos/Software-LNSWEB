<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="WebApplication1.Pages.Busqueda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Búsqueda</title>
    <link href="../css/StyleSheetSearch.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link href="../css/StyleSheetTable.css" rel="stylesheet" type="text/css" />
    <link href="../css/StyleSheetMap.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,700" />
    <link rel="icon" href="../img/favicon.png" type="image/png" sizes="128x128" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
    <div>
        <form id="form1" runat="server" class="form-search">
            <p><asp:Button ID="btnLogOut" runat="server" Text="Cerrar Sesión" Style="float:right;margin-right: 0px;" OnClick="btnLogOut_Click" /></p>
            <p>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/WEB-LESASAC.png" Style="vertical-align: -webkit-baseline-middle;" />
            </p>
            <br />
            <br />
            <asp:TextBox ID="txtSearch" runat="server" name="search" AutoPostBack="True" OnTextChanged="txtSearch_TextChanged" autocomplete="off"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Búsqueda" OnClick="btnSearch_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Borrar" OnClick="btnClear_Click" />
            <br />
            <br />
            <hr />
            <asp:Label ID="lblActu" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblTime" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="lblRest" runat="server"></asp:Label>
            <br />
            <hr />
            <br />
            <div>
                <div class="table-container">
                    <asp:GridView ID="dgvSearch" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" class="container">
                        <Columns>
                            <asp:BoundField DataField="COD_ORDEN" HeaderText="CODIGO_ORDEN" SortExpression="COD_ORDEN" />
                            <asp:BoundField DataField="NUM_CAJA" HeaderText="NUMERO_CAJA" SortExpression="NUM_CAJA" />
                            <asp:BoundField DataField="PACIENTE" HeaderText="NOMBRE_PACIENTE" SortExpression="PACIENTE" />
                            <asp:BoundField DataField="ESTADO_GENERAL" HeaderText="ESTADO_GENERAL" SortExpression="ESTADO_GENERAL" />
                            <asp:BoundField DataField="ETAPA_LAB" HeaderText="ETAPA_LABORATORIO" ReadOnly="True" SortExpression="ETAPA_LAB" />
                            <asp:BoundField DataField="FECHA_DOC" HeaderText="FECHA_DOCUMENTO" ReadOnly="True" SortExpression="FECHA_DOC" />
                            <asp:BoundField DataField="Column1" HeaderText="FECHA_INGRESO" ReadOnly="True" SortExpression="Column1" />
                            <asp:BoundField DataField="Tiempo Faltante" HeaderText="TIEMPO_FALTANTE" ReadOnly="True" SortExpression="Tiempo Faltante" />
                        </Columns>
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OPTICADBConnectionString %>" SelectCommand="SELECT top 100  
          EN.[COD_ORDEN], 
       EN.CVE_CLIE AS CLIENTE_OPTICA
	   ,CLP.NUM_CAJA 
       ,EN.[PACIENTE] 
       ,EN.[ESTADO_LAB] AS ESTADO_GENERAL
       ,DET.LABORATORIO_ETAPA AS ETAPA_LAB 
       ,'Tiempo Faltante' =   
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
 
  LEFT JOIN [dbo].[LNS.PEDIDO_DET_CMPL] AS CLP
  ON EN.COD_ORDEN = CLP.COD_ORDEN
 
 
  LEFT JOIN (SELECT CASE WHEN  ESTADO_LAB  = 'ANULADO' THEN 'ANULADO'
                                        WHEN  ESTADO_LAB  = 'RECEPCIÓN' THEN 'RECEPCIÓN'  
                                        WHEN  ESTADO_LAB  = 'BODEGA' THEN 'BODEGA' 
                                         WHEN  CM.NOMBRE  = 'TALLADO' THEN 'TALLADO'
                                        WHEN  CM.NOMBRE  = 'RECUBRIMIENTO' THEN 'RECUBRIMIENTO'
                                        WHEN  CM.NOMBRE  = 'BISELADO' THEN 'BISELADO'
                                         WHEN  CM.NOMBRE  = 'CONTROL CALIDAD' THEN 'CONTROL CALIDAD'
                                         WHEN  ESTADO_LAB  = 'FACTURACION' THEN 'FACTURACION'
 
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
 
WHERE [CVE_CLIE] = @username AND CAST(datediff(HOUR, EN.FECHA_IN,GETDATE()) as int) &lt;= 240  AND EN.PACIENTE like Concat('%',@Paciente,'%')

ORDER BY [FECHA_IN] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="username" SessionField="username" Type="String" DefaultValue="" />
                        <asp:ControlParameter Name="paciente" ControlID="txtSearch" PropertyName="Text" DefaultValue="" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:OPTICADBConnectionString %>" SelectCommand="SELECT top 100
          EN.[COD_ORDEN],
       EN.CVE_CLIE AS CLIENTE_OPTICA
       ,EN.[PACIENTE]
       ,EN.[ESTADO_LAB] AS ESTADO_GENERAL
       ,DET.LABORATORIO_ETAPA AS ETAPA_LAB
       ,CLP.NUM_CAJA
          ,FACC.TIP_DOC_SIG AS TIPO_DOC

,CASE FACC.TIP_DOC_SIG

             WHEN 'R' THEN FACC.REMI
             WHEN 'F' THEN FACC.FACTU 
             --ELSE 'NO'
             
END AS FECHA_DOC
,FORMAT(EN.[FECHA_IN],'dd MMMM yyyy, hh:mm tt')
,'Tiempo Faltante' =   
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

  LEFT JOIN [dbo].[LNS.PEDIDO_DET_CMPL] AS CLP
  ON EN.COD_ORDEN = CLP.COD_ORDEN

 
  LEFT JOIN (SELECT CASE WHEN  ESTADO_LAB  = 'ANULADO' THEN 'ANULADO'
                                        WHEN  ESTADO_LAB  = 'RECEPCIÓN' THEN 'RECEPCIÓN' 
                                        WHEN  ESTADO_LAB  = 'BODEGA' THEN 'BODEGA'
                                         WHEN  CM.NOMBRE  = 'TALLADO' THEN 'TALLADO'
                                        WHEN  CM.NOMBRE  = 'RECUBRIMIENTO' THEN 'RECUBRIMIENTO'
                                        WHEN  CM.NOMBRE  = 'BISELADO' THEN 'BISELADO'
                                         WHEN  CM.NOMBRE  = 'CONTROL CALIDAD' THEN 'CONTROL CALIDAD'
                                         WHEN  ESTADO_LAB  = 'FACTURACION' THEN 'FACTURACION'

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

LEFT JOIN (SELECT PED.[CVE_DOC] 
                            ,PED.[DOC_SIG] 
                            ,PED.TIP_DOC_SIG
                           ,FACT.FECHA_DOC AS FACTURA_
                          ,FORMAT(FACT.FECHAELAB,'dd MMMM yyyy, hh:mm tt') AS FACTU
                           ,FORMAT(REM.FECHA_DOC,'dd MMMM yyyy, hh:mm tt') AS REMI 
                            ,FACT.TIP_DOC 
                             
                             FROM [dbo].[LESA.PEDIDO_ENC] as PED 
                            
                            LEFT JOIN [dbo].[LESA.FACTURACION_ENC] as FACT  
                            ON PED.DOC_SIG = FACT.CVE_DOC

                           LEFT JOIN [dbo].[LESA.REMISIONES] as REM
                           ON PED.DOC_SIG = REM.CVE_DOC
                           
                           where PED.CVE_DOC like '%LND%') AS FACC 

on EN.PEDIDO_SAE = FACC.CVE_DOC   
 
WHERE [CVE_CLIE] = @username AND CAST(datediff(HOUR, EN.FECHA_IN,GETDATE()) as int) &lt;= 240  AND EN.PACIENTE like Concat('%',@Paciente,'%')

ORDER BY [FECHA_IN] DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="username" SessionField="username" />
                        <asp:ControlParameter ControlID="txtSearch" Name="Paciente" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:OPTICADBConnectionString %>" SelectCommand="IF @Paciente = ' ' BEGIN
SELECT top 200
          EN.[COD_ORDEN],
       EN.CVE_CLIE AS CLIENTE_OPTICA
       ,EN.[PACIENTE]
       ,EN.[ESTADO_LAB] AS ESTADO_GENERAL
       ,DET.LABORATORIO_ETAPA AS ETAPA_LAB
       ,CLP.NUM_CAJA
          ,FACC.TIP_DOC_SIG AS TIPO_DOC

,CASE FACC.TIP_DOC_SIG

             WHEN 'R' THEN FACC.REMI
             WHEN 'F' THEN FACC.FACTU 
             --ELSE 'NO'
             
END AS FECHA_DOC
,FORMAT(EN.[FECHA_IN],'dd MMMM yyyy, hh:mm tt')
,'Tiempo Faltante' =   
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

  LEFT JOIN [dbo].[LNS.PEDIDO_DET_CMPL] AS CLP
  ON EN.COD_ORDEN = CLP.COD_ORDEN

 
  LEFT JOIN (SELECT CASE WHEN  ESTADO_LAB  = 'ANULADO' THEN 'ANULADO'
                                        WHEN  ESTADO_LAB  = 'RECEPCIÓN' THEN 'RECEPCIÓN' 
                                        WHEN  ESTADO_LAB  = 'BODEGA' THEN 'BODEGA'
                                         WHEN  CM.NOMBRE  = 'TALLADO' THEN 'TALLADO'
                                        WHEN  CM.NOMBRE  = 'RECUBRIMIENTO' THEN 'RECUBRIMIENTO'
                                        WHEN  CM.NOMBRE  = 'BISELADO' THEN 'BISELADO'
                                         WHEN  CM.NOMBRE  = 'CONTROL CALIDAD' THEN 'CONTROL CALIDAD'
                                         WHEN  ESTADO_LAB  = 'FACTURACION' THEN 'FACTURACION'

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

LEFT JOIN (SELECT PED.[CVE_DOC] 
                            ,PED.[DOC_SIG] 
                            ,PED.TIP_DOC_SIG
                           ,FACT.FECHA_DOC AS FACTURA_
                          ,FORMAT(FACT.FECHAELAB,'dd MMMM yyyy, hh:mm tt') AS FACTU
                           ,FORMAT(REM.FECHA_DOC,'dd MMMM yyyy, hh:mm tt') AS REMI 
                            ,FACT.TIP_DOC 
                             
                             FROM [dbo].[LESA.PEDIDO_ENC] as PED 
                            
                            LEFT JOIN [dbo].[LESA.FACTURACION_ENC] as FACT  
                            ON PED.DOC_SIG = FACT.CVE_DOC

                           LEFT JOIN [dbo].[LESA.REMISIONES] as REM
                           ON PED.DOC_SIG = REM.CVE_DOC
                           
                           where PED.CVE_DOC like '%LND%') AS FACC 

on EN.PEDIDO_SAE = FACC.CVE_DOC   
 
WHERE [CVE_CLIE] = @username AND CAST(datediff(HOUR, EN.FECHA_IN,GETDATE()) as int) &lt;= 240 

ORDER BY [FECHA_IN] DESC

END
ELSE BEGIN
SELECT top 100
          EN.[COD_ORDEN],
       EN.CVE_CLIE AS CLIENTE_OPTICA
       ,EN.[PACIENTE]
       ,EN.[ESTADO_LAB] AS ESTADO_GENERAL
       ,DET.LABORATORIO_ETAPA AS ETAPA_LAB
       ,CLP.NUM_CAJA
          ,FACC.TIP_DOC_SIG AS TIPO_DOC

,CASE FACC.TIP_DOC_SIG

             WHEN 'R' THEN FACC.REMI
             WHEN 'F' THEN FACC.FACTU 
             --ELSE 'NO'
             
END AS FECHA_DOC
,FORMAT(EN.[FECHA_IN],'dd MMMM yyyy, hh:mm tt')
,'Tiempo Faltante' =   
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

  LEFT JOIN [dbo].[LNS.PEDIDO_DET_CMPL] AS CLP
  ON EN.COD_ORDEN = CLP.COD_ORDEN

 
  LEFT JOIN (SELECT CASE WHEN  ESTADO_LAB  = 'ANULADO' THEN 'ANULADO'
                                        WHEN  ESTADO_LAB  = 'RECEPCIÓN' THEN 'RECEPCIÓN' 
                                        WHEN  ESTADO_LAB  = 'BODEGA' THEN 'BODEGA'
                                         WHEN  CM.NOMBRE  = 'TALLADO' THEN 'TALLADO'
                                        WHEN  CM.NOMBRE  = 'RECUBRIMIENTO' THEN 'RECUBRIMIENTO'
                                        WHEN  CM.NOMBRE  = 'BISELADO' THEN 'BISELADO'
                                         WHEN  CM.NOMBRE  = 'CONTROL CALIDAD' THEN 'CONTROL CALIDAD'
                                         WHEN  ESTADO_LAB  = 'FACTURACION' THEN 'FACTURACION'

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

LEFT JOIN (SELECT PED.[CVE_DOC] 
                            ,PED.[DOC_SIG] 
                            ,PED.TIP_DOC_SIG
                           ,FACT.FECHA_DOC AS FACTURA_
                          ,FORMAT(FACT.FECHAELAB,'dd MMMM yyyy, hh:mm tt') AS FACTU
                           ,FORMAT(REM.FECHA_DOC,'dd MMMM yyyy, hh:mm tt') AS REMI 
                            ,FACT.TIP_DOC 
                             
                             FROM [dbo].[LESA.PEDIDO_ENC] as PED 
                            
                            LEFT JOIN [dbo].[LESA.FACTURACION_ENC] as FACT  
                            ON PED.DOC_SIG = FACT.CVE_DOC

                           LEFT JOIN [dbo].[LESA.REMISIONES] as REM
                           ON PED.DOC_SIG = REM.CVE_DOC
                           
                           where PED.CVE_DOC like '%LND%') AS FACC 

on EN.PEDIDO_SAE = FACC.CVE_DOC   
 
WHERE [CVE_CLIE] = @username AND CAST(datediff(HOUR, EN.FECHA_IN,GETDATE()) as int) &lt;= 240  AND EN.PACIENTE like Concat('%',@Paciente,'%')

ORDER BY [FECHA_IN] DESC

END">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtSearch" Name="Paciente" PropertyName="Text" />
                        <asp:SessionParameter Name="username" SessionField="username" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Timer ID="Timer1" runat="server" Interval="300000" OnTick="Timer1_Tick">
                    <!-- Son 5 minutos-->
                </asp:Timer>
                <hr />
                <div id="webimg">
                    <figure class="annotated">
                        <asp:Image ID="Image3" runat="server" Width="100%" ImageUrl="~/img/Mapa_Lesa_Web.png" />

                        <figcaption>
                            <b>Anotaciones</b>
                            <ul>
                                <li style="top: 40%; left: 6.5%;" id="F1">Digitación</li>
                                <li style="top: 40%; left: 15.4%;" id="F2">Bodega</li>
                                <li style="top: 20%; left: 28%;" id="F3">Terminados</li>
                                <li style="top: 20%; left: 40.2%;" id="F4">Bisel</li>
                                <li style="top: 20%; left: 46.7%;" id="F5">Control De Calidad</li>
                                <li style="top: 20%; left: 60%;" id="F6">Facturación</li>
                                <li style="top: 66%; left: 28.4%;" id="F7">Procesado</li>
                                <li style="top: 66%; left: 39.8%;" id="F8">Tallado</li>
                                <li style="top: 66%; left: 48%;" id="F9">Recubrimiento</li>
                                <li style="top: 66%; left: 61.4%;" id="F10">Bisel</li>
                                <li style="top: 66%; left: 69.4%;" id="F11">Control De Calidad</li>
                                <li style="top: 66%; left: 82.7%;" id="F12">Facturación</li>
                            </ul>
                        </figcaption>
                    </figure>
                </div>
                <div id="mobileimg">
                     <figure class="annotated">
                        <asp:Image ID="Image4" runat="server" Width="100%" ImageUrl="~/img/MOVIL-MAPA.png" />

                        <figcaption>
                            <b>Anotaciones</b>
                            <ul>
                                <li style="top: 23%; left: 38.5%;" id="D1">Digitación</li>
                                <li style="top: 36%; left: 41%;" id="D2">Bodega</li>
                                <li style="top: 51%; left: 62%;" id="D3">Terminados</li>
                                <li style="top: 58%; left: 67%;" id="D4">Bisel</li>
                                <li style="top: 65%; left: 56.7%;" id="D5">Control De Calidad</li>
                                <li style="top: 73%; left: 62%;" id="D6">Facturación</li>
                                <li style="top: 50.5%; left: 16.8%;" id="D7">Procesado</li>
                                <li style="top: 58%; left: 19%;" id="D8">Tallado</li>
                                <li style="top: 65%; left: 14%;" id="D9">Recubrimiento</li>
                                <li style="top: 72.4%; left: 21.4%;" id="D10">Bisel</li>
                                <li style="top: 80%; left: 11.4%;" id="D11">Control De Calidad</li>
                                <li style="top: 87%; left: 15.7%;" id="D12">Facturación</li>
                            </ul>
                        </figcaption>
                    </figure>
                </div>
                <!-- Digitaciín Modal -->
                <div id="DigModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">DIGITACIÓN</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Digitacion.jpg" />
                            <p class="MH">Es el área donde entran los trabajos al laboratorio. En esta etapa controlamos el estado de el aro enviado para iniciar el proceso de producción del lente.</p>
                        </div>
                    </div>
                </div>
                <!-- Bodega Modal -->
                <div id="BodModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">BODEGA</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Bodega.jpg" />
                            <p class="MH">Es el primer paso del proceso productivo. Aquí es donde se asigna el material y tipo de lente de acuerdo a las especificaciones de cada orden.</p>
                        </div>
                    </div>
                </div>
                <!-- Terminados Modal -->
                <div id="TerModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">TERMINADOS</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Terminado.jpg" />
                            <p class="MH"></p>
                        </div>
                    </div>
                </div>
                <!-- Bisel Modal -->
                <div id="BisModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">BISEL</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Bisel.jpg"/>
                            <p class="MH">Parte del proceso donde se unen los lentes y los aros para terminar el trabajo.  Esta etapa requiere de alta concentración y detalle para dejar un terminado óptimo a los lentes.</p>
                        </div>
                    </div>
                </div>
                <!-- Control Calidad Modal -->
                <div id="ConModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">CONTROL DE CALIDAD</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Control.jpg" />
                            <p class="MH">Etapa final del proceso productivo. Es aquí donde se revisa que tanto el lente, aro y tratamientos; cumpla con las necesidades que el cliente solicitó en su orden. Dicha fase se realiza uno a uno por personal calificado.</p>
                        </div>
                    </div>
                </div>
                <!--Facturación Modal --> 
                <div id="FacModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">FACTURACIÓN</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Facturacion.jpg" />
                            <p class="MH">Es la última etapa de todo el proceso. Aquí es donde se empacan y preparan las diferentes rutas de envío de acuerdo a la ubicación del cliente.</p>
                        </div>
                    </div>
                </div>
                <!--Procesado Modal -->
                <div id="ProModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">PROCESADO</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Tallado.jpg" />
                            <p class="MH"></p>
                        </div>
                    </div>
                </div>
                <!--Tallado Modal -->
                <div id="TalModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">TALLADO</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Tallado.jpg" />
                            <p class="MH">Parte del proceso donde se transforma el material para brindarle la fórmula a los lentes. En esta etapa se usa la Mayr, tecnología de tallado punto a punto con diamante natural.</p>
                        </div>
                    </div>
                </div>
                <!--Recubrimiento Modal -->
                <div id="RecModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <h2 class="MH">RECUBRIMIENTO</h2>
                        </div>
                        <div class="modal-body">
                            <img src="../img/Recubrimiento6.jpg" />
                            <p class="MH">Es donde se le colocan los tratamientos de endurecido y antireflejo de última generación a los lentes. Estos son los que permiten tener lentes más resistentes a las rayas y más transparentes.</p>
                        </div>
                    </div>
                </div>
            </div>
            
        </form>
    </div>
    <footer>
        Distribución a Centroamérica y el Caribe / Llámanos: <a href="tel:22017788">(+503) 2201-7788</a> o escríbenos: <a href="mailto:sac@lesa.bz">sac@lesa.bz</a>
        <br />
        <br />
        <asp:Image ID="Image2" runat="server" ImageUrl="~/img/WEB-LESAABAJO.png" Width="100%" />
    </footer>
    <script>
        var Digmodal = document.getElementById('DigModal');
        var Bodmodal = document.getElementById('BodModal');
        var Termodal = document.getElementById('TerModal');
        var Bismodal = document.getElementById('BisModal');
        var Conmodal = document.getElementById('ConModal');
        var Facmodal = document.getElementById('FacModal');
        var Promodal = document.getElementById('ProModal');
        var Talmodal = document.getElementById('TalModal');
        var Recmodal = document.getElementById('RecModal');

        // Get the button that opens the modal
        var btnF1 = document.getElementById("F1");
        var btnD1 = document.getElementById("D1");
        var btnF2 = document.getElementById("F2");
        var btnD2 = document.getElementById("D2");
        var btnF3 = document.getElementById("F3");
        var btnD3 = document.getElementById("D3");
        var btnF4 = document.getElementById("F4");
        var btnD4 = document.getElementById("D4");
        var btnF5 = document.getElementById("F5");
        var btnD5 = document.getElementById("D5");
        var btnF6 = document.getElementById("F6");
        var btnD6 = document.getElementById("D6");
        var btnF7 = document.getElementById("F7");
        var btnD7 = document.getElementById("D7");
        var btnF8 = document.getElementById("F8");
        var btnD8 = document.getElementById("D8");
        var btnF9 = document.getElementById("F9");
        var btnD9 = document.getElementById("D9");
        //Estos son para modales que ya existen
        var btnF10 = document.getElementById("F10");
        var btnD10 = document.getElementById("D10");
        var btnF11 = document.getElementById("F11");
        var btnD11 = document.getElementById("D11");
        var btnF12 = document.getElementById("F12");
        var btnD12 = document.getElementById("D12");

        // Get the <span> element that closes the modal
        var spanM1 = document.getElementsByClassName("close")[0]; //DigModal
        var spanM2 = document.getElementsByClassName("close")[1]; //BodModal
        var spanM3 = document.getElementsByClassName("close")[2]; //BodModal
        var spanM4 = document.getElementsByClassName("close")[3]; //BisModal
        var spanM5 = document.getElementsByClassName("close")[4]; //ConModal
        var spanM6 = document.getElementsByClassName("close")[5]; //FacModal
        var spanM7 = document.getElementsByClassName("close")[6]; //ProModal
        var spanM8 = document.getElementsByClassName("close")[7]; //TalModal
        var spanM9 = document.getElementsByClassName("close")[8]; //RecModal

        // When the user clicks the button, open the modal 
        btnF1.onclick = function() {
            siMostrar(Digmodal);
        }
        btnD1.onclick = function() {
            siMostrar(Digmodal);
        }
        btnF2.onclick = function() {
            siMostrar(Bodmodal);
        }
        btnD2.onclick = function() {
            siMostrar(Bodmodal);
        }
        btnF3.onclick = function() {
            siMostrar(Termodal);
        }
        btnD3.onclick = function() {
            siMostrar(Termodal);
        }
        btnF4.onclick = function() {
            siMostrar(Bismodal);
        }
        btnD4.onclick = function() {
            siMostrar(Bismodal);
        }
        btnF5.onclick = function() {
            siMostrar(Conmodal);
        }
        btnD5.onclick = function() {
            siMostrar(Conmodal);
        }
        btnF6.onclick = function() {
            siMostrar(Facmodal);
        }
        btnD6.onclick = function() {
            siMostrar(Facmodal);
        }
        btnF7.onclick = function() {
            siMostrar(Promodal);
        }
        btnD7.onclick = function() {
            siMostrar(Promodal);
        }
        btnF8.onclick = function() {
            siMostrar(Talmodal);
        }
        btnD8.onclick = function() {
            siMostrar(Talmodal);
        }
        btnF9.onclick = function() {
            siMostrar(Recmodal);
        }
        btnD9.onclick = function() {
            siMostrar(Recmodal);
        }
        btnF10.onclick = function() {
            siMostrar(Bismodal);
        }
        btnD10.onclick = function() {
            siMostrar(Bismodal);
        }
        btnF11.onclick = function() {
            siMostrar(Conmodal);
        }
        btnD11.onclick = function() {
            siMostrar(Conmodal);
        }
        btnF12.onclick = function() {
            siMostrar(Facmodal);
        }
        btnD12.onclick = function() {
            siMostrar(Facmodal);
        }

        // When the user clicks on <span> (x), close the modal
        spanM1.onclick = function() {
            noMostrar(Digmodal);
        }
        spanM2.onclick = function() {
            noMostrar(Bodmodal);
        }
        spanM3.onclick = function() {
            noMostrar(Termodal);
        }
        spanM4.onclick = function() {
            noMostrar(Bismodal);
        }
        spanM5.onclick = function() {
            noMostrar(Conmodal);
        }
        spanM6.onclick = function() {
            noMostrar(Facmodal);
        }
        spanM7.onclick = function() {
            noMostrar(Promodal);
        }
        spanM8.onclick = function() {
            noMostrar(Talmodal);
        }
        spanM9.onclick = function() {
            noMostrar(Recmodal);
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            //Agregar un if por cada modal
            if (event.target == Digmodal) {
                noMostrar(Digmodal);
            }
            if (event.target == Bodmodal) {
                noMostrar(Bodmodal);
            }
            if (event.target == Termodal) {
                noMostrar(Termodal);
            }
            if (event.target == Bismodal) {
                noMostrar(Bismodal);
            }
            if (event.target == Conmodal) {
                noMostrar(Conmodal);
            }
            if (event.target == Facmodal) {
                noMostrar(Facmodal);
            }
            if (event.target == Promodal) {
                noMostrar(Promodal);
            }
            if (event.target == Talmodal) {
                noMostrar(Talmodal);
            }
            if (event.target == Recmodal) {
                noMostrar(Recmodal);
            }
        }
        //Funciones para si/no mostrar los modales.
        function siMostrar(modal){
            modal.style.display = "block";
        }
        function noMostrar(modal){
            modal.style.display = "none";
        }
    </script>
</body>
</html>
