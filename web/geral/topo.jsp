<%-- 
    Document   : inicio
    Created on : 18/10/2015, 23:44:26
    Author     : Maicon
--%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
             <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>
        <img src="../images/topo.png" border="0" >
        <div id="menu">
            <ul class="menu">
                <li><a href="#" class="parent"><span>Cadastros</span></a>


                    <ul>
                        <li><a href="../cadastros/pessoa.jsp"><span>Cliente</span></a></li>
                        <li><a href="../cadastros/animal.jsp"><span>Animal</span></a></li>
                    </ul>
                </li>
                <li><a href="#"><span>Serviços</span></a>
                    <ul>
                        <li><a href="../servicos/registrar.jsp"><span>Registrar Serviço Executado</span></a></li>
                    </ul>
                </li>
                <li><a href="#"><span>Consultas</span></a>
                    <ul>
                        <li><a href="../consultas/pessoa.jsp"><span>Clientes</span></a></li>
                        <li><a href="../consultas/animal.jsp"><span>Animais</span></a></li>
                        <li><a href="../consultas/servico.jsp"><span>Serviços</span></a></li>




                    </ul>
                </li>
            </ul>
        </div>
       
        <!-- jQuery -->
        <script src="assets/bootstrap/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
