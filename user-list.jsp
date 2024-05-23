<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        .text-center {
            text-align: center !important;
        }
        .text-left {
            text-align: left !important;
        }
        .btn {
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
        }
        .btn-success {
            color: #fff;
            background-color: #28a745;
            border-color: #28a745;
            text-decoration:none
        }
        .btn-success:hover {
            color: #fff;
            background-color: #218838;
            border-color: #1e7e34;
        }
        table {
            width: 100%;
            margin-bottom: 1rem;
            color: #212529;
            border-collapse: collapse;
        }
        .table-bordered {
            border: 1px solid #dee2e6;
        }
        .table-bordered th,
        .table-bordered td {
            border: 1px solid #dee2e6;
            padding: 0.75rem;
            vertical-align: top;
        }
        th {
            text-align: inherit;
        }
        hr {
            margin: 1rem 0;
            border: 0;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark">
            <div>
                <a href="https://www.javaguides.net" class="navbar-brand"> User
                    Management App </a>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list"
                    class="nav-link">Users</a></li>
            </ul>
        </nav>
    </header>
    <br>

    <div class="row">

        <div class="container">
            <h3 class="text-center">List of Users</h3>
            <hr>
            <div class="container text-left">

                <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
                    New User</a>
            </div>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Country</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${listUser}">

                        <tr>
                            <td>${user.id}</td>
                            <td>${user.name}</td>
                            <td>${user.email}</td>
                            <td>${user.country}</td>
                            <td><a href="<%=request.getContextPath()%>/edit?id=${user.id}">Edit</a>
                                &nbsp;&nbsp;&nbsp;&nbsp; <a
                                href="<%=request.getContextPath()%>/delete?id=${user.id}">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>
    </div>
</body>
</html>
