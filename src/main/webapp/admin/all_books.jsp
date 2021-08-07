<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.admin.servlet.BooksAdd"%>
<%@page import="com.entity.user"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Books| Admin</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">

						<div class="col-md-12 text-center" style="margin-bottom: 20px;">
							<h2 style="font-family: 'Montserrat'; font-weight: 700;">All
								Books</h2>
						</div>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>



						<table class="table text-center" style="font-size: 16px;">
							<thead>
								<tr>
									<th scope="col" class="text-center">ID</th>
									<th scope="col" class="text-center">Image</th>
									<th scope="col" class="text-center">Book Name</th>
									<th scope="col" class="text-center">Author</th>
									<th scope="col" class="text-center">Price</th>
									<th scope="col" class="text-center">Categories</th>
									<th scope="col" class="text-center">Status</th>
									<th scope="col" class="text-center">Action</th>

								</tr>
							</thead>
							<tbody>

								<%
								BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
								List<BookDtls> list = dao.getAllBooks();
								for (BookDtls b : list) {
								%>

								<tr>
									<td><%=b.getBookId()%></td>
									<td class="in-neu"><img
										src="../books/<%=b.getPhotoName()%>"
										style="width: 50px; height: 50px;"></td>
									<td><%=b.getBookName()%></td>
									<td><%=b.getAuthor()%></td>
									<td><%=b.getPrice()%></td>
									<td><%=b.getBookCategory()%></td>
									<td><%=b.getStatus()%></td>
									<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
										class="btn btn-color-o"><i class="fas fa-edit"></i></a> <a
										href="../delete?id=<%=b.getBookId()%>" class="btn btn-color-o"><i
											class="fas fa-trash-alt" style="color: #bd1d39;"></i></a></td>

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