<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改组织部门</title>
<link href="<%=path %>/css/bootstrap-responsive.css" rel="stylesheet">
<link href="<%=path %>/css/bootstrap-classic.css" rel="stylesheet">

<script type="text/javascript">
function submitOrg(){
	var fromObj =document.getElementById("form1");
	var offName =document.getElementById("offName").value;
	if(offName==""){
		alert("名称不能为空");
		return false;
	}
	fromObj.submit();
	window.parent.location.reload();
}
</script>
	
</head>
<body>
<div class="row-fluid sortable">		
			<div>
				<ul class="breadcrumb">
					<li>
						组织机构管理 <span class="divider">/</span>
					</li>
					<li>
						组织机构修改
					</li>
				</ul>
			</div>
			
				<div class="box span11">
					<div class="box-header well" >
						<h2><i class="icon-user"></i>组织机构修改</h2>
					</div>
					<div>
					<form action="<%=path %>/organize/updateOrganizeOffice.do" id="form1" method="post" >
						<table  class="table table-striped table-bordered bootstrap-datatable datatable">
										<tr style="display: none;" >
											<td>
											<input type="text" id="id" name="id" value="${sysOrganOff.id }"/></td>
											<td>
											<input type="text" id="parentId" name="parentId" value="${sysOrganOff.parent_id }"/></td>
											<td>
											<input type="text" id="areaId" name="areaId" value="${sysOrganOff.area_id }"/></td>
											<td></td>
										</tr>
										<tr>
												<td>机构名称：</td>
												<td><input type="text" id="offName" name="offName" value="${sysOrganOff.name }" size="25"></td>
												<td>联系地址：</td>
												<td><input type="text" id="offAddress" name="offAddress" value="${sysOrganOff.address }" size="25"></td>
										</tr>
										<tr>
												<td>负责人：</td>
												<td><input type="text" id="offMaster" name="offMaster" value="${sysOrganOff.master }" size="25"></td>
												<td>电话：</td>
												<td><input type="text" id="offPhone" name="offPhone" value="${sysOrganOff.phone }" size="25"></td>
										</tr>
										<tr>
												<td>邮箱：</td>
												<td><input type="text" id="offEmail" name="offEmail" value="${sysOrganOff.email }" size="25"></td>
												<td>邮政编码：</td>
												<td><input type="text" id="offZipCode" name="offZipCode" value="${sysOrganOff.zip_code }" size="25"></td>
										</tr>
										<tr>
												<td>备注：</td>
												<td colspan="3"><textarea name="remarks" rows="3" cols="500" id="remarks">${sysOrganOff.remarks }</textarea> </td>
										</tr>
							</table>
							
							<div class="form-actions" align="center">
									<button class="btn  btn-large btn-primary" type="button" onclick="submitOrg()">保存</button>
										&nbsp; &nbsp;
									 <button class="btn btn-large btn-danger" type="reset">重 置</button>
							</div>
							</form>
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
</body>
</html>