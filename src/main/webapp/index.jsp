<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
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
<div id="container">
    <div id="upper">
        <header>
            Pavlova Alina Egorovna <br> P32141 <br> Var 13171
        </header>
        <div id="sidebar">
            <h4>Useful link</h4>
            <a href="https://github.com/alinautumn/web-lab2"> Source code</a>
        </div>
    </div>

    <div id="heading">
        <h2>Laboratory work № 2 </h2>
    </div>

    <div id="content">
        <div id="graph">
            <svg width="300px" height="300px" onclick="svgHandler(event)" class="svgClass">
                <!-- Координатные оси -->
                <line x1="0" x2="300" y1="150" y2="150" stroke="#343548"></line>
                <line x1="150" x2="150" y1="0" y2="300" stroke="#343548"></line>
                <!--Стрелки-->
                <polygon points="150,0 145,10 155,10" stroke="#343548"></polygon>
                <polygon points="300,150 290,145 290,155" stroke="#343548"></polygon>
                <!--Четверть круга-->
                <path d="M100,150 A50,50 0 0,0 150,200 L 150,150 Z"></path>
                <!--Прямоугольник-->
                <polygon points="250,150 250,250 150,250 150,150"></polygon>
                <!--Треугольник-->
                <polygon points="150,150 150,50 200,150"></polygon>
                !!-->

                <!-- Метки для значений R на оси X -->
                <line x1="50" x2="50" y1="145" y2="155" stroke="#343548"></line>
                <line x1="100" x2="100" y1="145" y2="155" stroke="#343548"></line>
                <line x1="200" x2="200" y1="145" y2="155" stroke="#343548"></line>
                <line x1="250" x2="250" y1="145" y2="155" stroke="#343548"></line>

                <!-- Метки для значений R на оси Y -->
                <line x1="145" x2="155" y1="50" y2="50" stroke="#343548"></line>
                <line x1="145" x2="155" y1="100" y2="100" stroke="#343548"></line>
                <line x1="145" x2="155" y1="200" y2="200" stroke="#343548"></line>
                <line x1="145" x2="155" y1="250" y2="250" stroke="#343548"></line>

                <!-- Подписи к осям -->
                <text x="290" y="140">X</text>
                <text x="155" y="10">Y</text>
                <!-- Значения R на оси X -->
                <text x="40" y="138">-R</text>
                <text x="85" y="138">-R/2</text>
                <text x="190" y="138">R/2</text>
                <text x="245" y="138">R</text>
                <!-- Значения R на оси Y -->
                <text x="162" y="54">R</text>
                <text x="162" y="104">R/2</text>
                <text x="162" y="204">-R/2</text>
                <text x="162" y="254">-R</text>
                <%--@elvariable id="shots" type="com.alinautumn.web_lab2.model.ShotCollectionManager"--%>
                <c:forEach items="${shots.collection}" var="col">
                    <circle class="shot" cx="${150 + 50 * 2/col.r * col.x}"
                            cy="${150 - 50 * 2/col.r * col.y}" r="3"
                            fill="#000000" stroke-width="0"></circle>
                </c:forEach>
            </svg>
        </div>
        <form novalidate name="simpleForm" onsubmit="getDataFromForm(); return false;">
            <div id="form">
                <div id="values">
                    <div id="x-values">
                        <label for="x-values">Select X:</label>
                        <input id="x-button" class="x-button" type="button" value="-5">
                        <input class="x-button" type="button" value="-4">
                        <input class="x-button" type="button" value="-3">
                        <input class="x-button" type="button" value="-2">
                        <input class="x-button" type="button" value="-1">
                        <input class="x-button" type="button" value="0">
                        <input class="x-button" type="button" value="1">
                        <input class="x-button" type="button" value="2">
                        <input class="x-button" type="button" value="3">
                        <br>
                    </div>
                    <div id="y-values">
                        <label for="y-value">Enter Y (-3 ... 5 ):</label>
                        <input type = "number" class="y-text" maxlength="14" id="y-value" name="y-value"
                               oninput="validateYTextField()" required> <br>
                    </div>
                    <div id="r-values">
                        <label for="r-value">Enter R ( 2 ... 5 ):</label>
                        <input type = "number" class="r-text" maxlength="14" id="r-value" name="r-value"
                               oninput="validateRTextField()" required> <br>
                    </div>
                    <div id="formButtons">
                        <input type="submit" class="element" name="submit-btn" value="Submit">
                        <button onClick="window.location.replace('result.jsp');" type="reset" onclick="">Last Result</button>
                    </div>
                </div>
        </form>
        <section id="validationInfo" class="validationInfo">
        </section>
    </div>
</div>

<div id="tableInTotal">
    <input type="submit" class="element" id="clear-btn" value="Clean"
           onclick="cleanTable();">
    <table id="table">
        <tr>
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Current Time</th>
            <th>Execution Time (msec)</th>
            <th>Hit Result</th>
        </tr>
        <%--@elvariable id="shots" type="com.alinautumn.web_lab2.model.ShotCollectionManager"--%>
        <tr>
            <c:forEach items="${shots.collection}" var="col">
                <td>${col.x.toString().format("%.2f", col.x).replaceAll(",",".")}</td>
                <td>${col.y.toString().format("%.2f", col.y).replaceAll(",",".")}</td>
                <td>${col.r.toString().trim().format("%.2f", col.r).replaceAll(",",".")}</td>
                <td>${col.time.toString()}</td>
                <td>${col.scriptTime.toString()}</td>
                <td>${col.status.toString()}</td>
            </c:forEach>
        </tr>
    </table>
</div>
</div>
</body>
</html>