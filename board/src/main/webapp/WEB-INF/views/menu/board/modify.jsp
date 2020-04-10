<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../../includes/header.jsp" %>



            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify</h1>
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
							
							<form role="form" action="/menu/board/modify" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
							<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
							<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
							<div class="form-group">
								<label>bno</label>
								<input class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>Title</label>
								<input class="form-control" name='title' value='<c:out value="${board.title}"/>' >
							</div>
							
							<div class="form-group">
								<label>Content</label>
								<input class="form-control" rows="3" name='content' value='<c:out value="${board.content}"/>' >
							</div>
							
							<div class="form-group">
								<label>writer</label>
								<input class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
							</div>
							
							<div class="form-group">
								<label>Update Date</label>
								<input class="form-control" name='updatedate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updatedate}"/>'/>
							</div>
							
							<div class="form-group">
								<label>Register Date</label>
								<input class="form-control" name='regdate' value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate}"/>'/>
							</div>
							
	
							<sec:authentication property="principal" var="pinfo"/>
								<sec:authorize access="isAuthenticated()">
									<c:if test="${pinfo.username eq board.writer}">
										<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
										<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>	
									</c:if>
								</sec:authorize>
							
							
							<button type="submit" data-oper='list' class="btn btn-info">List</button>
																
							</form>					
						</div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->

<script type="text/javascript">
$(document).ready(function(){
	var formObj=$("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		var operation=$(this).data("oper");
		
		if(operation === 'remove')
		{
			formObj.attr("action", "/menu/board/remove");
		}
		else if(operation ==='list'){
			formObj.attr("action", "/menu/board/list").attr("method", "get");
			
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		
		formObj.submit();
	});
});
</script>		

<%@include file="../../includes/footer.jsp" %>