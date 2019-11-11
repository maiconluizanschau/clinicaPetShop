<%-- 
    Document   : servico
    Created on : 22/10/2015, 22:37:59
    Author: maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@ page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ListIterator" %>
<%@page import="java.util.ArrayList" %>

<%
//Lista de animais
    List<Servico> sList = new ArrayList<Servico>();
    String data = "";
%>
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
                <td height="22" colspan="2" valign="top" class="Txt"><strong>SERVIÇOS REALIZADOS</strong></td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td colspan="2"><hr size="1"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <table border="0" width="100%">
                        <thead>
                            <tr class="TopoTit">
                                <th>DATA</th>
                                <th>TIPO</th>
                                <th>NOME</th>
                                <th>ANIMAL</th>
                                <th>VALOR</th>
                                <th>AÇÕES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {

                                    sList = (List<Servico>) Servico.consultar();

                                    for (ListIterator iter = sList.listIterator(); iter.hasNext();) {
                                        Servico achei = (Servico) iter.next();

                                        data = achei.getData().toLocaleString().substring(0, 10);

                            %>

                            <tr class="Txt" >
                                <td><%out.print(data);%></td>
                                <td><%out.print(achei.getNome());%></td>
                                <td><%out.print(achei.getDescricao());%></td>
                                <td><% out.print(achei.getAnimal().getNome());%></td>
                                <td align="right"><%out.print(achei.getValor());%></td>
                                <td class="Txt" align="center">

                                    <table border="0" align="center" cellpadding="2" cellspacing="2" width="100%">

                                        <tr align="center" valign="middle">

                                            <td>
                                                <a href="../consultas/detalhe_servico.jsp?idServico=<%out.print(achei.getIdServico());%>">
                                                    <img src="../images/img_lupa_transparente.png" width="30" height="30" alt="consultar" title="consultar" border="0"/>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="../consultas/editar_servico.jsp?idServico=<%out.print(achei.getIdServico());%>">

                                                    <img src="../images/img_caderno_transparente.png" width="30" height="30" alt="editar" title="editar" border="0"/>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="../consultas/excluir_servico.jsp?idServico=<%out.print(achei.getIdServico());%>">

                                                    <img src="../images/img_lixeira_transparente.png" width="30" height="30" alt="excluir" title="excluir" border="0"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%}
                                } catch (Exception e) {
                                    out.print("<br>");
                                    out.print("<center><font face='verdana' color='red'   size='2'>Erro ao listar serviços </font></center>");
                                    out.print("<center><font face='verdana' color='red'   size='2'>" + e.getMessage() + "</font></center>");
                                }
                            %>
                        </tbody>
                    </table>
                    <jsp:include page="../geral/rodape.jsp" />

                </td>
            </tr>
        </table>
    </body>
</html>