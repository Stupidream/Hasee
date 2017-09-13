package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Pakages;

/**
 	* A data access object (DAO) providing persistence and search support for Pakages entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Pakages
  * @author MyEclipse Persistence Tools 
 */
public class PakagesDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(PakagesDAO.class);
	

	protected void initDao() {
		//do nothing
	}
    
    public void save(Pakages transientInstance) {
        log.debug("saving Pakages instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Pakages persistentInstance) {
        log.debug("deleting Pakages instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Pakages findById( java.lang.Integer id) {
        log.debug("getting Pakages instance with id: " + id);
        try {
            Pakages instance = (Pakages) getHibernateTemplate()
                    .get("com.pojo.Pakages", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Pakages instance) {
        log.debug("finding Pakages instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding Pakages instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Pakages as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}


	public List findAll() {
		log.debug("finding all Pakages instances");
		try {
			String queryString = "from Pakages";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Pakages merge(Pakages detachedInstance) {
        log.debug("merging Pakages instance");
        try {
            Pakages result = (Pakages) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Pakages instance) {
        log.debug("attaching dirty Pakages instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Pakages instance) {
        log.debug("attaching clean Pakages instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static PakagesDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (PakagesDAO) ctx.getBean("PakagesDAO");
	}
}