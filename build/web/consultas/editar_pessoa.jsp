<%-- 
    Document   : editar_pessoa
    Created on : 24/10/2015, 17:07:53
    Author: maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.ListIterator" %>
<%@ page import="java.util.Collection" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <jsp:include page="../geral/head.jsp" />
    <body>

        <form action="editar_pessoa.jsp" method="post" name="Formulario" >

            <table width="750" border="0" cellpadding="0" cellspacing="0" align="center">

                <tr>
                    <td colspan="2">
                        <jsp:include page="../geral/topo.jsp" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <%

                            //iniciando variáveis
                            int op = 0;
                            String tipo = null;
                            int idPessoa = 0;
                            Pessoa p = null;
                            String nome = "";
                            String razao = "";
                            String docReceita = "";
                            int dddTel = 0;
                            String Tel = "";
                            int dddCel = 0;
                            String Cel = "";
                            int dddFax = 0;
                            String Fax = "";

                            try {
                                if (!request.getParameter("op").isEmpty()) {
                                    op = Integer.parseInt(request.getParameter("op"));
                                }
                            } catch (Exception ex) {
                                throw new RuntimeException("<center><font face='verdana' color='red'   size='2'>Erro ao tentar localizar dados da pessoa.<br /> Verifique os dados e tente novamente</font></center>");
                            }

                            try {
                                idPessoa = Integer.parseInt(Util.SoNumero(request.getParameter("idPessoa")));
                            } catch (Exception e) {
                                throw new RuntimeException("<center><font face='verdana' color='red'   size='2'>Erro ao tentar localizar dados da pessoa.<br /> Verifique os dados e tente novamente</font></center>");
                            }

                            p = new PF().consultar(idPessoa);

                            try {
                                if (op == 1) {

                                    try {
                                        idPessoa = Integer.parseInt(Util.SoNumero(request.getParameter("idPessoa")));
                                    } catch (Exception e) {
                                        throw new RuntimeException("<center><font face='verdana' color='red'   size='2'>Erro ao tentar localizar dados da pessoa.<br /> Verifique os dados e tente novamente</font></center>");
                                    }

                                    try {
                                        tipo = request.getParameter("Tipo");
                                    } catch (Exception ex) {
                                    }
                                    if (tipo == "PJ") {

                                        p = new PJ().consultar(idPessoa);
                                        try {
                                            nome = request.getParameter("razao");
                                            docReceita = request.getParameter("CNPJ");
                                            docReceita = Util.SoNumero(docReceita);
                                            //pessoa juridica
                                        } catch (Exception ex) {
                                            throw new RuntimeException("<center><font face='verdana' color='red'   size='2'>Erro ao cadastrar Utilizador.<br /> Verifique os dados de Pessoa Jurídica tente novamente</font></center>");
                                        }
                                    } else {

                                        p = new PF().consultar(idPessoa);

                                        try {
                                            nome = request.getParameter("Nome");
                                            docReceita = request.getParameter("CPF");
                                            docReceita = Util.SoNumero(docReceita);
                                        } catch (Exception ex) {
                                            throw new RuntimeException("<center><font face='verdana' color='red'   size='2'>Erro ao cadastrar Utilizador.<br /> Verifique os dados de Pessoa física tente novamente</font></center>");
                                        }
                                    }
                                    //Endereço da pessoa
                                    Endereco endereco = new Endereco();
                                    String logradouro = "";
                                    String numero = "";
                                    String complemento = "";
                                    String bairro = "";
                                    String cep = "";
                                    String cidade = "";
                                    String uf = "";

                                    //Endereço
                                    List<Endereco> novoEndereco = new ArrayList<Endereco>();
                                    try {
                                        logradouro = request.getParameter("logradouro");
                                        numero = request.getParameter("Numero");
                                        complemento = request.getParameter("Complemento");
                                        bairro = request.getParameter("Bairro");
                                        cep = Util.SoNumero(request.getParameter("CEP"));
                                        cidade = request.getParameter("Cidade");
                                        uf = request.getParameter("uf");
                                        if (logradouro == "" || numero == "" || bairro == "" || cidade == "" || uf == "" || cep == "") {
                                            throw new RuntimeException("O endereço deve conter logradouro, número, Bairro, Cidade, Estado e CEP");
                                        } else {
                                            endereco.setLogradouro(logradouro);
                                            endereco.setBairro(bairro);
                                            endereco.setCep(cep);
                                            endereco.setCidade(cidade);
                                            endereco.setComplemento(complemento);
                                            endereco.setNumero(numero);
                                            endereco.setUf(uf);
                                        }
                                    } catch (Exception ex) {
                                        throw new RuntimeException("Logradouro é um campo obrigatório");
                                    }

                                    //Telefones
                                    ArrayList<Telefone> telefone = new ArrayList<Telefone>();
                                    try {
                                        dddTel = Integer.parseInt(Util.SoNumero(request.getParameter("TelDDD")));
                                        Tel = Util.SoNumeroTel(request.getParameter("Tel"));
                                    } catch (Exception eTel) {
                                    }
                                    try {
                                        dddCel = Integer.parseInt(Util.SoNumero(request.getParameter("TelCelDDD")));
                                        Cel = Util.SoNumeroTel(request.getParameter("TelCel"));
                                    } catch (Exception eCel) {
                                    }
                                    try {
                                        dddFax = Integer.parseInt(Util.SoNumero(request.getParameter("TelFaxDDD")));
                                        Fax = Util.SoNumeroTel(request.getParameter("TelFax"));
                                    } catch (Exception eFax) {
                                    }

                                    if (dddTel != 0 && Tel != "") {
                                        telefone.add(new Telefone(dddTel, Tel, p));
                                    }

                                    if (dddCel != 0 && Cel != "") {
                                        telefone.add(new Telefone(dddCel, Cel, p));
                                    }

                                    if (dddFax != 0 && Fax != "") {
                                        telefone.add(new Telefone(dddFax, Fax, p));
                                    }

                                    //Excluindo endereço anterior
                                    List<Endereco> end = endereco.consultar(p);
                                    for (int i = 0; i < end.size(); i++) {
                                        Endereco.excluir(end.get(i));
                                    }

                                    //Excluindo Telefones anteriores
                                    List<Telefone> tel = (List<Telefone>) Telefone.consultar(p);
                                    for (int i = 0; i < tel.size(); i++) {
                                        Telefone.excluir(tel.get(i));
                                    }

                                    p.setNome(nome);
                                    endereco.setPessoa(p);
                                    novoEndereco.add(endereco);
                                    p.setEndereco(novoEndereco);
                                    p.setTelefone(telefone);
                                    p.alterar(p);

                                    out.print("<br>");
                                    out.print("<br>");
                                    out.print("<br>");
                                    out.print("<center><font face='verdana' color='blue'   size='2'>Utilizador cadastrado com sucesso</font></center>");
                                    out.print("<br>");
                                    out.print("<br>");
                                    out.print("<br>");

                                } else if (op == 2) {

                        %>
                    </td>
                </tr>
                <tr>
                    <td width="162" class="Txt">Tipo</td>
                    <td width="436" class="Txt">
                        <select name="Tipo" id="Tipo" onChange="showCampo(document.forms[0][this.name].options[document.forms[0][this.name].selectedIndex].value, 'campo_hidden');">
                            <option  <%if (p.getTipo() == 2) {%>  selected <%}%> value="PJ" >PJ</option>
                            <option  <%if (p.getTipo() == 1) {%>  selected <%}%> value="PF" >PF</option>
                        </select>
                    </td>

                </tr>

                <tr id="campo_hiddenPJ" style<% if (p.getTipo() == 2) {%> ="display:''" <%} else {%> ="display:none" <%}%>>
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
                                                                                <td width="436" valign="top" class="Txt"><input name="razao" value="<% if (p.getTipo() == 2) {
                                        out.print(p.getNome());
                                    }%>" type="text" id="razao" size="50" maxlength="100">
                                    <span class="style1">*</span></td>
                            </tr>
                            <tr>
                                <td height="27" valign="top" class="Txt">CNPJ</td>
                                <td valign="top" class="Txt">
                                    <input name="CNPJ"
                                           type="text"
                                           id="CNPJ"
                                           OnKeyPress="formatar(this, '##.###.###/####-##')"
                                           onKeyUp="javascript:Sonumero(this)"
                                           size="24"
                                           maxLength="18"
                                           value="<% if (p.getTipo() == 2) {
                                                   out.print(p.getDocReceita().getNumero());
                                               }%>" >
                                    + </td>
                            </tr>
                        </table>
                    </td>

                </tr>

                <tr id="campo_hiddenPF" style<% if (p.getTipo() == 1) {%> ="display:''" <%} else {%> ="display:none" <%}%>>
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
                                <td width="436" valign="top" class="Txt">
                                    <input
                                        name="Nome"
                                        value="<% if (p.getTipo() == 1) {
                                                out.print(p.getNome());
                                            }%>"
                                        type="text"
                                        id="Nome"
                                        size="50"
                                        maxlength="100">
                                    <span class="style1">*</span></td>
                            </tr>
                            <tr>
                                <td height="27" valign="top" class="Txt">CPF</td>
                                <td valign="top" class="Txt">
                                    <input
                                        name="CPF"
                                        type="text"
                                        id="CPF"
                                        OnKeyPress="formatar(this, '###.###.###-##')"
                                        onKeyUp="javascript:Sonumero(this)"
                                        size=17
                                        maxlength="14"
                                        value="<% if (p.getTipo() == 1) {
                                                out.print(p.getDocReceita().getNumero());
                                            }%>">
                                    + </td>
                            </tr>
                        </table>
                    </td>

                </tr>


                <tr>
                    <td id="contato" height="104" colspan="2" valign="top">

                        <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                            <!--DWLayoutTable-->


                            <tr>
                                <td colspan="3"><hr size="1"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="Txt"><strong>TELEFONES</strong></td>
                            </tr>
                            <%
                                List<Telefone> telefones = new ArrayList<Telefone>();
                                telefones = (List<Telefone>) Telefone.consultar(p);

                                for (int i = 0; i <= 2; i++) {
                                    if (i == 0) {
                                        try {
                            %>
                            <tr>
                                <td class="Txt">Telefone</td>
                                <td colspan="2" class="Txt">
                                    <%if (telefones.size() >= 1) {%>
                                    (<input name="TelDDD" value="<%out.print(telefones.get(i).getDdd());%>" type="text" id="TelDDD" onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">)
                                    <input name="Tel" value="<%out.print(telefones.get(i).getNumero());%>" type="text" id="Tel"  OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10">
                                    <%} else {%>
                                    (<input name="TelDDD"  type="text" id="TelDDD" onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">)
                                    <input name="Tel"  type="text" id="Tel"  OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10">

                                    <%}%>
                                </td>
                            </tr>
                            <%
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                if (i == 1) {
                                    try {
                            %>

                            <tr>
                                <td class="Txt">Telefone</td>
                                <td colspan="2" class="Txt">

                                    <%if (telefones.size() >= 2) {%>
                                    (<input name="TelCelDDD" value="<%out.print(telefones.get(i).getDdd());%>" type="text" onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">)
                                    <input name="TelCel" value="<%out.print(telefones.get(i).getNumero());%>" type="text" OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10">

                                    <%} else {%>
                                    (<input name="TelCelDDD"  onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">)
                                    <input name="TelCel"  type="text" OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10">

                                    <%}%>
                                </td>
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
                                <td class="Txt">Telefone</td>
                                <td colspan="2" class="Txt">
                                    <%if (telefones.size() >= 3) {%>
                                    (<input name="TelFaxDDD" value="<%out.print(telefones.get(i).getDdd());%>" type="text" onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">)
                                    <input name="TelFax" value="<%out.print(telefones.get(i).getNumero());%>" type="text" OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10">
                                    <%} else {%>
                                    (<input name="TelFaxDDD"  type="text" onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">)
                                    <input name="TelFax"  type="text" OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10">
                                    <%}%>
                                </td>
                            </tr>
                            <%
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    }
                                }
                            %>
                            <tr>
                                <td colspan="3"><hr size="1"></td>
                                <td></td>
                            </tr>
                            <%
                                List<Endereco> enderecos = Endereco.consultar(p);

                                for (ListIterator iter = enderecos.listIterator(); iter.hasNext();) {
                                    Endereco end = (Endereco) iter.next();
                            %>
                            <tr>
                                <td colspan="3" class="Txt"><strong>ENDERE&Ccedil;O</strong></td>
                            </tr>
                            <tr>
                                <td class="Txt">LOGRADOURO</td>
                                <td colspan="2" class="Txt"><input name="logradouro" value="<%out.print(end.getLogradouro());%>" type="text" size="50" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td class="Txt">Nº</td>
                                <td colspan="2" class="Txt"><input name="Numero" value="<%out.print(end.getNumero());%>" type="text" size="10" maxlength="10"></td>
                            </tr>
                            <tr>
                                <td class="Txt">Complemento</td>
                                <td colspan="2" class="Txt"><input name="Complemento" value="<%out.print(end.getComplemento());%>" type="text" size="30" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td class="Txt">Bairro</td>
                                <td colspan="2" class="Txt"><input name="Bairro" value="<%out.print(end.getBairro());%>"  type="text" size="30" maxlength="50"></td>
                            </tr>
                            <tr>
                                <td class="Txt">Cidade</td>
                                <td colspan="2" class="Txt"><input name="Cidade"  value="<%out.print(end.getCidade());%>" type="text" size="30" maxlength="50"></td>
                            </tr>

                            <tr id="estados" >
                                <td class="Txt">Estado</td>
                                <td colspan="2" class="Txt">
                                    <select name="uf">
                                        <option value="AC">AC</option>
                                        <option value="AL">AL</option>
                                        <option value="AP">AP</option>
                                        <option value="AM">AM</option>
                                        <option value="BA">BA</option>
                                        <option value="CE">CE</option>
                                        <option value="DF">DF</option>
                                        <option value="ES">ES</option>
                                        <option value="GO">GO</option>
                                        <option value="MA">MA</option>
                                        <option value="MT">MT</option>
                                        <option value="MS">MS</option>
                                        <option value="MG">MG</option>
                                        <option value="PA">PA</option>
                                        <option value="PB">PB</option>
                                        <option value="PR">PR</option>
                                        <option value="PE">PE</option>
                                        <option value="PI">PI</option>
                                        <option value="RJ">RJ</option>
                                        <option value="RN">RN</option>
                                        <option value="RS">RS</option>
                                        <option value="RO">RO</option>
                                        <option value="RR">RR</option>
                                        <option value="SC">SC</option>
                                        <option value="SP">SP</option>
                                        <option value="SE">SE</option>
                                        <option value="TO">TO</option>
                                        <option selected="true" value="<%out.print(end.getUf());%>"><%out.print(end.getUf());%></option>
                                    </select></td>
                            </tr>
                            <tr>
                                <td class="Txt">CEP</td>
                                <td colspan="2" class="Txt">
                                    <input name="CEP" value="<%out.print(end.getCep());%>"  type="text" OnKeyPress="formatar(this, '#####-###')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="9">
                                    + </td>
                            </tr>
                            <%}%>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="Txt" width="23%">&nbsp;</td>
                    <td class="Txt" width="77%">
                        <input type="hidden" name="op" value="1" />
                        <input type="hidden" name="idPessoa" value="<%out.print(p.getIdPessoa());%>" />
                        <input type="button" name="Btn_Entrar" value="Alterar"  onClick="Validar(document.Formulario);"    >
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <%
                                }
                            } catch (Exception e) {
                                out.print("<br>");
                                out.print("<center><font face='verdana' color='red'   size='2'>Erro ao cadastrar</font></center>");
                                out.print("<center><font face='verdana' color='red'   size='2'>" + e.getMessage() + "</font></center>");
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
        </form>
    </body>
</html>