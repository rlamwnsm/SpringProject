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

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
/*
 console.log("===============");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.bno}"/>'; 

//for replyService add test
 replyService.remove(6, function(count) {

   console.log(count);

   if (count === "success") {
     alert("REMOVED");
   }
 }, function(err) {
   alert('ERROR...');
 });
 
 replyService.getList({bno:bnoValue, page:1}, function(list){
	 for(var i = 0, len = list.length||0; i<len; i++){
		 console.log(list[i]);
	 }
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