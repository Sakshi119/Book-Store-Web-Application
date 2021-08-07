package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDAOImpl;
import com.DB.DBConnect;
import com.entity.user;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+""+email+""+phno+""+password+""+check);
			
			user us=new user();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session=req.getSession();
		
			if(check!=null)
			{
				userDAOImpl dao = new userDAOImpl(DBConnect.getConn());
				boolean f=dao.userRegister(us);
				
				if(f) {
					//System.out.println("User Register Success..");
					session.setAttribute("succMsg","Registration Successfull");
					resp.sendRedirect("register.jsp");
					
				}else {
					//System.out.println("Something wrong with the server..");
					session.setAttribute("failedMsg","Registration Failed");
					resp.sendRedirect("register.jsp");
				}
			}else {
				//System.out.println("Please Agree the Terms & Conditions");
				session.setAttribute("failedMsg","Please Agree the Terms & Conditions");
				resp.sendRedirect("register.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
  
}
