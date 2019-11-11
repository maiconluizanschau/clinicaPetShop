<%-- 
    Document   : consulta_pessoa
    Created on : 23/09/2015, 03:10:39
    Author: maicon

--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.ListIterator" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    try {
        int idPessoa = Integer.parseInt(Util.SoNumero(request.getParameter("idPessoa")));

        Pessoa pessoa = Pessoa.consultar(idPessoa);
%>
<html>
    <jsp:include page="../geral/head.jsp" />
    <body>
        <form action="utilizador.jsp" method="post" name="Formulario" >

            <table width="1366" border="0" cellpadding="0" cellspacing="0" align="center">

                <tr>
                    <td colspan="2">
                        <jsp:include page="../geral/topo.jsp" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                    </td>
                </tr>


                <% if (pessoa.getTipo() == 2) { //PJ%>
                <tr id="campo_hiddenPJ"  >
                    <td  height="104" colspan="2" valign="top">

                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                            <!--DWLayoutTable-->
                            <tr>
                                <td height="1" colspan="2" valign="top"><hr size="1"></td>
                            </tr>
                            <tr>
                                <td height="22" colspan="2" valign="top" class="Txt"><strong>PESSOA JURÍDICA </strong></td>
                            </tr>
                            <tr>
                                <td width="162" height="27" valign="top" class="Txt">RAZÃO SOCIAL</td>
                                <td width="436" valign="top" class="Txt"><%out.print(pessoa.getNome());%></td>
                            </tr>

                            <tr>
                                <td height="27" valign="top" class="Txt">CNPJ</td>
                                <td valign="top" class="Txt">
                                    <%
                                        Pessoa pj = Pessoa.consultar(pessoa.getIdPessoa());
                                        out.print(pj.getDocReceita().getNumero());
                                    %>
                                </td>
                            </tr>
                        </table>
                    </td>

                </tr>
                <%} else {%>
                <tr id="campo_hiddenPF" >
                    <td  height="104" colspan="2" valign="top">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                            <!--DWLayoutTable-->
                            <tr>
                                <td height="1" colspan="2" valign="top"><hr size="1"></td>
                            </tr>
                            <tr>
                                <td height="22" colspan="2" valign="top" class="Txt"><strong>PESSOA F&Iacute;SICA </strong></td>
                            </tr>
                            <tr>
                                <td width="162" height="27" valign="top" class="Txt">Nome Completo </td>
                                <td width="436" valign="top" class="Txt"> <%out.print(pessoa.getNome());%></td>
                            </tr>
                            <tr>
                                <td height="27" valign="top" class="Txt">CPF</td>
                                <td valign="top" class="Txt">
                                    <%
                                        Pessoa pf = Pessoa.consultar(idPessoa);
                                        out.print(pf.getDocReceita().getNumero());
                                    %>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <%}%>

                <tr>
                    <td id="contato" height="104" colspan="2" valign="top">

                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                            <!--DWLayoutTable-->

                            <tr>
                                <td colspan="2"><hr size="1"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="Txt"><strong>USUARIO DO SISTEMA</strong></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td width="162" height="27" valign="top" class="Txt">E-mail</td>
                                <td width="436" valign="top" class="Txt">
                                    <%
                                        out.print(pessoa.getEmail());
                                    %>
                                </td>
                            </tr>
                            <tr>
                                <td width="162" height="27" valign="top" class="Txt">Senha</td>
                                <td width="436" valign="top" class="Txt">******</td>
                            </tr>

                            <tr>
                                <td colspan="2"><hr size="1"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="Txt"><strong>CONTATO</strong></td>
                                <td></td>
                            </tr>
                            <%
                                ArrayList<Telefone> telefones = new ArrayList<Telefone>();

                                telefones = (ArrayList<Telefone>) Telefone.consultar(pessoa);

                                for (int i = 0; i <= 2; i++) {

                                    if (i == 0) {
                                        try {
                            %>
                            <tr>
                                <td class="Txt">Telelefone</td>
                                <td class="Txt">
                                    <%
                                        out.print(telefones.get(i).getDdd() + " - " + telefones.get(i).getNumero());
                                    %>
                                </td>
                                <td></td>
                            </tr>
                            <%
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                            %>
                            <%
                                if (i == 1) {
                                    try {
                            %>

                            <tr>
                                <td class="Txt">Celular</td>
                                <td class="Txt">
                                    <%
                                        out.print(telefones.get(i).getDdd() + " - " + telefones.get(i).getNumero());
                                    %>
                                </td>
                                <td></td>
                            </tr>
                            <%
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }

                                if (i == 2) {
                                    try {

                            %>
                            <tr>
                                <td class="Txt">Fax</td>
                                <td class="Txt">
                                    <%                                    out.print(telefones.get(i).getDdd() + " - " + telefones.get(i).getNumero());
                                    %>
                                </td>
                                <td></td>
                            </tr>
                            <%
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    }

                                }%>
                            <tr>
                                <td colspan="2"><hr size="1"></td>
                                <td></td>
                            </tr>

                            <%

                                ArrayList<Endereco> enderecos = Endereco.consultar(pessoa);

                                for (ListIterator iter = enderecos.listIterator(); iter.hasNext();) {
                                    Endereco end = (Endereco) iter.next();
                            %>
                            <tr>
                                <td colspan="2" class="Txt"><strong>ENDERE&Ccedil;O</strong></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="Txt">LOGRADOURO</td>
                                <td class="Txt"><% out.print(end.getLogradouro()); %></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="Txt">Nº</td>
                                <td class="Txt"><% out.print(end.getNumero());%>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="Txt">Complemento</td>
                                <td class="Txt"><% out.print(end.getComplemento());%>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="Txt">Bairro</td>
                                <td class="Txt"><%out.print(end.getBairro());%>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="Txt">Cidade</td>
                                <td class="Txt"><%out.print(end.getCidade());%>
                                </td>
                                <td></td>
                            </tr>

                            <tr id="estados" >
                                <td class="Txt">Estado</td>
                                <td class="Txt"><%out.print(end.getUf());%>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="Txt">CEP</td>
                                <td class="Txt"><%out.print(end.getCep());%>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                                <td></td>
                            </tr>
                            <%}%>
                        </table>
                        <jsp:include page="../geral/rodape.jsp" />
                        <%
                            } catch (Exception e) {
                                out.print("<br>");
                                out.print("<center><font face='verdana' color='red'   size='2'>Erro ao consultar Utilizador" + e.getMessage() + "</font></center>");
                                out.print(e.getMessage());
                            }
                        %>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>