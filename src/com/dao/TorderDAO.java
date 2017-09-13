package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Torder;

/**
 	* A data access object (DAO) providing persistence and search support for Torder entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Torder
  * @author MyEclipse Persistence Tools 
 */
public class TorderDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(TorderDAO.class);
	

	protected void initDao() {
		//do nothing
	}
    
    public void save(Torder transientInstance) {
        log.debug("saving Torder instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Torder persistentInstance) {
        log.debug("deleting Torder instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Torder findById( java.lang.Integer id) {
        log.debug("getting Torder instance with id: " + id);
        try {
            Torder instance = (Torder) getHibernateTemplate()
                    .get("com.pojo.Torder", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Torder instance) {
        log.debug("finding Torder instance by example");
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
      log.debug("finding Torder instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Torder as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}


	public List findAll() {
		log.debug("finding all Torder instances");
		try {
			String queryString = "from Torder";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Torder merge(Torder detachedInstance) {
        log.debug("merging Torder instance");
        try {
            Torder result = (Torder) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Torder instance) {
        log.debug("attaching dirty Torder instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Torder instance) {
        log.debug("attaching clean Torder instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static TorderDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (TorderDAO) ctx.getBean("TorderDAO");
	}
}