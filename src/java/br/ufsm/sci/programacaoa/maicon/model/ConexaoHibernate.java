package br.ufsm.sci.programacaoa.maicon.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class ConexaoHibernate {

    private static final SessionFactory sessionFactory;
    private static final ThreadLocal<Session> threadLocal = new ThreadLocal<Session>();

    static {
        try {
            sessionFactory = new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();
        } catch (Throwable e) {
            System.err.println("\n\n\n----  Erro nas sessões e conexao com Hibernate -----------------------\n\n\n");
            e.printStackTrace();
            System.err.println("\n\n\n---- Fim das sessões e erro Hibernate --------------\n\n\n");
            throw new ExceptionInInitializerError(e);
        }
    }

    // retorna uma sessao de comunicacao com o Banco de dados

    public static Session getInstance() {
        Session session = (Session) threadLocal.get();
        session = sessionFactory.openSession();
        threadLocal.set(session);
        return session;
    }
}
