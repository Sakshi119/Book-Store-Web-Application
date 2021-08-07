
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.BookDAO"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DAO.CartDAO"%>
<%@page import="com.user.servlet.CartServlet"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.Cart"%>
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
<title>BookStore | Cart</title>

<%@include file="includes/allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">
	<%@include file="includes/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>


	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg }</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger" role="alert">${failedMsg }</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container" style="margin-top: 126px;">
		<div class="row">
			<div class="col-md-6">

				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Your Selected Item</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								user u = (user) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
										class="btn btn-color btn-sm mar btn-color-o"> <i
											class="fas fa-trash-alt .btn-color-o m-2" style="color: #bd1d39;"></i>Remove
									</a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>

								</tr>



							</tbody>
						</table>
					</div>
				</div>
			</div>


			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Your Details For Order</h3>


						<form action="order" method="post">
						<input type="hidden" value="${userobj.id }" name="id">
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu" id="inputEmail4"
										placeholder="Name" name="username" value="${userobj.name} ">
								</div>
								<div class="form-group col-md-6">
									<input type="email" class="form-control in-neu"
										id="inputPassword4" placeholder="Email" name="email"
										value="${userobj.email }">
								</div>
								<div class="form-group col-md-6">
									<input type="number" class="form-control in-neu"
										id="inputEmail4" placeholder="Phone Number" name="phno"
										value="${userobj.phno }">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu"
										id="inputPassword4" placeholder="Address" name="address" value="">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu" id="inputEmail4"
										placeholder="Landmark" name="landmark" value="">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu"
										id="inputPassword4" placeholder="City" name="city" value="">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu" id="inputEmail4"
										placeholder="State" name="state" value="">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu"
										id="inputPassword4" placeholder="PinCode" name="pincode" value="">
								</div>
								<div class="form-group col-md-12">
									<select id="inputState" name="payment" class="form-control in-neu">
										<option value="noselect">Payment Type</option>
										<option value="COD">Cash On Delivery</option>
									</select>
								</div>



							</div>

						</form>
						<div class="text-center">
							<a href=""><button type="button"
									class="btn   btn-color">
									<i class="fas fa-sign-out-alt" style="margin-right: 5px;"></i>Order
									Now
								</button></a> <a href="index.jsp"><button type="button"
									class="btn   btn-color">
									<i class="fas fa-sign-out-alt" style="margin-right: 5px;"></i>Continue
									Shopping Now
								</button></a>
						</div>

					</div>

				</div>
			</div>

		</div>
	</div>

</body>
</html>