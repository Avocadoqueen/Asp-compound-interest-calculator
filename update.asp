<!--#include file="conn.asp"-->
<%
' Get form data
Dim id, principal, rate, duration, duration_type, frequency
id = Request.Form("id")
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

' Recalculate compound interest
Dim final_amount, interest_earned
final_amount = principal * ((1 + (rate/100) / frequency) ^ (frequency * years))
interest_earned = final_amount - principal

' Update database
Dim sql
sql = "UPDATE Calculations SET principal = " & principal & ", rate = " & rate & ", duration = " & duration & ", " & _
      "duration_type = '" & duration_type & "', frequency = " & frequency & ", " & _
      "final_amount = " & final_amount & ", interest_earned = " & interest_earned & " WHERE id = " & id

conn.Execute sql
conn.Close
Set conn = Nothing

' Redirect to success page
Response.Redirect "update_success.asp"
%>
