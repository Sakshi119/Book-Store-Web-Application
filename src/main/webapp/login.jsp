<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookStore | Login</title>

<%@include file="includes/allcss.jsp"%>

</head>
<body style="background-color: #f5f5f5">

	<%@include file="includes/navbar.jsp"%>


	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-md-4 offset-md-4 ">
				<div class="card reg">
					<div class="card-body">
						<h4 class="text-center">Login Page</h4>



						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="login" method="post">

							<div class="form-group">
								<label for="email">Email Address:</label> <input type="email"
									class="form-control in-neu" placeholder="Enter address" id="email"
									name="email" required>
							</div>
							<div class="form-group">
								<label for="pwd">Password:</label> <input type="password"
									class="form-control in-neu" placeholder="Enter password" id="pwd"
									name="password" required>
							</div>

							<div class="text-center">
								<button type="submit" class="btn btn-color"
									style="margin: 15px;">Login</button>
								<br> <a href="register.jsp">Create Account</a>
							</div>


						</form>

					</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>