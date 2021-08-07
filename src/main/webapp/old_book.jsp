<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User | Old Books</title>
<%@include file="includes/allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">
	<%@include file="includes/navbar.jsp"%>

	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-12 ">
				<div class="card">
					<div class="card-body">

						<div class="col-md-12 text-center recent">
							<h2>Old Books</h2>
						</div>


						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<table class="table text-center">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Category</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								user u = (user) session.getAttribute("userobj");
								String email = u.getEmail();
								BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
								List<BookDtls> list = dao.getBookByOld(email, "Old");

								for (BookDtls b : list) {
								%>


								<tr>
									<td class="in-neu"><%=b.getBookName()%></td>
									<td class="in-neu"><%=b.getAuthor()%></td>
									<td class="in-neu"><%=b.getPrice()%></td>
									<td class="in-neu"><%=b.getBookCategory()%></td>

									<td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId() %>"
										class="btn btn-color btn-sm mar .btn-color-o"> <i
											class="fas fa-trash-alt .btn-color-o m-2"></i>Remove
									</a></td>
								</tr>

								<%
								}
								%>



							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>