<%@page import="java.util.UUID"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String uuid =UUID.randomUUID().toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加区域</title>

<script type="text/javascript">

function submitOrg(){
	var fromObj =document.getElementById("form1");
	var areaName = document.getElementById("areaName").value;
	if(areaName==""){
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
				<ul class="breadcrumb" style="width: 94%">
					<li>
						组织机构管理 <span class="divider">/</span>
					</li>
					<li>
						区域添加
					</li>
				</ul>
			</div>
			
				<div class="box span11" style="height:375px ">
					<div class="box-header well" >
						<h2><i class="icon-user"></i>添加区域</h2>
					</div>
					<div>
					<form action="<%=path %>/organize/addOrganize.do" id="form1" method="post" >
						<table  class="table  table-bordered bootstrap-datatable datatable">
							<input type="hidden" id="Id" name="Id" value="${param.Id }"/>
										<tr>
												<td width="15%">区域编码：</td>
												<td width="30%"><input type="text" id="areaCode" name="areaCode" value="<%=uuid %>" readonly="readonly" size="35"></td>
												<td>区域名称：</td>
												<td><input type="text" id="areaName" name="areaName" size="25"></td>
										</tr>
										<tr>
											<td>区域类型：</td>
											<td>
												<select id="areaType" name="areaType">
													<option value="1">国家</option>
													<option value="2">省份、直辖市</option>
													<option value="3">地市</option>
													<option value="4">区县</option>
												</select>
											</td>
												<td>备注：</td>
												<td colspan=""><textarea name="remarks" rows="3" cols="500" id="remarks"></textarea> </td>
										</tr>
							</table>
							
							<div class="form-actions" align="center">
									<button class="btn  btn-large btn-primary" onclick="submitOrg()" type="button">保存</button>
										&nbsp; &nbsp;
									 <button class="btn btn-large btn-danger" type="reset">重 置</button>
							</div>
							</form>
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
</body>
</html>