package br.ufsm.sci.programacaoa.maicon.controller;


import br.ufsm.sci.programacaoa.maicon.model.PessoaDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.*;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "tipo")
public abstract class Pessoa implements Autenticavel, Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idPessoa;
    @Column(nullable = false, length = 2)
    private int tipo;
    @Column(nullable = false, length = 255)
    private String nome;
    @OneToMany(mappedBy = "pessoa", fetch = FetchType.LAZY)
    @Cascade(CascadeType.ALL)
    private Collection<Telefone> telefone;
    @OneToMany(mappedBy = "pessoa", fetch = FetchType.LAZY)
    @Cascade(CascadeType.ALL)
    private Collection<Endereco> endereco;
    @OneToMany(mappedBy = "pessoa", fetch = FetchType.LAZY)
    @Cascade(CascadeType.ALL)
    private Collection<Animal> animal;
    @Column(nullable = false, length = 255)
    private String email;
    @Column(nullable = false, length = 255)
    private String senha;
    @OneToOne(mappedBy = "pessoa", fetch = FetchType.LAZY)
    @Cascade(CascadeType.ALL)
    private DocReceita docReceita;
    public static final int PF = 1;
    public static final int PJ = 2;

    public Pessoa() {
    }

    public Pessoa(int idPessoa, int tipo, String nome, Collection<Telefone> telefone, Collection<Endereco> endereco, Collection<Animal> animal, String email, String senha, DocReceita docReceita) {
        this.idPessoa = idPessoa;
        this.tipo = tipo;
        this.nome = nome;
        this.telefone = telefone;
        this.endereco = endereco;
        this.animal = animal;
        this.email = email;
        this.senha = senha;
        this.docReceita = docReceita;
    }

    public Autenticavel autenticar(String usuario, String senha) {
        return PessoaDAO.autenticar(usuario, senha);
    }

    public boolean existe(String email) {
        return PessoaDAO.existe(email);
    }

    public boolean existe(DocReceita documento) {
        return PessoaDAO.existe(documento);
    }

    static public boolean salvar(Pessoa p) {
        return PessoaDAO.salvar(p);
    }

    static public ArrayList<Pessoa> consultar() {
        return PessoaDAO.consultar();
    }

    static public Pessoa consultar(int idPessoa) {
        return PessoaDAO.consultar(idPessoa);
    }

    static public Collection<Pessoa> consultar(String nome) {
        return PessoaDAO.consultar(nome);
    }

    static public boolean alterar(Pessoa p) {
        return PessoaDAO.alterar(p);
    }

    static public boolean excluir(Pessoa p) {
        return PessoaDAO.excluir(p);
    }

    public int getIdPessoa() {
        return idPessoa;
    }

    public void setIdPessoa(int idPessoa) {
        this.idPessoa = idPessoa;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Collection<Telefone> getTelefone() {
        return telefone;
    }

    public void setTelefone(Collection<Telefone> telefone) {
        this.telefone = telefone;
    }

    public Collection<Endereco> getEndereco() {
        return endereco;
    }

    public void setEndereco(Collection<Endereco> endereco) {
        this.endereco = endereco;
    }

    public Collection<Animal> getAnimal() {
        return animal;
    }

    public void setAnimal(Collection<Animal> animal) {
        this.animal = animal;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public DocReceita getDocReceita() {
        return docReceita;
    }

    public void setDocReceita(DocReceita docReceita) {
        this.docReceita = docReceita;
    }

    
}
