package br.ufsm.sci.programacaoa.maicon.controller;

import br.ufsm.sci.programacaoa.maicon.model.AnimalDAO;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.*;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
@DiscriminatorColumn(name = "tipo")
public abstract class Animal implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idAnimal;
    @Column(nullable = false)
    private int tipo;
    @Column(nullable = false)
    private String descricao;
    @Column(length = 50, nullable = false)
    private String nome;
    @Column(nullable = false)
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dataNascimento;
    @Column(length = 1, nullable = false)
    private char sexo;
    @Column(nullable = false)
    private String raca;
    @Column(length = 255, nullable = true)
    private String Observacao;
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "idPessoa", updatable = true, insertable = true)
    @Cascade(CascadeType.SAVE_UPDATE)
    private Pessoa pessoa;
    @OneToMany(mappedBy = "animal", fetch = FetchType.LAZY)
    @Cascade(CascadeType.ALL)
    private Collection<Servico> servico;
    public static final int CACHORRO = 1;
    public static final int GATO = 2;
    public static final int PASSAROS = 3;
    public static final int REPTEIS = 4;
    public static final int ROEDORES = 5;
    public static final int PEIXES = 6;
    public static final int ANIMAISSILVESTRES = 7;

    public Animal() {
    }

    public Animal(int idAnimal, int tipo, String nome, Date dataNascimento, char sexo, String raca, String Observacao, Pessoa pessoa, Collection<Servico> servico) {
        this.idAnimal = idAnimal;
        this.tipo = tipo;
        this.nome = nome;
        this.dataNascimento = dataNascimento;
        this.sexo = sexo;
        this.raca = raca;
        this.Observacao = Observacao;
        this.pessoa = pessoa;
        this.servico = servico;
    }

    public static boolean salvar(Animal a) {
        return AnimalDAO.salvar(a);
    }

    public static boolean salvar(Pessoa p) {
        return AnimalDAO.salvar(p);
    }

    public static Animal consultar(int idAnimal) {
        return AnimalDAO.consultar(idAnimal);
    }

    public static Collection<Animal> consultar() {
        return AnimalDAO.consultar();
    }

    public static Collection<Animal> consultar(Pessoa p) {
        return AnimalDAO.consultar(p);
    }

    public static boolean alterar(Animal a) {
        return AnimalDAO.alterar(a);
    }

    public static boolean excluir(Animal a) {
        return AnimalDAO.excluir(a);
    }

    public static boolean excluir(Pessoa p) {
        return AnimalDAO.excluir(p);
    }

    /**
     * @return the idAnimal
     */
    public int getIdAnimal() {
        return idAnimal;
    }

    /**
     * @param idAnimal the idAnimal to set
     */
    public void setIdAnimal(int idAnimal) {
        this.idAnimal = idAnimal;
    }

    /**
     * @return the tipo
     */
    public int getTipo() {
        return tipo;
    }

    /**
     * @param tipo the tipo to set
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the dataNascimento
     */
    public Date getDataNascimento() {
        return dataNascimento;
    }

    /**
     * @param dataNascimento the dataNascimento to set
     */
    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    /**
     * @return the sexo
     */
    public char getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    /**
     * @return the raca
     */
    public String getRaca() {
        return raca;
    }

    /**
     * @param raca the raca to set
     */
    public void setRaca(String raca) {
        this.raca = raca;
    }

    /**
     * @return the Observacao
     */
    public String getObservacao() {
        return Observacao;
    }

    /**
     * @param Observacao the Observacao to set
     */
    public void setObservacao(String Observacao) {
        this.Observacao = Observacao;
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

    /**
     * @return the servico
     */
    public Collection<Servico> getServico() {
        return servico;
    }

    /**
     * @param servico the servico to set
     */
    public void setServico(Collection<Servico> servico) {
        this.servico = servico;
    }

    /**
     * @return the descricao
     */
    public String getDescricao() {
        return descricao;
    }

    /**
     * @param descricao the descricao to set
     */
    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
