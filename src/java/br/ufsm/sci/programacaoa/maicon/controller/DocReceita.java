package br.ufsm.sci.programacaoa.maicon.controller;

import java.io.Serializable;
import javax.persistence.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "tipo")
public class DocReceita implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idDocReceita;
    @Column(nullable = false)
    private int tipo;
    @Column(nullable = false)
    private String numero;
    @OneToOne(fetch = FetchType.EAGER)
    @Fetch(org.hibernate.annotations.FetchMode.JOIN)
    @JoinColumn(name = "idPessoa", updatable = true, insertable = true)
    @Cascade(CascadeType.SAVE_UPDATE)
    private Pessoa pessoa;
    public static final int CPF = 1;
    public static final int CNPJ = 2;

    protected DocReceita() {
    }

    public int getIdDocReceita() {
        return idDocReceita;
    }

    public void setIdDocReceita(int idDocReceita) {
        this.idDocReceita = idDocReceita;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
}
