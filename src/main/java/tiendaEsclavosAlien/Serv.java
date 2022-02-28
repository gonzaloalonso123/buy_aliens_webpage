package tiendaEsclavosAlien;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Serv
 */
public class Serv extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public Serv() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String peticion = request.getParameter("peticion");
		switch(peticion)
		{
		case "1":
			String usuario = request.getParameter("usuario");
			String pw = request.getParameter("pw");
			try {
				if(comprobarUsu(usuario, pw))
				{
					request.getSession().setAttribute("usuario", request.getParameter("usuario"));
					request.getSession().setAttribute("alienigenas", aliensBD);
					request.getSession().setAttribute("enCarro", new ArrayList<Alienigena>());
					getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
				}
				else {
					request.setAttribute("error", 1);
					getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
				}
			} catch (Exception e) {e.printStackTrace();}
			
			break;
		case "2":		
			Alienigena a = aliensBD.get(Integer.parseInt(request.getParameter("numeroAlCarro")));
			System.out.println(a.getNombre());
			((ArrayList<Alienigena>)request.getSession().getAttribute("enCarro")).add(a);
			getServletContext().getRequestDispatcher("/pagina.jsp").forward(request, response);	
			break;
		case "3":
			((ArrayList<Alienigena>)request.getSession().getAttribute("enCarro")).clear();
			getServletContext().getRequestDispatcher("/pagina.jsp").forward(request, response);	
			break;
		case "4":
			getServletContext().getRequestDispatcher("/pagina.jsp").forward(request, response);	
		}
	}

	private boolean comprobarUsu(String usu, String pw) throws SQLException {
		boolean esGonzalo = false;
		if(usu.equalsIgnoreCase("gonzalo") && pw.equalsIgnoreCase("123"))
		{
			esGonzalo = true;
			if(aliensBD == null)
			{
				initBD();
			}
		}
		return esGonzalo;
	}
	
	private void initBD() throws SQLException
	{	
		aliensBD = new ArrayList<Alienigena>();
		Connection cn = Connections.getDataSource().getConnection();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery("select * from aliens;");
		
		while(rs.next())
		{
			aliensBD.add(new Alienigena(rs.getString("nombre"), rs.getInt("precio"), rs.getString("imagen"), rs.getString("descripcion")));
		}
	}
	
	ArrayList<Alienigena> aliensBD;

}
