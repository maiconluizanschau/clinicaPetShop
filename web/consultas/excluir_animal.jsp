<%-- 
    Document   : excluir_animal
    Created on : 30/11/2015, 10:43:29
    Author: maicon

--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@ page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.ListIterator" %>

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
                <td colspan="2">
                    <%
                        int op = 0;
                        int idAnimal = 0;
                        Animal a = null;

                        try {
                            if (!request.getParameter("op").isEmpty()) {
                                op = Integer.parseInt(request.getParameter("op"));
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                        try {
                            if (!request.getParameter("idAnimal").isEmpty()) {
                                idAnimal = Integer.parseInt(Util.SoNumero(request.getParameter("idAnimal")));
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                        a = Animal.consultar(idAnimal);
                        try {
                            if (op == 1 && idAnimal > 0) { //Op =1 : Deletar

                                Animal.excluir(a);

                                out.print("<br>");
                                out.print("<br>");
                                out.print("<br>");
                                out.print("<center><font face='verdana' color='blue'   size='2'>Registro excluído com sucesso</font></center>");
                                out.print("<br>");
                                out.print("<br>");
                                out.print("<br>");
                    %>




                    <%} else {%>

                    <table border="0" width="100%">
                        <thead>
                            <tr  class="TextoTit" align="center">
                                <th colspan="2" height="50">Esta operação excluirá o <%out.print(a.getDescricao());%> de&nbsp;<font color="blue"><%out.print(a.getPessoa().getNome());%> </font> chamado:<font color="blue"> <%out.print(a.getNome());%> </font> </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="TextoTit">
                                <td colspan="2" align="center" height="60">Confirma a exclusão?</td>
                            </tr>
                            <tr align="center" >
                                <td width="50%" align="right" height="150"><form action="excluir_animal.jsp" method="post"  name="Formulario"> <input type="hidden" name="op" value="1"><input type="hidden" name="idAnimal" value="<%out.print(a.getIdAnimal());%>"><input type="submit"   name="btn_sim" value="SIM"></form></td>
                                <td width="50%" align="left" height="150"><form action="../consultas/animal.jsp" method="post"  name="Formulario"><input type="submit" name="btn_sim" value="NÃO" > </form></td>
                            </tr>
                        </tbody>
                    </table>


                    <%

                            }
                        } catch (Exception e) {
                            out.print("<br>");
                            out.print("<center><font face='verdana' color='red'   size='2'>Erro ao excluir </font></center>");
                            out.print("<center><font face='verdana' color='red'   size='2'>" + e.getMessage() + "<br>" + e.getCause() + "</font></center>");
                        }
                    %>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <jsp:include page="../geral/rodape.jsp" />

                </td>
            </tr>
        </table>

    </body>
</html>
