package br.ufsm.sci.programacaoa.maicon.controller;

import java.io.Serializable;

public final class CPF extends DocReceita implements Serializable {

    public CPF(String numero) throws Exception {
        super.setNumero(numero);
        super.setTipo(CPF);
        if (validar(this) == false) {
            super.setNumero("");
            throw new Exception("CPF inválido");
        }
    }

    public boolean validar(DocReceita doc) {
        String strCpf = doc.getNumero();
        try {
            boolean validado = true;
            int d1, d2;
            int digito1, digito2, resto;
            int digitoCPF;
            String nDigResult;         
            String[] strIndesejados = {".","-"," "};
            for(int i = 0;i<strIndesejados.length;i++){ 
                strCpf = strCpf.replace(strIndesejados[i], "");
            } 
            d1 = d2 = 0;
            digito1 = digito2 = resto = 0;
            for (int nCount = 1; nCount < strCpf.length() - 1; nCount++) {
                digitoCPF = Integer.valueOf(strCpf.substring(nCount - 1, nCount)).intValue();
                d1 = d1 + (11 - nCount) * digitoCPF;
                d2 = d2 + (12 - nCount) * digitoCPF;
            }
            resto = (d1 % 11);
            if (resto < 2) {
                digito1 = 0;
            } else {
                digito1 = 11 - resto;
            }
            d2 += 2 * digito1;
            resto = (d2 % 11);
            if (resto < 2) {
                digito2 = 0;
            } else {
                digito2 = 11 - resto;
            }
            String nDigVerific = strCpf.substring(strCpf.length() - 2, strCpf.length());
            nDigResult = String.valueOf(digito1) + String.valueOf(digito2);
            return nDigVerific.equals(nDigResult);
        } catch (Exception e) {
            System.err.println("Erro !" + e);
            return false;
        }
    }
}
