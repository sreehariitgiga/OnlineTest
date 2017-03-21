<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String st[] = new String[10];
	for (int i = 0; i < st.length; i++) {
		int j = i + 1;
		st[i] = request.getParameter("radio" + j);
		System.out.println(st[i]);

	}
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinetest", "root","root");
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery("select ans from answer");
	String ans = "";
	while (rs.next()) {
		ans += rs.getString("ans") + " ";
	}

	int count=0;
	String answers[]= ans.split(" ");
	
	for(int i=0;i<answers.length;i++){
		if(st[i].equals(answers[i])){
			count++;
		}
	}
	out.println("Total number of correct answers:"+count);
%>
</body>
</html>