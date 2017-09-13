package com.dao;

import java.lang.reflect.Field;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;


import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class HQLDAO extends HibernateDaoSupport {

	public List jdbc(String sql, Class c, Object... p) {
		List list = new ArrayList();
		Session session = getHibernateSession();
		Connection con = session.connection();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			if (p != null) {
				for (int i = 0; i < p.length; i++) {
					ps.setObject(i + 1, p[i]);
				}
			}
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ResultSetMetaData rsmd = rs.getMetaData();
				Object obj = c.newInstance();

				for (int i = 0; i < rsmd.getColumnCount(); i++) {
					String columnName = rsmd.getColumnName(i + 1);
					Field field = c.getDeclaredField(columnName);
					if (field == null)
						continue;
					field.setAccessible(true);
					Object value = rs.getObject(columnName);
					field.set(obj, value);
				}
				list.add(obj);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		return list;

	}

	public Session getHibernateSession() {
		return (Session) super.getHibernateTemplate().execute(new HibernateCallback() {

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						// TODO Auto-generated method stub
						return session;
					}

				});

	}

	public Object queryFunction(final String fn, final Object... p) {
		return super.getHibernateTemplate().execute(new HibernateCallback() {
			// {?=call getchild(?)}
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Connection connection = session.connection();
				String sql = fn;
				CallableStatement cs = connection.prepareCall(sql);
				cs.registerOutParameter(1, Types.VARCHAR);
				if (p != null)
					for (int i = 0; i < p.length; i++) {
						cs.setObject(i + 2, p[i]);
					}
				cs.execute();
				String msg = cs.getString(1);
				return msg;
			}
		});
	}

	public int unique(final String hql, final Object... p) {

		List list = findByHQL(hql, p);

		if (list.size() > 0) {
			Object obj = list.get(0);
			if (obj != null) {
				return Integer.parseInt(obj.toString());
			}
		}
		return 0;
	}

	public List findByHQL(final String hql, final Object... p) {
		List list = getHibernateTemplate().find(hql, p);
		return list;
	}

	/*
	 * 条件查询
	 */
	public List pageQuery2(final String hql, final Object... p) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				String shql = hql.toString();
				Query query = session.createQuery(shql);
				if (p != null)
					for (int i = 0; i < p.length; i++) {
						query.setParameter(i, p[i]);
					}
				return query.list();
			}

		});
	}


	// page:页 ，size:数据多少
	public List pageQuery(final String hql, final int page, final int size,
			final Object... p) {
		return getHibernateTemplate().executeFind(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Query query = session.createQuery(hql);
				query.setFirstResult((page-1)*size).setMaxResults(size);				
				if (p != null)
					for (int i = 0; i < p.length; i++) {
						query.setParameter(i, p[i]);
					}
				return query.list();
			}
		});
	}

	
	public void bulkUpdate(String hql, Object... p) {
		getHibernateTemplate().bulkUpdate(hql, p);
	}

	/**
	 * 用查询缓存去查询数据 ，不分页
	 * 
	 * @param hql
	 * @param p
	 * @return
	 */
	public List findCache(String hql, Object... p) {
		Session session = getHibernateSession();
		Query query = session.createQuery(hql);
		query.setCacheable(true);// 开启查询缓存 要先配好二级缓存
		if (p != null) {
			for (int i = 0; i < p.length; i++) {
				query.setParameter(i, i + 1);
			}
		}
		List list = query.list();

		return list;
	}

	/**
	 * 用查询缓存去查询数据， 分页查询
	 * 
	 * @param hql
	 *            hql语句
	 * @param page
	 *            第几页
	 * @param size
	 *            每页多少条
	 * @param p
	 *            不定参数
	 * @return 返回一个结果集
	 */
	public List pageQueryCache(String hql, int page, int size, Object... p) {
		Session session = getHibernateSession();
		Query query = session.createQuery(hql);
		query.setCacheable(true);// 开启查询缓存
		if (p != null) {
			for (int i = 0; i < p.length; i++) {
				query.setParameter(i, p[i]);// 给问号赋值 下标从0开始
			}
		}

		query.setFirstResult((page - 1) * size).setMaxResults(size);// 从第几条开始查
																	// 每页多少条

		List list = query.list();

		return list;
	}

	/**
	 * 
	 * @Title: HQLDAO
	 * @author: Kk QQ:279697375
	 * @Description: sql分页
	 * @throws
	 */
	public List sqlPageCreateQuery(String sql, int page, int size, Object... p) {
		Session session = getHibernateSession();
		Query query = session.createSQLQuery(sql);
		if (p != null) {
			for (int i = 0; i < p.length; i++) {
				query.setParameter(i, p[i]);
			}
		}
		query.setFirstResult((page - 1) * size).setMaxResults(size);
		List list = query.list();
		return list;
	}

	public List sqlCreateQuery(String sql, Object... p) {
		Session session = getHibernateSession();
		Query query = session.createSQLQuery(sql);
		if (p != null) {
			for (int i = 0; i < p.length; i++) {
				query.setParameter(i, p[i]);
			}
		}
		query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		List list = query.list();
		return list;
	}
}
