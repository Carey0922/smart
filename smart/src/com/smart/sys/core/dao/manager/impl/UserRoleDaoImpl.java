package com.smart.sys.core.dao.manager.impl;

import com.smart.sys.core.dao.manager.IUserRoleDao;
import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import com.sqlmapper.exception.SQLMapperException;
import com.sqlmapper.link.ParameterProcessor;
import com.sqlmapper.link.SQLMapperTableLink;
import com.sqlmapper.link.impl.ParameterProcessorImpl;
import org.apache.commons.collections4.map.ListOrderedMap;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-29
 * Time: 下午12:36
 * To change this template use File | Settings | File Templates.
 */
public class UserRoleDaoImpl implements IUserRoleDao {
    @Autowired
    private SQLMapperTableLink sqlMapperTableLink;

    @Override
    public ExecEntity roleAuthorize(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=null;
        try {
            execEntity =sqlMapperTableLink.insert("smart_sys_role_user",map);
        } catch (SQLMapperException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return execEntity;  //To change body of implemented methods use File | Settings | File Templates.

    }

    @Override
    public ExecEntity resourceAuthorize(ListOrderedMap<String, Object> map) {
        ExecEntity execEntity=null;
        try {
            execEntity =sqlMapperTableLink.insert("smart_sys_role_resource",map);
        } catch (SQLMapperException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        return execEntity;  //To change body of implemented methods use File | Settings | File Templates.

    }
        @Override
    public QueryEntity queryUserRole(ListOrderedMap<String, Object> map) throws Exception {
            if(null==map.get("uid")){  throw new Exception("uid  is not null"); }
           StringBuffer stringBuffer =new StringBuffer("select b.*  from  smart_sys_role_user t  left join " +
                " smart_sys_role b on t.rid=b.rid  where t.uid=?");
            ParameterProcessor parameterProcessor =new ParameterProcessorImpl();
            parameterProcessor.setNotNullParameter("uid",map.get("uid"),"",stringBuffer);
            QueryEntity queryEntity= sqlMapperTableLink.queryByLinkTable(stringBuffer,parameterProcessor);
            return queryEntity;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public QueryEntity queryRoleResource(ListOrderedMap<String, Object> map) throws Exception {
        if(null==map.get("rid")){  throw new Exception("rid  is not  null!");}
        StringBuffer stringBuffer =new StringBuffer(
                "select t.* from smart_sys_resource  t left join smart_sys_role_resource b on b.resource_id =t.id where b.rid =?");
        ParameterProcessor parameterProcessor =new ParameterProcessorImpl();
        parameterProcessor.setNotNullParameter("rid",map.get("rid"),"",stringBuffer);
        QueryEntity queryEntity= sqlMapperTableLink.queryByLinkTable(stringBuffer,parameterProcessor);
        return queryEntity;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
