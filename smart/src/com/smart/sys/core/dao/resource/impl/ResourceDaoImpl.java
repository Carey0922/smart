package com.smart.sys.core.dao.resource.impl;

import com.smart.sys.core.dao.resource.IResourceDao;
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
 * Date: 14-7-29
 * Time: 上午10:21
 * To change this template use File | Settings | File Templates.
 */
@Service
public class ResourceDaoImpl implements IResourceDao {
    @Autowired
    private SQLMapperTableLink sqlMapperTableLink;


    @Override
    public QueryEntity queryResource(ListOrderedMap<String, Object> map) {
        QueryEntity queryEntity =null;
        StringBuffer SQL=new StringBuffer("select *  from  smart_sys_resource");
        ParameterProcessor parameterProcessor=new ParameterProcessorImpl();
        parameterProcessor.setNotNullParameter("offSize",map.get("offSize")," limit ?,?",SQL);
        parameterProcessor.setNotNullParameter("pageSize",map.get("pageSize"),"",SQL);
        try {
            queryEntity=sqlMapperTableLink.queryByLinkTable(SQL,parameterProcessor);
            StringBuffer SQL2=new StringBuffer("select count(id)as count from smart_sys_resource");
            ParameterProcessor parameterProcessor1=new ParameterProcessorImpl();
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
    public ExecEntity saveResource(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=null;
        try {
            execEntity =sqlMapperTableLink.insert("smart_sys_resource",map);
        } catch (SQLMapperException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return execEntity;  //To change body of implemented methods use File | Settings | File Templates.

    }

    @Override
    public ExecEntity updateResource(ListOrderedMap<String, Object> rowMap, ListOrderedMap<String, Object> whereMap) {
        ExecEntity execEntity=null;
        try {
            execEntity =sqlMapperTableLink.update("smart_sys_resource", rowMap, whereMap);
        } catch (SQLMapperException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return execEntity;  //To change body of implemented methods use File | Settings | File Templates.

    }

    @Override
    public ExecEntity delResource(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=null;
        try {
            execEntity =sqlMapperTableLink.delete("smart_sys_resource", map);
        } catch (SQLMapperException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return execEntity;  //To change body of implemented methods use File | Settings | File Templates.

    }
}
