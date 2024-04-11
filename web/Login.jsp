<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%
    if (request.getParameter("btn_submit") != null) {
        String email = request.getParameter("txt_email");
        String password = request.getParameter("txt_password");

        String selQryA = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
        ResultSet rsA = con.selectCommand(selQryA);

        String selQryU = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
        ResultSet rsU = con.selectCommand(selQryU);

        String selQryS = "select * from tbl_shop where shop_email='" + email + "' and shop_password='" + password + "'";
        ResultSet rsS = con.selectCommand(selQryS);

        if (rsA.next()) {
            session.setAttribute("aname", rsA.getString("admin_name"));
            session.setAttribute("aid", rsA.getString("admin_id"));
            response.sendRedirect("Admin/HomePage.jsp");
        } else if (rsU.next()) {
            session.setAttribute("uname", rsU.getString("user_name"));
            session.setAttribute("uid", rsU.getString("user_id"));
            response.sendRedirect("User/");
        } else if (rsS.next()) {

            session.setAttribute("sname", rsS.getString("shop_name"));
            session.setAttribute("sid", rsS.getString("shop_id"));
            response.sendRedirect("Shop/");

        } else {
                %>
                <script>
                    alert("Invalid Credentials");
                    window.location = "Login.jsp";
                </script>
                <%
        }

    }
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <%@include file="Head.jsp" %>

        <h2>Login</h2>
        <br/>
        <form method="post">
            <table>
                <tr>
                    <th>Email</th>
                    <td>
                        <input  type="email"  name="txt_email" id="txt_email" placeholder="E-Mail Address" required="">
                    </td>
                </tr>
                <tr>
                    <th>Password</th>
                    <td>
                        <input  type="password"  name="txt_password" id="txt_password"  placeholder="Password" required="">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit"  name="btn_submit" value="Login">
                    </td>
                </tr>
            </table>
        </form>
    </body>
    <%@include file="Foot.jsp" %>
</html>