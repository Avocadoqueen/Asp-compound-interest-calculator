<!--#include file="conn.asp"-->
<%
' Get form data
Dim principal, rate, duration, duration_type, frequency
principal = CDbl(Request.Form("principal"))
rate = CDbl(Request.Form("rate"))
duration = CInt(Request.Form("duration"))
duration_type = Request.Form("duration_type")
frequency = CInt(Request.Form("frequency"))

' Convert duration to years if in months
Dim years
If duration_type = "months" Then
    years = duration / 12
Else
    years = duration
End If

' Calculate compound interest
' Formula: A = P(1 + r/n)^(nt)
Dim final_amount, interest_earned
final_amount = principal * ((1 + (rate/100) / frequency) ^ (frequency * years))
interest_earned = final_amount - principal

' Save to database
Dim sql
sql = "INSERT INTO Calculations (principal, rate, duration, duration_type, frequency, final_amount, interest_earned, calculation_date) " & _
      "VALUES (" & principal & ", " & rate & ", " & duration & ", '" & duration_type & "', " & frequency & ", " & final_amount & ", " & interest_earned & ", #" & Now() & "#)"

conn.Execute sql
conn.Close
Set conn = Nothing

' Redirect to index
Response.Redirect "index.asp"
%>
