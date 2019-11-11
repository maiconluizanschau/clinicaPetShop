package br.ufsm.sci.programacaoa.maicon.controller;
import javax.persistence.*;
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("3")
public class Tosa extends Servico {
    public Tosa() {
        super.setTipo(TOSA);
        super.setNome("Tosa");
    }
}