/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package br.ufsm.sci.programacaoa.maicon.util;
import java.text.NumberFormat;

/**
 *
 * @author maicon
 */
public abstract class Util {

    public static String formatCurrency(double numero) {

        return NumberFormat.getCurrencyInstance().format(numero);
    }

    public static String SoNumero(String s) {
        // Deixa so' os digitos no numero
        String Digitos = "0123456789";
        String temp = "";
        char digito;

        try {
            if (!s.equals("")) {


                for (int i = 0; i < s.length(); i++) {
                    digito = s.charAt(i);
                    if (Digitos.indexOf(digito) >= 0) {
                        temp = temp + digito;
                    }
                } //for

                return temp;

            } else {
                return "";
            }
        } catch (NullPointerException nex) {
            return "";
        } catch (Exception ex) {

            throw new RuntimeException("Erro ao formatar número");

        }
    }




     public static String SoNumeroTel(String s) {
        // Deixa so' os digitos no numero
        String Digitos = "0123456789-";
        String temp = "";
        char digito;

        try {
            if (!s.equals("")) {


                for (int i = 0; i < s.length(); i++) {
                    digito = s.charAt(i);
                    if (Digitos.indexOf(digito) >= 0) {
                        temp = temp + digito;
                    }
                } //for

                return temp;

            } else {
                return "";
            }
        } catch (NullPointerException nex) {
            return "";
        } catch (Exception ex) {

            throw new RuntimeException("Erro ao formatar número");

        }
    }




    public static Boolean validarData(String data) {

        String dia = data.substring(0, 2);
        String mes = data.substring(3, 5);
        String ano = data.substring(6, 10);
        int iDia = Integer.parseInt(dia);
        int iMes = Integer.parseInt(mes);
        int iAno = Integer.parseInt(ano);

        if (iMes > 13 || iMes < 0) {
            throw new RuntimeException("Data inválida. Entre com um mes entre 01 e 12");
        }
        if (iMes == 1 || iMes == 3 || iMes == 5 || iMes == 7 || iMes == 8 || iMes == 10 || iMes == 12) {
            if (iDia > 31) {
                throw new RuntimeException("Data inválida. Este mes exige um dia entre 01 e 31");
            }
        }
        if (iMes == 4 || iMes == 6 || iMes == 9 || iMes == 11) {
            if (iDia > 30) {
                throw new RuntimeException("Data inválida. Este mes exige um dia entre 01 e 30");
            }
        }
        if (iMes == 2 && (iAno % 4) == 0) {
            if (iDia > 29) {
                throw new RuntimeException("Data inválida. Um ano bissexto exige um dia entre 01 e 29 para o mes de fevereiro");
            }
        }
        if (iMes == 2 && (iAno % 4) > 0) {
            if (iDia > 28) {
                throw new RuntimeException("Data inválida. Este mes exige um dia entre 01 e 28");
            }
        }
        return true;
    }


    public static String dataMysqlParaBrasileira(String d){

        String dia;
        String mes;
        String ano;


        ano = d.substring(0, 3);
        mes = d.substring(5, 7);
        dia = d.substring(9, 14);

        return dia +"/"+mes+"/"+ano;
    }


}

