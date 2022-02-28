<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tiendaEsclavosAlien.Alienigena"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">


function alCarro(idAlien)
{
	document.getElementById("numeroAlCarro").value = idAlien;	
	document.getElementById("peticion").value = 2;
	document.getElementById("form").submit();
}

function mostrarOcultarCarro()
{
	var x = document.getElementById("carro");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	
}

function comprar()
{
	alert("Se estan enviando esclavos alienigenas a tu domicilio");
	document.getElementById("peticion").value = "3";
	document.getElementById("form").submit();
}

</script>
</head>
<body style="background-color:#fffd9a;">
	<table width="100%" cellspacing="0" cellpadding="10" >
		<tr>
		<td bgcolor="#229922" width="30%" height="20%">
			<td bgcolor="#229922" width="62%" height="20%"><img
				src="<%=request.getContextPath()%>/Images/alien.png"
				onClick="/home.jsp"> <FONT FACE="impact" SIZE=10
				COLOR="#53ff23" style="text-shadow: -4px 0 black">NUESTRAS
					OFERTAS</FONT> <img src="<%=request.getContextPath()%>/Images/alien.png"
				onClick="/home.jsp"></td>
			<td bgcolor="#229922" width="8%"><img
				src="<%=request.getContextPath()%>/Images/carro.png"
				onClick="mostrarOcultarCarro()" id="carroImg"></td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td width="70%">
				<table cellspacing="5" cellpadding="0" border  = "2px">
					<%
					if (request.getSession().getAttribute("alienigenas") != null) {
						ArrayList<Alienigena> alienigenas = (ArrayList<Alienigena>) request.getSession().getAttribute("alienigenas");
						for (int i = 0; i < alienigenas.size(); i++) {

							out.println("<tr><td width =\"5%\"> <img src = \"" + request.getContextPath() + alienigenas.get(i).getFoto()
							+ ".jpg\"></td><td width = \"90%\" style=\"text-align: center; vertical-align: middle;\"><label style=\"float: left;\">&nbsp;<b>" + alienigenas.get(i).getNombre() + "</b></label>&nbsp;&nbsp;&nbsp;" + alienigenas.get(i).getDescripcion()
							+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label style=\"float: right;\"><b>" + alienigenas.get(i).getPrecio()
							+ "$&nbsp;&nbsp;</b></label> &nbsp;&nbsp;&nbsp;&nbsp; </td><td width = \"5%\"><input type = \"button\" height = \"30\" style=\"float: right;height:90px;\" value = \"Añadir al carro\" onClick = \"alCarro("
							+ i + ")\"></td></tr>");

						}

					}
					%>
				</table>
			</td>
			<td width="30%" style="text-align: right; vertical-align: top">
				<table id="carro" border="4px" align="right" vertical-align="top"
					style="background-color: #c8fdb9;" width="100%">
					<%
					if (request.getSession().getAttribute("enCarro") != null) {
						ArrayList<Alienigena> aliensEnCarro = (ArrayList<Alienigena>) request.getSession().getAttribute("enCarro");
						if (aliensEnCarro.size() == 0) {
							out.println("<tr><td>Todavia no has comprado nada</b></td></tr>");
						} else {
							int total = 0;

							for (Alienigena a : aliensEnCarro) {
						total += a.getPrecio();
						out.println("<tr><td width = \"20%\" border = \"2px\"><img src =\"" + request.getContextPath() + a.getFoto()
								+ ".jpg\" </td><td width = \"80%\">" + a.getDescripcion() + "<br><b>" + a.getPrecio()
								+ "$</b></td></tr>");
							}
							out.println("<tr><td></td><td><label text-align:right><b>Total: " + total + "$</b></label></td></tr>");
							out.println("<tr><td></td><td><input type = \"button\" value = \"Comprar\" onClick = \"comprar()\"></td></tr>");
						}
					}
					%>
				</table>
			</td>
		</tr>
	</table>
	<form action="Serv" method="post" id="form">
		<input hidden name="peticion" id="peticion"> <input hidden
			name="numeroAlCarro" id="numeroAlCarro">
	</form>

</body>
<footer>
	<table width="100%" cellspacing="0" cellpadding="10">
		<tr>
			<td bgcolor="#229922" width="88%" height="20%"><label><a
					href=<%=request.getContextPath() + "/home.jsp"%>>Home</a></label> <label><a
					href=<%=request.getContextPath() + "/index.jsp"%>> | Cerrar
						sesion</a></label></td>
			<td bgcolor="#229922" width="12%"><label text-align:right>
					<%
					out.println((String) request.getSession().getAttribute("usuario"));
					%>
			</label></td>
		</tr>
	</table>

</footer>
</html>