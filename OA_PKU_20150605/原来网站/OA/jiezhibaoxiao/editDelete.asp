<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>删除借支单</title>
<%
id=request("id")
set conn=opendb("finance","conn","sql")
set rs=server.CreateObject("adodb.recordset")
sql="select * from borrowlist where id="&request("id")
rs.open sql,conn,1,3
if not rs.eof then
rs.delete
rs.update
rs.movenext
response.Write("<div align=center> 删除成功</div>")
end if
if rs.eof and rs.bof then
response.Write("<div align=center> 删除失败，请联系管理员</div>")
end if
%>
</head>
<body>
<div align="center">
<form action="mainborrow.asp" method="post">
<input type="submit" value="关闭" />
</form>
</div>
</body>
</html>
