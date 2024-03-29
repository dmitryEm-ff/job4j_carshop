<%@ page import="ru.job4j.carshop.model.CarType" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <title>Car Shop</title>

    <style>
        .navbar-brand h1 i {
            font-size: 1.1em;
        }

        .topnav-right a {
            font-size: x-large;
        }
    </style>

</head>

<body>

<div class="container">

    <div class="header">
        <nav class="navbar navbar-dark bg-danger text-white py-0">
            <a class="navbar-brand">
                <h1>
                    <i class="bi bi-bicycle"></i> AUTO.RU
                </h1>
            </a>
            <div class="topnav-right">
                <div class="row">
                    <c:choose>
                        <c:when test="${user != null}">
                            <a class="nav-link" style="color: white" href="<%=request.getContextPath()%>/post/edit.do">
                                <i class="bi bi-plus-circle"></i>
                                Разместить объявление
                            </a>
                            <a class="nav-link" id="userName" style="color: white" href="<%=request.getContextPath()%>/login.do">
                                <i class="bi bi-person-circle"></i>
                                <c:out value="${user.name}"/>
                            </a>
                            <a class="nav-link" style="color: white" href="<%=request.getContextPath()%>/logout.do">
                                <i class="bi bi-door-open-fill"></i>
                                Выйти
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a class="nav-link" id="userName" style="color: white" href="<%=request.getContextPath()%>/login.do">
                                <i class="bi bi-person-circle"></i>
                                Войти
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>
    </div>

    <table class="table table-striped" id="taskTable">
        <thead>
        <tr>
            <th>Описание</th>
            <th>Категория</th>
            <th>Добавлен</th>
            <th>Пользователь</th>
            <th>Фото</th>
        </tr>
        </thead>
        <tbody id="table">
            <jsp:useBean id="posts" scope="request" type="java.util.List<ru.job4j.carshop.model.Post>"/>
            <c:forEach items="${posts}" var="post">
                <tr>
                    <td>
                        <a href='<c:url value="/post.do?id=${post.id}"/>' class="text-secondary">
                            <c:out value="${post.description}"/>
                        </a>
                    </td>
                    <td>
                        <c:out value="${post.carType.name}"/>
                    </td>
                    <td>
                        <c:out value="${post.created}"/>
                    </td>
                    <td>
                        <c:out value="${post.user.name}"/>
                    </td>
                    <td>
                        <c:forEach items="${post.images}" var="image" begin="0" end="0">
                            <img src="<c:url value='/addImage.do?image=${image.name}'/>" width="200px" height="150px">
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</div>
</body>
</html>
