<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<t:pageTemplate pageTitle="Login">
    <c:if test="${message != null}">
        <div class="alert alert-warning" role="alert">
            ${message}
        </div>
    </c:if>


    <form class="form-signin" method="POST" action="j_security_check">
        <h1>Sign in</h1>

        <div class="row">
            <div class="col-md 6 mb-3">
                <label for="username" class="sr-only">Username</label>
                <input type="text" id="username" name="j_username" class="form-control" placeholder="Username" required autofocus />
            </div>
        </div>

        <div class="row">
            <div class="col-md 6 mb-3">
                <label for="password" class="sr-only">Password</label>
                <input type="password" id="password" name="j_password" class="form-control" placeholder="Password" required />
            </div>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>
</t:pageTemplate>

