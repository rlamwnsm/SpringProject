<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../../includes/header.jsp" %>



            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Read</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"> Board Read Page</div>
                        <!-- /.panel-heading -->
                        
                        <div class="panel-body">
							
							<div class="form-group">
								<label>bno</label>
								<input class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>Content</label>
								<input class="form-control" rows="3" name='content' value='<c:out value="${board.content}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>writer</label>
								<input class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
							</div>
							
							
							
							<sec:authentication property="principal" var="pinfo"/>
								<sec:authorize access="isAuthenticated()">
									<c:if test="${pinfo.username eq board.writer}">
										<button data-oper='modify' class="btn btn-default">Modify</button>
									</c:if>
								</sec:authorize>
						
							
							<button data-oper='list' class="btn btn-default">List</button>
							
							<form id='operForm' action="/menu/board/modify" method="get">
								<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'/>
								<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'/>
								<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'/>
								<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'/>
								<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'/>
							</form>							
						
						</div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
            
            <div class='row'>
            	<div class="col-lg-12">
            		
            		<div class="panel panel-default">
            			<div class="panel-heading">
            				<i class="fa fa-comments fa-fw"></i> Reply
            				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
            			</div>
            		
            		
            		<div class="panel-body">
            			<ul class="chat">
            				<li class="left clearfix" data-rno='12'>
            					<div>
            						<div class="header">
            							<strong class="primary-font">no comments yet.</strong>
            						</div>
            						</div>
            					</li>
            				</ul>
            			
            			</div>
            		</div>
            	</div>
			</div>
			
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            	<div class="modal-dialog">
                	<div class="modal-content">
                    	
                    	<div class="modal-header">
                        	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            	<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
                        </div>
                        
                        <div class="modal-body">
							<div class="form-group">
								<label>Reply</label>
								<input class="form-control" name = 'reply'>
							</div>
							<div class="form-group">
								<label>Replyer</label>
								<input class="form-control" name = 'replyer' readonly>
							</div>
							<div class="form-group">
								<label>ReplyData</label>
								<input class="form-control" name = 'replyDate'>
							</div>							
                        </div>
                        
                        <div class="modal-footer">
							<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
							<button id='modalRemoveBtn' type="button" class="btn btn-warning">Remove</button>
							<button id='modalRegisterBtn' type="button" class="btn btn-warning">Register</button>
							<button id='modalCloseBtn' type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
                        </div>
					</div>
                                    <!-- /.modal-content -->
                </div>
                                <!-- /.modal-dialog -->
             </div>
			
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
/*
 console.log("===============");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.bno}"/>'; 

//for replyService add test

 
 replyService.getList({bno:bnoValue, page:1}, function(list){
	 for(var i = 0, len = list.length||0; i<len; i++){
		 console.log(list[i]);
	 }
 });
 
 
  replyService.remove(6, function(count) {

   console.log(count);

   if (count === "success") {
     alert("REMOVED");
   }
 }, function(err) {
   alert('ERROR...');
 });
 replyService.add(
		    
		    {reply:"JS Test", replyer:"tester", bno:bnoValue}
		    ,
		    function(result){ 
		      alert("RESULT: " + result);
		    }
		 ); 
*/
</script>

<script>
$(document).ready(function () {
  
  var bnoValue = '<c:out value="${board.bno}"/>';
  var replyUL = $(".chat");
  
    showList(1);
    
function showList(page){
	
	console.log("show list " + page);
    replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {  
    var str="";
    if(list == null || list.length == 0){
     	return;
    }
    for (var i = 0, len = list.length || 0; i < len; i++) {
       str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
       str +="  <div><div class='header'><strong class='primary-font'>["
    	   +list[i].rno+"] "+list[i].replyer+"</strong>"; 
       str +="    <p>"+list[i].reply+"</p></div></li>";
     }
     
     replyUL.html(str);
   });//end function 
 }//end showList
 
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
 	
	var replyer = null;
	<sec:authorize access="isAuthenticated()">
		replyer = '<sec:authentication property="principal.username"/>';
	</sec:authorize>
	var csrfHeaderName="${_csrf.headerName}";
	var csrfTokenValue="${_csrf.token}";
	

	
    $("#addReplyBtn").on("click", function(e){
        
        modal.find("input").val("");
        modal.find("input[name='replyer']").val(replyer);
        modalInputReplyDate.closest("div").hide();
        modal.find("button[id !='modalCloseBtn']").hide();
        modalRegisterBtn.show();
        
        $(".modal").modal("show");
        
      });
    
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
	modalRegisterBtn.on("click",function(e){
        
        var reply = {
              reply: modalInputReply.val(),
              replyer:modalInputReplyer.val(),
              bno:bnoValue
            };
        replyService.add(reply, function(result){
          alert(result);
          modal.find("input").val("");
          modal.modal("hide");
          
          showList(1);
        });
        
      });
    
    
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	var operForm=$("#operForm");
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/menu/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/menu/board/list")
		operForm.submit();
	});	
});

</script>		

<%@include file="../../includes/footer.jsp" %>