<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITGIGA_EXAM</title>
</head>
<body>
<h1 align="center">ITGIGA EXAMINATION</h1>

<form method="post" action="result.jsp">
	<table>
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinetest", "root","root");
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("select * from test");
			int i = 1;
			while (rs.next()) {
		%>
		<tr>
			<td><%=i%></td>
			<td><%=rs.getString("ques")%></td>
			
			<td><input type="radio" value="<%=rs.getString("op1")%>" name="radio<%=i%>" /><%=rs.getString("op1")%></td>
			<td><input type="radio" value="<%=rs.getString("op2")%>" name="radio<%=i%>" /><%=rs.getString("op2")%></td>
			<td><input type="radio" value="<%=rs.getString("op3")%>" name="radio<%=i%>" /><%=rs.getString("op3")%></td>
			<td><input type="radio" value="<%=rs.getString("op4")%>" name="radio<%=i%>" /><%=rs.getString("op4")%></td>
			
		</tr>

		<%
			i++;
			}
		%>
		<tr>
			<td><input type="submit" value="submit"  ></td>
		</tr>
	</table>
</form>
</body>
</html>