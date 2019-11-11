package br.ufsm.sci.programacaoa.maicon.controller;
import java.io.Serializable;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("2")
public class Gato extends Animal implements Serializable{
    public Gato() {
        super.setTipo(GATO);
        super.setDescricao("Gato");
    }
}
