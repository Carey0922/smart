package com.smart.sys.core.servlet.resource;

import com.smart.sys.core.service.resource.IResourceService;
import com.smart.sys.core.service.role.IRoleService;
import com.smart.sys.core.servlet.SmartUtil;

import org.apache.commons.collections4.map.ListOrderedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2014/8/14.
 */
@Controller
@RequestMapping("/resource")
public class ResourceServlet {

    @Autowired
    private IResourceService  iResourceService ;
    @Autowired
    private SmartUtil smartUtil;
    @RequestMapping("/resourceListView.do")
    public String resourceListView(HttpServletRequest request,ModelMap modelMap){
        Map<String,Object> requestMap= request.getParameterMap();
        int  pageSize=10;
        int  offSize=0;
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("pageSize",pageSize);
        listOrderedMap.put("offSize",offSize);
        listOrderedMap.put("isdel",0);
        List<Map<String, Object>> list= iResourceService.queryResource(listOrderedMap);
        modelMap.put("list",list);
        return  "smart/resource/indexResource";
    }

    @RequestMapping("/oldResourceListView.do")
    public String oldResourceListView(HttpServletRequest request,ModelMap modelMap){
        Map<String,Object> requestMap= request.getParameterMap();
        int  pageSize=10;
        int  offSize=0;
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("pageSize",pageSize);
        listOrderedMap.put("offSize",offSize);
        listOrderedMap.put("isdel",1);
        List<Map<String, Object>> list= iResourceService.queryResource(listOrderedMap);
        modelMap.put("list",list);
        return  "smart/resource/oldResource";
    }

    /**
     * @description  增加、删除、修改
     * @param request
     * @param modelMap
     * @return
     */
    @RequestMapping("/execUpdate.do")
    public String execUpdate(HttpServletRequest request,ModelMap modelMap){
        Map<String,Object> requestMap= request.getParameterMap();
        ListOrderedMap listOrderedMap =new ListOrderedMap();
        ListOrderedMap whereListOrderedMap =new ListOrderedMap();
        String ctx= request.getParameter("ctx");
        String[] idArr= (String[]) requestMap.get("id");
        if(null!=ctx&& "PhysicalRemoval".equals(ctx)&& idArr.length>0) {
            listOrderedMap.clear();
            for (int i = 0; i < idArr.length; i++) {
                listOrderedMap.put("id", idArr[i]);
                iResourceService.delResource(listOrderedMap);
                listOrderedMap.clear();
            }
        }
        if(null!=ctx&&"update".equals(ctx)){
            whereListOrderedMap.put("id",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("id")));
            Timestamp date=new Timestamp(System.currentTimeMillis());
            listOrderedMap.put("type",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("type")));
            listOrderedMap.put("title",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("title")));
            listOrderedMap.put("url",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("url")));
            listOrderedMap.put("code",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("code")));
            listOrderedMap.put("description",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("description")));
            listOrderedMap.put("isdel",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("isdel")));
            listOrderedMap.put("update_time",date);
            iResourceService.updateResource(listOrderedMap,whereListOrderedMap);
            return  resourceListView(request, modelMap);
        }
        if(null!=ctx&&"save".equals(ctx)){
            Timestamp date=new Timestamp(System.currentTimeMillis());
            listOrderedMap.put("type",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("type")));
            listOrderedMap.put("title",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("title")));
            listOrderedMap.put("url",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("url")));
            listOrderedMap.put("code",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("code")));
            listOrderedMap.put("description",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("description")));

            listOrderedMap.put("update_time",date);
            iResourceService.saveResource(listOrderedMap);
            return  resourceListView(request, modelMap);
        }
        if(null!=ctx&&"logicDel".equals(ctx)) {
            listOrderedMap.put("isdel", 1);
            whereListOrderedMap.put("id",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("id")));
            iResourceService.updateResource(listOrderedMap,whereListOrderedMap);
            return  resourceListView(request,modelMap);
        }
        if(null!=ctx&&"restore".equals(ctx)) {
            listOrderedMap.put("isdel", 0);
            whereListOrderedMap.put("id",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("id")));
            iResourceService.updateResource(listOrderedMap,whereListOrderedMap);
            return  oldResourceListView(request, modelMap);
        }

        return  resourceListView(request,modelMap);
    }

    @RequestMapping("/getResourceInfo.do")
    public String getResourceInfo(HttpServletRequest request,ModelMap modelMap){
        String next=request.getParameter("next");
        Map<String,Object> requestMap= request.getParameterMap();
        ListOrderedMap listOrderedMap=new ListOrderedMap();
        listOrderedMap.put("id",smartUtil.getArrayOfFirstData((Object[]) requestMap.get("id")));
        List<Map<String, Object>> list= iResourceService.queryResource(listOrderedMap);
        if(!list.isEmpty()) {
            modelMap.put("resourceInfo", list.get(0));
        }
        return  "smart/resource/"+next;
    }

}
