<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Management Application</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-color: #fff;
            margin: 0;
        }
        .navbar {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 1rem;
            background-color: tomato;
        }
        .navbar-brand {
            display: inline-block;
            padding-top: 0.3125rem;
            padding-bottom: 0.3125rem;
            margin-right: 1rem;
            font-size: 1.25rem;
            color: #fff;
            text-decoration: none;
        }
        .navbar-nav {
            display: flex;
            flex-direction: row;
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
        }
        .nav-link {
            display: block;
            padding: 0.5rem 1rem;
            color: #fff;
            text-decoration: none;
        }
        .nav-link:hover {
            color: #ddd;
        }
        .container {
            width: 100%;
            padding-right: 15px;
            padding-left: 15px;
            margin-right: auto;
            margin-left: auto;
        }
        .container.col-md-5 {
            max-width: 41.666667%;
        }
        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid rgba(0, 0, 0, 0.125);
            border-radius: 0.25rem;
            margin-top: 1rem;
        }
        .card-body {
            flex: 1 1 auto;
            padding: 1.25rem;
        }
        .form-group {
            margin-bottom: 1rem;
            border:none;
        }
        .form-control {
            display: block;
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        .form-control:focus {
            color: #495057;
            background-color: #fff;
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }
        .btn-success {
        	display: inline-block;
            font-weight: 400;
            color: #212529;
            text-align: center;
            vertical-align: middle;
            cursor: pointer;
            background-color: transparent;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            color: #fff;
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-success:hover {
            color: #fff;
            background-color: #218838;
            border-color: #1e7e34;
        }
    </style>
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark">
            <div>
                <a href="https://www.javaguides.net" class="navbar-brand"> User Management App </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list"
                    class="nav-link">Users</a></li>
            </ul>
        </nav>
    </header>
    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <c:if test="${user != null}">
                    <form action="update" method="post">
                </c:if>
                <c:if test="${user == null}">
                    <form action="insert" method="post">
                </c:if>

                <caption>
                    <h2>
                        <c:if test="${user != null}">
                            Edit User
                        </c:if>
                        <c:if test="${user == null}">
                            Add New User
                        </c:if>
                    </h2>
                </caption>

                <c:if test="${user != null}">
                    <input type="hidden" name="id" value="${user.id}" />
                </c:if>

                <fieldset class="form-group">
                    <label>Name</label> 
                    <input type="text" value="${user.name}" class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Email</label> 
                    <input type="text" value="${user.email}" class="form-control" name="email">
                </fieldset>

                <fieldset class="form-group">
                    <label>Country</label> 
                    <input type="text" value="${user.country}" class="form-control" name="country">
                </fieldset>

                <button type="submit" class="btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
