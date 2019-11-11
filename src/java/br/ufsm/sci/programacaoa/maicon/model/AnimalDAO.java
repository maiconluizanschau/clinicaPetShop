package br.ufsm.sci.programacaoa.maicon.model;

import br.ufsm.sci.programacaoa.maicon.controller.Animal;
import br.ufsm.sci.programacaoa.maicon.controller.Pessoa;
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
public class AnimalDAO {

    public static boolean salvar(Animal a) {
        Session session;
        session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.save(a);
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
        Collection<Animal> a = p.getAnimal();
        try {
            tx = session.beginTransaction();
            //Percorrendo a coleção de animais
            for (Iterator iter = a.iterator(); iter.hasNext();) {
                Animal animal = (Animal) iter.next();
                session.save(animal);
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

    public static Animal consultar(int idAnimal) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Animal a = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Animal as a where a.idAnimal=:id");
            q.setParameter("id", idAnimal);
            List resultados = q.list();
            if (resultados.size() > 0) {
                a = (Animal) resultados.get(0);
            }
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return a;
    }

    public static boolean alterar(Animal a) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.merge(a);
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

    public static boolean excluir(Animal a) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(a);
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
        Collection<Animal> a = p.getAnimal();
        try {
            tx = session.beginTransaction();
            //Percorrendo a coleção de animais
            for (Iterator iter = a.iterator(); iter.hasNext();) {
                Animal animal = (Animal) iter.next();
                session.delete(animal);
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

    public static Collection<Animal> consultar(Pessoa p) {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Animal> a = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Animal as a where a.pessoa=:p");
            q.setParameter("p", p);
            a = q.list();
            return a;
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
            return a;
        } finally {
            session.close();
        }
    }

    public static Collection<Animal> consultar() {
        Session session = ConexaoHibernate.getInstance();
        Transaction tx = null;
        Collection<Animal> a = null;
        try {
            Query q;
            tx = session.beginTransaction();
            q = session.createQuery("FROM Animal as a");
            a = q.list();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
        return a;
    }
}
