<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
		<style type="text/css">
	input, textarea {
    width: 500px;
}

	h4{
		padding-top: 0px;

	}
	input[type="file"] {
	width: 400px;
}
	
		</style>
</head>
<body>

				<div id="breadCrumbs">
		<font color="#8D8E91">&nbsp;&nbsp;系统管理</font>&nbsp;/&nbsp;<font
			color="#8D8E91">角色管理</font>/&nbsp;<font color="#FF0000">角色信息</font>
	</div>

<table class="table  table2   table-hover table-condensed  ">
				<thead>
					<tr>
						<th colspan="2"><img src="<%=path %>/images/tablehrard.png" />&nbsp;用户修改</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">
							<h3>提示：该面板显示角色的所有信息</h3>
						</td>
					</tr>
						<tr>
							<td align="right" width="40%"><h4>角色名称：</h4></td>
							<td>${sys_jsh_role.rolename}</td>
						</tr>
						<tr >
							<td align="right" width="40%"><h4>角色编码：</h4></td>
							<td>${sys_jsh_role.roleid}</td>
						</tr>
					<tr>
					<td align="right" width="40%"><h4>角色类型：</h4></td>
							<td>
									<c:if test="${sys_jsh_role.roletype=='ROLE_USE'}">业务角色</c:if>
									<c:if test="${sys_jsh_role.roletype=='ROLE_ADMIN'}">系统角色</c:if>
						</td>
					</tr>
					<tr>
							<td align="right" width="40%"><h4>角色英文名：</h4></td>
							<td>${sys_jsh_role.roleenname}</td>
					</tr>

					<tr>
							<td align="right" width="40%"><h4>备注信息：</h4></td>
							<td colspan="3">${sys_jsh_role.remarks}</td>
					</tr>
				<tr>
					<td colspan="2" align="center">
						<button class="btn   btn-primary" type="button" onclick="indexlocalhost()">返回角色列表</button>
				</td>
				</tr>
						
		</tbody>
					</table>


</body>
<script type="text/javascript">
function  indexlocalhost(){
		 gotoAddPage("<%=path %>/SysRole/displayIndex.do");
}
</script>
</html>
