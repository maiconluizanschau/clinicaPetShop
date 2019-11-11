<%-- 
    Document   : editar_animal
    Created on : 29/09/2015, 04:58:03
    Author: maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ListIterator" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Date" %>

<%
    //Iniciando variaveis
    int op = 0;
    int idPessoa = 0;
    int idAnimal = 0;

    //verificando a variável op
    try {
        op = Integer.parseInt(Util.SoNumero(request.getParameter("op")));
    } catch (Exception ex) {
        ex.printStackTrace();
        throw new RuntimeException("Não foi informada a operação desejada!");
    }

    try {
        idAnimal = Integer.parseInt(Util.SoNumero(request.getParameter("idAnimal")));
    } catch (Exception ex) {
        ex.printStackTrace();
        throw new RuntimeException("É necessário informar o id do animal!");
    }

    //Listando pessoas
    List<Pessoa> pList = new ArrayList<Pessoa>();

    Animal animal;
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <jsp:include page="../geral/head.jsp" />
    <body>
        <form action="editar_animal.jsp" method="post" name="Formulario" >


            <table width="1366" border="0" cellpadding="0" cellspacing="0" align="center">

                <tr>
                    <td colspan="2">
                        <jsp:include page="../geral/topo.jsp" />
                    </td>
                </tr>
                <tr>
                    <td height="22" colspan="2" valign="top" class="Txt"><strong>ATUALIZAÇÃO DE ANIMAL DE ESTIMAÇÃO</strong></td>
                </tr>

                <tr>
                    <td colspan="2">
                        <%
                            try {
                                animal = Animal.consultar(idAnimal);
                            } catch (Exception ex) {
                                ex.printStackTrace();
                                throw new RuntimeException("Animal não encontrado");
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td ></td>
                </tr>
                <%if (op != 2) {%>
                <tr>
                    <td colspan="2">

                        <table width="750" border="0" cellpadding="0" cellspacing="0" align="center">
                            <tr>
                                <td width="23%" class="Txt">Dono do animal</td>
                                <td width="77%" class="Txt">
                                    <select name="idPessoa">
                                        <option value="0">  Selecione  </option>
                                        <%
                                            pList = Pessoa.consultar();
                                            for (ListIterator iter = pList.listIterator(); iter.hasNext();) {
                                                Pessoa achei = (Pessoa) iter.next();
                                        %>
                                        <option value="<% out.print(achei.getIdPessoa());%>"  <%if (animal.getPessoa().getIdPessoa() == achei.getIdPessoa()) {%> selected="true" <%}%>    ><% out.print(achei.getNome());%></option>

                                        <%
                                            }
                                        %>
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr size="1"></td>
                            </tr>

                        </table>

                    </td>
                </tr>
                <%}%>
                <% if (op == 1) {%>
                <tr>
                    <td colspan="2">

                        <table width="750" border="0" cellpadding="0" cellspacing="0" align="center">
                            <tr>
                                <td height="22" colspan="2" valign="top" class="Txt"><strong>ANIMAL</strong></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tr>
                                            <td width="162" class="Txt">Tipo</td>
                                            <td width="436" class="Txt">
                                                <select name="tipoAnimal" id="tipoAnimal">
                                                    <option value="1" <%if (animal.getTipo() == 1) {%> selected="true" <%}%>  >Cachorro</option>
                                                    <option value="2" <%if (animal.getTipo() == 2) {%> selected="true" <%}%>   >Gato</option>
                                                    <option value="3" <%if (animal.getTipo() == 3) {%> selected="true" <%}%>   >Repteis</option>
                                                    <option value="4" <%if (animal.getTipo() == 4) {%> selected="true" <%}%>   >Passaros</option>
                                                    <option value="5" <%if (animal.getTipo() == 5) {%> selected="true" <%}%>   >Peixes</option>
                                                    <option value="6" <%if (animal.getTipo() == 6) {%> selected="true" <%}%>   >Roedores</option>
                                                    <option value="7" <%if (animal.getTipo() == 7) {%> selected="true" <%}%>   >Animais Silvestres</option>

                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="162" height="27" valign="top" class="Txt">Nome</td>
                                            <td width="436" valign="top" class="Txt">
                                                <input  value="<%out.print(animal.getNome());%>" name="nome" type="text" id="nome" size="50" maxlength="100">
                                                <span class="style1">*</span></td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Raça</td>
                                            <td valign="top" class="Txt">
                                                <input value="<%out.print(animal.getRaca());%>" name="raca" type="text" id="raca"  size="24"  maxLength="50" >
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Data de Nascimento</td>
                                            <td valign="top" class="Txt">
                                                <input value="<%out.print(animal.getDataNascimento().toLocaleString().substring(0, 10));%>" name="dataNascimento" type="text"  size="11"  maxLength="10" OnKeyPress="formatar(this, '##/##/####')" onKeyUp="javascript:Sonumero(this)">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Sexo</td>
                                            <td valign="top" class="Txt">
                                                <select name="sexo" id="sexo">
                                                    <option value="M"  <%if (animal.getSexo() == 'M') {%> selected="true" <%}%> >Macho</option>
                                                    <option value="F"  <%if (animal.getSexo() == 'F') {%> selected="true" <%}%> >Femea</option>
                                                </select>
                                            <td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Observacao</td>
                                            <td valign="top" class="Txt">
                                                <textarea name="observacao" rows="4" cols="50">
                                                    <%
                                                        if (animal.getObservacao() != null) {
                                                            out.print(animal.getObservacao());
                                                        }
                                                    %>
                                                </textarea>
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
                                    <input type="hidden" name="op" value="2" />
                                    <input type="hidden" name="idAnimal" value="<%out.print(animal.getIdAnimal());%>" />
                                    <input type="button" name="Btn_Entrar" value="Alterar"  onClick="ValidarAnimal(document.Formulario);"    >
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <jsp:include page="../geral/rodape.jsp" />

                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>

                <%} else if (op == 2) {%>
                <tr>
                    <td colspan="2">
                        <%
                            //Pessoa
                            Pessoa pessoa = null;

                            //Animal
                            int tipoAnimal = 0;
                            String nome = null;
                            String raca = null;
                            String dataNascimento = null;
                            String sexo = null;
                            String observacao = null;

                            //Tipo, nome, data de nascimento e sexo são obrigatórios
                            try {
                                try {
                                    idPessoa = Integer.parseInt(Util.SoNumero(request.getParameter("idPessoa")));
                                    pessoa = Pessoa.consultar(idPessoa);
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    throw new RuntimeException("Erro ao construir o Objeto pessoa");
                                }

                                try {
                                    tipoAnimal = Integer.parseInt(Util.SoNumero(request.getParameter("tipoAnimal")));
                                    if (tipoAnimal == 0) {
                                        throw new RuntimeException("Selecione o Tipo do animal");
                                    } else {
                                        animal.setTipo(tipoAnimal);
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    throw new RuntimeException("Erro ao pegar o tipo do animal");
                                }

                                try {
                                    nome = request.getParameter("nome");
                                    if (nome == null || nome == "" || nome == "0") {
                                        throw new RuntimeException("Informe o nome do animal");
                                    } else {
                                        animal.setNome(nome);
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    throw new RuntimeException("Erro ao capturar o nome do animal");
                                }

                                try {
                                    raca = request.getParameter("raca");
                                    animal.setRaca(raca);
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    throw new RuntimeException("Erro ao capturar a raça do animal");

                                }

                                try {
                                    dataNascimento = request.getParameter("dataNascimento");

                                    //validar data e construir um objeto Date()
                                    if (dataNascimento == null || dataNascimento == "" || dataNascimento == "0") {
                                        throw new RuntimeException("Informe a data de nascimento do animal");
                                    } else if (Util.validarData(dataNascimento) != true) {
                                        throw new RuntimeException("A data de nascimento do animal é inválida");
                                    } else {
                                        animal.setDataNascimento(new Date(dataNascimento));
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                                try {
                                    sexo = request.getParameter("sexo");
                                    if (sexo == null || sexo == "" || sexo == "0") {
                                        throw new RuntimeException("Informe o sexo do animal");
                                    } else {
                                        animal.setSexo(sexo.charAt(0));
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    throw new RuntimeException("Informe o sexo do animal");

                                }

                                try {
                                    observacao = request.getParameter("observacao");
                                    if (observacao != "") {
                                        animal.setObservacao(observacao.trim());
                                    }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                    throw new RuntimeException("Erro ao pegar o parâmetro Observação");
                                }

                                animal.setIdAnimal(idAnimal);
                                animal.setPessoa(pessoa);
                                Animal.alterar(animal);
                                out.print("<br><center><font face='verdana' color='blue'   size='2'><br />Animal atualizado com sucesso em nosso banco de dados</font></center><br>");
                            } catch (Exception ex) {
                                ex.printStackTrace();
                                out.print("<br>");
                                out.print("<br>");
                                out.print("<br>");
                                out.print("<br><center><font face='verdana' color='red'   size='2'><br />Erro ao atualizar dados do animal</font></center><br>");
                                out.print("<br><center><font face='verdana' color='red'   size='2'><br />" + ex.getMessage() + "</font></center><br>");
                                out.print("<br>");
                                out.print("<br>");
                            }
                        %>
                        <jsp:include page="../geral/rodape.jsp" />

                    </td>
                <tr>
                    <% }//fim do if de op%>
            </table>
        </form>
    </body>
</html>
