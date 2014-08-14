package com.smart.sys.core.service.role.impl;

import com.smart.sys.core.dao.role.IRoleDao;
import com.smart.sys.core.service.role.IRoleService;
import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import com.sqlmapper.exception.SQLMapperException;
import com.sqlmapper.link.ParameterProcessor;
import com.sqlmapper.link.SQLMapperTableLink;
import com.sqlmapper.link.impl.ParameterProcessorImpl;
import org.apache.commons.collections4.map.ListOrderedMap;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-29
 * Time: 上午10:07
 * To change this template use File | Settings | File Templates.
 */
@Service
public class RoleServiceImpl implements IRoleService {
    private static Logger logger= Logger.getLogger(RoleServiceImpl.class);
    @Autowired
    private  IRoleDao iRoleDao;
    @Override
    public List<Map<String,Object>> queryRole(ListOrderedMap<String, Object> map) {
        QueryEntity queryEntity=iRoleDao.queryRole(map);
        logger.debug("queryRole:"+queryEntity.getReturnCount());
        logger.debug("queryRole:"+queryEntity.getSqlMapperList());
        logger.debug("queryRole:"+queryEntity.getSql());
        logger.debug("queryRole:"+queryEntity.getExecTime());
        return  queryEntity.getSqlMapperList();
    }

    @Override
    public void saveRole(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=   iRoleDao.saveRole(map);
        logger.debug("saveRole:"+ execEntity.getSql());
        logger.debug("saveRole:"+execEntity.getMap());
        logger.debug("saveRole:"+execEntity.getExecTime());
        logger.debug("saveRole:"+execEntity.getReturnCount());
    }

    @Override
    public void updateRole(ListOrderedMap<String, Object> rowMap, ListOrderedMap<String, Object> whereMap) {
        ExecEntity execEntity= iRoleDao.updateRole(rowMap,whereMap);
        logger.debug("saveRole:"+ execEntity.getSql());
        logger.debug("saveRole:"+execEntity.getMap());
        logger.debug("saveRole:"+execEntity.getExecTime());
        logger.debug("saveRole:"+execEntity.getReturnCount());
    }

    @Override
    public void delRole(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity= iRoleDao.delRole(map);
        logger.debug("saveRole:"+ execEntity.getSql());
        logger.debug("saveRole:"+execEntity.getMap());
        logger.debug("saveRole:"+execEntity.getExecTime());
        logger.debug("saveRole:"+execEntity.getReturnCount());
    }
}
