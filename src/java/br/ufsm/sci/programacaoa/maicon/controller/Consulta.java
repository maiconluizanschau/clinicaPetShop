package br.ufsm.sci.programacaoa.maicon.controller;
import javax.persistence.*;
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorValue("2")
public class Consulta extends Servico {
    public Consulta() {
        super.setTipo(CONSULTA);
        super.setNome("Consulta");
    }
}
