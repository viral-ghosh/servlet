<%-- 
    Document   : MasterHeader
    Created on : 23 Jan, 2020, 11:30:37 AM
    Author     : Viral Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom.css">
    <script src="https://kit.fontawesome.com/9a5a1d6d18.js" crossorigin="anonymous"></script>
    <title>Hello, world!</title>
</head>

<body>
    <nav class="navbar navbar-dark sticky-top bg-dark fixed-top">
        <a href="#" class="navbar-brand">Viral Ghosh</a>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                <div class="sidebar-sticky">
                  <ul class="nav flex-column">
                    <li class="nav-item">
                      <a class="nav-link active" href="admin.jsp">
                        <i class="fas fa-home"></i>
                        Dashboard 
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">
                        <i class="fas fa-clipboard-list"></i>
                        Orders
                      </a>
                    </li>
                    
                  </ul>
          
                  <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>Access</span>
                    <a class="d-flex align-items-center text-muted" href="#" aria-label="Add a new report">
                      <span data-feather="plus-circle"></span>
                    </a>
                  </h6>
                  <ul class="nav flex-column mb-2">
                    <li class="nav-item">
                      <a class="nav-link" href="login.jsp">
                        <span data-feather="file-text"></span>
                        Login
                      </a>
                    </li>   
                     <li class="nav-item">
                      <a class="nav-link" href="registration.jsp">
                        <span data-feather="file-text"></span>
                        Sign Up
                      </a>
                    </li>         
                  </ul>
                </div>
              </nav>
              <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">