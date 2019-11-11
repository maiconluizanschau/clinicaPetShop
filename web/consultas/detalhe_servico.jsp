<%-- 
    Document   : consulta_servico
    Created on : 04/09/2015, 06:46:29
    Author: maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <jsp:include page="../geral/head.jsp" />
    <body>
        <table width="1366" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td colspan="2">
                    <jsp:include page="../geral/topo.jsp" />
                </td>
            </tr>
            <tr>
                <td height="22" colspan="2" valign="top" class="Txt"><strong>DETALHAMENTO DE SERVIÇO REALIZADO</strong></td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td  height="104" colspan="2" valign="top" >
                    <form action="registrar.jsp" method="post" name="Formulario" >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                            <!--DWLayoutTable-->

                            <tr>
                                <td colspan="2">

                                    <%
                            int idServico = Integer.parseInt(Util.SoNumero(request.getParameter("idServico")));
                            String data = "";
                            try {
                                Servico servico = Servico.consultar(idServico);

                                    data = servico.getData().toLocaleString().substring(0, 10);
                         %>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tr >
                                            <td width="20%" class="TopoTit">CLIENTE: </td>
                                            <td class="TextoTit"><% out.print(servico.getAnimal().getPessoa().getNome());%></td>
                                        </tr>
                                        <tr>
                                            <td width="20%" class="TopoTit">ANIMAL DE ESTIMAÇÃO: </td>
                                            <td class="TextoTit" ><% out.print(servico.getAnimal().getNome());%></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr size="1"></td>
                            </tr>
                            <tr>
                                <td height="22" colspan="2" valign="top" class="Txt"><strong>SERVIÇO EXECUTADO</strong></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tr>
                                            <td width="162" class="Txt">Serviço</td>
                                            <td width="436" class="Txt">
                                                <%  out.print(servico.getNome());%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="162" height="27" valign="top" class="Txt">Nome / Descrição </td>
                                            <td width="436" valign="top" class="Txt">
                                                <%  out.print(servico.getNome());%>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="27" valign="top" class="Txt">Valor R$ </td>
                                            <td valign="top" class="Txt">
                                                <%  out.print(servico.getValor());%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Data de execução</td>
                                            <td valign="top" class="Txt">
                                                <%  out.print(data);%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Observacao</td>
                                            <td valign="top" class="Txt">
                                                <%  out.print(servico.getObservacao());%>
                                            <td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>
            <tr>
                <td class="Txt"></td>
                <td class="Txt">
                </td>
            </tr>


            <tr>
                <td colspan="2">
                    <%          } catch (Exception ex) {
                                    ex.printStackTrace();
                                    out.print("<br>");
                                    out.print("<br>");
                                    out.print("<br>");
                                    out.print("<br><center><font face='verdana' color='red'   size='2'><br />Erro ao cadastrar o serviço executado</font></center><br>");
                                    out.print("<br><center><font face='verdana' color='red'   size='2'><br />" + ex.getMessage() + "</font></center><br>");
                                    out.print("<br>");
                                    out.print("<br>");
                                }
          %>
                    <jsp:include page="../geral/rodape.jsp" />
                </td>
            </tr>
        </table>
    </body>
</html>