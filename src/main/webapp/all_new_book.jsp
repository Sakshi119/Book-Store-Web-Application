
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
<title>Book Store | New Books</title>
<%@include file="includes/allcss.jsp"%>

<style type="text/stylesheet">

</style>
</head>
<body style="background-color: #f5f5f5">
	<%
	user u = (user) session.getAttribute("userobj");
	%>


	<c:if test="${not empty addCart}">

		<div id="toast">${addCart}</div>

		<script type="text/javascript">
			function showToast(content){
				$('#toast').addClass("display");
				$('#toast').html(content);
				setTimeout(()=>{
					$("#toast").removeClass("display");
				},2000)
			}
		</script>
		<c:remove var="addCart" scope="session" />
	</c:if>

	<%@include file="includes/navbar.jsp"%>

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
						<p><%=b.getBookName()%></p>
						<p>
							Author :
							<%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getBookCategory()%></p>

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


							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-sm mar btn-color-green">View Details</a> <a
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
	</div>



</body>
</html>