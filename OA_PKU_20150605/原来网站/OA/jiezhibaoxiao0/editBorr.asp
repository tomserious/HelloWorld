<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!--#include file="opendb.asp"-->
<title>查看页面</title>
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
Id=request("id")
'response.Write(Id)
%>
<style type="text/css">
<!--
.style2 {color: #0d79b3;
	font-weight: bold;
}
.style7 {color: #2d4865}
.style8 {color: #2b486a}
-->
</style>

</head>
<script language="javascript">
function editChange()
{
    
	window.open('editChange.asp?borrowTime='+ document.form.borrowTime.value+"&money="+document.form.money.value+"&content="+document.form.content.value+"&id="+document.form.Id.value+"&repayTime="+document.form.repayTime.value+"&finance="+document.form.finance.value,"_self");
}
</script>

<script language="javascript">
function editdelete()
{
    
	window.open('editDelete.asp?id='+ document.form.Id.value,"_self");
}
</script>
<script language="javascript">
function editSubmit()
{
    
	window.open('editSubmit.asp?borrowTime='+ document.form.borrowTime.value+"&money="+document.form.money.value+"&content="+document.form.content.value+"&id="+document.form.Id.value+"&repayTime="+document.form.repayTime.value+"&finance="+document.form.finance.value,"_self");
}
</script>
<script language="javascript">
function editAgree()
{
    
	window.open('editAgree.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
}
</script>
<script language="javascript">
function editNotAgree()
{
    
	window.open('editNotAgree.asp?id='+ document.form.Id.value+"&notes="+document.form.notes.value,"_self");
}
</script>
<script language="javascript">
function SignatureBorr()
{
    
	window.open('SignatureBorr.asp?id='+ document.form.Id.value,"_self");
}
function UnPayBorr()
{
    
	window.open('UnPayBorr.asp?id='+ document.form.Id.value,"_self");
}
function ClearBorr()
{
    
	window.open('ClearBorr.asp?id='+ document.form.Id.value,"_self");
}
</script>
<body>
<font size="-1">
<div align="center">
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="../images/main/l3.gif" width="2" height="25"></span></td>
            <td background="../images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="../images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td align="left"class="style7"><font size="-1">借支模块</font></td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="../images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<%
'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
if oabusyuserlevelCode="ZSYG" then 
stage1=0
sql= "select * from borrowlist_old where id= "&ID
end if
if oabusyuserlevelCode="BMJL" then 
stage1=1
sql= "select * from borrowlist_old where id= "&ID
end if
if oabusyuserlevelCode="CW" then 
stage1=2
sql= "select * from borrowlist_old where id= "&ID
end if
if oabusyuserlevelCode="DSZ" then 
stage1=3
sql= "select * from borrowlist_old where id= "&ID
end if
if oabusyuserlevelCode="CWZG" then 
stage1=2
sql= "select * from borrowlist_old where id= "&ID
end if
if oabusyuserlevelCode="CN" then 
stage1=2
sql= "select * from borrowlist_old where id= "&ID
end if
rs.open sql,conn,1,1
if not rs.eof then
%>
<form name="form" >

<table border="1"  cellpadding="0" cellspacing="0" bgcolor="D7E8F8">
<%
'set conn2=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("../db/lmtof.mdb")
'conn2.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
set conn2=opendb("lmtof","conn","sql")
set rs2=server.createobject("adodb.recordset")
 sql2= "select * from userinf where userdept="&"'"&rs("dept")&"'"&"and  (levelCode='BMJL' or levelCode1='BMJL')"
rs2.open sql2,conn2,1,1
if not rs2.eof then
%>
<input type="hidden" name="Id" value="<%response.Write(request("id"))%>"> <tr  bgcolor="D7E8F8" ><td>申请人</td><td><input type="hidden" name="borrower" value="<%=rs("borrower")%>"><%response.Write(rs("borrower"))%></td><td>部门</td><td>
<input type="hidden" name="userdept" value="<%=rs2("userdept")%>" /><% response.Write(rs2("userdept")) %>
<%
end if
%></td>
<td colspan="3">部门负责人</td>
<td>
<input type="hidden" name="leader" value="<%=rs2("username")%>" />
<%response.Write(rs2("username"))%>
</td>

</tr>
<tr  bgcolor="D7E8F8" >
<td colspan="2">借款日期</td><td colspan="2"><input type="hidden" name="borrowTime" value="<%response.Write(formatdatetime(rs("borrowTime"), 1))%>" /><%response.Write(formatdatetime(rs("borrowTime"), 1)) %></td>
<td colspan="2">还款日期</td><td colspan="2"><input type="hidden" name="repayTime" value="<%response.Write(formatdatetime(rs("repayTime"), 1))%>" /><%response.Write(formatdatetime(rs("repayTime"), 1)) %></td>
</tr>
<tr  bgcolor="D7E8F8" >
<td>金额(元)</td><td colspan="4" align="center"><% if rs("borrower")=oabusyusername then %><input type="text" name="money" value="<%=rs("money")%>" />元<%else response.Write(rs("money")) end if%></td>
<td>财务人员</td>
<td colspan="2">
<input type="hidden" name="finance" value="<%=rs("finance")%>" />
<% response.Write(rs("finance"))%></td></tr>
<tr  bgcolor="D7E8F8" >
<td>事由</td><td colspan="7" align="center" ><% if rs("borrower")=oabusyusername then %><textarea name="content" cols="60" rows="2"/>
<%=rs("content")%></textarea><%else response.Write("&nbsp;&nbsp;"&rs("content")) end if%></td>
</tr>
<%
dim flag
flag=2
	if oabusyuserlevelCode="ZSYG" then 
		flag=1
	end if
	if oabusyuserlevelCode="BMJL"   then 
		if rs("stage")<>1 then
		flag=1
		end if
	end if
	if oabusyuserlevelCode="DSZ" and oabusyuserlevelCode1="BMJL" then 
		 if  rs("stage")>1 and rs("stage")<>4 then
		 flag=1 
		 end if
	end if
	if oabusyuserlevelCode="CWZG" then
		if (rs("stage")<>1 and rs("stage")<3) or rs("stage")>3 then
		flag=1
		end if
	end if
	if oabusyuserlevelCode="CN" then
		flag=1
	end if
%>
<% if flag=2 then %>
<tr>
<%' if (oabusyuserlevelCode="BMJL" or oabusyuserlevelCode1="BMJL") and rs("stage")=1 then %>
<td>批注</td><td colspan="7"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%end if%>
<!--<tr>
<% 'if rs("borrower")<>oabusyusername and oabusyuserlevelCode="CWZG" and rs("stage")<>6 and rs("stage")<>7 and rs("stage")>0 then %>
<td>批注</td><td colspan="7"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%'end if%>
<tr>
<%' if (oabusyuserlevelCode="DSZ" or oabusyuserlevelCode1="BMJL") and rs("stage")=4 then %>
<td>批注</td><td colspan="7"><textarea cols="60" maxize=80 name="notes"></textarea></td>
</tr>
<%'end if%>
<tr>-->
<% if rs("stage")=9 or rs("stage")=7 or rs("stage")=8 then%>
<td>部门批注</td><td colspan="7"><%=rs("deptNotes")&"&nbsp;"%></td>
</tr>
<tr>
<td>财务批注</td><td colspan="7"><%=rs("financialNotes")&"&nbsp;"%></td>
</tr>
<tr>
<td>名誉董事长批注</td><td colspan="7"><%=rs("gManagerNotes")&"&nbsp;"%></td>
</tr>
<% end if%>
<tr >
<td colspan="9">
<div align="center">
<input type="button" value="返回" onclick="javascript:window.history.back();" />
<% if rs("borrower")=oabusyusername  and (rs("stage")=0 or rs("stage")=10)  then %>
<input type="button" value="修改" onclick="editChange()" />
<input type="button" value="提交" onclick="editSubmit()" />
<input type="button" value="删除" onclick="editdelete()" />
<% end if%>
<%
%>
<%' if (rs("borrower")<>oabusyusername and (rs("stage")<5 or rs("stage")>10) and rs("stage")>0) or (rs("borrower")=oabusyusername and oabusyusername=rs2("username") and rs("stage")>0 and rs("stage")<>10) then %>
<% if flag=2 then %>
<input  type="button" value="同意" onclick="editAgree()"  />
<input type="button" value="不同意" onclick="editNotAgree()" />
<%end if%>
<%if rs("stage")=7  then %><input type="button" value="已领款" onclick="SignatureBorr()" /><%end if%>
<%if rs("stage")=7  then %><input type="button" value="未付款" onclick="UnPayBorr()" /><%end if%>

 <!--<br /><br /><br /><br />
<input type="button" value="删除" onclick="editdelete()" />-->
</div>
</td>
</tr>
<%
rs.movenext
end if
%>
</table>
</form>
<%
set rs2=nothing
set conn2=nothing
%>
</div>
</font>
</body>
</html>
