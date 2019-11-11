package br.ufsm.sci.programacaoa.maicon.controller;

import java.io.Serializable;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("1")
public class Cachorro extends Animal implements Serializable {

    public Cachorro() {
        super.setTipo(CACHORRO);
        super.setDescricao("Cachorro");
    }
}
