<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!--#include file="opendb.asp"-->
<%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
Code=request.cookies("oabusyuserlevelCode")
oabusyuserlevelCode1=request.cookies("oabusyuserlevelCode1")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='mainReim.asp';")
	response.write("</script>")
	response.end
end if
if code<>"CWZG" and oabusyuserlevelCode1<>"CWZG" then 
'if 1=2 then
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='mainReim.asp';")
	response.write("</script>")
	response.end
end if
id=request("id")
dstatus="同意帐号修改"
success="flase"
		  set conn=opendb("finance","conn","sql")
          set rs=server.CreateObject("adodb.recordset")
          sql="select * from reimlisttable where id="&id
          rs.open sql,conn,1,3
		  rs("haveverify")=rs("haveverify")&rs("nowverify")&"--"
		  willverifytemp=rs("willverify")
		  mystr=split(willverifytemp,"--")
		  nowverify=mystr(0)
		  oldnowverify=rs("nowverify")
		  rs("nowverify")=nowverify
		  numf=len(willverifytemp)-(len(mystr(0))+2)
		  if numf > 0 then
		  willverify=right(willverifytemp,len(willverifytemp)-(len(mystr(0))+2))
		  end if
		  if numf <= 0 then
		  willverify=""
		  end if
		  rs("willverify")=willverify
		  getstage=split(mystr(0),":")
		  stage=getstage(0)
		  rs("stage")=stage
		  rs("notes")=rs("notes")&oldnowverify&":"&dstatus&notes&"####" 
		  rs.update
		  rs.movenext
		  set rs=nothing
		  set conn=nothing
		  success="true"
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>财务页面</title>
</head>
<%
if success="true" then 
response.write("<script language=""javascript"">")
response.write("alert(""帐号调整审批"");")
response.write("window.location.href='mainReim.asp';")
response.write("</script>")
else
response.write("<script language=""javascript"">")
response.write("alert(""帐号调整审批未成功，请联系管理员"");")
response.write("window.location.href='mainReim.asp';")
response.write("</script>")
end if
%>
<body>
</body>
</html>
