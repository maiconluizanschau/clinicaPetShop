/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.sci.programacaoa.maicon.controller;

import static br.ufsm.sci.programacaoa.maicon.controller.Servico.PARTO;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

/**
 *
 * @author maicon
 */
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("7")
public class Parto extends Servico {

    public Parto() {
        super.setTipo(PARTO);
        super.setNome("Parto");
    }
}
