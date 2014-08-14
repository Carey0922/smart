function  TestTimeOut(responseTxt){
	if(responseTxt.indexOf("j_spring_security_check")>0){
	     window.location="login.jsp";
	   }
}	

function  gotoAddPage(URL)
{
		 
		      $("#mainFrame").load(URL,function(responseTxt,statusTxt,xhr){
		    	  TestTimeOut(responseTxt);
		    	    if(statusTxt=="success"){}

		    	      if(statusTxt=="error"){}

		    	    });
		     
		   } 
	 
	 function JshPrompt(Message){
		  $("#dialog-Highlight").fadeIn("slow");
	      $("#dialog-Highlight").fadeOut(4000);
	      $("#dialog-Highlight > p > span").html("");
	      $("#dialog-Highlight > p").append('<span>'+Message+'</span>');
	 }	 
	     
		 // POST 请求 返回页面 动态加载到 主页DIV 
	function loadPageForPost(URL,data){
		var urlid=Math.random();
		URL=URL+"&"+urlid;

				  $.post(URL,data,function(result){

				    $("#mainFrame").html(result);
				  });

   }
	
	
	 /**
	  * @author Carey
	  * @param URL 请求的地址
	  * @param data 请求的json数据
	  * @param DivId 加载的容器
	  * @date 2014/2/27 
	  * @Description ajax 请求，加载至指定DIV
	  */
	function loadPageForPosts(URL,data,DivId,cache){
         if(null!=cache){
            var uuid=Math.random();
            URL=URL+"&"+uuid;
         }
				  $.post(URL,data,function(result){
				    $("#"+DivId).html(result);
				  });

   }
	
	

	
	/**
	 * @author Carey
	 * @Desiption 消息提示框
	 */
	function  showdialog(message){
		$("#dialog-message").html("<b>"+message+"</b>");
		 $("#dialog-message").dialog({
		      modal: true,
		 	  title:'系统提示',
		 	  buttons: {
			      "好": function() {$("#dialog-message").dialog('close'); }
			   }
		 	  
		 });
	}
	
	/**
	 * @author Carey
	 * @Desiption 执行消息提示框
	 */
	function  showdialogByconfirm(message,URL,data){
		$("#dialog-message").html("<b>"+message+"</b>");
		 $("#dialog-message").dialog({
		      modal: true,
		 	  title:'系统提示',
		 	 buttons: {
		 		 "好": function() {
		 			var urlid=Math.random();
		 			URL=URL+"?"+urlid;
		 			 $("#dialog-img").dialog({
		 			      modal: true
		 			 });
		 			 $('a.ui-dialog-titlebar-close').hide();
		 					  $.post(URL,data,function(result){
		 				    	$("#dialog-img").dialog("close");
		 					    $("#mainFrame").html(result);
		 					  });
		 			 $("#dialog-message").dialog('close'); },
			     "取 消": function() {$("#dialog-message").dialog('close'); }
			   }
		 	
		 });
	}
	

	


	
	
	/***
	 * 分页方法
	 */
	
	/***
	 * @author Carey
	 * @Description 获取当前页面所有的 Text 和 hidden 元素的所有数据
	 */
	function  LoadPaginationData(URL){
		var text = $("input[type='text'],input[type='hidden'],select");
		var Package="{";
		  	    for(var i=0;i<text.length;i++)  
			  	   {  
		  	    	
		  	    	if(text.length>1){
		  	    	if(text.length==i+1){
		  	    		if(text[i].value!=""){
		  	    		Package=Package+text[i].name+":"+text[i].value;
		  	    		}
		  	    	}else{
		  	    		if(text[i].value!=""){
		  	    		Package=Package+text[i].name+":"+text[i].value+",";
		  	    		}
			  	    }  
			  	   }else{
			  		 if(text[i].value!=""){
			  		 Package=Package+text[i].name+":"+text[i].value;
			  		 
			  	   }
			  	   }
			  	 }
		  	  Package=Package+'}';
		  	  //json字符串转json对象
		      var obj = eval('(' + Package + ')');
		      $.post(URL,obj,function(result){
			    	$("#dialog-img").dialog("close");
				    $("#mainFrame").html(result);
				  });
			  	  
	}
	/**
	 * @author Carey
	 * @Description 返回首页
	 */
	  function goFirst(URL){
		var pageIndex=document.getElementById("pageIndex").value;
		if(pageIndex<=1){
	  		return;
	  	}
		document.getElementById("pageIndex").value=1;
		LoadPaginationData(URL);
	  
	  }
		/**
		 * @author Carey
		 * @Description 最后一页
		 */
	  function goLast(URL){
		var pageIndex=document.getElementById("pageIndex").value;
		var totalPage=document.getElementById("totalPage").value;
		if(pageIndex>=totalPage){
			return;
		}
		document.getElementById("pageIndex").value=totalPage;
		LoadPaginationData(URL);
	  	
	  }
		/**
		 * @author Carey
		 * @Description 上一页
		 */
	  function goPrev(URL){
	  	var pageIndex=document.getElementById("pageIndex").value;
	  	if(pageIndex==1){
	  		return;
	  	}
	  	document.getElementById("pageIndex").value=pageIndex-1;
	  	LoadPaginationData(URL);
	  }
		/**
		 * @author Carey
		 * @Description 下一页
		 */
	  function goNext(URL){
	  	var pageIndex=document.getElementById("pageIndex").value;
	  	var totalPage=document.getElementById("totalPage").value;
	  	if(pageIndex==totalPage){
	  		return;
	  	}
	  	document.getElementById("pageIndex").value=parseInt(pageIndex)+1;
	  	LoadPaginationData(URL);
	  }
	  
		/**
		 * @author Carey
		 * @Description 返回首页
		 */
	  function changePage(URL){
	  	//每次条件查询都回到第1页
	  	document.getElementById("pageIndex").value=1;
	  	LoadPaginationData(URL);
	  }
	  
	  
	  function  RemoveState(message,URL,data){
			$("#dialog-message").html("<b>"+message+"</b>");
			 $("#dialog-message").dialog({
			      modal: true,
			 	  title:'系统提示',
			 	 buttons: {
			 		 "好": function() {
			 			 $.post(URL,data,function(result){
						    	$("#dialog-img").dialog("close");
						    	   $("#mainFrame").html(result);
							  });
			 		$("#dialog-message").dialog('close'); },
				     "取 消": function() {$("#dialog-message").dialog('close'); }
				   }
			 	
			 });
			 return  false;	
		}
	  
	  

	