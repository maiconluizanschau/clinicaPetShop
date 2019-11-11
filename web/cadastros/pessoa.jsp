<%-- 
    Document   : pessoa
    Created on : 22/10/2015, 20:56:23
    Author: maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <jsp:include page="../geral/head.jsp" />
    <body>
    <head>


    <form action="pessoa.jsp" method="post" name="Formulario" >


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
                        String tipo = null;
                        Pessoa pessoa = null;
                        String username = null;
                        String senha = null;
                        DocReceita docReceita = null;

                        try {
                            op = Integer.parseInt(Util.SoNumero(request.getParameter("op")));
                        } catch (Exception ex) {
                        }

                        try {
                            if (op == 1) {//O formulário foi enviado
                                try {
                                    tipo = request.getParameter("Tipo");
                                } catch (Exception ex) {
                                }
                                if (tipo == "PJ") {
                                    String razao = null;
                                    try {
                                        razao = request.getParameter("razao");
                                        docReceita = new CNPJ(request.getParameter("CNPJ"));
                                        //uma pessoa juridica
                                        pessoa = new PJ();
                                        pessoa.setDocReceita(docReceita);
                                        pessoa.setNome(razao);
                                        docReceita.setPessoa(pessoa);
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                        throw new RuntimeException("<center>"
                                                + "<font face='verdana' color='red'   "
                                                + "size='2'>Erro ao cadastrar Utilizador."
                                                + "<br /> Verifique os dados de Pessoa Jurídica"
                                                + " tente novamente</font></center>");
                                    }
                                } else {
                                    try {
                                        String nome = request.getParameter("Nome");
                                        docReceita = new CPF(request.getParameter("CPF"));
                                        // pessoa física
                                        pessoa = new PF();
                                        pessoa.setDocReceita(docReceita);
                                        pessoa.setNome(nome);
                                        docReceita.setPessoa(pessoa);
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                        throw new RuntimeException("<center>"
                                                + "<font face='verdana' color='red' "
                                                + "  size='2'>Erro ao cadastrar Utilizador."
                                                + "<br /> Verifique os dados de Pessoa física"
                                                + " tente novamente</font></center>");
                                    }
                                }
                                // pessoa com o CPF ou CNPJ informado
                                if (pessoa.existe(docReceita) == true) {
                                    if (pessoa.getTipo() == 1) {
                                        throw new RuntimeException("<br>"
                                                + "<center><font face='verdana' "
                                                + "color='red'   size='2'><br />"
                                                + "já existe cliente cadastrado com"
                                                + " o CPF informado</font></center><br>");
                                    } else {
                                        throw new RuntimeException("<br>"
                                                + "<center><font face='verdana' "
                                                + "color='red'   size='2'><br />"
                                                + "já existe cliente cadastrado com"
                                                + " o CNPJ informado</font></center><br>");

                                    }
                                }
                                try {
                                    username = request.getParameter("email");
                                    senha = request.getParameter("senha");
                                } catch (Exception ex) {
                                    throw new RuntimeException("Verifique "
                                            + "se o e-mail e senha foram "
                                            + "digitados corretamente");
                                }
                                if (username == "" || senha == "") {
                                    throw new RuntimeException("<center>"
                                            + "<font face='verdana' color='red'"
                                            + " size='2'><br />Verifique o e-mail "
                                            + "e senha foram digitados corretamente"
                                            + "</font></center>");
                                } else if (pessoa.existe(username) == true) {
                                    throw new RuntimeException("<br><center>"
                                            + "<font face='verdana' color='red' "
                                            + " size='2'><br />já existe usuário "
                                            + "cadastrado com o e-mail digitado</font>"
                                            + "</center><br>");
                                } else {
                                    pessoa.setEmail(username);
                                    pessoa.setSenha(senha);
                                }
                                //Telefone da pessoa
                                ArrayList<Telefone> telefone = new ArrayList<Telefone>();
                                try {
                                    int dddTel = Integer.parseInt(Util.SoNumero(request.getParameter("TelDD")));
                                    String Tel = Util.SoNumero(request.getParameter("Tel"));
                                    if (dddTel != 0 && Tel != "") {
                                        telefone.add(new Telefone(dddTel, Tel, pessoa));
                                    }
                                } catch (Exception eTel) {
                                }
                                try {
                                    int dddCel = Integer.parseInt(Util.SoNumero(request.getParameter("TelCelDD")));
                                    String Cel = Util.SoNumero(request.getParameter("TelCel"));
                                    if (dddCel != 0 && Cel != "") {
                                        telefone.add(new Telefone(dddCel, Cel, pessoa));
                                    }
                                } catch (Exception eCel) {
                                }
                                try {
                                    int dddFax = Integer.parseInt(Util.SoNumero(request.getParameter("TelFaxDD")));
                                    String Fax = Util.SoNumero(request.getParameter("TelFax"));
                                    if (dddFax != 0 && Fax != "") {
                                        telefone.add(new Telefone(dddFax, Fax, pessoa));
                                    }
                                } catch (Exception eFax) {
                                }
                                //Endereços da pessoa
                                ArrayList<Endereco> end = new ArrayList<Endereco>();
                                Endereco endereco = new Endereco();
                                String logradouro = "";
                                String numero = "";
                                String complemento = "";
                                String bairro = "";
                                String cep = "";
                                String cidade = "";
                                String uf = "";
                                try {
                                    logradouro = request.getParameter("logradouro");
                                    numero = request.getParameter("Numero");
                                    complemento = request.getParameter("Complemento");
                                    bairro = request.getParameter("Bairro");
                                    cep = Util.SoNumero(request.getParameter("CEP"));
                                    cidade = request.getParameter("Cidade");
                                    uf = request.getParameter("uf");
                                    if (logradouro == "" || numero == ""
                                            || bairro == "" || cidade == ""
                                            || uf == "" || cep == "") {
                                        throw new RuntimeException("O endereço deve conter"
                                                + " logradouro, número, Bairro, "
                                                + "Cidade, Estado e CEP");
                                    } else {
                                        endereco.setLogradouro(logradouro);
                                        endereco.setBairro(bairro);
                                        endereco.setCep(cep);
                                        endereco.setCidade(cidade);
                                        endereco.setComplemento(complemento);
                                        endereco.setNumero(numero);
                                        endereco.setUf(uf);
                                        endereco.setPessoa(pessoa);
                                        end.add(endereco);
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    throw new RuntimeException("Logradouro é um campo obrigatório");
                                }
                                //Salvando a pessoa e todos os seua relacionamentos em banco de dados
                                //Adicionando a Pessoa
                                pessoa.setTelefone(telefone);
                                pessoa.setEndereco(end);
                                pessoa.setAnimal(null);
                                //Salvando
                                pessoa.salvar(pessoa);
                                out.print("<br>");
                                out.print("<br>");
                                out.print("<br>");
                                out.print("<center><font face='verdana' color='blue'   size='2'>Utilizador cadastrado com sucesso</font></center>");
                                out.print("<br>");
                                out.print("<br>");
                                out.print("<br>");
                            } else {//Se op for diferente de 1
                    %>

                </td>
            </tr>
            <tr>
                <td width="162" class="Txt">Tipo</td>
                <td width="436" class="Txt">
                    <select name="Tipo" id="Tipo" onChange="showCampo(document.forms[0][this.name].options[document.forms[0][this.name].selectedIndex].value, 'campo_hidden');">
                        <option value="0">Selecione</option>
                        <option value="PJ">PJ</option>
                        <option value="PF">PF</option>
                    </select>
                </td>
            </tr>
            <tr id="campo_hiddenPJ" style="display:none">
                <td  height="104" colspan="2" valign="top">

                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <!--DWLayoutTable-->
                        <tr>
                            <td height="1" colspan="2" valign="top"><hr size="1"></td>
                        </tr>
                        <tr>
                            <td height="22" colspan="2" valign="top" class="Txt"><strong>PESSOA JURÍDICA </strong></td>
                        </tr>
                        <tr>
                            <td width="23%" height="27" valign="top" class="Txt">RAZÃO SOCIAL</td>
                            <td width="77%" valign="top" class="Txt"><input name="razao" type="text" id="razao" size="50" maxlength="100">
                                <span class="style1">*</span></td>
                        </tr>

                        <tr>
                            <td height="27" valign="top" class="Txt">CNPJ</td>
                            <td valign="top" class="Txt"><input name="CNPJ" type="text" id="CNPJ" OnKeyPress="formatar(this, '##.###.###/####-##')" onKeyUp="javascript:Sonumero(this)" size="24"  maxLength="18" >
                                + </td>
                        </tr>
                    </table>
                </td>

            </tr>

            <tr id="campo_hiddenPF" style="display:none">
                <td  height="104" colspan="2" valign="top">

                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <!--DWLayoutTable-->
                        <tr>
                            <td height="1" colspan="2" valign="top"><hr size="1"></td>
                        </tr>
                        <tr>
                            <td height="22" colspan="2" valign="top" class="Txt"><strong>PESSOA FíSICA </strong></td>
                        </tr>
                        <tr>
                            <td width="20%"  valign="top" class="Txt">Nome Completo </td>
                            <td width="80%" valign="top" class="Txt"><input name="Nome" type="text" id="Nome" size="50" maxlength="100">
                                <span class="style1">*</span></td>
                        </tr>

                        <tr>
                            <td width="25%" valign="top" class="Txt">CPF</td>
                            <td width="75%" valign="top" class="Txt"><input name="CPF" type="text" id="CPF" OnKeyPress="formatar(this, '###.###.###-##')" onKeyUp="javascript:Sonumero(this)" size=17  maxlength="14">
                                + </td>
                        </tr>
                    </table>
                </td>

            </tr>
            <tr>
                <td id="contato" height="104" colspan="2" valign="top">

                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
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
                            <td width="436" valign="top" class="Txt"><input name="email" type="text" id="email" size="50" maxlength="200">
                                <span class="style1">*</span></td>
                        </tr>
                        <tr>
                            <td width="162" height="27" valign="top" class="Txt">Senha</td>
                            <td width="436" valign="top" class="Txt"><input name="senha" type="text" id="senha" size="50" maxlength="200">
                                <span class="style1">*</span></td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr size="1"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="Txt"><strong>CONTATO</strong></td>
                            <td></td>
                        </tr>

                        <tr>
                            <td class="Txt">Telelefone</td>
                            <td class="Txt">(<input name="TelDDD" type="text" id="TelDDD" onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">) <input name="Tel" type="text" id="Tel"  OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="Txt">Celular</td>
                            <td class="Txt">(<input name="TelCelDDD" type="text" onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">) <input name="TelCel" type="text" OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="Txt">Fax</td>
                            <td class="Txt">(<input name="TelFaxDDD" type="text" onKeyUp="javascript:Sonumero(this)" size="2" maxlength="2">) <input name="TelFax" type="text" OnKeyPress="formatar(this, '####-####')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="10"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr size="1"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="Txt"><strong>ENDEREÇO</strong></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="Txt">LOGRADOURO</td>
                            <td class="Txt"><input name="logradouro" type="text" size="50" maxlength="50"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="Txt">Nº</td>
                            <td class="Txt"><input name="Numero" type="text" size="10" maxlength="10"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="Txt">Complemento</td>
                            <td class="Txt"><input name="Complemento" type="text" size="30" maxlength="50"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="Txt">Bairro</td>
                            <td class="Txt"><input name="Bairro" type="text" size="30" maxlength="50"></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="Txt">Cidade</td>
                            <td class="Txt"><input name="Cidade" type="text" size="30" maxlength="50"></td>
                            <td></td>
                        </tr>

                        <tr id="estados" >
                            <td class="Txt">Estado</td>
                            <td class="Txt">
                                <select name="uf">
                                    <option value="">Selecione</option>
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
                                </select></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td class="Txt">CEP</td>
                            <td class="Txt">
                                <input name="CEP" type="text" OnKeyPress="formatar(this, '#####-###')" onKeyUp="javascript:Sonumero(this)" size="12" maxlength="9">
                                + </td>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td></td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <td class="Txt" width="20"></td>
                <td class="Txt" width="80" align="left">
                    <input type="hidden" name="op" value="1" />
                    <input type="button" name="Btn_Entrar" value="Cadastrar"  onClick="Validar(document.Formulario);"    >
                </td>
            </tr>
            <tr><td></td></tr>
            <%}
                } catch (Exception e) {
                    out.print("<br>");
                    out.print("<center><font face='verdana' color='red'   size='2'>"
                            + "Erro ao cadastrar Utilizador</font></center>");
                    out.print(e.getMessage());
                }
            %>
            <tr>
                <td colspan="2">
                    <jsp:include page="../geral/rodape.jsp" />
                </td>
            </tr>
        </table>
    </form>

</body>
</html>