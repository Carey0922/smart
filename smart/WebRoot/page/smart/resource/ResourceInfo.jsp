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
        <h2>角色信息</h2>
        <div class="baracts">
            <a href="javascript:;" class="toggle-btn"></a>
            <a href="javascript:;" class="close-btn"  onclick="closeBox('bodyInfo')"></a>
        </div>
    </div>
    <div class="box-body">

        <!--//查询条件-->
        <!--查询结果-->
        <div class="query-result-table m10-b">
            <table width="100%" class="table">
                <tr>
                    <td>资源名称：</td>
                    <td><input type="text" id="id" value="${resourceInfo.id}"></td>

                </tr>
                <tr>
                    <td>资源类型：</td>
                    <td><input type="text" id="type" value="${resourceInfo.type}"></td>

                </tr>
                <tr>
                    <td>资源代码 ：</td>
                    <td><input type="text" id="code" value="${resourceInfo.code}"></td>
                </tr>
                <tr>
                    <td>资源名称：</td>
                    <td><input type="text" id="title" value="${resourceInfo.title}"></td>
                </tr>
                <tr>
                <td>资源请求地址：</td>
                <td><input type="text" id="url" value="${resourceInfo.url}"></td>
                </tr>
                <tr>
                    <td>资源更新时间 ：</td>
                    <td><input type="text" id="update_time" value="${resourceInfo.update_time}"></td>
                </tr>
                <tr>
                    <td>资源描述 ：</td>
                    <td><input type="text" id="description" value="${resourceInfo.description}"></td>
                </tr>
                <tr>
                    <td>是否被拆卸：</td>
                    <td><input type="text" id="isdel" value="${resourceInfo.isdel}"></td>

                </tr>
                <tr><td></td>
                    <td>  <input type="button"  value="关闭"  class="btn-orange1"  onclick="closeBox('bodyInfo')"/> </td></tr>
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

</script>
</html>
