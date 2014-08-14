<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<style type="text/css">
	input, textarea {
    width: 400px;
}
	input[type="file"] {
	width: 400px;
	background-color: transparent;
	
}
	input[type="text"] {
	 background-color: transparent;
}

.table th, .table td  { border-top: 0px solid #DDDDDD;}


</style>
<style type="text/css">
.table td {
	padding: 5px;
	line-height: 10px;
	text-align: left;
	vertical-align: top;
	border-top: 1px solid #dddddd;
	
}

   .Divstr{
   		position:relative;
        overflow: auto;
   		padding:3px;	
   		width: 250px;
   		height: 300px;
   		background-color:#A3A799;
   		 z-index:2;
   		
   		
   }

   .DivInner{
      width:200px;
   		height: 30px;
   		margin: 1px;
   	
   			background-color:#A3A799
   }
   
      .NowDivInner{
      width:200px;
   		height: 30px;
   		margin: 3px;
   }
</style>

 
</head>
<body >
	<form id="userAuthorizeFrom" name="userAuthorizeFrom"
		action="<%=path%>/SysRole/userAuthorize.do" method="post">
		<input type="hidden" name="uid" id="uid" value="${jsh_user.uid }"> 
	
<div>
				<ul class="breadcrumb">
					<li>
						  系统管理<span class="divider">/</span>
					</li>
					<li>
						 用户管理<span class="divider">/</span>
					</li>
						<li>
						 用户授权
					</li>
				</ul>
			</div>

			
	<table class="table  table2 table-condensed ">
				<thead>
					<tr>
						<th colspan="4"><img src="<%=path %>/images/tablehrard.png"/>&nbsp;&nbsp;<font color="White">用户授权<font></th>
					</tr>
				</thead>
				<tbody>
		
				<tr>
											<td><div class="image">
									<img style="width: 50px; height: 50px" class="img-polaroid"
										src="<%=path %>${jsh_user.useravatar }">
								</div></td>

						</tr>


				
						<tr>
							<td>当前角色：</td>
							<td>
								<div  class="Divstr" id="nowRole"> 
									<c:forEach var="rolelist"  items="${ rolelist}">
										<div onclick="Role(this)" class="NowDivInner btn btn-success"><i class="icon-bookmark icon-white"></i>  
										${ rolelist.rolename} <input type="hidden" id="optionValue" name="optionValue" value="${ rolelist.roleid}"/> </div>
								</c:forEach>
								</div>
							</td>

							<td>全部角色</td>
							<td>
							<div  class="Divstr" id="AllRole" > 
									<c:forEach var="list"  items="${ list}">
										<div class="DivInner btn btn-info" onclick="Role(this)"><i class="icon-bookmark icon-white"></i>  ${ list.rolename} <input type="hidden" name="optionValue" value="${ list.roleid}"/></div>
								</c:forEach>
								</div>
							</td>
						</tr>
						<tr>
								<td colspan="4">
									<div class="form-actions" align="center">
					<input type="hidden" id="NowoptionValue" name="NowoptionValue"/>
					<button class="btn   btn-primary" type="button" onclick="appendValue()"  <c:if test="${uidRule=='ROLE_ADMIN'}">disabled="disabled" title="你没有权限操作该用户"</c:if>>确认授权</button>
					<button class="btn   btn-primary" type="button" onclick="brak()">返 回</button>
					&nbsp; &nbsp;
				</div>
								</td>
							</tr>
					</table>
				
	</form>

</body>


<script type="text/javascript">
			function  Role(evel){
				
			 evel.parentNode.removeChild(evel);
			 var classname=evel.className;
			 if(classname=='NowDivInner btn btn-success'){
					var AllRole=  document.getElementById('AllRole');
					AllRole.appendChild(evel);
					evel.className="DivInner btn btn-info";
			 }else{
				 var nowRole=  document.getElementById('nowRole');
				 nowRole.appendChild(evel);
				 evel.className="NowDivInner btn btn-success";
			 }
		
			
			}
			
			function  appendValue(){
				 document.getElementById("NowoptionValue").value=="";
				 var NowoptionValue="";
				var nowRole=document.getElementById("nowRole");

				var inputtype=nowRole.getElementsByTagName("input");
				for(var i=0;i<inputtype.length;i++){
				    	NowoptionValue+=inputtype[i].value+"@";
				    	document.getElementById("NowoptionValue").value=NowoptionValue;
				}
				var Nowoptiondata=$("#NowoptionValue").val();
				var uid=$("#uid").val();
				loadPageForPost('<%=path%>/SysRole/userAuthorize.do',{NowoptionValue:Nowoptiondata,uid:uid});
				}
				
				function  brak(){
					gotoAddPage("<%=path%>/SystemUser/displayIndex.do");
				}
		
		
</script>
</html>
