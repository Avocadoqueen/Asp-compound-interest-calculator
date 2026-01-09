<%
' Database connection file
Dim conn, connStr
Set conn = Server.CreateObject("ADODB.Connection")
connStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & Server.MapPath("compoundly.accdb") & ";"
conn.Open connStr
%>
