<%@ LANGUAGE = VBScript %>
<!--#include file="asp/sqlstr.asp"-->

<!--#include file="asp/opendb.asp"-->
<!--#include file="asp/checked.asp"-->
<!--#include file="asp/keepformat.asp"-->
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
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="css/css.css">
<script language="javascript1.2" src="js/openwin.js"></script>
<SCRIPT language=javascript>
<!--
if (window.Event) 
　document.captureEvents(Event.MOUSEUP); 
 
function nocontextmenu() {
 event.cancelBubble = true
 event.returnvalue = false;
 return false;
}
 
function norightclick(e) {
 if (window.Event) {
　if (e.which == 2 || e.which == 3)
　 return false;
 } else if (event.button == 2 || event.button == 3) {
　 event.cancelBubble = true
　 event.returnvalue = false;
　 return false;
 } 
}
 
document.oncontextmenu = nocontextmenu;　// for IE5+
document.onmousedown = norightclick;　　 // for all others
//-->
</SCRIPT>
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

<table width="583"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="21"><div align="center">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="2" height="25"><span class="style2"><img src="images/main/l3.gif" width="2" height="25"></span></td>
            <td background="images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="21"><div align="center"><span class="style2"><img src="images/main/icon.gif" width="15" height="12"></span></div></td>
                  <td class="style7">员工管理</td>
                </tr>
            </table></td>
            <td width="1"><span class="style2"><img src="images/main/r3.gif" width="1" height="25"></span></td>
          </tr>
        </table>
        <font color="0D79B3"></font></div></td>
  </tr>
</table>
<%
'打开数据库读出用户名
set conn=opendb("oabusy","conn","accessdsn")
set rs=server.createobject("adodb.recordset")
sql="select name from userinf where username=" & sqlstr(request("username"))
rs.open sql,conn,1
name=rs("name")
%>
<center>
<table>
<tr>
      <td> 增加<%=name%>的考核档案&nbsp;&nbsp; </td>
<form method="post" action="checkinf.asp" name="form2"><td>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<input type="submit" value="返回">
</td>
</form>
</tr>
</table>
</center>

<%
if request("submit")="增加" then
username=request("username")
checkname=request("checkname")
checkdate=request("checkdate")
checkcommment=request("checkcommment")
checksort=request("checksort")
checktype=request("checktype")
checkresult=request("checkresult")
remark=request("remark")
recname=oabusyname
updatename=oabusyname
set conn=opendb("oabusy","conn","accessdsn")
sql = "Insert Into checkinf (username,checkname,checkdate,checkcommment,checksort,checktype,checkresult,remark,recname,updatename) Values( "
sql = sql & SqlStr(username) & ", "
sql = sql & SqlStr(checkname) & ", "
sql = sql & SqlStr(checkdate) & ", "
sql = sql & SqlStr(checkcommment) & ", "
sql = sql & SqlStr(checksort) & ", "
sql = sql & SqlStr(checktype) & ", "
sql = sql & SqlStr(checkresult) & ", "
sql = sql & SqlStr(remark) & ", "
sql = sql & SqlStr(recname) & ", "
sql = sql & SqlStr(updatename) & ")"
conn.Execute sql
%>
<br><br>
<center><font color=red >成功增加员工考核信息！</font></center>
<%
else
%>


<script Language="JavaScript">

 function form_check(){
   var l1=document.form1.checkname.value;
   if(l1==""){window.alert("考核名称必须填写！");document.form1.checkname.focus();return (false);}

   var l2=document.form1.checkdate.value;
   if(l2==""){window.alert("考核时间必须填写！");document.form1.checkdate.focus();return (false);}
                    }



</script>




<br>
<center>
<form method="post" action="addcheckinf.asp" name="form1" onsubmit="return form_check();">
    <table border="0" cellpadding="4" cellspacing="0" width="540">
      <tr> 
        <td height="25" width="15%" style="border-left: 2 solid #B0C8EA; border-top: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA" align="center">员工姓名</td>
        <td colspan="3" width="85%" style="border-left: 1 solid #B0C8EA; border-right: 2 solid #B0C8EA; border-top: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA"><%=name%> 
        </td>
      </tr>
      <tr> 
        <td width="15%" style="border-left: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA" align="center">考核名称</td>
        <td width="35%" style="border-left: 1 solid #B0C8EA; border-bottom: 1 solid #B0C8EA"> 
          <input type="text" name="checkname" size=10>
          <font color=red>*</font> </td>
        <td width="15%" style="border-left: 1 solid #B0C8EA; border-bottom: 1 solid #B0C8EA" align="center">考核时间</td>
        <td width="35%" style="border-left: 1 solid #B0C8EA; border-right: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA"> 
          <input type="text" name="checkdate" size=10>
          <font color=red>*</font> </td>
      </tr>
      <tr> 
        <td style="border-left: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA" width="15%" align="center">考核类型</td>
        <td style="border-left: 1 solid #B0C8EA; border-bottom: 1 solid #B0C8EA"> 
          <input type="text" name="checksort" size=10>
        </td>
        <td style="border-left: 1 solid #B0C8EA; border-bottom: 1 solid #B0C8EA" width="15%" align="center">考核方式</td>
        <td style="border-left: 1 solid #B0C8EA; border-right: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA"> 
          <input type="text" name="checktype" size=10>
        </td>
      </tr>
      <tr> 
        <td style="border-left: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA" width="15%" align="center">考核评语</td>
        <td width="85%" colspan="3" style="border-left: 1 solid #B0C8EA; border-right: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA"> 
          <textarea rows="3" name="checkcommment" cols="46"></textarea>
        </td>
      </tr>
      </tr>
      <td style="border-left: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA" width="15%" align="center">考核结果</td>
      <td width="85%" colspan="3" style="border-left: 1 solid #B0C8EA; border-right: 2 solid #B0C8EA; border-bottom: 1 solid #B0C8EA"> 
        <textarea rows="3" name="checkresult" cols="46"></textarea>
      </td>
      </tr>
      <tr> 
        <td width="15%" style="border-left: 2 solid #B0C8EA; border-bottom: 2 solid #B0C8EA" align="center">备注说明</td>
        <td colspan="3" width="85%" style="border-left: 1 solid #B0C8EA; border-right: 2 solid #B0C8EA; border-bottom: 2 solid #B0C8EA"> 
          <textarea rows="3" name="remark" cols="46"></textarea>
        </td>
      </tr>
    </table>
<br>
<input type="hidden" name="userdept" value="<%=request("userdept")%>">
<input type="hidden" name="username" value="<%=request("username")%>">
<font color=red>*</font>为必填项&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="submit" value="增加">
</form>
</center>
<%
end if
%>


</body>
</html>










