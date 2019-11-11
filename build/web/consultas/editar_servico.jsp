<%-- 
    Document   : alterar_servico
    Created on : 26/10/2015, 18:19:30
    Author: maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@ page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@ page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>



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
                    <form action="editar_servico.jsp" method="post" name="Formulario" >
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">

                            <tr>
                                <td colspan="2">

                                    <%
                                        int op = 0;
                                        try {
                                            op = Integer.parseInt(Util.SoNumero(request.getParameter("op")));

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }

                                        int idServico = Integer.parseInt(Util.SoNumero(request.getParameter("idServico")));
                                        String data = "";

                                        Servico servico = Servico.consultar(idServico);
                                        data = servico.getData().toLocaleString().substring(0, 10);

                                        try {
                                            if (op == 0) {
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


                                                <select name="servico" id="servico">
                                                    <option value="Consulta"   <%if (servico.getNome().equals("Consulta")) {%> selected="true" <%}%>  >Consulta Veterinária</option>
                                                    <option value="Banho" <%if (servico.getNome().equals("Banho")) {%> selected="true" <%}%> >Banho</option>
                                                    <option value="Tosa" <%if (servico.getNome().equals("Tosa")) {%> selected="true" <%}%> >Tosa</option>
                                                    <option value="Vacina" <%if (servico.getNome().equals("Vacina")) {%> selected="true" <%}%> >Vacina</option>
                                                    <option value="Vacina" <%if (servico.getNome().equals("Cirurgia")) {%> selected="true" <%}%> >Cirurgia</option>
                                                    <option value="Vacina" <%if (servico.getNome().equals("AtendimentoEmergencia")) {%> selected="true" <%}%> >Atendimento Emergencia</option>
                                                    <option value="Vacina" <%if (servico.getNome().equals("Parto")) {%> selected="true" <%}%> >Parto</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="162" height="27" valign="top" class="Txt">Nome / Descrição </td>
                                            <td width="436" valign="top" class="Txt">
                                                <input name="nome" value="<%  out.print(servico.getNome());%>"type="text" id="nome" size="50" maxlength="100">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td height="27" valign="top" class="Txt">Valor R$ </td>
                                            <td valign="top" class="Txt">
                                                <input name="valor" value="<%  out.print(servico.getValor());%>" type="text"  size="11"  maxLength="10" onKeyUp="javascript:Sonumero(this)">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Data de execução</td>
                                            <td valign="top" class="Txt">


                                                <input type="text" value="<%  out.print(data);%>" name="data" >


                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Observacao</td>
                                            <td valign="top" class="Txt">

                                                <textarea name="observacao" rows="4" cols="50"><%
                                                    if (servico.getObservacao() != null && servico.getObservacao() != "" && servico.getObservacao() != "null") {
                                                        out.print(servico.getObservacao().trim());
                                                    }%></textarea>
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
                            <tr>
                                <td class="Txt" width="23%"></td>
                                <td class="Txt" width="77%">
                                    <input type="hidden" name="op" value="3" />
                                    <input type="hidden" name="idAnimal" value="<% out.print(servico.getAnimal().getIdAnimal());%>" />
                                    <input type="hidden" name="idServico" value="<% out.print(servico.getIdServico());%>" />
                                    <input type="button" name="Btn_Entrar" value="Alterar"  onClick="ValidarRegistro(document.Formulario);"    >
                                </td>
                            </tr>
                        </table>
                    </form>
                </td>
            </tr>




            <tr>
                <td class="Txt"></td>
                <td class="Txt">
                    <%

                        } else if (op == 3) {
                            String servicoEscolhido = "";
                            String nome = "";
                            int periodicidade = 0;
                            String novaData = "";

                    // objeto serviço
                            servicoEscolhido = request.getParameter("servico");
                            novaData = request.getParameter("data");

                            servico = Servico.consultar(servico.getIdServico());
                            if (Util.validarData(novaData)) {
                                servico.setData(new Date(novaData));
                            }

                            try {
                                nome = request.getParameter("nome");
                                if (nome == null || nome == "" || nome == "0") {
                                    throw new RuntimeException("Informe o nome ou descrição do serviço efetuado");
                                } else {
                                    servico.setNome(nome);
                                }
                            } catch (Exception ex) {
                                ex.printStackTrace();
                                throw new RuntimeException("Erro ao pegar o nome do serviço efetuado");
                            }

                            double valor = 0;
                            try {
                                valor = Double.parseDouble(request.getParameter("valor"));
                                servico.setValor(valor);
                            } catch (Exception ex) {
                                ex.printStackTrace();
                                throw new RuntimeException("Informe corretamente o valor do serviço executado");
                            }

                            String observacao = null;

                            try {
                                observacao = request.getParameter("observacao");
                                servico.setObservacao(observacao);
                            } catch (Exception ex) {
                                ex.printStackTrace();
                                throw new RuntimeException("Erro ao pegar o nome do serviço efetuado");
                            }

                            Servico.alterar(servico);
                            out.print("<br>");
                            out.print("<br>");
                            out.print("<br>");
                            out.print("<br><center><font face='verdana' color='blue'   size='2'><br />Serviço atualizado com sucesso!</font></center><br>");
                            out.print("<br>");
                            out.print("<br>");
                        } else {
                            throw new RuntimeException("Operação inválida");
                        }
                    %>


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