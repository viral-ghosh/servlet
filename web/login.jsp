<%-- 
    Document   : login
    Created on : 23 Jan, 2020, 12:33:18 PM
    Author     : Viral Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="MasterPage/Header.jsp" %>
<div class="d-flex justify-content-center  mt-5 mr-5">
    <form class="form-signin col-4" action="login" method="POST">
  <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
  <label for="inputEmail" class="sr-only">Email address</label>
  <input type="text" name="uname" class="form-control" placeholder="Username" required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" name="password" class="form-control" placeholder="Password" required>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>

</form>
    </div>
<%@ include file="MasterPage/Footer.jsp" %>