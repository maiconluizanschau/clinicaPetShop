<%-- 
    Document   : consulta_animal
    Created on : 26/10/2015, 06:54:21
    Author: maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ListIterator" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <jsp:include page="../geral/head.jsp" />
    <body>
        <form action="animal.jsp" method="post" name="Formulario" >

            <table width="1366" border="0" cellpadding="0" cellspacing="0" align="center">

                <tr>
                    <td colspan="2">
                        <jsp:include page="../geral/topo.jsp" />
                    </td>
                </tr>

                <tr>
                    <td height="22" colspan="2" valign="top" class="Txt"><strong>DETALHAMENTO DO ANIMAL DE ESTIMAÇÃO</strong></td>
                </tr>
                <%
            Animal animal;
            int idAnimal = 0;
            try {
                try {
                    idAnimal = Integer.parseInt(Util.SoNumero(request.getParameter("idAnimal")));
                    animal = Animal.consultar(idAnimal);
                } catch (Exception ex) {
                   throw new RuntimeException("Erro ao conectar Objeto animal");
                }
                %>

                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">

                    </td>
                </tr>
                <%
            Pessoa pessoa = Pessoa.consultar(animal.getPessoa().getIdPessoa());
            %>
                <tr>
                    <td  width="20%" class="TopoTit">Dono do animal</td>
                    <td  width="80%" class="TextoTit">
                        <% out.print(pessoa.getNome());%>
                    </td>


                </tr>

                <tr>
                    <td  height="104" colspan="2" valign="top">

                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                            <!--DWLayoutTable-->
                            <tr>
                                <td colspan="2"><hr size="1"></td>
                            </tr>
                            <tr>
                                <td height="22" colspan="2" valign="top" class="Txt"><strong>ANIMAL</strong></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">

                                        <tr>
                                            <td width="162" class="Txt">Tipo</td>
                                            <td width="436" class="Txt">
                                                <%out.print(animal.getDescricao());%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="162" height="27" valign="top" class="Txt">Nome</td>
                                            <td width="436" valign="top" class="Txt">
                                                <%out.print(animal.getNome());%>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="27" valign="top" class="Txt">Raça</td>
                                            <td valign="top" class="Txt">
                                                <%out.print(animal.getRaca());%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Data de Nascimento</td>
                                            <td valign="top" class="Txt">
                                                <%out.print(animal.getDataNascimento().toLocaleString().substring(0, 10));%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Sexo</td>
                                            <td valign="top" class="Txt">
                                                <%out.print(animal.getSexo());%>
                                            <td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Observacao</td>
                                            <td valign="top" class="Txt">
                                                <%out.print(animal.getObservacao());%>
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


                        <%
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                        out.print("<br>");
                                        out.print("<br>");
                                        out.print("<br>");
                                        out.print("<br><center><font face='verdana' color='red'   size='2'><br />Erro ao consultar o animal</font></center><br>");
                                        out.print(ex.getMessage());
                                        out.print("<br>");
                                        out.print("<br>");
                                    }
                        %>

                        <jsp:include page="../geral/rodape.jsp" />
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
