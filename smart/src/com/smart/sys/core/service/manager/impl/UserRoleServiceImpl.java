package com.smart.sys.core.service.manager.impl;

import com.smart.sys.core.dao.manager.IUserRoleDao;
import com.smart.sys.core.service.manager.IUserRoleService;
import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import com.sqlmapper.exception.SQLMapperException;
import com.sqlmapper.link.ParameterProcessor;
import com.sqlmapper.link.SQLMapperTableLink;
import com.sqlmapper.link.impl.ParameterProcessorImpl;
import org.apache.commons.collections4.map.ListOrderedMap;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;


/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-29
 * Time: 下午12:36
 * To change this template use File | Settings | File Templates.
 */
public class UserRoleServiceImpl implements IUserRoleService {
  private static Logger logger= Logger.getLogger(UserRoleServiceImpl.class);
    @Autowired
    private IUserRoleDao iUserRoleDao;

    @Override
    public void roleAuthorize(ListOrderedMap<String, Object> map) {
          ExecEntity execEntity= iUserRoleDao.roleAuthorize(map);
          logger.debug("roleAuthorize:"+ execEntity.getSql());
          logger.debug("roleAuthorize:"+execEntity.getMap());
          logger.debug("roleAuthorize:"+execEntity.getExecTime());
          logger.debug("roleAuthorize:"+execEntity.getReturnCount());
    }

    @Override
    public void resourceAuthorize(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity= iUserRoleDao.resourceAuthorize(map);
        logger.debug("resourceAuthorize:"+ execEntity.getSql());
        logger.debug("resourceAuthorize:"+execEntity.getMap());
        logger.debug("resourceAuthorize:"+execEntity.getExecTime());
        logger.debug("resourceAuthorize:"+execEntity.getReturnCount());

    }
        @Override
    public List<Map<String,Object>> queryUserRole(ListOrderedMap<String, Object> map) throws Exception {
            QueryEntity queryEntity= iUserRoleDao.queryUserRole(map);
            logger.debug("queryUserRole:"+queryEntity.getReturnCount());
            logger.debug("queryUserRole:"+queryEntity.getSqlMapperList());
            logger.debug("queryUserRole:"+queryEntity.getSql());
            logger.debug("queryUserRole:"+queryEntity.getExecTime());
            return queryEntity.getSqlMapperList();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<Map<String,Object>> queryRoleResource(ListOrderedMap<String, Object> map) throws Exception {
        QueryEntity queryEntity=  iUserRoleDao.queryRoleResource(map);
        logger.debug("queryRoleResource:"+queryEntity.getReturnCount());
        logger.debug("queryRoleResource:"+queryEntity.getSqlMapperList());
        logger.debug("queryRoleResource:"+queryEntity.getSql());
        logger.debug("queryRoleResource:"+queryEntity.getExecTime());
        return  queryEntity.getSqlMapperList();

    }
}
