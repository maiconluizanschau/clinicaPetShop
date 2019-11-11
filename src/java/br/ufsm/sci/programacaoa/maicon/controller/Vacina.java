package br.ufsm.sci.programacaoa.maicon.controller;
import javax.persistence.*;
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("4")
public class Vacina extends Servico {
    public Vacina() {
        super.setTipo(VACINA);
        super.setNome("Vacina");
    }
}
