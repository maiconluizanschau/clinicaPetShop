<%-- 
    Document   : animal
    Created on : 09/10/2015, 22:21:45
    Author: maicon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ListIterator" %>
<%@page import="java.util.ArrayList" %>

<%
//Lista de animais
    List<Animal> pList = new ArrayList<Animal>();
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
                <td height="22" colspan="2" valign="top" class="Txt"><strong>ANIMAIS</strong></td>
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
                                <th>NOME</th>
                                <th>NASCIMENTO</th>
                                <th>TIPO</th>
                                <th>RAÇA</th>
                                <th>QTD SERVIÇOS</th>
                                <th>AÇÕES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                pList = (List<Animal>) Animal.consultar();
                                for (ListIterator iter = pList.listIterator(); iter.hasNext();) {
                                    Animal achei = (Animal) iter.next();
                            %>
                            <tr class="Txt" >
                                <td><%out.print(achei.getNome());%></td>
                                <td><%out.print(achei.getDataNascimento().toLocaleString().substring(0, 10));%></td>
                                <td><%out.print(achei.getDescricao());%></td>
                                <td><%out.print(achei.getRaca());%></td>
                                <td align="center">
                                    <%
                                        List<Servico> servicos = (List<Servico>) Servico.consultar(achei);
                                        out.print(servicos.size());
                                    %>
                                </td>
                                <td class="Txt" align="center">
                                    <%
                                        int idPessoa = achei.getPessoa().getIdPessoa();
                                    %>
                                    <table border="0" align="center" cellpadding="2" cellspacing="2" width="100%">

                                        <tr align="center" valign="middle">
                                            <td>
                                                <a href="../servicos/registrar.jsp?op=2&amp;idPessoa=<%out.print(idPessoa);%>&amp;idAnimal=<%out.print(achei.getIdAnimal());%>">
                                                    <img src="../images/img_cesto.png" width="30" height="30" alt="Incluir serviço" title="Incluir serviço" border="0"/>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="../consultas/detalhe_animal.jsp?idAnimal=<%out.print(achei.getIdAnimal());%>">
                                                    <img src="../images/img_lupa_transparente.png" width="30" height="30" alt="consultar" title="consultar" border="0"/>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="../consultas/editar_animal.jsp?op=1&amp;idAnimal=<%out.print(achei.getIdAnimal());%>">

                                                    <img src="../images/img_caderno_transparente.png" width="30" height="30" alt="editar" title="editar" border="0"/>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="../consultas/excluir_animal.jsp?idAnimal=<%out.print(achei.getIdAnimal());%>">

                                                    <img src="../images/img_lixeira_transparente.png" width="30" height="30" alt="excluir" title="excluir" border="0"/>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <jsp:include page="../geral/rodape.jsp" />
                </td>
            </tr>
        </table>
    </body>
</html>