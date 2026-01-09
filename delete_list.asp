<!--#include file="conn.asp"-->
<%
Dim id
id = Request.QueryString("id")

If id <> "" Then
    ' Delete the record
    Dim sql
    sql = "DELETE FROM Calculations WHERE id = " & id
    conn.Execute sql
End If

conn.Close
Set conn = Nothing

' Redirect back to index
Response.Redirect "index.asp"
%>
