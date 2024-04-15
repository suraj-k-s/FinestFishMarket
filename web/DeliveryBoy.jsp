<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%@include file="Head.jsp" %>
        <div id="tab" align="center">
            <h2>Delivery partner Registration</h2>
            <br/>
            <form enctype="multipart/form-data" method="post" action="Assets/ActionPages/DeliveryBoyUploadAction.jsp">
                <table>
                    <tr>
                        <th>Name</th>
                        <td>
                            <input  type="text"  name="txt_name" id="txt_name"  placeholder="Name" required="">
                        </td>
                    </tr>
                    <tr>
                        <th>Contact</th>
                        <td>
                            <input  type="text"   name="txt_contact" id="txt_contact" placeholder="Contact" required="">
                        </td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>
                            <input  type="email"  name="txt_email" id="txt_email" placeholder="E-Mail Address" required="">
                        </td>
                    </tr>
                    <tr> 
                        <th>Address</th>
                        <td>
                            <textarea  rows="6"  name="txt_address" id="txt_address" placeholder="Your Address" required=""></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th>District</th>
                        <td>
                            <select  name="sel_district" id="sel_district" onchange="getPlace(this.value)">
                                <option value="">Select District</option>
                                <%
                                    String selQry = "select * from tbl_district";
                                    ResultSet rsd = con.selectCommand(selQry);
                                    while (rsd.next()) {
                                %>
                                <option value="<%=rsd.getString("district_id")%>"><%=rsd.getString("district_name")%></option>
                                <%
                                    }
                                %>
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <th>Place</th>
                        <td>
                            <select  name="sel_place" id="sel_place">
                                <option value="">Select Place</option>
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <th>Photo</th>
                        <td>
                            <input  type="file" style="background: white"  id="file_photo" name="file_photo"  required="">
                        </td>
                    </tr>
                    <tr>
                        <th>Proof</th>
                        <td>
                            <input  type="file" style="background: white" id="file_proof" name="file_proof"  required="">
                        </td>
                    </tr>
                    <tr>
                        <th>Password</th>
                        <td>
                            <input  type="password"  name="txt_password" id="txt_password"  placeholder="Password" required="">
                        </td>
                    </tr>
                    <tr>
                        <th>Confirm Password</th>
                        <td>
                            <input  type="password"   name="txt_cpassword" id="txt_cpassword" placeholder="Confirm Password" required="">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit"  name="btn_submit" value="Register">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <script src="../Assets/JQuery/jQuery.js"></script>
        <script>
                                function getPlace(did)
                                {
                                    $.ajax({
                                        url: "Assets/AjaxPages/AjaxPlace.jsp?did=" + did,
                                        success: function(html) {
                                            $("#sel_place").html(html);

                                        }
                                    });
                                }
        </script>
        <%@include file="Foot.jsp" %>
    </body>
</html>
