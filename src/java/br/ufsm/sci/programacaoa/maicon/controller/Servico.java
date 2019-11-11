package br.ufsm.sci.programacaoa.maicon.controller;

import br.ufsm.sci.programacaoa.maicon.model.ServicoDAO;
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
public abstract class Servico implements Serializable {



    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idServico;
    @Column(nullable = false)
    private int tipo;
    @Column(nullable = false)
    private String nome;
    @Column(nullable = false)
    private double valor;
    @Column(nullable = false)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date data;
    @Column(length = 255, nullable = true)
    private String descricao;
    @Column(length = 255, nullable = true)
    private String observacao;
    @ManyToOne(fetch = FetchType.EAGER)
    @Fetch(FetchMode.JOIN)
    @JoinColumn(name = "idAnimal", updatable = true, insertable = true)
    @Cascade(CascadeType.SAVE_UPDATE)
    private Animal animal;
    public static int BANHO = 1;
    public static int CONSULTA = 2;
    public static int TOSA = 3;
    public static int VACINA = 4;
    public static int CIRURGIA=5;
    public static int ATENDIMENTOEMERGENCIA=6;
    public static  int PARTO=7;

    public Servico() {
    }

    public Servico(int idServico, int tipo, String nome, double valor, Date data, String descricao, String observacao, Animal animal) {
        this.idServico = idServico;
        this.tipo = tipo;
        this.nome = nome;
        this.valor = valor;
        this.data = data;
        this.descricao = descricao;
        this.observacao = observacao;
        this.animal = animal;
    }

    
    public static boolean salvar(Servico s) {
        return ServicoDAO.salvar(s);
    }

    public static boolean salvar(Animal a) {
        return ServicoDAO.salvar(a);
    }

    public static Servico consultar(int idServico) {
        return ServicoDAO.consultar(idServico);
    }

    public static Collection<Servico> consultar(Animal a) {
        return ServicoDAO.consultar(a);
    }

    public static Collection<Servico> consultar() {
        return ServicoDAO.consultar();
    }

    public static boolean alterar(Servico s) {
        return ServicoDAO.alterar(s);
    }

    public static boolean excluir(Servico s) {
        return ServicoDAO.excluir(s);
    }

    public static boolean excluir(Animal a) {
        return ServicoDAO.excluir(a);
    }

    public int getIdServico() {
        return idServico;
    }

    public void setIdServico(int idServico) {
        this.idServico = idServico;
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

    public double getValor() {
        return valor;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Animal getAnimal() {
        return animal;
    }

    public void setAnimal(Animal animal) {
        this.animal = animal;
    }
    
}
