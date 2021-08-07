package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

@SuppressWarnings("serial")
@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

//			System.out.println(name+" "+email+" "+phno+" "+fullAdd+" "+paymentType);

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			List<Cart> blist = dao.getBookByUser(id);
			BookOrderImpl dao2=new BookOrderImpl(DBConnect.getConn());
			int i=dao2.getOrderNo();
			
			Book_Order o=new Book_Order();
			
			ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
			for (Cart c:blist) {
				o.setOrderId("BOOK-ORD-00"+i);
				o.setUserName(name);
				o.setEmail(email);
				o.setPhno(phno);
				o.setFulladd(fullAdd);
				o.setBookName(c.getBookName());
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice()+"");
				o.setPaymentType(paymentType);
				i++;
			}

			if ("noselect".equals(paymentType)) {
				resp.sendRedirect("checkout.jsp");
			} else {
				boolean f=dao2.saveOrder(orderList);
				
				if(f) {
					System.out.println("Order Success");
				}else {
					System.out.println("Order Failed");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
