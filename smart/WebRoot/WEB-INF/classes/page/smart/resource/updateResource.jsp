<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2014/8/8
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<from id="create">
<div class="box">
    <div class="box-head">
        <h2>角色更新</h2>
        <div class="baracts">
            <a href="javascript:;" class="toggle-btn"></a>
            <a href="javascript:;" class="close-btn"  onclick="closeBox('bodyInfo')"></a>
        </div>
    </div>
    <div class="box-body">
        <!--查询条件-->
            <input type="hidden" id="id" value="${resourceInfo.id}">
        <!--//查询条件-->
        <!--查询结果-->
        <div class="query-result-table m10-b">
            <table width="100%" class="table">

                <tr>
                    <td>资源类型：</td>
                    <td><input type="text" id="type" value="${resourceInfo.type}"></td>

                </tr>
                <tr>
                    <td>资源名称 ：</td>
                    <td><input type="text" id="title" value="${resourceInfo.title}"></td>
                </tr>
                <tr>
                    <td>资源描述 ：</td>
                    <td><input type="text" id="url" value="${resourceInfo.url}"></td>
                </tr>
                <tr>
                    <td>资源代码 ：</td>
                    <td><input type="text" id="update_time" value="${resourceInfo.code}"></td>
                </tr>


                <tr>
                    <td>资源描述 ：</td>
                    <td><input type="text" id="description" value="${resourceInfo.description}"></td>
                </tr>


                <tr>
                    <td>是否被拆卸：</td>
                    <td><input type="text" id="isdel" value="${resourceInfo.isdel}"></td>

                </tr>
               

                <tr><td>  <input type="button"  value="更新资源"  class="btn-orange1" onclick="updateResourceInfo()"/></td>
                    <td>  <input type="button"  value="取消"  class="btn-orange1"  onclick="closeBox('bodyInfo')"/> </td></tr>
            </table>
        </div>
    </div>

</div>
</from>


</body>

<script>
    function  closeBox(did){
        $("#"+did).html("");
    }
    function  updateResourceInfo(){
        var  id=$("#id").val();
        var  type=$("#type").val();  var  title=$("#title").val();  var  url=$("#url").val();
        var  update_time=$("#update_time").val();  var  isdel=$("#isdel").val() ; var  code=$("#code").val() ;
        $.ajax({
            url: '<%=path%>/resource/execUpdate.do?ctx=update',
            type: "post",//使用get方法访问后台
            dataType: "json",//返回json格式的数据
            data: {type:type,title:title,url:url,update_time:update_time,isdel:isdel,id:id},
            success: function (data) {
                $("#mainFrame").html(data);
            },
            cache: false
        });
    }



</script>
</html>
