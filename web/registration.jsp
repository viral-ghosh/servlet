<%-- 
    Document   : registration
    Created on : 23 Jan, 2020, 11:32:36 AM
    Author     : Viral Ghosh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="MasterPage/Header.jsp" %>    
<div class="d-flex justify-content-center">

    <form class="form-signin col-8" method="POST" action="register">
        <fieldset>
            <div id="legend">
                <legend class="">Sign Up</legend>
            </div>
            <div class="control-group">
                <label class="control-label" for="email">Username:</label>

                <div class="controls"><input class="form-control" minlength="5" maxlength="15" type="text" maxlength="50" name="uname"  required="Please Enter Username" >
                </div>
            </div>
            <div class="control-group">
                <div class="first">
                    <label for="password">Password:</label>
                </div>
                <div class="second">
                    <input class="form-control" type="password" minlength="8" maxlength="15" name="password" required="Please Enter Password" />
                </div>
            </div>
            <div class="control-group">
                <div class="first">
                    <label for="fname">Full Name:</label>
                </div>
                <div class="second">
                    <input class="form-control" type="text" minlength="6" maxlength="25" name="name" required="Please Enter Your Name"/>
                </div>
            </div>
            <div class="control-group">
                <div class="first">
                    <label for="password">Email:</label>
                </div>
                <div class="second">
                    <input class="form-control" minlength="8" maxlength="35" type="email" name="email" />
                </div>
            </div>
            <div class="control-group">
                <div class="first">
                    <label for="gender">Gender:</label>
                </div>
                <div class="second">
                    <input type="radio" name="gender" value="m" checked="">Male
                    <input type="radio" name="gender" value="f" id="rb">Female
                </div>
            </div>
            <div class="control-group">
                <div class="first">
                    <label for="password">Previous Employer:-</label>
                </div>
                <div class="second">
                    <select name="company" class="form-control">
                        <option value="1">AIMDek</option>
                        <option value="2">Google</option>
                        <option value="3">TCS</option>
                        <option selected="" value="4">Other</option>
                    </select>
                </div>
            </div>
            <div class="control-group">
                <div class="first">
                    <label for="fname">Prefered Deparment:-</label>
                </div>
                <div class="second">
                    <input type="checkbox" name="department" value="1">Front<br>
                    <input type="checkbox" name="department" value="2">Back End<br>
                    <input type="checkbox" name="department" value="3">Networking<br>

                </div>
            </div>
             <div class="control-group">
                <button class="btn btn-lg btn-info btn-block" type="reset">Reset</button>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
            </div>
           
           
        </fieldset>
    </form>
</div>

<%@ include file="MasterPage/Footer.jsp" %>