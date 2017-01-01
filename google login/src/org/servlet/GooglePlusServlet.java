package org.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GooglePlusServlet
 */
@WebServlet("/googleplus")
public class GooglePlusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   public GooglePlusServlet() {
        super();
        // TODO Auto-generated constructor stub
   }

    
       private static final String CLIENT_ID = ":-  50376313406-hp2i1too98fc8nbgpd9cd0bvs0j4s0qj.apps.googleusercontent.com"; 
       private static final String CLIENT_SECRET = "WB2FlaMS5JprvrvI3IHnBT5x";
       @Override 
       protected void doGet(HttpServletRequest req, HttpServletResponse res) 
          throws IOException, ServletException {
          //Configure 
          ServiceBuilder builder= new ServiceBuilder(); 
          OAuthService service = builder.provider(Google2Api.class) 
             .apiKey(CLIENT_ID) 
             .apiSecret(CLIENT_SECRET) 
             .callback("http://localhost:8080/mywebapp/oauth2callback&quot")
             .scope("openid profile email " + 
                   "https://www.googleapis.com/auth/plus.login " + 
                   “https://www.googleapis.com/auth/plus.me”)  
             .debug(System.out) 
             .build(); //Now build the call
          HttpSession sess = req.getSession(); 
          sess.setAttribute("oauth2Service", service);
          resp.sendRedirect(service.getAuthorizationUrl(null)); 
       } 
    } 


