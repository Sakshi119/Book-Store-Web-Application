<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User | SellBooks</title>
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
			<div class="col-md-6 offset-md-4">
				<div class="card">
					<div class="card-body">

						<div class="col-md-12 text-center recent">
							<h2>Sell Old Books</h2>
						</div>

						<c:if test="${not empty succMsg }">
							<p class="text-center text-success">${succMsg }</p>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg }">
							<p class="text-center text-danger">${failedMsg }</p>
							<c:remove var="failedMsg" scope="session" />
						</c:if>


						<form action="add_old_book" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="${userobj.email }" name="user">
							<div class="form-group">
								<label for="email">Book Name</label> <input type="text"
									class="form-control in-neu" placeholder="Enter name" id="name"
									name="bname" required>
							</div>
							<div class="form-group">
								<label for="email">Author Name</label> <input type="text"
									class="form-control in-neu" placeholder="Enter name" id="name"
									name="author" required>
							</div>
							<div class="form-group">
								<label for="email">Price</label> <input type="text"
									class="form-control in-neu" placeholder="Enter name" id="name"
									name="price" required>
							</div>

							<div class="form-group">
								<label for="examleFormControlFile1 search-type">Upload
									Photo</label> <input name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-color-o"
									style="width: 118px;">Sell</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>