//hover事件 延迟 200ms
(function($){
	 $.fn.hoverDelay = function(options){
	   var defaults = {
		 hoverDuring: 200,
		 outDuring: 200,
		 hoverEvent: function(){
		   $.noop();
		 },
		 outEvent: function(){
		   $.noop();
		 }
	};
	var sets = $.extend(defaults,options || {});
	var hoverTimer, outTimer, that = this;
	return $(this).each(function(){
	  $(this).hover(function(){
		clearTimeout(outTimer);
		hoverTimer = setTimeout(function(){sets.hoverEvent.apply(that)}, sets.hoverDuring);
	  },function(){
		clearTimeout(hoverTimer);
		outTimer = setTimeout(function(){sets.outEvent.apply(that)}, sets.outDuring);
	  });
	});
  } 
})(jQuery);

$(document).ready(function() {
  //user information
  //show edit btn
  $(".user-img").hover(function(){
	 $(this).find(".edit").css({"bottom":"-18px"}).stop().animate({"bottom":"2px"},200); 
  },function(){
	 $(this).find(".edit").stop().animate({"bottom":"-20px"}); 
  });
  //if click edit btn show edit pannel
  $(".user-img .edit").click(function(evt){
	evt.stopPropagation?evt.stopPropagation():evt.cancelBubble=true;
	$(".edit-userInfo").css({"display":"block","height":"0","top":"55px"}).animate({"height":$(".edit-userInfo-pannel").height(),"top":"60px"});
  });
  $(".edit-userInfo").click(function(evt){
	evt.stopPropagation?evt.stopPropagation():evt.cancelBubble=true;  
  });
  $(document).click(function(){
    $(".edit-userInfo").hide()
  });
  $(".edit-userInfo .close-pannel").click(function(){
    $(".edit-userInfo").hide()
  });
  
  //tips
  $(".has-tip").each(function(){
    that = $(this);
    that.hoverDelay({
        hoverEvent: function(){
          $(".tips").css({
		    "display" : "block",
	  	    "top"     : $(this).offset().top-$(this).height()-$(".tips").height()+5,
		    "left"    : $(this).offset().left+$(this).width()/2-93
	      });
	    },
		 outEvent: function(){
		   
		 }
	});
	$(".tips").mouseenter(function(){
      $(".tips").show();
    });
    $(".tips").mouseleave(function(){
      setTimeout(function(){$(".tips").hide();}, 200);
    });
  });
});