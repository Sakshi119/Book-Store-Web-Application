
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.admin.servlet.BooksAdd"%>
<%@page import="com.entity.user"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!--  IMPORTING THE class from package-->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Store | Home Page</title>


<%@include file="includes/allcss.jsp"%>
<style type="text/css">
.back-img {
	background: url("images/World.png");
	height: 730px;
	width: 100%;
	background-size: cover;
}
</style>

</head>
<body style="background-color: #f5f5f5;">

	<%
	user u = (user) session.getAttribute("userobj");
	%>


	<%@include file="includes/navbar.jsp"%>


	<div class="img-responsive back-img"></div>

	<div class="strip"></div>


	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row justify-content-center">



			<div class="col-md-3 col-sm-6">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<div class="icon">
							<i class="fas fa-truck"></i>
						</div>
						<div class="text">
							<h3 style="font-size: 20px;">Free Shipping Item</h3>
							<p>Orders over 500 Rupees</p>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<div class="icon">
							<i class="fas fa-redo-alt"></i>
						</div>
						<div class="text">
							<h3 style="font-size: 20px;">Money Back Guarantee</h3>
							<p>100% money back</p>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<div class="icon">
							<i class="fas fa-piggy-bank"></i>
						</div>
						<div class="text">
							<h3 style="font-size: 20px;">Cash On Delivery</h3>
							<p>New Feature</p>
						</div>

					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-6">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<div class="icon">
							<i class="fas fa-life-ring"></i>
						</div>
						<div class="text">
							<h3 style="font-size: 20px;">Help & Support</h3>
							<p>Call us : + 7559145650</p>
						</div>

					</div>

				</div>
			</div>

		</div>
	</div>





	<!-- END OF RECENT BOOKS ADDED -->



	<!-- START OF RECENT BOOKS ADDED -->

	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-12 p-3 text-center recent">
				<h2>Recent Released Books</h2>
			</div>

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3 col-sm-6">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<img class="img-thumblin product"
							src="books/<%=b.getPhotoName()%>" alt="Card image cap"
							style="width: 150px; height: 200px;">
						<h3 class="b-name"><%=b.getBookName()%></h3>
						<p>
							Author :
							<%=b.getAuthor()%></p>

						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p>
							Catagories :<%=b.getBookCategory()%></p>
						<div class="row justify-content-center">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-sm mar btn-color-green">View Details</a> <a
								href="" class="btn btn-color btn-sm mar .btn-color-o"><i
								class="fas fa-rupee-sign mar .btn-color-o"></i>350</a>
						</div>

						<%
						} else {
						%>
						<p>
							Catagories : <%=b.getBookCategory()%></p>
						<div class="row justify-content-center">


							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-color btn-sm mar"><i
								class="fas fa-cart-plus mar"></i>Add to Cart</a>

							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-color btn-sm mar"><i
								class="fas fa-cart-plus mar"></i>Add to Cart</a>

							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-sm mar btn-color-green">View Details</a> <a
								href="" class="btn btn-color btn-sm mar .btn-color-o"><i
								class="fas fa-rupee-sign mar .btn-color-o"></i>350</a>
						</div>

						<%
						}
						%>




					</div>
				</div>
			</div>

			<%
			}
			%>



		</div>
		<div class="text-center mt-5">
			<a href="all_recent_book.jsp" type="button" class="btn btn-color ">
				<i class="fas fa-chevron-down" style="margin-right: 5px;"></i>View
				all
			</a>
		</div>
	</div>

	<!-- END OF RECENT BOOKS ADDED -->


	<!-- START OF NEW BOOKS ADDED -->

	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-12 p-3 text-center recent">
				<h2>New Books</h2>
			</div>


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>

			<div class="col-md-3 col-sm-6">
				<div class="card" style="width: 18rem;">
					<div class="card-body text-center">
						<img class="img-thumblin product"
							src="books/<%=b.getPhotoName()%>" alt="Card image cap"
							style="width: 150px; height: 200px;">
						<h3 class="b-name"><%=b.getBookName()%></h3>
						<p>
							Author :
							<%=b.getAuthor()%></p>
						<p>
							Category : <%=b.getBookCategory()%></p>

						<div class="row justify-content-center">

							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-color btn-sm mar"><i
								class="fas fa-cart-plus mar"></i>Add to Cart</a>

							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-color btn-sm mar"><i
								class="fas fa-cart-plus mar"></i>Add to Cart</a>

							<%
							}
							%>


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn  btn-sm mar btn-color-green">View Details</a> <a
								href="" class="btn btn-color btn-sm mar .btn-color-o"><i
								class="fas fa-rupee-sign mar .btn-color-o"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>







		</div>
		<div class="text-center mt-5">
			<a href="all_new_book.jsp" type="button" class="btn btn-color"> <i
				class="fas fa-chevron-down" style="margin-right: 5px;"></i>View all
			</a>
		</div>
	</div>

	<!-- END OF NEW BOOKS ADDED -->


	<!-- START OF OLD BOOKS ADDED -->



	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-12 p-3 text-center recent">
				<h2>Sold Books Books</h2>
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
						<h3 class="b-name"><%=b.getBookName()%></h3>
						<p>
							Author :
							<%=b.getAuthor()%></p>
						<p>
							Category : <%=b.getBookCategory()%></p>

						<div class="row justify-content-center">

							<%
							if (u == null) {
							%>

							<a href="login.jsp" class="btn btn-color btn-sm mar"><i
								class="fas fa-cart-plus mar"></i>Add to Cart</a>

							<%
							} else {
							%>

							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-color btn-sm mar"><i
								class="fas fa-cart-plus mar"></i>Add to Cart</a>

							<%
							}
							%>


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn  btn-sm mar btn-color-green">View Details</a> <a
								href="" class="btn btn-color btn-sm mar .btn-color-o"><i
								class="fas fa-rupee-sign mar .btn-color-o"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			%>







		</div>
		<div class="text-center mt-5">
			<a href="all_old_book.jsp" type="button" class="btn btn-color"> <i
				class="fas fa-chevron-down" style="margin-right: 5px;"></i>View all
			</a>
		</div>
	</div>














	<!-- END OF OLD BOOKS ADDED -->

	<%@include file="includes/footer.jsp"%>
</body>
</html>