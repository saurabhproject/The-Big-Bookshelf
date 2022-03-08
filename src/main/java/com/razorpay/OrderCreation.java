package com.razorpay;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.*;
import com.razorpay.*;
/**
 * Servlet implementation class OrderCreation
 */
public class OrderCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCreation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RazorpayClient client = null; 
		String orderId = null;
		
			try {

			client = new RazorpayClient("rzp_test_IQ3gvuwdBjkKnI", "0Cw9bKdkvmiYgFZ94mDDbXsp");
			
			JSONObject option = new JSONObject();
			option.put("amount","100");
			option.put("currency","INR");
			option.put("receipt","zxr456");
			option.put("payment_capture",true);
			Order order = client.Orders.create(option);
			orderId = order.get("ID");
			
		} catch (RazorpayException e) {
			e.printStackTrace();
		}
			
	
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RazorpayClient client = null; 
		
		
			try {

			client = new RazorpayClient("rzp_test_IQ3gvuwdBjkKnI", "0Cw9bKdkvmiYgFZ94mDDbXsp");
			
			JSONObject option = new JSONObject();
			option.put("razorpay_payment_id",request.getParameter("razorpay_payment_id"));
			option.put("razorpay_order_id",request.getParameter("razorpay_order_id"));
			option.put("razorpay_signature",request.getParameter("razorpay_signature"));
			boolean sigRes = Utils.verifyPaymentSignature(option, "0Cw9bKdkvmiYgFZ94mDDbXsp");
			if(sigRes) {
				response.getWriter().append("Payment Successfull");
			}else {
				response.getWriter().append("Payment failed");
			}
			
			} catch (RazorpayException e) {
			e.printStackTrace();
		}
	}

}
