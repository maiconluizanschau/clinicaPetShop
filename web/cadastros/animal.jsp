<%--
    Document   : animal.jsp
    Created on : 22/10/2015, 00:25:16
    Author: maicon

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*" %>
<%@page import="br.ufsm.sci.programacaoa.maicon.util.Util" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ListIterator" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Collection" %>
<%@page import="java.util.Date" %>

<%
//Operações:
// 0  Neste caso exibiremos o formulário pedindo para selecionar o
//     dono do animal
// 1 buscar os animais do dono:
// 2 registraremos o serviço executado.

//Iniciando a variável op
            int op = 0;
//verificando a variável op enviada pelo formulário:
            try {
                op = Integer.parseInt(Util.SoNumero(request.getParameter("op")));
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            List<Pessoa> pList = new ArrayList<Pessoa>();
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <jsp:include page="../geral/head.jsp" />
    <body>

        <table width="750" border="0" cellpadding="0" cellspacing="0" align="center">
            <tr>
                <td colspan="2">
                    <jsp:include page="../geral/topo.jsp" />
                </td>
            </tr>
            <tr>
                <td height="22" colspan="2" valign="top" class="Txt"><strong>CADASTRAMENTO DE ANIMAL DE ESTIMAÇÃO</strong></td>
            </tr>
            <tr>
                <td colspan="2"></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <%  if (op == 0) {%>
            <tr>
                <td colspan="2">
                    <form action="animal.jsp" method="post" name="Formulario" >

                        <table width="1366" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="7">
                            <tr>
                                <td width="162" class="Txt">Dono do animal</td>
                                <td width="436" class="Txt">
                                    <select name="idPessoa">
                                        <option value="0">  Selecione  </option>
                                        <%
                                  pList = Pessoa.consultar();
                                  for (ListIterator iter = pList.listIterator(); iter.hasNext();) {
                                      Pessoa achei = (Pessoa) iter.next();
                                %>
                                        <option value="<% out.print(achei.getIdPessoa());%>"><% out.print(achei.getNome());%></option>
                                        <%
                                  }
                                %>
                                    </select>
                                </td>

                            </tr>
                            <tr>
                                <td colspan="7"></td>
                            </tr>
                            <tr>
                                <td colspan="7"></td>
                            </tr>
                            <tr>
                                <td class="Txt"></td>
                                <td class="Txt"><input type="hidden" name="op" value="1" />
                                    <input type="button" name="Btn_Entrar" value="Prosseguir >>"  onClick="ValidarRegistro1(document.Formulario);"  >
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2"></td>
                            </tr>
                        </table>

                    </form>

                    <jsp:include page="../geral/rodape.jsp" />

                </td>
            </tr>
            <% } else if (op == 1) {%>
            <tr>
                <td colspan="7">
                    <form action="animal.jsp" method="post" name="Formulario" >

                        <table width="1366" border="0" cellpadding="0" cellspacing="0">
                            <%
                       int idPessoa = Integer.parseInt(Util.SoNumero(request.getParameter("idPessoa")));
                       Pessoa donoAnimal = Pessoa.consultar(idPessoa);
                      %>

                            <tr>
                                <td colspan="2">
                                    <input type="hidden" name="idPessoa" value="<%out.print(donoAnimal.getIdPessoa());%>" />
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="20%" class="TopoTit">CLIENTE: </td>
                                            <td class="TextoTit"><% out.print(donoAnimal.getNome());%></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7"><hr size="1"></td>
                            </tr>
                            <tr>
                                <td height="22" colspan="7" valign="top" class="Txt"><strong>ANIMAL</strong></td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tr>
                                            <td width="162" class="Txt">Tipo</td>
                                            <td width="436" class="Txt">
                                                <select name="tipoAnimal" id="tipoAnimal">
                                                    <option value="0">Selecione</option>
                                                    <option value="1">Cachorro</option>
                                                    <option value="2">Gato</option>
                                                    <option value="3">Passaros</option>
                                                    <option value="4">Repteis</option>
                                                    <option value="5">Roedores</option>
                                                    <option value="6">Peixes</option>
                                                    <option value="7">Animais Silvestres</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="162" height="27" valign="top" class="Txt">Nome</td>
                                            <td width="436" valign="top" class="Txt"><input name="nome" type="text" id="nome" size="50" maxlength="100">
                                            <span class="style1">*</span></td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Raça</td>
                                            <td valign="top" class="Txt"><input name="raca" type="text" id="raca"  size="24"  maxLength="50" ></td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Data de Nascimento</td>
                                            <td valign="top" class="Txt"><input name="dataNascimento" type="text"  size="11"  maxLength="10" OnKeyPress="formatar(this, '##/##/####')" onKeyUp="javascript:Sonumero(this)"></td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Sexo</td>
                                            <td valign="top" class="Txt">
                                                <select name="sexo" id="sexo">
                                                    <option value="0">Selecione</option>
                                                    <option value="M">Macho</option>
                                                    <option value="F">Femea</option>
                                                </select>
                                            <td>
                                        </tr>
                                        <tr>
                                            <td height="27" valign="top" class="Txt">Observacao</td>
                                            <td valign="top" class="Txt">
                                                <textarea name="observacao" rows="4" cols="50"></textarea>
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
                                    <input type="button" name="Btn_Entrar" value="Cadastrar"  onClick="ValidarAnimal(document.Formulario);"    >
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7"></td>
                            </tr>
                        </table>
                        <jsp:include page="../geral/rodape.jsp" />

                    </form>
                </td>
            </tr>
            <%} else if (op == 7) {%>
            <tr>
                <td colspan="7">
                    <%
     
                          //Declarando variáveis
                          //Pessoa
                          Pessoa pessoa = null;
                          int idPessoa = 0;

                          //Animal
                          Animal animal = null;
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
                                  if (tipoAnimal == 1) {
                                      animal = new Cachorro();
                                  } else if (tipoAnimal == 2) {
                                      animal = new Gato();
                                  } else if (tipoAnimal == 3) {
                                      animal = new Passaros();
                                  }   else if (tipoAnimal == 4) {
                                      animal = new Repteis();
                                      }   else if (tipoAnimal == 5) {
                                      animal = new Roedores();
                                  }   else if (tipoAnimal == 6) {
                                      animal = new Peixes();
                                  }   else if (tipoAnimal == 7) {
                                      animal = new AnimaisSilvestres();
                                  }
                                  else {
                                      throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Selecione o Tipo do animal</font></center><br>");
                                  }
                              } catch (Exception ex) {
                                  ex.printStackTrace();
                                  throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Erro ao pegar o tipo do animal</font></center><br>");
                              }

                              try {
                                  nome = request.getParameter("nome");
                                  if (nome == null || nome == "" || nome == "0") {
                                      throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Informe o nome do animal</font></center><br>");
                                  } else {
                                      animal.setNome(nome);
                                  }
                              } catch (Exception ex) {
                                  ex.printStackTrace();
                                  throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Erro ao pegar o nome do animal</font></center><br>");
                              }

                              try {
                                  raca = request.getParameter("raca");
                                  animal.setRaca(raca);
                              } catch (Exception ex) {
                                  ex.printStackTrace();
                                  throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Erro ao capturar a raça do animal</font></center><br>");

                              }

                              try {
                                  dataNascimento = request.getParameter("dataNascimento");

                                  //validar data e construir um objeto Date() caso a data seja válida
                                  if (dataNascimento == null || dataNascimento == "" || dataNascimento == "0") {
                                      throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Informe a data de nascimento do animal</font></center><br>");
                                  } else if (Util.validarData(dataNascimento) != true) {
                                      throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />A data de nascimento do animal é inválida</font></center><br>");
                                  } else {
                                      animal.setDataNascimento(new Date(dataNascimento));
                                  }
                              } catch (Exception ex) {
                                  ex.printStackTrace();
                              }

                              try {
                                  sexo = request.getParameter("sexo");
                                  if (sexo == null || sexo == "" || sexo == "0") {
                                      throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Informe o sexo do animal</font></center><br>");
                                  } else {
                                      animal.setSexo(sexo.charAt(0));
                                  }
                              } catch (Exception ex) {
                                  ex.printStackTrace();
                                  throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Informe o sexo do animal</font></center><br>");

                              }

                              try {
                                  observacao = request.getParameter("observacao");
                                  if (observacao != "") {
                                      animal.setObservacao(observacao);
                                  }
                              } catch (Exception ex) {
                                  ex.printStackTrace();
                                  throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />Erro ao pegar o parâmetro Observação</font></center><br>");
                              }
                              animal.setPessoa(pessoa);
                              animal.setIdAnimal(1);
                              //lista os servicos executados
                              ArrayList<Servico> servico = new ArrayList<Servico>();
                              animal.setServico(servico);
                              //salvando
                              animal.salvar(animal);
                              out.print("<br><center><font face='verdana' color='blue'   size='2'><br />Animal cadastrado com sucesso em nosso banco de dados</font></center><br><br><br>");
                          } catch (Exception ex) {
                              ex.printStackTrace();
                              out.print("<br>");
                              out.print("<br>");
                              out.print("<br>");
                              out.print("<br><center><font face='verdana' color='red'   size='2'><br />Erro ao cadastrar o animal</font></center><br>");
                              out.print(ex.getMessage());
                              out.print("<br>");
                              out.print("<br>");
                          }
                    %>
                    <jsp:include page="../geral/rodape.jsp" />
                </td>
            <tr>
                <% }//fim do if de op%>
        </table>

    </body>
</html>
