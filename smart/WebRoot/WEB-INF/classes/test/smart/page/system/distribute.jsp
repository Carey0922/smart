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

	<SCRIPT type="text/javascript">
		var setting = {
			async:{
				enable:false,
				
			},
			check:{
				enable: true
			},
			view: {
				addHoverDom: null,//addHoverDom
				removeHoverDom: null,//removeHoverDom
				selectedMulti: false
				//,fontCss:{color:"red"}
			},
			edit: {
				enable: false,
				editNameSelectAll: true
				//,
				//showRemoveBtn: showRemoveBtn,
				//showRenameBtn: showRenameBtn
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeEditName: beforeEditName,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove,
				onRename: onRename
			}
		};

		var m1='${allMenuList}';
		//alert(m1.length);
		//alert(m1);
		var myobj=eval(m1);  
		var strz='';
		for(var i=0;i<myobj.length;i++){   
		  // alert(myobj[i].name); 
		   if(myobj[i].parent_id==0){
			   if(i==myobj.length-1){
				   strz=strz+'{id:'+myobj[i].id+',pId:'+myobj[i].parent_id+',name:"'+myobj[i].name+'",open:true}';
			   }else{
				   strz=strz+'{id:'+myobj[i].id+',pId:'+myobj[i].parent_id+',name:"'+myobj[i].name+'",open:true},'; 
			   }
			   
		   }else{
			   if(i==myobj.length-1){
				   strz=strz+'{id:'+myobj[i].id+',pId:'+myobj[i].parent_id+',name:"'+myobj[i].name+'",open:true}';
			   }else{
				   strz=strz+'{id:'+myobj[i].id+',pId:'+myobj[i].parent_id+',name:"'+myobj[i].name+'",open:true},';
			   }
			  
		   }
		   
		}
		var zN1='['+strz+']';
		var zNodes =eval('('+zN1+')');
		var log, className = "dark";
		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		function beforeEditName(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			changeContentnn(treeNode.id);
			return false; 
			//confirm("进入节点 -- " + treeNode.name + " 的编辑状态吗？");
		}
		function beforeRemove(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			if(confirm("你确认要删除该菜单吗？")){
				document.getElementById('Nid').value=treeNode.id;
				document.getElementById("SystemUserForm").action='<%=path%>/SysMenu/deleteMenus.do';
				$('#SystemUserForm').submit();
			}
			return false; 
			//confirm("确认删除 节点 -- " + treeNode.name + " 吗？");
		}
		function onRemove(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function beforeRename(treeId, treeNode, newName) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			if (newName.length == 0) {
				alert("节点名称不能为空.");
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				setTimeout(function(){zTree.editName(treeNode)}, 10);
				return false;
			}
			return true;
		}
		function onRename(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function showRemoveBtn(treeId, treeNode) {
			return !treeNode.isFirstNode;
		}
		function showRenameBtn(treeId, treeNode) {
			return !treeNode.isLastNode;
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}

		var newCount = 1;
		function addHoverDom(treeId, treeNode) {
			
			var myobj=eval(zNodes); 
			var pids;
			for(var i=0;i<myobj.length;i++){ 
				if(treeNode.id==myobj[i].id){
					pids=myobj[i].pId;
				}
			
			}
			
			if(pids==1||pids==0){
				var sObj = $("#" + treeNode.tId + "_span");
				if (treeNode.editNameFlag || $("#addBtn_"+treeNode.id).length>0) return;
				var addStr = "<span class='button add' id='addBtn_" + treeNode.id
					+ "' title='add node' onfocus='this.blur();'></span>";
				sObj.after(addStr);
				var btn = $("#addBtn_"+treeNode.id);
				if (btn) btn.bind("click", function(){
					document.getElementById("ta1").style.display='block';
					document.getElementById("parent_id").value=treeNode.id;
					document.getElementById('Nid').value='';
					document.getElementById('name').value='';
					document.getElementById('href').value='';
					document.getElementById('remarks').value='';
				});
			}
			
			
		};
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.id).unbind().remove();
		};
		function selectAll() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#selectAll").bind("click", selectAll);
			var roleMenuList='${roleMenuList}';
			var roleMenuArray=eval('(' + roleMenuList + ')');
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			for(var i=0;i<roleMenuArray.length;i++){
				var node=treeObj.getNodeByParam("id", roleMenuArray[i].menuId, null);
				if(null!=node){
				node.checked=true;
				treeObj.updateNode(node,true);
				}
			}
			
		});
		
		function  submitFrom(){
			var x=document.getElementById('Nid').value;
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			for(var i=0;i<nodes.length;i++){
				if(i==0){
					$("#menuIds").val(nodes[i].id);
				}else{
					$("#menuIds").val($("#menuIds").val()+","+nodes[i].id);
				}
			}
			var roleId=$("#roleId").val();
			var menuIds=$("#menuIds").val();
		    loadPageForPost('<%=path%>/SysRole/grantRoleMenu.do',{roleId:roleId,menuIds:menuIds});

			
		}
		
		
		function changeContentnn(id) {
			var url = "<%=path%>/SysMenu/updateMenu.do";
			var pars = '&Nid='+id+'&id=' + Math.random();
			var myAjax = new Ajax.Request(url, {
				method : 'get',
				parameters : pars,
				onComplete : showNeedCodeResponsenn
			});
		}
		function showNeedCodeResponsenn(originalRequest) {
			var values = originalRequest.responseText.replace(/^\s+|\s+$/g, "");
				if (values != null && values != "") {
					document.getElementById("ta1").style.display='block';
				var arrvalue = values.split("@@");
				document.getElementById('parent_id').value=arrvalue[0];
				document.getElementById('Nid').value=arrvalue[1];
				document.getElementById('name').value=arrvalue[2];
				document.getElementById('href').value=arrvalue[3];
				document.getElementById('remarks').value=arrvalue[5];
				
			}
			
		}
		
	</SCRIPT>
	<style type="text/css">
.ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
	</style>
</HEAD>

<BODY>	
		
<form id="SystemUserForm"  name="SystemUserForm"  method="POST" >
			<table class=" table  table2  table-striped table-hover table-condensed  box" >
		<thead>
        	<tr>
            	<th colspan="9" ><img src="<%=path %>/images/tablehrard.png"/>&nbsp;<font color="White">权限管理</font></th>
            </tr>
        </thead>
        <tbody>
        	<tr>
			<td width="40%">
			</td>
			<td width="60%">
				<div class="zTreeDemoBackground left">
					<ul id="treeDemo" class="ztree"></ul>
				</div>
							<input type="hidden" id="parent_id" name="parent_id"   />
							<input type="hidden" id="Nid" name="Nid"   />
							<input type="hidden" name="roleId" id="roleId" value="${roleId }"  />
							<input type="hidden" id="menuIds" name="menuIds"  />
						
							<input class="btn   btn-primary" type="button" onclick="submitFrom()" value="保存菜单" />
							&nbsp; &nbsp;
							<input class="btn  btn-danger" type="button" value="返 回" onclick="loadview()"/>
						
			</td>   
			<td width="60%">
		
			</td>
			</tr>
			</table>
			
				
					</form>
			
</BODY>
<script type="text/javascript">
function  loadview(){
		gotoAddPage("<%=path %>/SysRole/displayIndex.do");
}
</script>
</HTML>