package com.dao;

import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.pojo.Mycart;

/**
 	* A data access object (DAO) providing persistence and search support for Mycart entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see com.pojo.Mycart
  * @author MyEclipse Persistence Tools 
 */
public class MycartDAO extends HibernateDaoSupport  {
	private static final Logger log = LoggerFactory.getLogger(MycartDAO.class);
	

	protected void initDao() {
		//do nothing
	}
    
    public void save(Mycart transientInstance) {
        log.debug("saving Mycart instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }

    
	public void delete(Mycart persistentInstance) {
        log.debug("deleting Mycart instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public Mycart findById( java.lang.Integer id) {
        log.debug("getting Mycart instance with id: " + id);
        try {
            Mycart instance = (Mycart) getHibernateTemplate()
                    .get("com.pojo.Mycart", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(Mycart instance) {
        log.debug("finding Mycart instance by example");
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
      log.debug("finding Mycart instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from Mycart as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}


	public List findAll() {
		log.debug("finding all Mycart instances");
		try {
			String queryString = "from Mycart";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public Mycart merge(Mycart detachedInstance) {
        log.debug("merging Mycart instance");
        try {
            Mycart result = (Mycart) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(Mycart instance) {
        log.debug("attaching dirty Mycart instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(Mycart instance) {
        log.debug("attaching clean Mycart instance");
        try {
                      	getHibernateTemplate().lock(instance, LockMode.NONE);
                        log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static MycartDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (MycartDAO) ctx.getBean("MycartDAO");
	}
}