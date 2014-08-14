package com.smart.sys.core.dao.resource;

import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import org.apache.commons.collections4.map.ListOrderedMap;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-29
 * Time: 上午10:17
 * To change this template use File | Settings | File Templates.
 */
public interface IResourceDao {

    public QueryEntity queryResource(ListOrderedMap<String,Object> map);

    public ExecEntity  saveResource(ListOrderedMap<String,Object> map);

    public ExecEntity  updateResource(ListOrderedMap<String,Object> rowMap,ListOrderedMap<String,Object> whereMap);

    public ExecEntity  delResource(ListOrderedMap<String,Object> map);
}
