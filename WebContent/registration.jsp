<%@ page import ="java.sql.*" %>
<%
String user = request.getParameter("uname");    
String pwd = request.getParameter("pass");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String add_num = request.getParameter("add_num");
String cnfrm_pass = request.getParameter("cnfrm_pass");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test100",
"root", "root");
Statement st = con.createStatement();
//ResultSet rs;
int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass,add_num,cnfrm_pass,regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','" +add_num + "','" +cnfrm_pass+ "', CURDATE())");
if(pwd.equals(cnfrm_pass))
{
response.sendRedirect("welcome.jsp");
}
else
{
	out.print("password not matching");
}
//if (i > 0) {
//session.setAttribute("userid", user);
//response.sendRedirect("welcome.jsp");
// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
//} else {
//response.sendRedirect("index.jsp");
//}
%>
