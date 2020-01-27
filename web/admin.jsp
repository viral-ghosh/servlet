<%-- 
    Document   : admin
    Created on : 27 Jan, 2020, 10:09:21 AM
    Author     : Viral Ghosh
--%>

<%@page import="Model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="Model.DatabaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="MasterPage/Header.jsp" %> 

<table class="table table-striped">
   <caption>List of users</caption>
  <thead class="thead-light">
    <tr>
      <th scope="col">#</th>
      <th scope="col">Username</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Gender</th>
      <th scope="col">Company</th>
      <th scope="col">Department</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
    
        <%
            DatabaseHelper db = new DatabaseHelper();
            ArrayList<Customer> list = new ArrayList<>();
            list = db.getAllCustomers();
            for(Customer c: list){%>
            <tr>
                <th scope="row"><%=c.getLoginid()%></th>
                <td><%=c.getUsername()%></td>
                <td><%=c.getName()%></td>
                <td><%=c.getEmail()%></td>
                <td><%=c.getGender()%></td>
                <td><%=c.getCompany()%></td>
                <td><%=c.getDepartment()%></td>
                <td><a href="edit?id=<%=c.getLoginid()%>" >Edit</a>
                    <a href="delete?id=<%=c.getLoginid()%>" >Delete</a>
                </td>
            </tr>
        <%    }
        %>
      
    
  </tbody>
</table>

        <script src="js/jquery-3.4.1.slim.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    
<%@ include file="MasterPage/Footer.jsp" %>
