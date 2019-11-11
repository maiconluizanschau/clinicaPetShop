package br.ufsm.sci.programacaoa.maicon.model;

import br.ufsm.sci.programacaoa.maicon.controller.Autenticavel;
import br.ufsm.sci.programacaoa.maicon.controller.DocReceita;
import br.ufsm.sci.programacaoa.maicon.controller.Pessoa;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class PessoaDAO {

    public static boolean salvar(Pessoa p) {
        Session session;
        session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(p);
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public static Pessoa consultar(int idPessoa) {
        Session session;
        session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Pessoa p = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Pessoa as p where p.idPessoa=:id");
            q.setParameter("id", idPessoa);
            List resultados = q.list();
            if (resultados.size() > 0) {
                p = (Pessoa) resultados.get(0);
            }
            return p;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return p;
        } finally {
            session.close();
        }
    }

    public static ArrayList<Pessoa> consultar() {
        Session session;
        session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        ArrayList<Pessoa> p = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Pessoa as p");
            p = (ArrayList<Pessoa>) q.list();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return p;
    }

    public static Collection<Pessoa> consultar(String nome) {
        Session session;
        session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Pessoa> p = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Pessoa as p where p.nome=:nome");
            q.setParameter("nome", nome);
            p = q.list();
            return p;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return p;
        } finally {
            session.close();
        }
    }

    public static boolean alterar(Pessoa p) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.merge(p);
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public static boolean excluir(Pessoa p) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(p);
            tx.commit();
            return true;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return false;
        }
    }

    public static Autenticavel autenticar(String usuario, String senha) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Pessoa p = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Pessoa as p where p.email=:usuario and p.senha=:senha");
            q.setParameter("usuario", usuario);
            q.setParameter("senha", senha);
            List resultados = q.list();
            if (resultados.size() > 0) {
                p = (Pessoa) resultados.get(0);
            }
            return p;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return p;
        } finally {
            session.close();
        }
    }

    public static boolean existe(String usuario) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
         try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Pessoa as p where p.email=:usuario");
            q.setParameter("usuario", usuario);
            List resultados = q.list();
            if (resultados.size() > 0) {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Erro ao consultar existência de usuário");
        } finally {
            session.close();
        }
    }

    public static boolean existe(DocReceita documento) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
         try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM DocReceita as d where d.numero=:documento");
            q.setParameter("documento", documento.getNumero());
            List resultados = q.list();
            if (resultados.size() > 0) {
                return true;
            }else{
                return false;
            }
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            throw new RuntimeException("Erro ao consultar existência de usuário com o documento solicitado");
        } finally {
            session.close();
        }
    }
}
