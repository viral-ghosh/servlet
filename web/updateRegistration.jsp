<%-- 
    Document   : EditRegistration
    Created on : 22 Jan, 2020, 4:40:20 PM
    Author     : Viral Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="MasterPage/Header.jsp" %>    
<div class="d-flex justify-content-center">

    <form class="form-signin col-8" method="POST" action="edit">
        <fieldset>
            <div id="legend">
                <legend class="">Update Registration</legend>
            </div>
                    <div class="control-group">
                        <label class="control-label" for="email">Username:</label>
                      
                        <div class="controls"><input class="form-control" type="text" maxlength="50" readonly="" name="uname" value=${c.username} />
                        </div>
                    </div>
                   
                    <div class="control-group">
                        <div class="first">
                            <label for="fname">Full Name:</label>
                        </div>
                        
                            <input id="name" class="form-control" type="text" name="name" value=${c.name} />
                       
                    </div>
                    <div class="control-group">
                        <div class="first">
                            <label for="password">Email:</label>
                        </div>
                        <div class="second">
                            <input class="form-control" type="email" name="email" value=${c.email} />
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="first">
                            <label for="gender">Gender:</label>
                        </div>
                        <div class="second">

                            <input type="radio" name="gender" value="m">Male
                            <input type="radio" name="gender" value="f" id="rb">Female
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="first">
                            <label for="password">Previous Employer:-</label>
                        </div>
                        <div class="second">
                            <select class="form-control" name="company">
                                <option value="1">AIMDek</option>
                                <option value="2">Google</option>
                                <option value="3">TCS</option>
                                <option value="4">Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="first">
                            <label for="fname">Prefered Deparment:-</label>
                        </div>
                        <div class="second">
                            <input type="checkbox" name="department" value="1">Front End<br>
                            <input type="checkbox" name="department" value="2">Back End<br>
                            <input type="checkbox" name="department" value="3" >Networking<br>

                        </div>
                    </div>
                    <div class="control-group">
                <button class="btn btn-lg btn-info btn-block" type="reset">Reset</button>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Update</button>
            </div>

                </form>
            </div>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <script>
           
            $(document).ready(function () {
                $("input[name=gender][value=${c.gender}]").prop("checked", true);
                $("input[name=name]").val("${c.name}"); 
                $("select[name=company] option[value=${c.company}]").attr('selected','selected');
            <%
                String department = (String.valueOf(request.getAttribute("department")));
                String[] arr = department.split(",");
                 for (int a = 0; a < arr.length; a++) {
            %>
                $("input[name=department][value=<%=arr[a]%>]").prop("checked", true);
            <%
                }
            %>
            });
        </script>
<%@ include file="MasterPage/Footer.jsp" %>