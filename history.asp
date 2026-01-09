<%@ Language=VBScript %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculation History</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Calculation History</h1>
        
        <%
        ' Connect to database
        Dim conn, connString, rs, sql
        connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("calculations.mdb")
        
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open connString
        
        sql = "SELECT * FROM Calculations ORDER BY CalculationDate DESC"
        Set rs = conn.Execute(sql)
        
        If Not rs.EOF Then
            Response.Write "<table>"
            Response.Write "<tr>"
            Response.Write "<th>Date</th>"
            Response.Write "<th>Principal</th>"
            Response.Write "<th>Rate</th>"
            Response.Write "<th>Duration</th>"
            Response.Write "<th>Interest Earned</th>"
            Response.Write "<th>Final Amount</th>"
            Response.Write "<th>Action</th>"
            Response.Write "</tr>"
            
            Do While Not rs.EOF
                Response.Write "<tr>"
                Response.Write "<td>" & FormatDateTime(rs("CalculationDate"), 2) & "</td>"
                Response.Write "<td>$" & FormatNumber(rs("Principal"), 2) & "</td>"
                Response.Write "<td>" & rs("InterestRate") & "%</td>"
                Response.Write "<td>" & rs("Duration") & " " & rs("TimeUnit") & "</td>"
                Response.Write "<td style='color: #28a745; font-weight: 600;'>$" & FormatNumber(rs("InterestEarned"), 2) & "</td>"
                Response.Write "<td style='font-weight: 700;'>$" & FormatNumber(rs("FinalAmount"), 2) & "</td>"
                Response.Write "<td><a href='delete.asp?id=" & rs("ID") & "' class='btn btn-danger' onclick='return confirm(""Are you sure you want to delete this calculation?"")'>Delete</a></td>"
                Response.Write "</tr>"
                rs.MoveNext
            Loop
            
            Response.Write "</table>"
        Else
            Response.Write "<div class='no-data'>No calculations found. Start by making your first calculation!</div>"
        End If
        
        rs.Close
        conn.Close
        Set rs = Nothing
        Set conn = Nothing
        %>
        
        <a href="index.html" class="back-link">← Back to Calculator</a>
    </div>
</body>
</html>
