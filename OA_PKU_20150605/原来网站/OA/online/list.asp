<!--#include file="conn.asp"-->

<HTML><HEAD><TITLE>Untitled Document</TITLE>
<meta HTTP-EQUIV=REFRESH CONTENT=60;URL=list.asp>
<META content="text/html; charset=gb2312" http-equiv=Content-Type><LINK 
href="oa.css" rel=stylesheet>

<SCRIPT language=javascript>
  function OpenSmallWindows(strURL)
  {
     window.open (strURL,"_blank",
     "status=no,resizable=0,toolbar=no,menubar=no,scrollbars=no,width=300,height=160,left=200,top=150");
  }
</SCRIPT>
<%   nowtime=now()
    shijian=cstr(year(nowtime))+right("0"+cstr(month(nowtime)),2)+right("0"+cstr(day(nowtime)),2)+right("0"+cstr(hour(nowtime)),2)+right("0"+cstr(minute(nowtime)),2)
session("Uid")=request.cookies("oabusyusername")    
    Set rs= Server.CreateObject("ADODB.Recordset") 
    strSql="select * from userinfo where id="&Session("Uid")
    rs.open strSql,Conn,3,3 
        rs("Utime")=shijian
        rs.update
        rs.close
        set rs=nothing
    Conn.execute"update user set state=false where Utime<'"&shijian&"'-3"
    Conn.execute"update user set state=true where Utime>'"&shijian&"'-2"

strSql="select * from userinfo where state="&true&" and rule=true ORDER  BY name, id DESC"
set my_rs=server.createobject("adodb.recordset")
my_rs.open strsql,conn,1,1
%>
<META content="Microsoft FrontPage 5.0" name=GENERATOR></HEAD>
<BODY bgColor=#276db2 leftMargin=0 topMargin=5 marginheight="0" marginwidth="0">
<TABLE align=center border=0 cellPadding=0 cellSpacing=0 width=100>
  <TBODY>
  <TR align=middle>
    <TD><FONT color=#ffffff>在线人员列表</FONT></TD></TR>
  <TR align=middle>
    <TD height=5></TD></TR>
  <TR align=middle>
    <FORM action="" method=post name=form1>
    <TD><SELECT multiple name=list 
      ondblclick=Javascript:OpenSmallWindows(this.form.list.options[this.form.list.selectedIndex].value) 
      size=25 style="BACKGROUND-COLOR: #f9f9f9; FONT-SIZE: 9pt; WIDTH: 100px">
        <OPTION>----在线<%=my_rs.recordcount%>人----</OPTION> 
        <%do while not my_rs.eof%>
        <OPTION 
        value="show.asp?receiveuser=<%=my_rs("name")%>&id=<%=my_rs("id")%>"><%=my_rs("name")%></OPTION> 
         <%my_rs.movenext
         loop%>
          <%
          'strSql="select * from userinfo where state=false and rule=true ORDER  BY name, id DESC"
           strSql="select * from userinfo where state=false and rule=true and iPageSize=10 ORDER  BY name, id DESC"
          set my_rs=server.createobject("adodb.recordset")
          my_rs.open strsql,conn,1,1
          %>

        <OPTION>----离线<%=my_rs.recordcount%>人----</OPTION> 
          <%do while not my_rs.eof%>
         
           <OPTION 
        value="show.asp?receiveuser=<%=my_rs("name")%>&id=<%=my_rs("id")%>"><%=my_rs("name")%></OPTION> 
        <%my_rs.movenext
         loop
         my_rs.close
         set my_rs=nothing
         
          %>

                       </SELECT> 
    </TD></FORM></TR></TBODY></TABLE>
</BODY></HTML>
