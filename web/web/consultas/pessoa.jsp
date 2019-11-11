<%-- 
    Document   : pessoa
    Created on : 24/10/2015, 15:05:03
     Author   : maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ListIterator" %>


<%
//Iniciando variavel que receberá a lista de pessoas
    List<Pessoa> pList = new ArrayList<Pessoa>();
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
                <td height="22" colspan="2" valign="top" class="Txt"><strong>PESSOAS</strong></td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
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
                                <th>TELEFONES</th>
                                <th>EMAIL</th>
                                <th>ANIMAIS</th>
                                <th>AÇÕES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                pList = new PF().consultar();
                                for (ListIterator iter = pList.listIterator(); iter.hasNext();) {
                                    Pessoa achei = (Pessoa) iter.next();
                            %>
                            <tr>
                                <td class="Txt"><% out.print(achei.getNome());%></td>

                                <td align="center" class="Txt">

                                    <%
                                        List<Telefone> telefones = (List<Telefone>) new Telefone().consultar(achei);
                                        for (int i = 0; i <= 2; i++) {

                                            try {
                                                out.print(telefones.get(i).getDdd());

                                                out.print(" - ");
                                                out.print(telefones.get(i).getNumero());
                                            } catch (Exception e) {
                                                out.print("-");
                                                e.printStackTrace();
                                            }
                                        }
                                    %>
                                </td>
                                <%
                                    List<Animal> animais = (ArrayList<Animal>) new Cachorro().consultar(achei);
                                    out.print(achei.getEmail());
                                    out.print(animais.size());

                                %>
                                <td class="Txt" align="center">


                                    <table border="0" align="center" cellpadding="2" cellspacing="2" width="100%" >

                                        <tr align="center" valign="middle">
                                            <td>
                                                <a href="../cadastros/animal.jsp?op=1&amp;idPessoa=<%out.print(achei.getIdPessoa());%>">
                                                    <img src="../images/img_gato.png" width="30" height="30" alt="Inserir animal de estimação" title="Inserir animal de estimação" border="0" />
                                                </a>
                                            </td>
                                            <td>
                                                <a href="../consultas/detalhe_pessoa.jsp?idPessoa=<%out.print(achei.getIdPessoa());%>">
                                                    <img src="../images/img_lupa_transparente.png" width="30" height="30" alt="consultar" title="consultar" border="0"/>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="../alterar/editar_pessoa.jsp?op=2&amp;idPessoa=<%out.print(achei.getIdPessoa());%>">
                                                    <img src="../images/img_caderno_transparente.png" width="30" height="30" border="0" alt="editar" title="editar"/>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="../excluir/excluir_pessoa.jsp?idPessoa=<%out.print(achei.getIdPessoa());%>">

                                                    <img src="../images/img_lixeira_transparente.png" width="30" height="30" border="0" alt="excluir" title="excluir"/>
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