
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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Store | Old Books</title>
<%@include file="includes/allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">

	<%@include file="includes/navbar.jsp"%>

	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-12 p-3 text-center recent">
				<h2>Old Books</h2>
			</div>
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();
			for (BookDtls b : list3) {
			%>

			<div class="col-md-3 col-sm-6">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<img class="img-thumblin product"
							src="books/<%=b.getPhotoName()%>" alt="Card image cap"
							style="width: 150px; height: 200px;">
						<p><%=b.getBookName()%></p>
						<p>
							Author :
							<%=b.getAuthor()%></p>

						<p>
							Catagories :<%=b.getBookCategory()%></p>
						<div class="row justify-content-center">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-color btn-sm mar">View Details</a> <a
								href="" class="btn btn-color btn-sm mar"><i
								class="fas fa-rupee-sign mar"></i>350</a>
						</div>

					</div>
				</div>
			</div>

			<%
			}
			%>

		</div>
	</div>
</body>
</html>