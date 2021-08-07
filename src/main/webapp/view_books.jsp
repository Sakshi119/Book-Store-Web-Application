
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
<title>BookStore | View Books</title>
<%@include file="includes/allcss.jsp"%>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>

	<%
	int bid = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(bid);
	%>

	<div class="container" style="margin-top: 100px;">
		<div class="row">
			<div class="col-md-6 first-box">
				<img src="books/<%=b.getPhotoName()%>"
					style="height: 500px; width: 400px; box-shadow: -20px 19px 20px 0px #3c3c3c, -20px -20px 60px #000000;"><br>

			</div>

			<div class="col-md-6 second-box" style="margin-top: 36px;">
				<h2><%=b.getBookName()%></h2>
				<div class="col-md-12 text-center" style="padding: 30px;">
					<h4>
						Book Name -
						<%=b.getBookName()%></h4>

					<%
					if ("Old".equals(b.getBookCategory())) {
					%>

					<h5>
						Contact To Seller - <i class="far fa-envelope"></i> Email |
						<%=b.getEmail()%></h5>


					<%
					}
					%>

					<h4>
						Author Name -
						<%=b.getAuthor()%></h4>
					<h4>
						Category -
						<%=b.getBookCategory()%></h4>
				</div>
				<div class="row">
					<div class="col-md-4 text-center">
						<i class="fas fa-wallet fa-3x p-2 icon-color"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center">
						<i class="fas fa-undo-alt fa-3x p-2 icon-color"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-center">
						<i class="fas fa-truck fa-3x p-2 icon-color"></i>
						<p>Free Delivery</p>
					</div>


					<%
					if ("Old".equals(b.getBookCategory())) {
					%>

					<div class="col-md-12 text-center" style="margin-top: 22px;">
						<a href="index.jsp" class="btn btn-sm mar detail-btn"><i
							class="fas fa-shopping-basket"></i>Continue Shopping</a> <a href=""
							class="btn btn-sm mar detail-btn"><i
							class="fas fa-rupee-sign mar"></i><%=b.getPrice()%></a>
					</div>

					<%
					} else {
					%>
					<div class="col-md-12 text-center" style="margin-top: 22px;">
						<a href="" class="btn btn-sm mar detail-btn"><i
							class="fas fa-cart-plus mar"></i>Add to Cart</a> <a href=""
							class="btn btn-sm mar detail-btn"><i
							class="fas fa-rupee-sign mar"></i><%=b.getPrice()%></a>
					</div>


					<%
					}
					%>




				</div>






			</div>
		</div>
	</div>
</body>
</html>