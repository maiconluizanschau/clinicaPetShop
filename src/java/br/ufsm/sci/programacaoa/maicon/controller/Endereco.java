package br.ufsm.sci.programacaoa.maicon.controller;

import br.ufsm.sci.programacaoa.maicon.model.EnderecoDAO;
import java.io.Serializable;
import java.util.ArrayList;
import javax.persistence.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;


@Entity
public class Endereco implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEndereco;

    @Column(length = 255, nullable = false)
    private String logradouro;
    @Column(length = 10, nullable = false)
    private String numero;
    @Column(length = 255, nullable = true)
    private String complemento;
    @Column(length = 255, nullable = false)
    private String bairro;
    @Column(length = 255, nullable = false)
    private String cidade;
    
    @Column(length = 2, nullable = false)
    private String uf;
    
    @Column(length = 8, nullable = false)
    private String cep;

    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "idPessoa", updatable = true, insertable = true)
    @Cascade(CascadeType.SAVE_UPDATE)
    private Pessoa pessoa;

    public static boolean salvar(Endereco e) {
        return EnderecoDAO.salvar(e);
    }

    public static boolean salvar(Pessoa p) {
        return EnderecoDAO.salvar(p);
    }

    public static Endereco consultar(int idEndereco) {
        return EnderecoDAO.consultar(idEndereco);
    }

    public static ArrayList<Endereco> consultar(Pessoa p) {
        return EnderecoDAO.consultar(p);
    }

    public static boolean alterar(Endereco e) {
        return EnderecoDAO.alterar(e);
    }

    public static boolean excluir(Endereco e) {
        return EnderecoDAO.excluir(e);
    }

    public static boolean excluir(Pessoa p) {
        return EnderecoDAO.excluir(p);
    }

    /**
     * @return the idEndereco
     */
    public int getIdEndereco() {
        return idEndereco;
    }

    /**
     * @param idEndereco the idEndereco to set
     */
    public void setIdEndereco(int idEndereco) {
        this.idEndereco = idEndereco;
    }

    /**
     * @return the logradouro
     */
    public String getLogradouro() {
        return logradouro;
    }

    /**
     * @param logradouro the logradouro to set
     */
    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
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
     * @return the complemento
     */
    public String getComplemento() {
        return complemento;
    }

    /**
     * @param complemento the complemento to set
     */
    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    /**
     * @return the bairro
     */
    public String getBairro() {
        return bairro;
    }

    /**
     * @param bairro the bairro to set
     */
    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    /**
     * @return the cidade
     */
    public String getCidade() {
        return cidade;
    }

    /**
     * @param cidade the cidade to set
     */
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    /**
     * @return the uf
     */
    public String getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(String uf) {
        this.uf = uf;
    }

    /**
     * @return the cep
     */
    public String getCep() {
        return cep;
    }

    /**
     * @param cep the cep to set
     */
    public void setCep(String cep) {
        this.cep = cep;
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
