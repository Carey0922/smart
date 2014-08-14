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
<title>添加组织部门</title>
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
<div class="sortable">		
			<div>
				<ul class="breadcrumb">
					<li>
						组织机构管理 <span class="divider">/</span>
					</li>
					<li>
						组织机构添加
					</li>
				</ul>
			</div>
			
				<table class=" table  table2   table-condensed  " >
		<thead>
        	<tr>
            	<th colspan="9" ><img src="<%=path %>/images/tablehrard.png"/>&nbsp;<font color="White">创建组织机构</font></th>
            </tr>
        </thead>
        <tbody>
				
								<tr style="display: none;">
									<td></td>
									<td><input type="text" id="Id" name="Id" value="${param.Id }"/></td>
									<td></td>
									<td><input type="text" id="areaId" name="areaId" value="${param.areaId }"></td>
								</tr>
										<tr>
												<td>机构名称：</td>
												<td><input type="text" id="offName" name="offName" value="" size="25"></td>
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
												<td><input type="text" id="offZipCode" name="offZipCode" size="25"></td>
										</tr>
										<tr>
												<td>备注：</td>
												<td colspan="3"><textarea name="remarks" rows="3" cols="500" id="remarks"></textarea> </td>
										</tr>
										
										<tr >
									
								
											<td colspan="2"><button class="btn   btn-primary" onclick="submitOrg()" type="button">保存</button>
											</td>
											<td colspan="2"><button class="btn btn-danger" type="reset">重 置</button></td>
										</tr>
							</table>
							
									
							</form>
					</div>
				</div><!--/span-->
			
			</div><!--/row-->
</body>
</html>