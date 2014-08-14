package com.smart.sys.core.service.resource.impl;

import com.smart.sys.core.dao.resource.IResourceDao;
import com.smart.sys.core.service.resource.IResourceService;
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
 * Time: 上午10:21
 * To change this template use File | Settings | File Templates.
 */
@Service
public class ResourceServiceImpl implements IResourceService {
    private static Logger logger= Logger.getLogger(ResourceServiceImpl.class);
    @Autowired
    private IResourceDao  iResourceDao;


    @Override
    public List<Map<String,Object>> queryResource(ListOrderedMap<String, Object> map) {
        QueryEntity queryEntity= iResourceDao.queryResource(map);
        logger.debug("queryResource:"+queryEntity.getReturnCount());
        logger.debug("queryResource:"+queryEntity.getSqlMapperList());
        logger.debug("queryResource:"+queryEntity.getSql());
        logger.debug("queryResource:"+queryEntity.getExecTime());
        return queryEntity.getSqlMapperList();  //To change body of implemented methods use File | Settings | File Templates.

    }

    @Override
    public void saveResource(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity= iResourceDao.saveResource(map);
        logger.debug("roleAuthorize:"+ execEntity.getSql());
        logger.debug("roleAuthorize:"+execEntity.getMap());
        logger.debug("roleAuthorize:"+execEntity.getExecTime());
        logger.debug("roleAuthorize:"+execEntity.getReturnCount());
    }

    @Override
    public void updateResource(ListOrderedMap<String, Object> rowMap, ListOrderedMap<String, Object> whereMap) {
        ExecEntity execEntity= iResourceDao.updateResource(rowMap,whereMap);
        logger.debug("updateResource:"+ execEntity.getSql());
        logger.debug("updateResource:"+execEntity.getMap());
        logger.debug("updateResource:"+execEntity.getExecTime());
        logger.debug("updateResource:"+execEntity.getReturnCount());
    }

    @Override
    public void delResource(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity= iResourceDao.delResource(map);
        logger.debug("delResource:"+ execEntity.getSql());
        logger.debug("delResource:"+execEntity.getMap());
        logger.debug("delResource:"+execEntity.getExecTime());
        logger.debug("delResource:"+execEntity.getReturnCount());
    }
}
