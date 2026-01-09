<%@ Language=VBScript %>
<%
' Get the ID to delete
Dim id
id = Request.QueryString("id")

' Connect to database
Dim conn, connString, sql
connString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("calculations.mdb")

Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connString

' Delete the record
sql = "DELETE FROM Calculations WHERE ID = " & id
conn.Execute sql

conn.Close
Set conn = Nothing

' Redirect back to history page
Response.Redirect "history.asp"
%>
