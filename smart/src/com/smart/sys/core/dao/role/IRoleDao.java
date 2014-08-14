package com.smart.sys.core.dao.role;

import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import org.apache.commons.collections4.map.ListOrderedMap;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-29
 * Time: 上午9:50
 * To change this template use File | Settings | File Templates.
 */
public interface IRoleDao {

    public QueryEntity queryRole(ListOrderedMap<String,Object> map);

    public ExecEntity saveRole(ListOrderedMap<String,Object> map);

    public ExecEntity updateRole(ListOrderedMap<String,Object> rowMap,ListOrderedMap<String,Object> whereMap);

    public  ExecEntity delRole(ListOrderedMap<String,Object> map);
}
