/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.sci.programacaoa.maicon.controller;

import java.io.Serializable;
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
@DiscriminatorValue("4")
public class Repteis extends Animal implements Serializable{
      public Repteis() {
        super.setTipo(REPTEIS);
        super.setDescricao("Repteis");
    }
}
