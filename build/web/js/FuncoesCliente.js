// JavaScript Document
// Funções do Site
/*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : 05/12/2015, 17:16:56
    Author     : maicon
*/ 
function Sonumero(campo){
    var digits="0123456789./-"
    var campo_temp
    for (var i=0;i<campo.value.length;i++){
        campo_temp=campo.value.substring(i,i+1)
        if (digits.indexOf(campo_temp)==-1){
            campo.value = campo.value.substring(0,i);
            break;
        }
    }
}

function formatar(src, mask) 
{
    var i = src.value.length;
    var saida = mask.substring(0,1);
    var texto = mask.substring(i)
    if (texto.substring(0,1) != saida)
    {
        src.value += texto.substring(0,1);
    }
}

function showCampo( escolha , campoLabel ){
    if(document.Formulario.Tipo.options[document.Formulario.Tipo.selectedIndex].value == 'PJ' ){
        document.getElementById( 'campo_hiddenPJ' ).style.display= '';
        document.getElementById( 'campo_hiddenPF' ).style.display= 'none';
        document.Formulario.Nome.value="";
        document.Formulario.CPF.value="";
    }else if(document.Formulario.Tipo.options[document.Formulario.Tipo.selectedIndex].value == 'PF' ){
        document.getElementById( 'campo_hiddenPJ' ).style.display  = 'none';
        document.getElementById( 'campo_hiddenPF' ).style.display  = '';
        document.Formulario.CNPJ.value="";
        document.Formulario.razao.value="";
    }else{
        document.getElementById( 'campo_hiddenPJ' ).style.display  = 'none';
        document.getElementById( 'campo_hiddenPF' ).style.display= 'none';
        document.Formulario.Nome.value="";
        document.Formulario.CPF.value="";
        document.Formulario.CNPJ.value="";
        document.Formulario.razao.value="";
    }
}

///  Validar CPF
function valida_CPF(s)	{
    var i;
    s = limpa_string(s);
    var c = s.substr(0,9);
    var dv = s.substr(9,2);
    var d1 = 0;
    for (i = 0; i < 9; i++)
    {
        d1 += c.charAt(i)*(10-i);
    }
    if (d1 == 0) return false;
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(0) != d1)
    {
        return false;
    }

    d1 *= 2;
    for (i = 0; i < 9; i++)
    {
        d1 += c.charAt(i)*(11-i);
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(1) != d1)
    {
        return false;
    }
    return true;
}



//// Função Para Limpar o Campo [ Apagar a Mascara ]
function limpa_string(S){
    // Deixa so' os digitos no numero
    var Digitos = "0123456789";
    var temp = "";
    var digito = "";

    for (var i=0; i<S.length; i++)	{
        digito = S.charAt(i);
        if (Digitos.indexOf(digito)>=0)	{
            temp=temp+digito
        }
    } //for

    return temp
}

/// Função Para Validar CNPJ
function valida_CGC(s)
{
    var i;
    s = limpa_string(s);
    var c = s.substr(0,12);
    var dv = s.substr(12,2);
    var d1 = 0;
    for (i = 0; i < 12; i++)
    {
        d1 += c.charAt(11-i)*(2+(i % 8));
    }
    if (d1 == 0) return false;
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(0) != d1)
    {
        return false;
    }

    d1 *= 2;
    for (i = 0; i < 12; i++)
    {
        d1 += c.charAt(11-i)*(2+((i+1) % 8));
    }
    d1 = 11 - (d1 % 11);
    if (d1 > 9) d1 = 0;
    if (dv.charAt(1) != d1)
    {
        return false;
    }
    return true;
}

function ValidarRegistro1(Formulario){

    if(Formulario.idPessoa.value == "0"||Formulario.idPessoa.value == ""){
        alert("Selecione uma pessoa da lista");
        return false;
    }

    Formulario.submit();
    return true
}

function ValidarRegistro2(Formulario){

    if(Formulario.idAnimal.value == "0"||Formulario.idAnimal.value == ""){
        alert("Selecione um animal de estimação");
        return false;
    }
    if(Formulario.idPessoa.value == "0"||Formulario.idPessoa.value == ""){
        alert("Erro ao capturar os dados da pessoa selecionada");
        return false;
    }

    Formulario.submit();
    return true
}

function ValidarRegistro(Formulario){

    if(Formulario.servico.value == "0"){
        alert("Informe o serviço que foi executado");
        return false;
    }
    if (Formulario.nome.value == "") {
        alert("Informe  o nome ou descrição do serviço executado.");
        Formulario.nome.focus();
        Formulario.nome.select();
        return false;
    }

    if (Formulario.valor.value == "") {
        alert("Informe  o valor desse serviço.");
        Formulario.valor.focus();
        Formulario.valor.select();
        return false;
    }
    if (Formulario.idAnimal.value == "" || Formulario.idAnimal.value == 0  ) {
        alert("Erro na informação do animal.");
       
        return false;
    }

    Formulario.submit();
    return true;
}

