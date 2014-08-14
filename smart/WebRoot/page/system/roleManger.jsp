<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
	<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色管理</title>
	

<style type="text/css">
.query{
	   padding-top: 0px; 
		padding-top: 8px; 
		padding-left: 10px;
		width: 10%;
}
</style>

</head>
<body>
<div>
				<ul class="breadcrumb">
					<li>
						  系统管理<span class="divider">/</span>
					</li>
					<li>
						角色管理
					</li>
				</ul>
			</div>
		<form  name="SysRoleForm"  action="<%=path %>/SysRole/displayIndex.do" method="POST" onkeydown="if(event.keyCode==13){return false;}">
<table class="table  table2  table-hover table-condensed table-striped ">
		<thead>
        	<tr>
            	<th colspan="6"><img src="<%=path %>/images/tablehrard.png"/>&nbsp;<font color="White">角色管理</font></th>
            </tr>
        </thead>
        <tbody>
        	<tr>
            	<td colspan="5" valign="baseline">
                 </td>
             <td align="center"><input type="button" id="setting"  onclick="distribute();" title="角色授权"> 
             <input type="button" id="paper-clip" onclick="showcreateView()" title="添加角色"></td>
            </tr>
        	<tr>
            	<td>&nbsp;</td>
            	<td>角色编码</td>
                <td>角色名</td>
                <td>角色类型</td>
                <td>更新时间</td>
                   <td>操作</td>
            </tr>
            	  <tbody>
						  <c:forEach var ="list"  items="${pageModel.data}" >
							<tr align="center">
								<td class="center"><input name="roleIds" type="radio" value="${list.roleid}" /></td>
								<td class="center">${ list.roleid}</td>
								<td class="center">${ list.rolename}</td>
								<td class="center">${ list.roletype}</td>
								<td class="center"><fmt:formatDate value="${ list.update_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td class="center">
								
									<input type="button" id="detailed" onclick="detailedlocalhost(${ list.id})"/>
               					     <input type="button" id="edit" onclick="editlocaltion(${ list.id})"/>
             				       <input type="button" id="delete"  onclick="deletelocaltion(${ list.id})"/>
                    
								</td>
							</tr>
							</c:forEach>
				<tr>
         			<td  colspan="9">
					  <font>
					  <a href="javascript:void(0);" onclick="goFirst('<%=path %>/SysRole/displayIndex.do');">首页</a>
					  <a href="javascript:void(0);" onclick="goPrev('<%=path %>/SysRole/displayIndex.do');">上一页</a>
					  每页显示
					  <select id="pageSize" name="pageSize" style="width:60px;" onchange="changePage('<%=path %>/SysRole/displayIndex.do');">
					  	<option value="5" <c:if test="${pageModel.pageSize==5 }">selected</c:if>>5</option>
					  	<option value="10" <c:if test="${pageModel.pageSize==10 }">selected</c:if>>10</option>
					  </select>条
					  共${pageModel.totalCount}条记录
					 
					  页数：<input id="pageIndex" name="pageIndex" type="hidden" value="${pageIndex }"  />
					  <input id="totalCount" name="totalCount" type="hidden" value="${pageModel.totalCount }" />
					  <input id="totalPage" name="totalPage" type="hidden" value="${pageModel.pageCount }" />
					  ${pageIndex }/
					  ${pageModel.pageCount }
					  <a href="javascript:void(0);" onclick="goNext('<%=path %>/SysRole/displayIndex.do');">下一页</a>
					  <a href="javascript:void(0);" onclick="goLast('<%=path %>/SysRole/displayIndex.do');">尾页</a>       
					  </font>
         			</td>
         	</tr>
           </tbody>
           	
           </table>
           
       	</form>
					


</body>
<script type="text/javascript">
		 function qeury(){
			    document.SysRoleForm.action="<%=path %>/SysRole/displayIndex.do";
			    var  querys=$("#searchtype").val();
				loadPageForPost('<%=path %>/SystemUser/displayIndex.do',{query:querys});
		 }
		 function  showSearch(){
				var display=document.getElementById("searchview").style.display;
				if(display=="none"){
				document.getElementById("searchview").style.display="block";
				}else{
					document.getElementById("searchview").style.display="none";
				}
			}
		 
		 function showcreateView(){
			 gotoAddPage("<%=path %>/SysRole/ShowCreateView.do");
		 }
		 

		 function  detailedlocalhost(userid){
			 gotoAddPage("<%=path %>/SysRole/ShowRoleView.do?nextPage=ShowSysRoleById&id="+userid);
		 }
		 function  editlocaltion(userid){
			 gotoAddPage("<%=path %>/SysRole/ShowRoleView.do?nextPage=updateSysRole&id="+userid);
		 }
		 function  deletelocaltion(userid){
			 gotoAddPage("<%=path %>/SysRole/deleteRole.do?uid="+userid);
		 }
		 
		 function distribute(){
				var roleIds=document.getElementsByName("roleIds");
				for(var i=0;i<roleIds.length;i++){
					if(roleIds[i].checked){
						 gotoAddPage("<%=path%>/SysRole/distribute.do?roleId="+roleIds[i].value);
						return;
					}
				}
				showdialog("请选择需要授权的角色");
			}
</script>
</html>