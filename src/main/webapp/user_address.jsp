<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User | Address</title>
<%@include file="includes/allcss.jsp"%>
</head>
<body style="background-color: #f5f5f5;">
	<%@include file="includes/navbar.jsp"%>

	<div class="container"
		style="margin-top: 30px; padding-right: 0px; padding-left: 0px;">
		<div class="row">
			<div class="col-md-6 offset-md-4">
				<div class="card">
					<div class="card-body">

						<div class="col-md-12 text-center recent">
							<h2>User Address</h2>
						</div>

						<form>
							<div class="form-row">


								<div class="form-group col-md-12">
									<input type="text" class="form-control in-neu"
										id="inputPassword4" placeholder="Address" value="">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu" id="inputEmail4"
										placeholder="Landmark" value="">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu"
										id="inputPassword4" placeholder="City" value="">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu" id="inputEmail4"
										placeholder="State" value="">
								</div>
								<div class="form-group col-md-6">
									<input type="text" class="form-control in-neu"
										id="inputPassword4" placeholder="PinCode" value="">
								</div>
								
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-color">Save
									Changes</button>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>