<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"--><head>
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
%>
<%

code=request.cookies("oabusyuserlevelCode")
code1=request.cookies("oabusyuserlevelCode1")
projectid=request.QueryString("projectid")%>
  <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from accProj where projectid='"&projectid&"'"
	rs.open sql,conn,1,1
		id=rs("id")
		pcycle=rs("pcycle")
		summoney=rs("summoney")
		initProUnit=rs("initProUnit")
		proforDept=rs("proforDept")
		attendeeDept=rs("attendeeDept")
		proLeader=rs("proLeader")
		certificateNo=rs("certificateNo")
		accrul=rs("accrul")
		taxes=rs("taxes")
		groundFee=rs("groundFee")
		collaborCosts=rs("collaborCosts")
		timewrite=rs("timewrite")
		stage=rs("stage")
	set rs=nothing
	set conn=nothing
	
	set conn=opendb("GFProjectType","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select projectName from projectType_old where projectId='"&projectid&"'"
	rs.open sql,conn,1,1
	if not rs.eof and not rs.bof then
	projectname=rs("projectName")
	rs.movenext
	end if
	set rs=nothing
	set conn=nothing
		flag=0
	if (code="BMJL" and (stage=1 or stage=0)) or  (code="CWZG" and (stage=2 or stage=1 or stage=0)) OR (code="DSZ" and (stage=3 or (stage=1 or stage=0))) then
		flag=1
	end if
	delflag=0
	if (stage=5 or stage=7) and proLeader=oabusyname then
	delflag=1
	end if
  %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>编辑审核预算表</title>
</head>

<body>
<div align="center">
<form name="xx" action="agrornot.asp" method="post">
<font color="#0d79b3" size="-1">
<table border="1" cellspacing="0" cellpadding="0" bgcolor="D7E8F8" bordercolor="#339999">
  <tr>
    <td>项目名称</td><td><%=projectname%></td>
    <td>项目编号</td><td><%=projectid%></td>
    <td>项目周期</td><td><%=pcycle%></td>
    <td>总金额</td><td><%=summoney%></td>
   </tr>
    <td>立项单位</td><td><%=initProUnit%></td>
    <td>承担部门</td><td><%=proforDept%></td>
    <td>参加部门</td><td><%=attendeeDept%></td>
    <td>项目经理</td><td><%=proLeader%></td>
  </tr>
    <td>税金/管理</td><td><%=taxes%></td>
    <td>管理服务费</td><td><%=accrul%></td>
    <td>发展基金</td><td><%=groundFee%></td>
    <td>协作费</td><td><%=collaborCosts%></td>
  </tr>
  <tr>
	<td colspan="2">凭证号</td><td colspan="6"><%=certificateNo%></td>
  </tr>
  <tr >
    <td colspan="8" >
		<TABLE id="table1" cellspacing="0" cellpadding="0" border=1 width="100%" bgcolor="D7E8F8" bordercolor="#339999">
  <tr>
			<td>科目</td>
    		<td>详细科目</td>
    		<td>金额</td>
  </tr>
   <%
	set conn=opendb("symx","conn","accessdsn")
	set rs=server.createobject("adodb.recordset")
	sql="select * from submoney where projectid='"&projectid&"'"
	rs.open sql,conn,1,1
	do while not rs.eof and not rs.bof 
%>
  <TR>
   <TD><%=rs("msub")%></TD><TD><%=rs("sub")%></TD><TD><%=rs("money")%></TD>
  </TR>
<%
	rs.movenext
	loop
	set rs=nothing
	set conn=nothing
  %>
 
</TABLE> 
	</td>
  </tr>
  <%
  if flag=1 then
   %>
  <tr height="18">
    <td>您的审批意见</td>
    <td colspan="13"><textarea cols="150" rows="4" name="note"></textarea></td>
  </tr>
  <%end if%>
  </font>
</table>
 <%
  if flag=1 then
   %>
<input type="hidden" name="projectid" value="<%=projectid%>" />
<input type="submit" name="submit" value="审核完毕" /><input type="submit" name="submit" value="不通过审核" />
</form>
 <%end if%>  
 <%
  if delflag=1 then
   %>
<input type="hidden" name="id" value="<%=d%>" />
<input type="submit" name="submit" value="删除" />
</form>
 <%end if%> 
 <%
 if (code="CN" and stage=4) then
 %>
 <A href=signfive.asp?kt=ok&id=<%=projectid%>>存储为决算表</A>
 <%
 end if
 %>
</div>
</body>
</html>
