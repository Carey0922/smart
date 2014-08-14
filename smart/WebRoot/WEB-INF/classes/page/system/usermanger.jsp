<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
	<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
</head>
	<style type="text/css">
	input[type="text"] {
	 background-color: transparent;
}

</style>

</head>
<body >

<form  name="SysUserForm"   action="#" method="POST"  onkeydown="if(event.keyCode==13){return false;}">
	
         <!-- table bootstrap 提供的默认表格样式  table-condensed 压缩表格间距 
   table-striped 表格奇数样式 table-bordered 表格边框 table hover 鼠标移动改变样式
--->
		<div>
				<ul class="breadcrumb">
					<li>
						  系统管理<span class="divider">/</span>
					</li>
					<li>
						 用户管理
					</li>
				</ul>
			</div>
<table class=" table  table2  table-striped table-hover table-condensed  box" >
		<thead>
        	<tr>
            	<th colspan="9" ><img src="<%=path %>/images/tablehrard.png"/>&nbsp;<font color="White">用户列表</font></th>
            </tr>
        </thead>
        <tbody>
        	<tr>
            	<td colspan="8" valign="baseline">
                 <input id="searchtype" type="text"    name="query"  value="${ query}" /><input type="button" id="search" onclick="findData()"/>
                 </td>
             <td align="center"><input type="button" id="setting"  onclick="Authorize()" title="用户授权">
             <input type="button" id="paper-clip" onclick="addUsers()" title="添加用户"></td>
            </tr>
        	<tr>
            	<td>&nbsp;</td>
            	<td>头像</td>
                <td>用户编号</td>
                <td>用户名</td>
                <td>用户邮箱</td>
                   <td>姓名</td>
                <td>用户状态</td>
                <td>更新时间</td>
                <td>操作</td>
            </tr>
             <c:forEach var ="list"  items="${pageModel.data}" >
            <tr>
            		<td >
									<input type="radio"  style="width:20px;" name="uid"  value="${ list.uid}">
								</td>
								<td ><img alt="" style="width: 40px;height: 35px" src="<%=path %>${ list.useravatar}"></td>
								<td class="center">${ list.uid}</td>
								<td class="center">${ list.uname}</td>
								<td class="center">${ list.email}</td>
								<td class="center">${ list.sname}</td>
								<td class="center">
								<c:if test="${list.active ==1}"><span class="label label-info">活动状态</span></c:if>
								 <c:if test="${list.active ==0}"> <span class="label label-warning">禁用状态</span></c:if></td>
								<td class="center"><fmt:formatDate value="${ list.update_date}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
                <td>	
                	<input type="button" id="detailed" onclick="detailedlocalhost(${ list.uid})"/>
                    <input type="button" id="edit" onclick="editlocaltion(${ list.uid})"/>
                    <c:if test="${currentUser=='ROLE_ADMIN'}">
                    <input type="button" id="delete"  onclick="deletelocaltion(${ list.uid})"/>
                    </c:if>
                    
                </td>
            </tr>
           </c:forEach>
         	<tr>
         			<td  colspan="9">
					  <font>
					  <a href="javascript:void(0);" onclick="goFirst('<%=path %>/SystemUser/displayIndex.do');">首页</a>
					  <a href="javascript:void(0);" onclick="goPrev('<%=path %>/SystemUser/displayIndex.do');">上一页</a>
					  每页显示
					  <select id="pageSize" name="pageSize"  style="width:60px;" onchange="changePage('<%=path %>/SystemUser/displayIndex.do');">
					  	<option value="5" <c:if test="${pageModel.pageSize==5 }">selected</c:if>> 5</option>
					  	<option value="10" <c:if test="${pageModel.pageSize==10 }">selected</c:if>>10</option>
					  </select>条
					  共${pageModel.totalCount}条记录
					 
					  页数：<input id="pageIndex" name="pageIndex" type="hidden" value="${pageIndex }"  />
					  <input id="totalCount" name="totalCount" type="hidden" value="${pageModel.totalCount }" />
					  <input id="totalPage" name="totalPage" type="hidden" value="${pageModel.pageCount }" />
					  ${pageIndex }/
					  ${pageModel.pageCount }
					  <a href="javascript:void(0);" onclick="goNext('<%=path %>/SystemUser/displayIndex.do');">下一页</a>
					  <a href="javascript:void(0);" onclick="goLast('<%=path %>/SystemUser/displayIndex.do');">尾页</a>       
					  </font>
         			</td>
         	</tr>
        </tbody>
</table>
	
</form>
</body>
<script type="text/javascript">
function  Authorize(){
	
	var uid = document.getElementsByName("uid");
	var  j=0;
	for(var i=0;i<uid.length;i++){
		if(uid[i].checked){
					j=1;
					gotoAddPage("<%=path%>/SysRole/loadAuthorize.do?uid="+uid[i].value);
		return;
		}
	}
	if(j==0){
		showdialog("请选择需要授权的用户");
	}
	
}

function  showSearch(){
	var display=document.getElementById("searchview").style.display;
	if(display=="none"){
	document.getElementById("searchview").style.display="block";
	}else{
		document.getElementById("searchview").style.display="none";
	}
}
function  findData(){
	var  querys=$("#searchtype").val();
	loadPageForPost('<%=path %>/SystemUser/displayIndex.do',{query:querys});
}

function  addUsers(){
	gotoAddPage("<%=path %>/page/system/addSysUser.jsp");
}

function  detailedlocalhost(userid){
	gotoAddPage("<%=path %>/SystemUser/editShowView.do?nextpage=sysUserMessage&uid="+userid);

}
function  editlocaltion(userid){
	gotoAddPage("<%=path %>/SystemUser/editShowView.do?nextpage=editSysUser&uid="+userid);
}
function  deletelocaltion(userid){
	   gotoAddPage("<%=path %>/SystemUser/delUserinfo.do?uid="+userid);
		JshPrompt(userid+"用户删除操作执行完成！");
}



</script>
</html>