/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.sci.programacaoa.maicon.model;

import br.ufsm.sci.programacaoa.maicon.controller.Pessoa;
import br.ufsm.sci.programacaoa.maicon.controller.Telefone;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author maicon
 */
public class TelefoneDAO {

    public static boolean salvar(Telefone t) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(t);
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

    public static Telefone consultar(int idTelefone) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Telefone t = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Telefone as t where t.idTelefone=:id");
            q.setParameter("id", idTelefone);
            List resultados = q.list();
            if (resultados.size() > 0) {
                t = (Telefone) resultados.get(0);
            }
            return t;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return t;
        } finally {
            session.close();
        }
    }

    public static Collection<Telefone> consultar(Pessoa p) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Telefone> t = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Telefone as t where t.pessoa=:p");
            q.setParameter("p", p);
            t = q.list();
            return t;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return t;
        } finally {
            session.close();
        }
    }

    public static boolean alterar(Telefone t) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.merge(t);
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

    public static boolean salvar(Pessoa p) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Telefone> t = p.getTelefone();
        try {
            tx = session.beginTransaction();
            //Percorrendo a coleção 
            for (Iterator iter = t.iterator(); iter.hasNext();) {
                Telefone telefone = (Telefone) iter.next();
                session.save(telefone);
            }
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




    public static boolean excluir(Telefone t) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(t);
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
        Collection<Telefone> t = p.getTelefone();
        try {
            tx = session.beginTransaction();
            //Percorrendo a coleção
            for (Iterator iter = p.getTelefone().iterator(); iter.hasNext();) {
                Telefone telefone = (Telefone) iter.next();
                session.delete(telefone);
            }
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
}
