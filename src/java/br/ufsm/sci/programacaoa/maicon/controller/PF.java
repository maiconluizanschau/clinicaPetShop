package br.ufsm.sci.programacaoa.maicon.controller;
import javax.persistence.*;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("1")
public class PF extends Pessoa {

     public PF() {
        super.setTipo(PF);
    }
}








