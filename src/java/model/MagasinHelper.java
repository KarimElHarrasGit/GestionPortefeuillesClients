/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import java.util.*;
import java.sql.*;

/**
 *
 * @author faycal
 */
public class MagasinHelper {

    Session session = null;

    public MagasinHelper() {
        this.session = HibernateUtil.getSessionFactory().openSession();
    }

    public List getClients() {
        List resultat = null;

        try {
            if (!session.isOpen()) {
                session = HibernateUtil.getSessionFactory().openSession();
            }
            session.flush();

            Query q = session.createQuery("from Customer");
            resultat = q.list();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }

        return resultat;
    }

    public List getDiscountCode() {
        List resultat = null;

        try {
            if (!session.isOpen()) {
                session = HibernateUtil.getSessionFactory().openSession();
            }
            session.flush();

            Query q = session.createQuery("select a.discountCode from DiscountCode a");
            resultat = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session.isOpen()) {
                session.close();
            }

        }

        return resultat;

    }

    public List getMicroMarket() {
        List resultat = null;
        //Transaction tx=null;
        try {
            //if(!session.isOpen())
            session = HibernateUtil.getSessionFactory().openSession();
            session.flush();

            //  tx=session.beginTransaction();
            Query q = session.createQuery("from MicroMarket");
            resultat = q.list();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session.isOpen()) {
                session.close();
            }

        }
        return resultat;
    }

    public void insertCustomer(String _name, String _adress, String _phone, String _email, String _discountCode, String _zip) {

        Transaction tx = null;
        try {
            if (!session.isOpen()) {
                session = HibernateUtil.getSessionFactory().openSession();
            }
            session.flush();

            tx = session.beginTransaction();
            Customer a = new Customer(_name, _adress, _phone, _email, _discountCode, _zip);
            session.save(a);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            //  tx.rollback();
            throw e;
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }

    }

    public void updateCustomer(int _customerId, String _name, String _adress, String _phone, String _email, Character _discountCode, String _zip) {

        Transaction tx = null;
        try {
            if (!session.isOpen()) {
                session = HibernateUtil.getSessionFactory().openSession();
            }
            session.flush();

            tx = session.beginTransaction();

            Customer a = new Customer();
            a.setCustomerId(_customerId);
            a.setName(_name);
            a.setAddressline1(_adress);
            a.setPhone(_phone);
            a.setEmail(_email);
            a.setDiscountCode(_discountCode);
            a.setZip(_zip);
            session.update(a);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
            throw e;
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }

    }

    public Customer getClient(int id) {

        Customer client = null;
        Transaction tx = null;
        try {
            if (!session.isOpen()) {
                session = HibernateUtil.getSessionFactory().openSession();
            }
            session.flush();
            tx = session.beginTransaction();
            Query q = session.createQuery(" from Customer a  where a.customerId =:_id");
            q.setInteger("_id", id);
            client = (Customer) q.list().iterator().next();
        } catch (Exception e) {
            System.out.println("erreur toto" + e);
            e.printStackTrace();
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }

        return client;
    }

    public void deleteCustomer(int _id) {

        Transaction tx = null;
        try {
            if (!session.isOpen()) {
                session = HibernateUtil.getSessionFactory().openSession();
            }
            session.flush();

            tx = session.beginTransaction();
            Query q = session.createQuery(" from Customer a  where a.customerId =:_id");
            q.setInteger("_id", _id);
            session.delete((Customer) q.list().iterator().next());
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
            throw e;
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }

    }

    public List getAchats(int id) {
        List<Object[]> resultat = null;
        Transaction tx = null;
        try {
            if (!session.isOpen()) {
                session = HibernateUtil.getSessionFactory().openSession();
            }
            session.flush();

            tx = session.beginTransaction();
            Query q = session.createQuery(" from PurchaseOrder as achats join achats.customer a where a.customerId=:_id");
            q.setInteger("_id", id);
            resultat = q.list();
            for (Object[] arr : resultat) {
                Query subquery = session.createQuery(" from Product p where p.productId =:_id");
                subquery.setInteger("_id", ((PurchaseOrder) arr[0]).getProductId());
                arr[1] = subquery.list().iterator().next();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (session.isOpen()) {
                session.close();
            }
        }

        return resultat;
    }

}
