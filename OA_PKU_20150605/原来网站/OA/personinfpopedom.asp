<%@ LANGUAGE = VBScript %>
<!--#include file="asp/sqlstr.asp"-->

<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<%
'-----------------------------------------
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if

'--------------------------------------
if request("submit")="应用" then
allow_edit_person_personinf=request("allow_edit_person_personinf")
if allow_edit_person_personinf="" then allow_edit_person_personinf="no"

allow_see_all_personinf=request("allow_see_all_personinf")
if allow_see_all_personinf="" then allow_see_all_personinf="no"

allow_see_dept_personinf=request("allow_see_dept_personinf")
if allow_see_dept_personinf="" then allow_see_dept_personinf="no"

set conn=opendb("oabusy","conn","accessdsn")
sql="update userinf set "
sql=sql & "allow_edit_person_personinf=" & sqlstr(allow_edit_person_personinf) & ","
sql=sql & "allow_see_dept_personinf=" & sqlstr(allow_see_dept_personinf) & ","
sql=sql & "allow_see_all_personinf=" & sqlstr(allow_see_all_personinf) & " where id=" & request("id")
conn.Execute sql

end if
%>
<%
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where username='" & oabusyusername&"'"
rs.open sql,conn,1
cook_allow_control_all_user=rs("allow_control_all_user")     
conn.close
set conn=nothing
set rs=nothing
if cook_allow_control_all_user="no" then
response.write("<font color=red size=""+1"">对不起，您没有这个权限！</font>")
	response.end
	end if
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<title>oa办公系统</title>
<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
-->
</style>
</head>
<body  topmargin="0" leftmargin="0">

<center>
  <table width="583"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="21"><div align="center">
          <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="2" height="25"><span class="style2"><img src="images/main/l3.gif" width="2" height="25"></span></td>
              <td background="images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="21"><div align="center"><span class="style2"><img src="images/main/icon.gif" width="15" height="12"></span></div></td>
                    <td class="style7">用户设置</td>
                  </tr>
              </table></td>
              <td width="1"><span class="style2"><img src="images/main/r3.gif" width="1" height="25"></span></td>
            </tr>
          </table>
          <font color="0D79B3"></font></div></td>
    </tr>
  </table>
  <br>
  <table>
<tr>
<td>基本档案权限设置&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%
'打开数据库，读出部门
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select DISTINCT userdept from userinf"
rs.open sql,conn,1
%>
<form method="post" action="personinfpopedom.asp">
<td>
<select size=1 name="userdept">
<%
if not rs.eof and not rs.bof then userdept=rs("userdept")
if request("userdept")<>"" then userdept=request("userdept")
while not rs.eof and not rs.bof
%>
<option value="<%=rs("userdept")%>"<%=selected(userdept,rs("userdept"))%>><%=rs("userdept")%></option>
<%
rs.movenext
wend
%>
</select><input type="submit" value="查看">
</td>
</form>
</tr>
</table>
  <br>
</center>


<center>
<table border="1"  cellspacing="0" cellpadding="0" width="95%" bgcolor="#FFFFFF" bordercolorlight="#B0C8EA" bordercolordark="#FFFFFF">
<tr bgcolor="D7E8F8"><td height=25 align=center>姓名</td>
<td align=center>部门</td>
<td align=center>职位</td>
<td align=center>可编辑本人档案</td>
<td align=center>可看所有员工档案</td>
<td align=center>可看本部门档案</td>
<td>&nbsp;</td>
</tr>
<%
'显示用户表
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select * from userinf where userdept=" & sqlstr(userdept)
rs.open sql,conn,1
while not rs.eof and not rs.bof
%>
<form method="post" action="personinfpopedom.asp">
<tr>
<td align=center><%=rs("name")%></td><td align=center><%=rs("userdept")%></td><td align=center><%=rs("userlevel")%></td>
<td align=center><input type="checkbox" name="allow_edit_person_personinf" value="yes"<%=checked(rs("allow_edit_person_personinf"),"yes")%>></td>
<td align=center><input type="checkbox" name="allow_see_all_personinf" value="yes"<%=checked(rs("allow_see_all_personinf"),"yes")%>></td>
<td align=center><input type="checkbox" name="allow_see_dept_personinf" value="yes"<%=checked(rs("allow_see_dept_personinf"),"yes")%>></td>
<td align=center><input type="submit" name="submit" value="应用"></td>
</tr>
<input type="hidden" name="id" value=<%=rs("id")%>>
<input type="hidden" name="userdept" value=<%=userdept%>>
</form>
<%
rs.movenext
wend
%>
</table>
</center>
<br>
<%

%>

</body>
</html>