package com.smart.sys.core.dao.user.impl;

import com.smart.sys.core.dao.user.IUserDao;
import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import com.sqlmapper.exception.SQLMapperException;
import com.sqlmapper.link.ParameterProcessor;
import com.sqlmapper.link.SQLMapperTableLink;
import com.sqlmapper.link.impl.ParameterProcessorImpl;
import org.apache.commons.collections4.map.ListOrderedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-28
 * Time: 下午1:14
 * To change this template use File | Settings | File Templates.
 */
@Service
public class UserDaoImpl implements IUserDao{
    /**
     * SQLMapper 注入
     */
    @Autowired
    private SQLMapperTableLink sqlMapperTableLink;


    @Override
    public QueryEntity queryUser(ListOrderedMap<String, Object> map) {
        QueryEntity queryEntity =null;
        StringBuffer SQL=new StringBuffer("select *  from  smart_sys_user where 1=1 ");
        ParameterProcessor parameterProcessor=new ParameterProcessorImpl();
        parameterProcessor.setNotNullParameter("isdel",map.get("isdel"),"and isdel= ?",SQL);
        parameterProcessor.setNotNullParameter("uid",map.get("uid"),"and uid= ? ",SQL);
        parameterProcessor.setNotNullParameter("offSize",map.get("offSize")," limit ?,?",SQL);
        parameterProcessor.setNotNullParameter("pageSize",map.get("pageSize"),"",SQL);
        try {
            queryEntity=sqlMapperTableLink.queryByLinkTable(SQL,parameterProcessor);
        StringBuffer SQL2=new StringBuffer("select count(uid)as count from smart_sys_user  where isdel= 0 ");
            ParameterProcessor parameterProcessor1=new ParameterProcessorImpl();
            parameterProcessor.setNotNullParameter("uid",map.get("uid"),"and uid= ? ",SQL);
           QueryEntity queryEntity1=sqlMapperTableLink.queryByLinkTable(SQL2,parameterProcessor1);
           queryEntity.setQueryEntityList(queryEntity1);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (SQLMapperException e) {
            e.printStackTrace();
        }
        return queryEntity;  //To change body of implemented methods use File | Settings | File Templates.
}

    @Override
    public ExecEntity saveUser(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=null;
        try {
            execEntity =sqlMapperTableLink.insert("smart_sys_user",map);
        } catch (SQLMapperException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return execEntity;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public ExecEntity updateUser(ListOrderedMap<String, Object> rowMap,ListOrderedMap<String,Object> whereMap) {
        ExecEntity execEntity=null;
        try {
            execEntity =sqlMapperTableLink.update("smart_sys_user",rowMap,whereMap);
        } catch (SQLMapperException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return execEntity;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public ExecEntity delUser(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=null;
        try {
            execEntity =sqlMapperTableLink.delete("smart_sys_user",map);
        } catch (SQLMapperException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return execEntity;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
