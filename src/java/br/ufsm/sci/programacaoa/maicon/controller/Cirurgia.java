/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.sci.programacaoa.maicon.controller;

import static br.ufsm.sci.programacaoa.maicon.controller.Servico.CIRURGIA;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

/**
 *
 * @author maicon
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("5")
public class Cirurgia extends Servico {
    public Cirurgia() {
        super.setTipo(CIRURGIA);
        super.setNome("Cirurgia");
    }
}