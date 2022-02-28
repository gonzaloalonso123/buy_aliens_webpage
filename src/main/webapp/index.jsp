<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="100%" cellspacing="0" cellpadding="10">
		<tr>
			<td width="27%" bgcolor="#229922" height="20%"></td>
			<td bgcolor="#229922" width="92%" height="20%"><img
				src="<%=request.getContextPath()%>/Images/alien.png"><FONT
				FACE="impact" SIZE=10 COLOR="#53ff23"
				style="text-shadow: -4px 0 black">ESCLAVOS-ALIENIGENAS-51 </FONT><img
				src="<%=request.getContextPath()%>/Images/alien.png"></td>
		</tr>
	</table>

	<form action="<%=request.getContextPath()%>/Serv" method="post">
		<table width="100%" cellspacing="0" cellpadding="10" height="500">
			<tr bgcolor="#66ff66"">
				<td width=33%></td>
				<td width=33%></td>
				<td></td>
			</tr>
			<tr bgcolor="#66ff66"">
				<td></td>
				<td bgcolor="88ff88"><label><b>Usuario:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label>
					<input type="text" size=30 name="usuario"> <br> <br>
					<label><b>Contraseña:&nbsp;&nbsp;</b></label> <input
					type="password" size=30 name="pw"> <br> <br> <input
					style="margin-left: 160px;" type="submit" value="Login" size=30>
					<%
					if (request.getAttribute("error") != null) {
						out.println("<br><br><FONT FACE=\"impact\" SIZE=3 COLOR=\"RED\">USUARIO O CONTRASEÑA INCORRECTO</FONT>");
					}
					%></td>
				<td></td>
			</tr>
			<tr bgcolor="#66ff66"">
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<input hidden name="peticion" value="1">
	</form>

</body>
</html>