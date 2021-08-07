package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			
			String bid = req.getParameter("bid");
			int bsr = 0;
			if(bid!=null) {
				bsr = Integer.parseInt("" + bid);
			}
			
			String uid = req.getParameter("uid");
			int usr = 0;
			if(uid!=null) {
				usr = Integer.parseInt("" + uid);
			}


			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDtls b = dao.getBookById(bsr);

			Cart c = new Cart();
			c.setBid(bsr);
			c.setUserId(usr);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotalPrice(Double.parseDouble(b.getPrice()));

			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao2.addCart(c);
			
			HttpSession session=req.getSession();

			if (f) {
				session.setAttribute("addCart", "Book Added to cart");
				resp.sendRedirect("all_new_book.jsp");
				
				

			} else {

				session.setAttribute("failed", "Something Wnt Wrong");
				resp.sendRedirect("all_new_book.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
