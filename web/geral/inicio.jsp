<%-- 
    Document   : inicio
    Created on : 18/10/2015, 23:44:26
    Author     : Maicon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
      
   
    <jsp:include page="head.jsp" />
    <body>      

        <table width="1366" align="center"  >
            <tr>
                <td >
                    <jsp:include page="topo.jsp" />
                </td>
            </tr>
            <tr>
                <td colspan="2" height="460"></td>
            </tr>
            <tr>
                <td colspan="2" >
                    <jsp:include page="../geral/rodape.jsp" />
                </td>
            </tr>
        </table>

    </body>
</html>
