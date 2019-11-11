package br.ufsm.sci.programacaoa.maicon.model;

import br.ufsm.sci.programacaoa.maicon.controller.Animal;
import br.ufsm.sci.programacaoa.maicon.controller.Servico;
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
public class ServicoDAO {

    public static boolean salvar(Servico s) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(s);
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

    public static Servico consultar(int idServico) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Servico s = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Servico as s where s.idServico=:id");
            q.setParameter("id", idServico);
            List resultados = q.list();
            if (resultados.size() > 0) {
                s = (Servico) resultados.get(0);
            }
            return s;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return s;
        } finally {
            session.close();
        }
    }

    public static boolean salvar(Animal a) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Servico> s = a.getServico();
        try {
            tx = session.beginTransaction();
            //Percorrendo a coleção de serviços
            for (Iterator iter = s.iterator(); iter.hasNext();) {
                Servico servico = (Servico) iter.next();
                session.save(servico);
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

    public static Collection<Servico> consultar(Animal a) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Servico> s = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Servico as s where s.animal=:a");
            q.setParameter("a", a);
            s = q.list();
            return s;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return s;
        } finally {
            session.close();
        }
    }

    public static boolean excluir(Animal a) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Servico> s = a.getServico();
        try {
            tx = session.beginTransaction();
            //Percorrendo a coleção de animais
            for (Iterator iter = s.iterator(); iter.hasNext();) {
                Servico servico = (Servico) iter.next();
                session.delete(servico);
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

    public static boolean alterar(Servico s) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.merge(s);
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

    public static boolean excluir(Servico s) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(s);
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

    public static Collection<Servico> consultar() {
                Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Servico> s = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Servico as s");
            s = q.list();
            return s;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return s;
        } finally {
            session.close();
        }
    }
}
