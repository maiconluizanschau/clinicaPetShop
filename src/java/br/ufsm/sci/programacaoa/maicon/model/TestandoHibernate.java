package br.ufsm.sci.programacaoa.maicon.model;

import br.ufsm.sci.programacaoa.maicon.controller.Animal;
import br.ufsm.sci.programacaoa.maicon.controller.Autenticavel;
import br.ufsm.sci.programacaoa.maicon.controller.Banho;
import br.ufsm.sci.programacaoa.maicon.controller.CPF;
import br.ufsm.sci.programacaoa.maicon.controller.Cachorro;
import br.ufsm.sci.programacaoa.maicon.controller.DocReceita;
import br.ufsm.sci.programacaoa.maicon.controller.Endereco;
import br.ufsm.sci.programacaoa.maicon.controller.PF;
import br.ufsm.sci.programacaoa.maicon.controller.Servico;
import br.ufsm.sci.programacaoa.maicon.controller.Telefone;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import javax.swing.JOptionPane;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class TestandoHibernate {

    public static void main(String[] args) {

        GerarTabelas();

        if (autenticar("maicon", "root") != null) {
            System.out.println("Usuário autenticado");
        } else {
            System.out.println("Erro na autenticação");
        }
        try {
            persistindo();
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(null, "Erro ao cadastrar usuario no banco de dados " + ex.getMessage());
        }

    }

    public static Autenticavel autenticar(String usuario, String senha) {
        return new PF().autenticar(usuario, senha);
    }

    private static void GerarTabelas() {
        AnnotationConfiguration cfg = new AnnotationConfiguration();
        cfg.configure("hibernate.cfg.xml");
        SchemaExport sx = new SchemaExport(cfg);
        sx.create(true, true);
    }

    private static void excluindo() {
    }

    private static void persistindo() throws Exception {
        PF pf = new PF();
        pf.setNome("Maicon Luiz Anschau");
        pf.setEmail("maicom.anschau@gmail.com");
        pf.setSenha("root");

        DocReceita cpf = new CPF("027.957.650-12");
        pf.setDocReceita(cpf);
        cpf.setPessoa(pf);



        if (pf.existe(cpf) == true) {
            throw new RuntimeException("<br><center><font face='verdana' color='red'   size='2'><br />já existe usuário cadastrado com o CPF ou CNPJ informado</font></center><br>");
        }



        Endereco end = new Endereco();
        end.setBairro("Camobi");
        end.setCep("97105970");
        end.setCidade("Santa Maria");
        end.setLogradouro("Avenida Roraima 1000");
        end.setNumero("1314");
        end.setUf("RS");
        end.setPessoa(pf);

        Collection<Endereco> e = new ArrayList<Endereco>();
        e.add(end);
        pf.setEndereco(e);

        Telefone t = new Telefone();
        t.setDdd(11);
        t.setNumero("9689-9593");
        t.setPessoa(pf);

        Collection<Telefone> tel = new ArrayList<Telefone>();
        tel.add(t);
        pf.setTelefone(tel);

        Animal a = new Cachorro();
        Date d = new Date();
        d.setDate(15);
        d.setMonth(5 - 1);
        d.setYear(2000 - 1900);

        a.setDataNascimento(d);
        a.setNome("Batman");
        a.setRaca("Pastor Alemao");
        a.setSexo('M');
        a.setObservacao("Manso!");
        a.setPessoa(pf);

        Servico s = new Banho();
        s.setData(new Date());
        s.setDescricao("Vacina");
        s.setValor(50.55);
        s.setAnimal(a);

        Collection<Servico> serv = new ArrayList<Servico>();
        serv.add(s);
        a.setServico(serv);

        Collection<Animal> ani = new ArrayList<Animal>();
        ani.add(a);
        pf.setAnimal(ani);

        pf.salvar(pf);
    }
}
