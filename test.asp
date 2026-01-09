<!DOCTYPE html>
<html>
<head>
    <title>ASP Test Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #4CAF50;
        }
        p {
            color: #333;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>ASP Test Page</h1>
        <p><strong>Server Date/Time:</strong> <%=Now()%></p>
        <p><strong>Server Name:</strong> <%=Request.ServerVariables("SERVER_NAME")%></p>
        <p><strong>ASP Version:</strong> <%=ScriptEngine & "/" & ScriptEngineMajorVersion & "." & ScriptEngineMinorVersion%></p>
        <p style="color: #4CAF50; font-weight: bold;">✓ ASP is working correctly!</p>
        <br>
        <a href="index.asp" style="color: #4CAF50;">Go to Calculator</a>
    </div>
</body>
</html>
