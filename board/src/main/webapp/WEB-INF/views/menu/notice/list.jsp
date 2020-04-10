<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../../includes/header.jsp" %>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Notice</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"> 
                        Notice List Page
	                        <sec:authorize access="hasRole('ROLE_ADMIN')">
        	               		<button id='regBtn' type="button" class="btn btn-xs pull-right">Register</button>
							</sec:authorize>
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table class="table table-striped table-bordered table-hover" >
                                
                                <thead>
                                    <tr>
                                        <th>#번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                            
                            	<c:forEach items="${list}" var="board">
                            		<tr>
                                		<td><c:out value="${board.bno}"/></td>
                                		<td>
                                		<a class='move' href='<c:out value="${board.bno}"/>'>
                                		<c:out value="${board.title}"/></a>                                		
                                		</td>
                                		<td><c:out value="${board.writer}"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value = "${board.regdate}"/></td>
                                		<td><fmt:formatDate pattern="yyyy-MM-dd" value = "${board.updatedate}"/></td>
                                	</tr>
                                </c:forEach>    
                            
                            </table>
                            
                            
                            
                             <form id='actionForm' action="/menu/notice/list" method='get'>
                            	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                            	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                            	<input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
                            	<input type='hidden' name='type' value='${pageMaker.cri.type}'>
                            </form>                           

                            <form id='searchForm' action="/menu/notice/list" method='get'>
                            	<select name='type'>
                            		<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected' : ''}"/>>전체</option>
                            		<option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
                            		<option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
                            		<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목+내용</option>
                            		<option value="W"<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
                            	</select>
                            	<input type='text' name='keyword' value='<c:out value = "${pageMaker.cri.keyword}"/>'/>
                            	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                            	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                            	<button class='btn btn-default'>Search</button>
                            </form>
                            
                            <div class='pull-right'>
                            	<ul class="pagination">
                            		<c:if test="${pageMaker.prev}">
                            			<li class="paginate_button previous"> 
                            				<a href='<c:out value="${pageMaker.startPage-1}"/>'>Previous</a>
                            			</li>
                            		</c:if>
                            		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            			<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}">
                            				<a href="${num}">${num}</a>
                            			</li>
                            		</c:forEach>
                            		<c:if test="${pageMaker.next}">
                            			<li class="paginate_button next">
                            				<a href='<c:out value="${pageMaker.endPage+1}"/>'>Next</a>
                            			</li>
                            		</c:if>
                            	</ul>
                            </div>
                            

                            
                            
                            
                            
                            
                            
                            <!-- Modal 추가 !!! -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">Modal title</h4>
										</div>
										<div class="modal-body">
											처리가 완료되었습니다.
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										</div>
									</div>
								</div>
							</div>
   							<!-- 모달 처리 -->     
   						</div>
                        <!-- /.table-responsive -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
		
<script type="text/javascript">
	$(document).ready
	(
		function() 
		{
			
			var result = '<c:out value="${result}"/>';
			
			checkModal(result);
			history.replaceState({}, null, null);
			
			function checkModal(result)
			{
				if (result === '' || history.state) 
				{
					return;
				}
				
				if (parseInt(result) > 0) 
				{
					$(".modal-body").html("게시글 "+parseInt(result)+" 번이 등록되었습니다.");
				}
				$("#myModal").modal("show");
			}
					
			
			$("#regBtn").on
			(
				"click", function() 
				{
					self.location = "/menu/notice/register";
				}
			);	
			
			
			var actionForm=$("#actionForm");
			
			$(".paginate_button a").on("click", function(e){
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
			});	
			
			$(".move").on("click", function(e){
				e.preventDefault();
				actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
				actionForm.attr("action", "/menu/notice/read");
				actionForm.submit();
			});
			
			var searchForm=$("#searchForm");
			
			$("#searchForm button").on("click", function(e){
				searchForm.find("input[name='pageNum']").val("1");
				e.preventDefault();
				searchForm.submit();
			});			
		}
	);
</script>
<%@include file="../../includes/footer.jsp" %>