<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container" id="article" style="width: 100%">
	<div id="header2">
		<h1>신고 게시판 관리</h1>
	</div>	
	<div id="content">
		<!-- <p>여기는 메인 컨텐츠</p> -->
		<div id="cont" style="margin-top: 30px;">
			<table>
				<thead>
					<tr>
						<th colspan="8">신고 리스트</th>
					</tr>
					<tr>
						<td>신고 번호</td>
						<td>신고 아이디</td>
						<td>신고 분야</td>
						<td>신고글 제목</td>
						<td>신고 날짜</td>
						<td>신고 내용</td>						
						<td>수정</td>
						<td>삭제</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="listv" items="${bvo }">
						<tr>
							<td>${listv.b_num }</td>
							<td>${listv.b_id }</td>
							<td>${listv.b_category }</td>
							<td>${listv.b_title }</td>
							<td>${listv.b_date }</td>
							<td>${listv.b_content }</td>
							<td><a href="">수정</a></td>
							<td><a href="deleteblockone?num=${listv.b_num }">삭제</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
			    	<tr>
			     		<td colspan="8" id="pageTd">
				      	<%--Page 이전 페이지 구현 --%> 
					      	<c:choose>
					       		<c:when test="${searchType == null}">
					        		<c:choose>
					         			<c:when test="${pageInfo.currentBlock eq 1}">
				          					<img src="resources/img/prev.png">
				         				</c:when>
						         		<c:otherwise>
							          		<a href="showblockall.kosta?page=
							          		${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
							           			<img src="resources/img/prev.png">
							          		</a>
				         				</c:otherwise>
					        		</c:choose>
							        <%--Page  페이지 구현 --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
					          				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
					          				 varStatus="num">
						                        [<a href="showblockall?page=
						                        ${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
									            ${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                       	</c:forEach>
					         			</c:when>
					         			<c:otherwise>
					          				<c:forEach
					           				begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					           				end="${pageInfo.totalPages}" varStatus="num">
					                        	[<a href="showblockall?page=
					          					${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                    	</c:forEach>
					         			</c:otherwise>
					        		</c:choose>
					
							        <%--Page 다음 페이지 구현 --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
					          				<img src="resources/img/next.png">
					         			</c:when>
						         		<c:otherwise>
						          			<a href="showblockall?page=
						         			${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
						           				<img src="resources/img/next.png">
						          			</a>
						         		</c:otherwise>
					        		</c:choose>
				       			</c:when>
					       		<c:otherwise>
					        		<c:choose>
					         			<c:when test="${pageInfo.currentBlock eq 1}">
					          				<img src="resources/img/prev.png">
					         			</c:when>
						         		<c:otherwise>
						          			<a href="showblockall.kosta?searchType=${searchType}&searchValue=${searchValue}&page=
						         			${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock }">
						           				<img src="resources/img/prev.png">
						          			</a>
						         		</c:otherwise>
					        		</c:choose>
					
							        <%--Page  페이지 구현 --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock ne pageInfo.totalBlocks}">
					          				<c:forEach begin="1" end="${pageInfo.pagesPerBlock}"
					           				varStatus="num">
					                        	[<a href="showblockall?searchType=${searchType}
					                        	&searchValue=${searchValue}&page=
					                        	${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock- 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                       </c:forEach>
					         			</c:when>
					         			<c:otherwise>
					          				<c:forEach 
					          				begin="${(pageInfo.currentBlock-1)*pageInfo.pagesPerBlock + 1}"
					           				end="${pageInfo.totalPages}" varStatus="num">
					                        	[<a href="showblockall?searchType=${searchType}
					                        	&searchValue=${searchValue}&page=
					          					${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }">
					            				${(pageInfo.currentBlock - 1) * pageInfo.pagesPerBlock + num.count }</a>]
					                    	</c:forEach>
					         			</c:otherwise>
					        		</c:choose>
					
					
							        <%--Page 다음 페이지 구현 --%>
							        <c:choose>
					         			<c:when test="${pageInfo.currentBlock eq pageInfo.totalBlocks}">
					          				<img src="resources/img/next.png">
					         			</c:when>
					         			<c:otherwise>
					          				<a href="showblockall?searchType=${searchType}
					          				&searchValue=${searchValue}&page=
					         				${pageInfo.currentBlock * pageInfo.pagesPerBlock + 1 }">
					           					<img src="resources/img/next.png">
					          				</a>
					         			</c:otherwise>
					        		</c:choose>
					       		</c:otherwise>
				      		</c:choose>
			     		</td>
			  		</tr>				    
		   		</tfoot>
			</table>
		</div>
	</div>
</div>

<style type="text/css">
	#cont {
	 width: 100%;
	 margin: auto;
	}

	#cont table {
	 width: 100%;
	 border: 1px dotted #000
	}

	#cont table thead th {
	 font-size: 30px;
	 color: orange
	}
	
	#cont table thead td {
	 text-align: center;
	 background-color: skyblue
	}
	
	#cont tbody img {
	 width: 80px;
	 border: 0px
	}
	#pageTd img {
	 width: 15px;
	 
	}
	#pageTd a{
	color: #000000;
	}
</style>
