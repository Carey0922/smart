package com.smart.sys.core.service.role;

import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import org.apache.commons.collections4.map.ListOrderedMap;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-29
 * Time: 上午9:50
 * To change this template use File | Settings | File Templates.
 */
public interface IRoleService {

    public List<Map<String,Object>> queryRole(ListOrderedMap<String,Object> map);

    public void saveRole(ListOrderedMap<String,Object> map);

    public void updateRole(ListOrderedMap<String,Object> rowMap,ListOrderedMap<String,Object> whereMap);

    public void delRole(ListOrderedMap<String,Object> map);
}
