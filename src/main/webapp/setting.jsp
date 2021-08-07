
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User|Setting</title>
<%@include file="includes/allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="includes/navbar.jsp"%>


	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">


		<div class="row">
			<div class="col-md-12 p-3 text-center recent">

				<h2>Hello, ${userobj.name }!</h2>


			</div>


			<div class="col-md-12" style="margin-top: 20px;">

				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-money-bill-wave"
								style="font-size: 40px; padding: 5px; color:#5553e0;"></i><br>
							<h4 style="color: black;">Old Books</h4>

						</div>
					</div>
				</a>


			</div>


			<div class="col-md-4" style="margin-top: 20px;">

				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-money-bill-wave"
								style="font-size: 40px; padding: 5px; color:#5553e0"></i><br>
							<h4 style="color: black;">Sell Old Books</h4>

						</div>
					</div>
				</a>


			</div>
			


			<div class="col-md-4" style="margin-top: 20px;">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-shopping-cart"
								style="font-size: 40px; padding: 5px; color:#5553e0;"></i><br>
							<h4 style="color: black;">My Order</h4>

						</div>
					</div>
				</a>
			</div>

			<div class="col-md-4" style="margin-top: 20px;">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fas fa-question-circle"
								style="font-size: 40px; padding: 5px; color: #5553e0;"></i><br>
							<h4 style="color: black;">Help Center</h4>

						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
</body>
</html>