/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.sci.programacaoa.maicon.controller;

/**
 *
 * @author Benefrancis
 */
public interface Autenticavel {

    public Autenticavel autenticar(String usuario, String senha);

    public boolean existe(String usuario);
}
