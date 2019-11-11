<%-- 
    Document   : index
    Created on : 14/10/2015, 20:14:03
    Author     : maicon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.ufsm.sci.programacaoa.maicon.controller.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jstl/xml" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PETSHOP- UFSM</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Pet Shop desenvolvimento disciplina Programacao A">
        <meta name="author" content="Maicon - Academico Da UFSM- Orientador Professor Alencar">
        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->


    </head>
    <body>

        <div class="register-container container">
            <div class="row">
                <div class="iphone span5">
                    <img src="assets/img/iphone.png" alt="">
                </div>
                <div class="register span6">
                    <form name="FrmLogin" id="FrmLogin" method="POST"  action="index.jsp">
                        <h2>Pet Shop <span class="red"><strong>USFM</strong></span></h2>
                        <label for="email">Email</label>
                        <td class="Txt"><input type="text" name="usuario" value=""/>
                            <label for="password">Password</label>
                        <td class="Txt"><input type="password" name="senha" value=""/>
                        <tr>
                            <td colspan="2"><hr size="1"><input type="hidden" name="op" value="1" />

                                <button type="submit" value="Autenticar" name="btn_autenticar"> LOGIN </button>

                    </form>
                </div>
            </div>
        </div>                
    <tr><td colspan="2" class="Txt">
            <%
                String usuario = "";
                String senha = "";
                int op = 0;
                try {
                    op = Integer.parseInt(request.getParameter("op"));
                } catch (Exception ex) {
                }
                try {
                    if (op == 1) {
                        usuario = request.getParameter("usuario");
                        senha = request.getParameter("senha");
                        Autenticavel p = new PF().autenticar(usuario, senha);
                        if (p != null) {
                            session.setAttribute("Usuario", p);
                            String novaURL = "geral/inicio.jsp";
                            response.sendRedirect(novaURL);
                        } else {
                            out.print("<br>");
                            out.print("<center><font face='verdana' color='blue'   "
                                    + "size='10'>Usuario ou senha inválidos</font></center>");
                            out.print("<br>");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>

            <!-- Javascript -->
            <script src="assets/js/jquery-1.8.2.min.js"></script>
            <script src="assets/bootstrap/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery.backstretch.min.js"></script>
            <script src="assets/js/scripts.js"></script>
            <div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<p>&copy-2015; Todos os direitos reservados. Disciplina Programação A - UFSM - Professor Orientador: Alencar | Academico:Maicon</p>
					</div>
				</div>
			</div>
		</div>

        </body>
</html>