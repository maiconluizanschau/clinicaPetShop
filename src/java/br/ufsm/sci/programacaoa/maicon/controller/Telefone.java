package br.ufsm.sci.programacaoa.maicon.controller;

import br.ufsm.sci.programacaoa.maicon.model.TelefoneDAO;
import java.util.Collection;
import javax.persistence.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
public class Telefone {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idTelefone;
    @Column(length = 2, nullable = false)
    private int ddd;
    @Column(length = 10, nullable = false)
    private String numero;
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "idPessoa", updatable = true, insertable = true)
    @Cascade(CascadeType.SAVE_UPDATE)
    private Pessoa pessoa;

    public Telefone(int ddd, String numero, Pessoa pessoa) {

        this.ddd = ddd;
        this.numero = numero;
        this.pessoa = pessoa;
    }

    public Telefone(int idTelefone, int ddd, String numero, Pessoa pessoa) {
        this.idTelefone = idTelefone;
        this.ddd = ddd;
        this.numero = numero;
        this.pessoa = pessoa;
    }

    public Telefone() {
    }

    public static boolean salvar(Telefone t) {
        return TelefoneDAO.salvar(t);
    }

    public static boolean salvar(Pessoa p) {
        return TelefoneDAO.salvar(p);
    }

    public static Telefone consultar(int idTelefone) {
        return TelefoneDAO.consultar(idTelefone);
    }

    public static Collection<Telefone> consultar(Pessoa p) {
        return TelefoneDAO.consultar(p);
    }

    public static boolean alterar(Telefone t) {
        return TelefoneDAO.alterar(t);
    }


    public static boolean excluir(Telefone t) {
        return TelefoneDAO.excluir(t);
    }

    public static boolean excluir(Pessoa p) {
        return TelefoneDAO.excluir(p);
    }

    /**
     * @return the idTelefone
     */
    public int getIdTelefone() {
        return idTelefone;
    }

    /**
     * @param idTelefone the idTelefone to set
     */
    public void setIdTelefone(int idTelefone) {
        this.idTelefone = idTelefone;
    }

    /**
     * @return the ddd
     */
    public int getDdd() {
        return ddd;
    }

    /**
     * @param ddd the ddd to set
     */
    public void setDdd(int ddd) {
        this.ddd = ddd;
    }

    /**
     * @return the numero
     */
    public String getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public void setNumero(String numero) {
        this.numero = numero;
    }

    /**
     * @return the pessoa
     */
    public Pessoa getPessoa() {
        return pessoa;
    }

    /**
     * @param pessoa the pessoa to set
     */
    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }
}

