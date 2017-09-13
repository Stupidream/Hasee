package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Mycollect;

/**
 	* A data access object (DAO) providing persistence and search support for Mycollect entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Mycollect
  * @author MyEclipse Persistence Tools 
 */
public class MycollectDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(MycollectDAO.class);
	

	protected void initDao() {
		//do nothing
	}
    
    public void save(Mycollect transientInstance) {
        log.debug("saving Mycollect instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(Mycollect persistentInstance) {
        log.debug("deleting Mycollect instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Mycollect findById( java.lang.Integer id) {
        log.debug("getting Mycollect instance with id: " + id);
        try {
            Mycollect instance = (Mycollect) getHibernateTemplate()
                    .get("com.pojo.Mycollect", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }

    
    public List findByExample(Mycollect instance) {
        log.debug("finding Mycollect instance by example");
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
      log.debug("finding Mycollect instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Mycollect as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}


	public List findAll() {
		log.debug("finding all Mycollect instances");
		try {
			String queryString = "from Mycollect";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Mycollect merge(Mycollect detachedInstance) {
        log.debug("merging Mycollect instance");
        try {
            Mycollect result = (Mycollect) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Mycollect instance) {
        log.debug("attaching dirty Mycollect instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Mycollect instance) {
        log.debug("attaching clean Mycollect instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static MycollectDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (MycollectDAO) ctx.getBean("MycollectDAO");
	}
}