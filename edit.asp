<!--#include file="conn.asp"-->
<%
Dim id, rs, sql
id = Request.QueryString("id")

Set rs = Server.CreateObject("ADODB.Recordset")
sql = "SELECT * FROM Calculations WHERE id = " & id
rs.Open sql, conn
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Calculation</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
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
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            margin-right: 10px;
        }
        button:hover {
            background-color: #45a049;
        }
        .cancel-btn {
            background-color: #999;
        }
        .cancel-btn:hover {
            background-color: #777;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Calculation</h1>
        
        <form action="update.asp" method="post">
            <input type="hidden" name="id" value="<%=rs("id")%>">
            
            <div class="form-group">
                <label>Principal Amount ($):</label>
                <input type="number" name="principal" step="0.01" value="<%=rs("principal")%>" required>
            </div>
            
            <div class="form-group">
                <label>Interest Rate (%):</label>
                <input type="number" name="rate" step="0.01" value="<%=rs("rate")%>" required>
            </div>
            
            <div class="form-group">
                <label>Duration:</label>
                <input type="number" name="duration" value="<%=rs("duration")%>" required>
            </div>
            
            <div class="form-group">
                <label>Duration Type:</label>
                <select name="duration_type">
                    <option value="years" <%If rs("duration_type") = "years" Then Response.Write("selected")%>>Years</option>
                    <option value="months" <%If rs("duration_type") = "months" Then Response.Write("selected")%>>Months</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Compound Frequency:</label>
                <select name="frequency">
                    <option value="1" <%If rs("frequency") = 1 Then Response.Write("selected")%>>Annually</option>
                    <option value="2" <%If rs("frequency") = 2 Then Response.Write("selected")%>>Semi-Annually</option>
                    <option value="4" <%If rs("frequency") = 4 Then Response.Write("selected")%>>Quarterly</option>
                    <option value="12" <%If rs("frequency") = 12 Then Response.Write("selected")%>>Monthly</option>
                </select>
            </div>
            
            <button type="submit">Update Calculation</button>
            <button type="button" class="cancel-btn" onclick="window.location.href='index.asp'">Cancel</button>
        </form>
    </div>
</body>
</html>
<%
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>
