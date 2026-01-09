<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html>
<head>
    <title>Compound Interest Calculator</title>
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
            max-width: 800px;
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
        h2 {
            color: #555;
            margin-top: 30px;
            margin-bottom: 15px;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 5px;
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
        }
        button:hover {
            background-color: #45a049;
        }
        .result {
            background-color: #e8f5e9;
            padding: 20px;
            border-radius: 4px;
            margin-top: 20px;
            border-left: 4px solid #4CAF50;
        }
        .result h3 {
            color: #2e7d32;
            margin-bottom: 10px;
        }
        .result p {
            color: #333;
            margin: 5px 0;
            font-size: 16px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .action-links a {
            margin-right: 10px;
            color: #4CAF50;
            text-decoration: none;
        }
        .action-links a:hover {
            text-decoration: underline;
        }
        .delete-link {
            color: #f44336 !important;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Compound Interest Calculator</h1>
        
        <!-- Calculator Form -->
        <form action="save.asp" method="post">
            <div class="form-group">
                <label>Principal Amount ($):</label>
                <input type="number" name="principal" step="0.01" required>
            </div>
            
            <div class="form-group">
                <label>Interest Rate (%):</label>
                <input type="number" name="rate" step="0.01" required>
            </div>
            
            <div class="form-group">
                <label>Duration:</label>
                <input type="number" name="duration" required>
            </div>
            
            <div class="form-group">
                <label>Duration Type:</label>
                <select name="duration_type">
                    <option value="years">Years</option>
                    <option value="months">Months</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Compound Frequency:</label>
                <select name="frequency">
                    <option value="1">Annually</option>
                    <option value="2">Semi-Annually</option>
                    <option value="4">Quarterly</option>
                    <option value="12">Monthly</option>
                </select>
            </div>
            
            <button type="submit">Calculate & Save</button>
        </form>
        
        <!-- Calculation History -->
        <h2>Calculation History</h2>
        <table>
            <tr>
                <th>Date</th>
                <th>Principal</th>
                <th>Rate</th>
                <th>Duration</th>
                <th>Final Amount</th>
                <th>Interest Earned</th>
                <th>Actions</th>
            </tr>
            <%
            Dim rs, sql
            Set rs = Server.CreateObject("ADODB.Recordset")
            sql = "SELECT * FROM Calculations ORDER BY calculation_date DESC"
            rs.Open sql, conn
            
            If Not rs.EOF Then
                Do While Not rs.EOF
            %>
            <tr>
                <td><%=FormatDateTime(rs("calculation_date"), 2)%></td>
                <td>$<%=FormatNumber(rs("principal"), 2)%></td>
                <td><%=rs("rate")%>%</td>
                <td><%=rs("duration")%> <%=rs("duration_type")%></td>
                <td>$<%=FormatNumber(rs("final_amount"), 2)%></td>
                <td>$<%=FormatNumber(rs("interest_earned"), 2)%></td>
                <td class="action-links">
                    <a href="edit.asp?id=<%=rs("id")%>">Edit</a>
                    <a href="delete_list.asp?id=<%=rs("id")%>" class="delete-link">Delete</a>
                </td>
            </tr>
            <%
                    rs.MoveNext
                Loop
            Else
            %>
            <tr>
                <td colspan="7" style="text-align: center; color: #999;">No calculations yet. Create your first calculation above!</td>
            </tr>
            <%
            End If
            rs.Close
            Set rs = Nothing
            %>
        </table>
    </div>
</body>
</html>
<%
conn.Close
Set conn = Nothing
%>
