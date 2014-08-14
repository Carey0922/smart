package com.smart.sys.core.service.user.impl;

import com.smart.sys.core.service.user.IUserService;
import com.smart.sys.core.dao.user.IUserDao;
import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import org.apache.commons.collections4.map.ListOrderedMap;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class UserServiceImpl implements IUserService {
    private static Logger logger= Logger.getLogger(UserServiceImpl.class);
    @Autowired
    private IUserDao iUserDao;

    @Override
    public List<Map<String, Object>> queryUser(ListOrderedMap<String, Object> map) {
        QueryEntity queryEntity=iUserDao.queryUser(map);
        logger.debug("queryUser:"+queryEntity.getReturnCount());
        logger.debug("queryUser:"+queryEntity.getSqlMapperList());
        logger.debug("queryUser:"+queryEntity.getSql());
        logger.debug("queryUser:"+queryEntity.getExecTime());
        return  queryEntity.getSqlMapperList();
    }

    @Override
    public void saveUser(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=  iUserDao.saveUser(map);
        logger.debug("saveUser:"+ execEntity.getSql());
        logger.debug("saveUser:"+execEntity.getMap());
        logger.debug("saveUser:"+execEntity.getExecTime());
        logger.debug("saveUser:"+execEntity.getReturnCount());
    }

    @Override
    public void updateUser(ListOrderedMap<String, Object> rowMap, ListOrderedMap<String, Object> whereMap) {
        ExecEntity execEntity=  iUserDao.updateUser(rowMap,whereMap);
        logger.debug("updateUser:"+ execEntity.getSql());
        logger.debug("updateUser:"+execEntity.getMap());
        logger.debug("updateUser:"+execEntity.getExecTime());
        logger.debug("updateUser:"+execEntity.getReturnCount());
    }

    @Override
    public void delUser(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=   iUserDao.delUser(map);
        logger.debug("delUser:"+ execEntity.getSql());
        logger.debug("delUser:"+execEntity.getMap());
        logger.debug("delUser:"+execEntity.getExecTime());
        logger.debug("delUser:"+execEntity.getReturnCount());
    }
}
