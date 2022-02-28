<%@page import="tiendaEsclavosAlien.Alienigena"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function mostrarOcultarCarro() {
		var x = document.getElementById("carro");
		if (x.style.display === "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
	}

	function irTienda() {
		document.getElementById("form").submit();
	}

	function comprar() {
		alert("Se estan enviando esclavos alienigenas a tu domicilio");
		document.getElementById("peticion").value = "3";
		document.getElementById("form").submit();
	}
</script>

<style>
</style>
</head>
<body>
<body
	background="<%=request.getContextPath()%>/Images/aliensheader.jpeg"
	width="100%" style="background-size: cover;">
	<table width="100%" cellspacing="0" cellpadding="10">
		<tr>
			<td bgcolor="#229922" width="25%" height="20%"><img
				src="<%=request.getContextPath()%>/Images/tienda.png"
				onClick="irTienda()"></td>
			<td bgcolor="#229922" width="67%" height="20%"><img
				src="<%=request.getContextPath()%>/Images/alien.png"><FONT
				FACE="impact" SIZE=10 COLOR="#53ff23"
				style="text-shadow: -4px 0 black">ESCLAVOS-ALIENIGENAS-51 </FONT><img
				src="<%=request.getContextPath()%>/Images/alien.png"></td>
			<td bgcolor="#229922" width="8%" height="20%"><img
				src="<%=request.getContextPath()%>/Images/carro.png"
				onClick="mostrarOcultarCarro()"></td>
		</tr>
	</table>

	<table width="100%" height="500">
		<tr>
			<td width="70%"></td>
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
		<input hidden type="text" value="4" name="peticion" id="peticion"
			value="4">
	</form>
</body>
<footer>
	<table width="100%" cellspacing="0" cellpadding="10"
		vertical-align="bottom">
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