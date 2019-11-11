/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.ufsm.sci.programacaoa.maicon.model;

import br.ufsm.sci.programacaoa.maicon.controller.Endereco;
import br.ufsm.sci.programacaoa.maicon.controller.Pessoa;
import java.util.ArrayList;
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
public class EnderecoDAO {

    public static boolean salvar(Endereco e) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(e);
            tx.commit();
            return true;
        } catch (Exception ex) {
            tx.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public static boolean salvar(Pessoa p) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Endereco> e = p.getEndereco();
        try {
            tx = session.beginTransaction();
            //Percorrendo a coleção
            for (Iterator iter = e.iterator(); iter.hasNext();) {
                Endereco endereco = (Endereco) iter.next();
                session.save(endereco);
            }
            tx.commit();
            return true;
        } catch (Exception ex) {
            tx.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public static Endereco consultar(int idEndereco) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Endereco e = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Endereco as e where e.idEndereco=:id");
            q.setParameter("id", idEndereco);
            List resultados = q.list();
            if (resultados.size() > 0) {
                e = (Endereco) resultados.get(0);
            }
            return e;
        } catch (Exception ex) {
            tx.rollback();
            ex.printStackTrace();
            return e;
        } finally {
            session.close();
        }
    }

    public static ArrayList<Endereco> consultar(Pessoa p) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        ArrayList<Endereco> e = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Endereco as e where e.pessoa=:p");
            q.setParameter("p", p);
            e = (ArrayList<Endereco>) q.list();
        } catch (Exception ex) {
            tx.rollback();
            ex.printStackTrace();
        } finally {
            session.close();
        }
        return e;
    }

    public static boolean alterar(Endereco e) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.merge(e);
            tx.commit();
            return true;
        } catch (Exception ex) {
            tx.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public static boolean excluir(Endereco e) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(e);
            tx.commit();
            return true;
        } catch (Exception ex) {
            tx.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }

    public static boolean excluir(Pessoa p) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Endereco> e = p.getEndereco();
        try {
            tx = session.beginTransaction();
            //Percorrendo a coleção
            for (Iterator iter = e.iterator(); iter.hasNext();) {
                Endereco endereco = (Endereco) iter.next();
                session.delete(endereco);
            }
            tx.commit();
            return true;
        } catch (Exception ex) {
            tx.rollback();
            ex.printStackTrace();
            return false;
        } finally {
            session.close();
        }
    }
}