function ValidarAnimal(Formulario){
    if(Formulario.tipoAnimal.value != "1" && Formulario.tipoAnimal.value != "7"){
        alert("Informe  o tipo do animal");
        return false;
    }
    
    // Foi preenchido o nome do Animal?
    if (Formulario.nome.value == "") {
        alert("Informe  o nome do Animal.");
        Formulario.nome.focus();
        Formulario.nome.select();
        return false;
    }
    if (Formulario.dataNascimento.value == "") {
        alert("Informe  a data de nascimento do Animal.");
        Formulario.dataNascimento.focus();
        Formulario.dataNascimento.select();
        return false;
    }

    if (Formulario.sexo.value == "") {
        alert("Informe o sexo do Animal.");
        return false;
    }
    Formulario.submit();
    return true;
}
function Validar( Formulario  ){

    if(Formulario.Tipo.options[Formulario.Tipo.selectedIndex].value == 'PJ' ){
  
        ///// PJ
        /// O nome da Empresa deverá ser inserida no Banco de dados em Maiusculo
        //// O nome da empresa deverá ter no mínimo 5 digitos
        Formulario.razao.value=Formulario.razao.value.toUpperCase();
   
        /// Foi preenchido o nome da Empresa
        if (Formulario.razao.value == "") {
            alert("Informe  o nome da Empresa.");
            Formulario.razao.focus();
            Formulario.razao.select();
            return false;			
        }else if (Formulario.razao.value.length <= 4){
            alert("O nome da empresa tem que ter no mínimo 5 digitos");
            Formulario.razao.focus();
            Formulario.razao.select();
            return false;
        }
					
        //// O  CNPJ deverá ter 14 digitos
        if (Formulario.CNPJ.value != "" ){
            if (valida_CGC(Formulario.CNPJ.value) == false ) {
                alert("O CNPJ não é válido !");
                Formulario.CNPJ.focus();
                return false;
            }
        }else if ( Formulario.CNPJ.value.length <= 13) {
            alert("Informa o CNPJ com 14 digitos");
            Formulario.CNPJ.focus();
            Formulario.CNPJ.select();
            return false;
        }
	
    } else if(Formulario.Tipo.options[Formulario.Tipo.selectedIndex].value == 'PF' ){
					
        ///// PF
        //O nome do  Cliente deverá ser inserido no Banco de Dados em Maiusculo
        Formulario.Nome.value=Formulario.Nome.value.toUpperCase();
			
        // Foi preenchido o nome do Cliente?
        if (Formulario.Nome.value == "") {
            alert("Informe  o nome do Cliente.");
            Formulario.Nome.focus();
            Formulario.Nome.select();
            return false;
					
        }else if ( Formulario.Nome.value.length <= 3){
            alert("O nome do cliente tem que ter no mínimo 4 digitos");
            Formulario.Nome.focus();
            Formulario.Nome.select();
            return false;				
        }
					
        // Foi informado um documento do cliente PF?
        if (  Formulario.CPF.value=="") {
            alert("Informe o CPF do Cliente");
            Formulario.CPF.focus();
            Formulario.CPF.select();
            return false;			
        }
					
        /// Se o CPF for preenchido ele deverá ser validado
        if (Formulario.CPF.value  != ""){
            if (valida_CPF(Formulario.CPF.value) == false ) {
                alert("O CPF não é válido !");
                Formulario.CPF.focus();
                return false;
            }
        }				
    }else{
        alert("Informe o tipo do cliente.");
        return false;
    }

    /// Foi informado alguma forma de contato?
    if (	  Formulario.Tel.value==""  &&  Formulario.TelCel.value=="" &&  Formulario.TelFax.value==""   ){
        alert("Informe uma forma de contato com o cliente");
        Formulario.Tel.focus();
        Formulario.Tel.select();
        return false;

    }


    if(Formulario.logradouro.value  == "" || Formulario.Numero.value  == "" || Formulario.Cidade.value  == "" || Formulario.Bairro.value  == ""   ){
        alert("Informe o endereço do cliente");
        Formulario.logradouro.focus();
        Formulario.logradouro.select();
        return false;
    }

    if (document.Formulario.uf.options[document.Formulario.uf.selectedIndex].value == '' ){
        alert("Por favor, Preencha o Campo ESTADO");
        return false;
    }

    // Foi Infomado o CEP corretamente?
    if (Formulario.CEP.value == "" ||  Formulario.CEP.value.length <= 4){
        alert("Informe o CEP.");
        Formulario.CEP.focus();
        Formulario.CEP.select();
        return false;
    }
    Formulario.submit();
    return true;
}// Fecha a Função Validar


