<%@ Language=VBScript %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculation Results</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Calculation Results</h1>
        
        <%
        ' Get form values
        Dim principal, rate, time, timeUnit, compound
        principal = CDbl(Request.Form("principal"))
        rate = CDbl(Request.Form("rate"))
        time = CDbl(Request.Form("time"))
        timeUnit = Request.Form("timeUnit")
        compound = CInt(Request.Form("compound"))
        
        ' Convert months to years if needed
        Dim timeInYears
        If timeUnit = "months" Then
            timeInYears = time / 12
        Else
            timeInYears = time
        End If
        
        ' Calculate compound interest
        ' Formula: A = P(1 + r/n)^(nt)
        ' A = Final amount
        ' P = Principal
        ' r = Annual interest rate (as decimal)
        ' n = Compound frequency
        ' t = Time in years
        
        Dim rateDecimal, amount, interest
        rateDecimal = rate / 100
        amount = principal * ((1 + (rateDecimal / compound)) ^ (compound * timeInYears))
        interest = amount - principal
        
        ' Display results
        Response.Write "<div class='result-box'>"
        Response.Write "<h3>Calculation Details</h3>"
        Response.Write "<div class='result-item'>"
        Response.Write "<span class='result-label'>Principal Amount:</span>"
        Response.Write "<span class='result-value'>$" & FormatNumber(principal, 2) & "</span>"
        Response.Write "</div>"
        Response.Write "<div class='result-item'>"
        Response.Write "<span class='result-label'>Interest Rate:</span>"
        Response.Write "<span class='result-value'>" & rate & "%</span>"
        Response.Write "</div>"
        Response.Write "<div class='result-item'>"
        Response.Write "<span class='result-label'>Duration:</span>"
        Response.Write "<span class='result-value'>" & time & " " & timeUnit & "</span>"
        Response.Write "</div>"
        Response.Write "<div class='result-item'>"
        Response.Write "<span class='result-label'>Compound Frequency:</span>"
        
        Dim compoundText
        Select Case compound
            Case 1: compoundText = "Annually"
            Case 2: compoundText = "Semi-Annually"
            Case 4: compoundText = "Quarterly"
            Case 12: compoundText = "Monthly"
        End Select
        
        Response.Write "<span class='result-value'>" & compoundText & "</span>"
        Response.Write "</div>"
        Response.Write "<div class='result-item'>"
        Response.Write "<span class='result-label'>Interest Earned:</span>"
        Response.Write "<span class='result-value' style='font-size: 1.2em; color: #28a745;'>$" & FormatNumber(interest, 2) & "</span>"
        Response.Write "</div>"
        Response.Write "<div class='result-item'>"
        Response.Write "<span class='result-label'>Final Amount:</span>"
        Response.Write "<span class='result-value' style='font-size: 1.3em;'>$" & FormatNumber(amount, 2) & "</span>"
        Response.Write "</div>"
        Response.Write "</div>"
        
        ' Save to database
        Dim conn, connString, sql
        connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("calculations.mdb")
        
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open connString
        
        sql = "INSERT INTO Calculations (Principal, InterestRate, Duration, TimeUnit, CompoundFrequency, InterestEarned, FinalAmount, CalculationDate) " & _
              "VALUES (" & principal & ", " & rate & ", " & time & ", '" & timeUnit & "', " & compound & ", " & interest & ", " & amount & ", #" & Now() & "#)"
        
        conn.Execute sql
        conn.Close
        Set conn = Nothing
        
        Response.Write "<p style='text-align: center; color: #28a745; margin-top: 20px;'>✓ Calculation saved successfully!</p>"
        %>
        
        <div style="text-align: center; margin-top: 30px;">
            <a href="index.html" class="btn btn-primary" style="width: auto; margin-right: 10px;">New Calculation</a>
            <a href="history.asp" class="btn btn-secondary">View History</a>
        </div>
    </div>
</body>
</html>
