package org.jz.web.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.jz.web.domain.SysFunction;
import org.jz.web.domain.TellerFunc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SysfunctionDao {

  @Autowired
  private SessionFactory sessionFactory;

  public void setSessionFactory(SessionFactory sf) {
    this.sessionFactory = sf;
  }

  public void addSysfunction(SysFunction function) {
    Session session = sessionFactory.getCurrentSession();
    session.persist(function);
    session.flush();
  }

  public void addTellerFunc(TellerFunc tf) {
    Session session = sessionFactory.getCurrentSession();
    Query query = session.createQuery("from TellerFunc");
    List list = query.list();
    System.out.println(list.size());
  }

  public List<SysFunction> findFunctionByTellerId(String id) {
    Session session = sessionFactory.getCurrentSession();
    // 原生sql传统方式 A.id, A.name, A.layer
    String sSql = "SELECT A.* FROM sysfunction A JOIN tellerfunc B ON A.type='M' AND B.tellerid = '"
        + id + "' AND B.funcid=A.id ORDER BY A.id";
    Query query = session.createSQLQuery(sSql).addEntity(SysFunction.class);
    List<SysFunction> functions = query.list();
    return functions;
  }

}
