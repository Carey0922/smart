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
<style type="text/css">

	input, textarea {
    width: 500px;
}

	h4{
		padding-top: 8px;
	}
	input[type="file"] {
	width: 400px;
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
	<form id="SystemUserForm"  name="SystemUserForm" action="<%=path%>/SysRole/RoleSave.do"  method="post" >
		<input type="hidden" id="rid" name="id" size="25" value="${sys_jsh_role.id}">
	<table class="table  table2   table-hover table-condensed  table-striped ">
				<thead>
					<tr>
						<th colspan="2"><img src="<%=path %>/images/tablehrard.png" />&nbsp;<font color="White">角色修改</font></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">
							<h3>提示：修改角色的详细信息</h3>
						</td>
					</tr>
						<tr >
							<td  align="right" width="30%">角色名称：</td>
							<td id="userAvatartd">
									<input type="text" name="Rolename" id="Rolename" size="25" value="${sys_jsh_role.rolename}" readonly="readonly">
								</td>
						</tr>
					<tr>
					<td align="right" width="30%">角色编码:</td>
					<td><input type="text" size="30" readonly="readonly" id="Rolecode"   name="Rolecode" value="${sys_jsh_role.roleid}"></td>
					</tr>
					<tr>
							<td align="right" width="30%">角色类型：</td>
							<td><select id="roletype" name="roletype">
									<option value="ROLE_USE" <c:if test="${sys_jsh_role.roletype=='ROLE_USER'}">selected="selected"</c:if>>业务角色</option>
									<option value="ROLE_ADMIN" <c:if test="${sys_jsh_role.roletype=='ROLE_ADMIN'}">selected="selected"</c:if>>系统角色</option>
							     	<option value="ROLE_USES" <c:if test="${sys_jsh_role.roletype=='ROLE_USER'}">selected="selected"</c:if>>普通角色</option>
							</select></td>
							
					</tr>

					<tr>
						<td align="right" width="30%">角色英文名：</td>
							<td><input type="text" size="25" name="ERolename"  id="ERolename" value="${sys_jsh_role.roleenname}"></td>
					</tr>
					<tr>
						<td align="right" width="20%">备注信息</td>
							<td colspan="3"><textarea id="Remarks" name="Remarks" rows="4" style="width: 55%">${sys_jsh_role.remarks}</textarea></td>
					</tr>

					<tr>
					<td colspan="2" style="text-align: center;">
						<button class="btn   btn-primary"type="button" onclick="submitFrom()">角色更新</button>
								&nbsp; &nbsp;
						<button class="btn   btn-primary" type="button" onclick="returnRole()">返回角色列表</button>
					&nbsp; &nbsp;
					<button class="btn  btn-danger" type="reset">重 置</button>
					
				</td>
				</tr>
						
		</tbody>
					</table>
	
	
	
	</form>

</body>

<script type="text/javascript">
function  returnRole(){
	 gotoAddPage("<%=path %>/SysRole/displayIndex.do");
}

function ajaxS() {
   var  pojectNmae='<%=path %>';
    var options = {
        url: "<%=path %>/SystemUser/uploadImg.do?id="+Math.random(),
        dataType: "html",
        type: 'POST',
        success: function (data,status) {
            if(status=="success"){
            	 $('#userAvatartd').empty();
            	  var datas=data.split("#");
            	  var imageURL=datas[0];
            	 var imageName= datas[1];
            	 document.getElementById("imageName").value=imageName;
            	 document.getElementById("imageURL").value=imageURL;
            	 alert( document.getElementById("imageName").value);
            	 var imagepath="<img  src='"+pojectNmae+imageURL+"'>  <input type='button' class='btn btn-primary' value='删除' onclick='deluserAvatar()'>";
                   $('#userAvatartd').prepend(imagepath);
            }else{
				alert("导入失败！");
            }
        }
    };
    var form = $('#SystemUserForm');
        form.attr("enctype", "multipart/form-data");
    $('#SystemUserForm').ajaxSubmit(options);
    $('#SystemUserForm').remove("multipart/form-data");
      alert("");

} 

function  deluserAvatar(){
	 $('#userAvatartd').empty();
	 $('#userAvatartd').prepend("<input type='file' size='19' class='btn btn-close btn-round' name='userAvatar'> <input type='button'  class='btn btn-primary' value='上传头像' onclick='ajaxS()'>");
}
function  submitFrom(){
		if(document.getElementById("Rolename").value==""){
			showdialog("角色名称不能为空！");
			return;
		}
		if(document.getElementById("ERolename").value==""){
			showdialog("角色英文名不能为空！");
			return;
		}
		var parent=/^[A-Za-z]+$/;
  if(!parent.test(document.getElementById("ERolename").value))
  {
         showdialog("请输入角色英文名！");
		 return;
  }
		var Rolename=$('#Rolename').val();
		var ERolename=$('#ERolename').val();
		var Rolecode=$('#Rolecode').val();
		var roletype=$('#roletype').val();
		var Remarks=$('#Remarks').val();
		var id=$('#rid').val();
		
		    loadPageForPost('<%=path%>/SysRole/RoleSave.do',{id:id,Rolename:Rolename,ERolename:ERolename,Rolecode:Rolecode,roletype:roletype,Remarks:Remarks});
}



</script>
</html>
