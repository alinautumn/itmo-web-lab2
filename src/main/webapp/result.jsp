<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Web lab2</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/Validator.js"></script>
    <script src="js/Updater.js"></script>
    <script src="js/CleanTable.js"></script>
    <script src="js/xButton.js"></script>
    <script src="js/GraphHandler.js"></script>
    <script src="js/jquery-3.6.0.js"></script>
</head>
<body>
<div id="resultsContainer">
  <table id="resultsTable">
    <tbody>
        <tr class = "results">
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Current Time</th>
            <th>Execution time (msec)</th>
            <th>Hit Result</th>
        </tr>
        <%--@elvariable id="collection" type="java.util.LinkedList"--%>
        <tr class = "results">
            <th>${collection.getLast().getX().toString().format("%.2f", collection.getLast().getX()).replaceAll(",",".")}</th>
            <th>${collection.getLast().getY().toString().format("%.2f", collection.getLast().getY()).replaceAll(",",".")}</th>
            <th>${collection.getLast().getR().toString().format("%.2f", collection.getLast().getR()).replaceAll(",",".")}</th>
            <th>${collection.getLast().getTimezone().toString()}</th>
            <th>${collection.getLast().getScriptTime().toString()}</th>
            <c:choose>
                <c:when test="${collection.getLast().getStatus().toString().trim()=='true'}">
                    <th style="color: green">${collection.getLast().getStatus().toString().toUpperCase()}</th>
                </c:when>
                <c:otherwise>
                    <th style="color: red">${collection.getLast().getStatus().toString().toUpperCase()}</th>
                </c:otherwise>
            </c:choose>
        </tr>
        <tr>
            <td colspan="6" style="text-align: center">
                <button onClick="window.location.replace('./.');" type="reset" onclick="">Main page</button>
            </td>
        </tr>
    </tbody>
  </table>
</div>
</body>
</html>