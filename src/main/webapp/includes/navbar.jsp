<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.admin.servlet.BooksAdd"%>
<%@page import="com.entity.user"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<nav class="navbar navbar-light justify-content-between nav-color-o">
	<a class="navbar-brand logo">Online Book Store</a>

	<div>

		<c:if test="${not empty userobj }">


			<a href="checkout.jsp"><i class="fas fa-cart-plus"
				style="font-size: 27px; margin-right: 20px; color: black;"></i></a>
			<a href="login.jsp"><button type="button" class="btn  btn-color">
					<i class="fas fa-user" style="margin-right: 5px;"></i>${userobj.name}
				</button></a>
			<a href="logout"><button type="button" class="btn btn-color">
					<i class="fas fa-sign-out-alt" style="margin-right: 5px;"></i>Logout
				</button></a>

		</c:if>

		<c:if test="${empty userobj }">
			<a href="login.jsp"><button type="button" class="btn  btn-color">
					<i class="fas fa-user" style="margin-right: 5px;"></i>Login
				</button></a>
			<a href="register.jsp"><button type="button"
					class="btn btn-color">
					<i class="fas fa-sign-in-alt" style="margin-right: 5px;"></i>Register
				</button></a>

		</c:if>

	</div>





</nav>


<nav class="navbar navbar-expand-lg navbar-light nav-color">

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fas fa-house-user" style="margin-right: 5px;"></i>Home <span
					class="sr-only">(current)</span> </a></li>
			<li><a class="nav-link" href="all_recent_book.jsp">Recent
					Released </a></li>
			<li><a class="nav-link" href="all_new_book.jsp">New Book </a></li>
			<li><a class="nav-link" href="all_old_book.jsp">Sold
					Collection </a></li>
		</ul>
	</div>
	<div>
		<a href="setting.jsp"><button type="button" class="btn btn-color">
				<i class="fas fa-cog" style="margin-right: 5px;"></i>Setting
			</button></a> <a href="helpline.jsp"><button type="button"
				class="btn btn-color">
				<i class="fas fa-phone" style="margin-right: 5px;"></i>Contact Us
			</button></a>
	</div>
</nav>