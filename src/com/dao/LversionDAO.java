package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Lversion;

/**
 	* A data access object (DAO) providing persistence and search support for Lversion entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Lversion
  * @author MyEclipse Persistence Tools 
 */
public class LversionDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(LversionDAO.class);
	

	protected void initDao() {
		//do nothing
	}
    
    public void save(Lversion transientInstance) {
        log.debug("saving Lversion instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Lversion persistentInstance) {
        log.debug("deleting Lversion instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Lversion findById( java.lang.Integer id) {
        log.debug("getting Lversion instance with id: " + id);
        try {
            Lversion instance = (Lversion) getHibernateTemplate()
                    .get("com.pojo.Lversion", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Lversion instance) {
        log.debug("finding Lversion instance by example");
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
      log.debug("finding Lversion instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Lversion as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}


	public List findAll() {
		log.debug("finding all Lversion instances");
		try {
			String queryString = "from Lversion";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Lversion merge(Lversion detachedInstance) {
        log.debug("merging Lversion instance");
        try {
            Lversion result = (Lversion) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Lversion instance) {
        log.debug("attaching dirty Lversion instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Lversion instance) {
        log.debug("attaching clean Lversion instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static LversionDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (LversionDAO) ctx.getBean("LversionDAO");
	}
}