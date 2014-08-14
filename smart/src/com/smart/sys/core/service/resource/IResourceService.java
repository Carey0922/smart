package com.smart.sys.core.service.resource;

import com.sqlmapper.entity.ExecEntity;
import com.sqlmapper.entity.QueryEntity;
import org.apache.commons.collections4.map.ListOrderedMap;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-7-29
 * Time: 上午10:17
 * To change this template use File | Settings | File Templates.
 */
public interface IResourceService {

    public List<Map<String,Object>> queryResource(ListOrderedMap<String,Object> map);

    public void  saveResource(ListOrderedMap<String,Object> map);

    public void  updateResource(ListOrderedMap<String,Object> rowMap,ListOrderedMap<String,Object> whereMap);

    public void  delResource(ListOrderedMap<String,Object> map);
}
