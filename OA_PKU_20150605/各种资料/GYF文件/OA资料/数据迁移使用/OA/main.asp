<%@ LANGUAGE = VBScript %>

<%
set file=server.createobject("scripting.FileSystemObject")
addr1=server.mappath("top1.asp")
addr2=server.mappath("top1.asp")
If Not file.FileExists(addr1) or Not file.FileExists(addr2) Then
response.write "<script LANGUAGE='javascript'>alert('系统发生严重错误即将关闭！！！');window.close();</script>"
End If
%>

<html>
<head>
<title>欢迎进入OA智能办公自动化系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<!--#include file="jiezhibaoxiao/opendb.asp"-->
<link rel="stylesheet" href="inc/style.css" type="text/css">
</head>

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
<script>
function tick() {
var hours, minutes, seconds, ap;
var intHours, intMinutes, intSeconds;
var today;
today = new Date();
intHours = today.getHours();
intMinutes = today.getMinutes();
intSeconds = today.getSeconds();
if (intHours == 0) {
hours = "12:";
ap = "Midnight";
} else if (intHours < 12) { 
hours = intHours+":";
ap = "A.M.";
} else if (intHours == 12) {
hours = "12:";
ap = "Noon";
} else {
hours = intHours + ":";
ap = "P.M.";
}
if (intMinutes < 10) {
minutes = "0"+intMinutes+":";
} else {
minutes = intMinutes+":";
}
if (intSeconds < 10) {
seconds = "0"+intSeconds+" ";
} else {
seconds = intSeconds+" ";
} 
timeString = hours+minutes+seconds+ap;
Clock.innerHTML = timeString;
window.setTimeout("tick();", 1000);
}
window.onload = tick;
</script>

<script language="javascript">
//单击"注销"连接时，弹出对话框是否要求退出系统
function closesystem()
{
	window.open('logout.asp?closeflag=1','closesystem','location=no,height=10, width=10, top=600, left=10,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
}

</script>
<SCRIPT LANGUAGE="JavaScript">
<!--

<!-- Hide
function killErrors() {
return true;
}
window.onerror = killErrors;
// -->
//-->
</SCRIPT>
<style type="text/css">
<!--
body {
	background-color: #335e91;
}
.style2 {color: #2d4865}
.style3 {color: #334d66}
.style4 {color: #2e4869}
-->
</style>
</head>
<body topmargin="0" leftmargin="0" onmouseover="self.status='欢迎进入OA智能办公自动化系统';return true">
<div align=center>
<table width="1003" height="741"  border="0" cellpadding="0" cellspacing="0">
                      <%
oabusyname=request.cookies("oabusyname")
oabusyusername=request.cookies("oabusyusername")
oabusyuserdept=request.cookies("oabusyuserdept")
oabusyuserlevel=request.cookies("oabusyuserlevel")
oabusyuserlevelCode=request.cookies("oabusyuserlevelCode")
if oabusyusername="" then 
	response.write("<script language=""javascript"">")
	response.write("window.top.location.href='default.asp';")
	response.write("</script>")
	response.end
end if
%>
  <tr>
    <td><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="14"><img src="images/main/l.gif" width="14" height="700"></td>
        <td valign="top" background="images/main/bg_m.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="96"><div align="center">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><img src="images/logo_fir.gif" width="312" height="96"></td>
                  <td>&nbsp;<font color=red size=3>借支报销模块测试中，发现问题请直接点击<a href="jiezhibaoxiao/question.asp" target="_blank"><font color="#0000FF" size="+1">发现问题</font></a>系统数据库升级，若发现无法正常使用，请联系赵师军(<a href="mailto:junshi1987@163.com">点击给赵师军发邮件</a> )</font></td>
                  <td><div align="right"><img src="images/to_r.gif" width="56" height="96"></div></td>
                </tr>
              </table>
              </div></td>
          </tr>
          <tr>
            <td height="28"><table width="951" height="28"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="A3B4C4">
              <tr>
                <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
                    <tr>
                      <td height="24" background="images/main/bg_t1.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="28%"><div align="center" class="style3">OA智能办公自动化系统</div></td>
                          <td width="33%"><span class="style3">欢迎您,<span style="font-size:11px"><%=oabusyname%></span></span></td>
                          <td width="39%">&nbsp;</td>
                        </tr>
                      </table></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="951" height="32"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="4B779C">
              <tr>
                <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="1"><img src="images/main/l1.gif" width="1" height="30"></td>
                    <td background="images/main/m1.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td><div align="center" class="style3"><a href="desk.asp" target="main_body"><font color="#334d66" >我的办公桌面(D)</font></a></div></td>
                        <td><div align="center" class="style3"><a href="dayrep.asp" target="main_body"><font color="#334d66" >我的个人计划(P)</font></a></div></td>
                        <td><div align="center" class="style3"><a href="personlist.asp" target="main_body"><font color="#334d66" >我的通讯录(A)</font></a></div></td>
                        <td><div align="center" class="style3"><a href="online/onlineuser.asp" target="main_body"><font color="#334d66" >在线员工(O)</font></a></div></td>
                        <td><div align="center" class="style3"><a href="javascript:history.back(-1)"><font color="#334d66" >返回(B)</font></a></div></td>
                        <td><div align="center" class="style3"><a href="" onClick="history.go(0)"><font color="#334d66" >刷新(R)</font></a></div></td>
                        <td><div align="center" class="style3"><a href="logout.asp?closeflag=1"><font color="#334d66" >安全退出(Q)</font></a></div></td>
                        <td>&nbsp;</td>
                      </tr>
                    </table></td>
                    <td width="1"><img src="images/main/r1.gif" width="1" height="30"></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="951" height="541"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="9EB4C9">
              <tr>
                <td valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="155" height="539" valign="top"><table width="100%" height="540"  border="0" cellpadding="0" cellspacing="1" bgcolor="4F769D">
                      <tr>
                        <td valign="top" bgcolor="#FFFFFF"><iframe name=main marginwidth=0 marginheight=0 src="leftbutton.asp" frameborder=0 scrolling="auto"  width=153 height=540></iframe></td>
                      </tr>
                    </table></td>
                    <td width="583" valign="top"><iframe name=main_body marginwidth=0 marginheight=0 src="desk.asp" frameborder=0 scrolling="auto"  width=583 height=542 ></iframe></td>
                    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="1" bgcolor="50769D"></td>
                        <td height="542" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="2" height="25"><img src="images/main/l3.gif" width="2" height="25"></td>
                                <td background="images/main/m3.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="21"><div align="center"><img src="images/main/icon.gif" width="15" height="12"></div></td>
                                    <td><span class="style2">常用信息</span></td>
                                  </tr>
                                </table></td>
                                <td width="1"><img src="images/main/r3.gif" width="1" height="25"></td>
                              </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="6"></td>
                          </tr>
                          <tr>
                            <td><div align="center">
                              <table width="200"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="567B98">
                                <tr>
                                  <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="1"><img src="images/main/l4.gif" width="1" height="21"></td>
                                          <td background="images/main/m4.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                              <td width="10">&nbsp;</td>
                                              <td><span class="style4">登陆信息</span></td>
                                            </tr>
                                          </table></td>
                                          <td width="1"><img src="images/main/r4.gif" width="1" height="21"></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td><table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                          <td height="10"></td>
                                        </tr>
                                        <tr>
                                          <td height="20"><span style="font-size:11px">用户：<%=oabusyname%> &nbsp;</span></td>
                                        </tr>
                                        <tr>
                                          <td height="20"><span style="font-size:11px">部门：<span style="font-size:11px"><%=oabusyuserdept%></span> </span></td>
                                        </tr>
                                        <tr>
                                          <td height="20"><span style="font-size:11px">职位：<%=oabusyuserlevel%> </span></td>
                                        </tr>
                                        <tr>
                                          <td height="20"><span style="font-size:11px">时间：
                                                <script language="JavaScript">
<!---
//取得日期和星期
   today=new Date();
   function initArray(){
	 this.length=initArray.arguments.length
	 for(var i=0;i<this.length;i++)
	 this[i+1]=initArray.arguments[i]  }
	 
  var d=new initArray("<font color=RED>星期日","<font color=black>星期一","<font color=black>星期二","<font color=black>星期三","<font color=black>星期四","<font color=black>星期五","<font color=GREEN>星期六"); 
document.write(today.getYear(),"年",today.getMonth()+1,"月",today.getDate(),"日",d[today.getDay()+1]);  
//-->
                                          </script>
                                          </span></td>
                                        </tr>
                                        <tr>
                                          <td><iframe name=fir1 marginwidth=0 marginheight=0 src="top0.asp" frameborder=0 scrolling="no"  width=100% height=5 allowTransparency="true"></iframe></td>
                                        </tr>
                                        <tr>
                                          <td><iframe name=fir2 marginwidth=0 marginheight=0 src="top1.asp" frameborder=0 scrolling="no"  width=100% height=5 allowTransparency="true"></iframe></td>
                                        </tr>
                                      </table></td>
                                    </tr>
                                  </table></td>
                                </tr>
                              </table>
                            </div></td>
                          </tr>
                          <tr>
                            <td height="8"></td>
                          </tr>
                          <tr>
                            <td><table width="200"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="567B98">
                              <tr>
                                <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="1"><img src="images/main/l4.gif" width="1" height="21"></td>
                                            <td background="images/main/m4.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td width="10">&nbsp;</td>
                                                  <td><span class="style4">办公常用信息</span></td>
                                                </tr>
                                            </table></td>
                                            <td width="1"><img src="images/main/r4.gif" width="1" height="21"></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td><table width="92%"  border="0" align="center" cellpadding="0" cellspacing="0">
                                          <tr>
                                            <td height="5" colspan="2"></td>
                                          </tr>
                                          <tr>
                                            <td width="50%" height="20"><div align="center"><a href="cy/link.asp" target="main_body">常用网址</a></div></td>
                                            <td height="20"><div align="center"><a href="cy/links.asp" target="main_body">网址管理</a></div></td>
                                          </tr>
                                          <tr>
                                            <td height="20"><div align="center"><a href="rl/cal.htm" target="main_body">万 年 历</a></div></td>
                                            <td height="20"><div align="center"><a href="ip/index.asp" target="main_body">手机及ip</a></div></td>
                                          </tr>
                                          <tr>
                                            <td height="20"><div align="center"><a href="youbian/index.asp" target="main_body">邮编区号</a></div></td>
                                            <td height="20"><div align="center"><a href="http://www.cma.gov.cn/netcenter_news/qxyb/city/index.php?city=&#21271;&#20140;&province=&#21271;&#20140;&area=&#21326;&#21271;" target="main_body">天气查询</a></div></td>
                                          </tr>
                                          <tr>
                                            <td height="20"><div align="center"><a href="http://www.hao123.com" target="main_body">网址大全</a></div></td>
                                            <td height="20"><div align="center"><a href="http://www.cngoto.com/tr/chaxun.htm" target="main_body">列车时刻</a></div></td>
                                          </tr>
                                          <tr>
                                            <td height="20"><div align="center"><a href="http://www.yoee.com/?src=hao123h" target="main_body">航班查询</a></div></td>
                                            <td height="20"><div align="center"><a href="http://www.hao123.com/ss/fy.htm" target="main_body">在线翻译</a></div></td>
                                          </tr>
                                          <tr>
                                            <td height="20"><div align="center"><a href="http://www.hao123.com/soft/default.htm" target="main_body">常用软件</a></div></td>
                                            <td height="20"><div align="center"><a href="http://map.baidu.com/" target="main_body">电子地图</a></div></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                </table></td>
                              </tr>
                            </table></td>
                          </tr>
                          <tr>
                            <td height="8"></td>
                          </tr>
                          <tr>
                            <td><table width="200"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="567B98">
                              <tr>
                                <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="1"><img src="images/main/l4.gif" width="1" height="21"></td>
                                            <td background="images/main/m4.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                  <td width="10">&nbsp;</td>
                                                  <td><span class="style4">今日天气</span></td>
                                                </tr>
                                            </table></td>
                                            <td width="1"><img src="images/main/r4.gif" width="1" height="21"></td>
                                          </tr>
                                      </table></td>
                                    </tr>
                                    <tr>
                                      <td height="3"></td>
                                    </tr>
                                    <tr>
                                      <td><IFRAME ID='ifm2' WIDTH='189' HEIGHT='190' ALIGN='CENTER' MARGINWIDTH='0' MARGINHEIGHT='0' HSPACE='0' VSPACE='0' FRAMEBORDER='0' SCROLLING='NO' SRC='http://weather.qq.com/inc/ss125.htm'></IFRAME>
</td>
                                    </tr>
                                </table></td>
                              </tr>
                            </table></td>
                          </tr>
                        </table></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="18"><img src="images/main/r.gif" width="18" height="700"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="44" background="images/main/d.gif">&nbsp;</td>
  </tr>
</table>
<%
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
'set conn=server.CreateObject("adodb.connection")
'DBPath1=server.mappath("jiezhibaoxiao/finance.mdb")
'conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath1
'set rs=server.createobject("adodb.recordset")
set conn=opendb("finance","conn","sql")
set rs=server.createobject("adodb.recordset")
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部"  then
   sqlstr="select * from borrowlist where dept = "& "'" & oabusyuserdept & "'" & "and stage =1"
end if
if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部"  then
   sqlstr="select * from borrowlist where (dept = "& "'" & oabusyuserdept & "'" & "and stage =1) or stage=10"
end if
if oabusyuserlevelCode="CW" then
   sqlstr="select * from  borrowlist where stage=6  or (stage=1 and borrower= "& "'" & oabusyname & "'" &")"
end if
if oabusyuserlevelCode="DSZ" and oabusyname<>"陈秀万" then
   sqlstr="select * from  borrowlist where  stage=4 "
end if
if oabusyuserlevelCode="DSZ" and oabusyname="陈秀万" then
   sqlstr="select * from  borrowlist where  stage=4 "
end if
if oabusyuserlevelCode="CWZG" then
   sqlstr="select * from  borrowlist where  stage=3  or (stage=1 and borrower= "& "'" & oabusyname & "'" &")"
end if
if oabusyuserlevelCode="ZSYG" then
   sqlstr="select * from  borrowlist where  stage=99"
end if
if oabusyuserlevelCode="CN" then
   sqlstr="select * from  borrowlist where  stage=5"
end if
if oabusyuserlevelCode="GLY" or oabusyuserlevelCode="" then
   sqlstr="select * from  borrowlist where  stage=100"
end if
rs.open sqlstr,conn,1,1

'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
'set cn=server.CreateObject("adodb.connection")
'DBPath2=server.mappath("jiezhibaoxiao/finance.mdb")
'cn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DBPath2
'changed by zhaoshijun with qq:515447782   @ 2010-2-24 for update database
set cn=opendb("finance","conn","sql")
set res=server.createobject("adodb.recordset")
if oabusyuserlevelCode="BMJL" and oabusyuserdept<>"综合管理部" then
   'sqlstr2="select * from  reimlisttable where  stage=1 and dept='" &oabusyuserdept &"'"
   sqlstr2="select * from reimlisttable where (type='A' and projectDept = "& "'" & oabusyuserdept & "')" & "and (stage =1 or (claimant="&"'"&oabusyusername&"' and stage=0)) or (type='B' and projectDept = "& "'" & oabusyuserdept & "'" & "and stage =2   ) or (type='B' and principal = "& "'" & oabusyusername & "'" & "and (stage =1 or  (claimant="&"'"&oabusyusername&"' and stage=0)  ) )"
 '首先是非项目成本自己填写的、别人填写的和被退回的已完成；然后是项目成本 自己是项目经理的但不是项目负责人已完成，项目成本的项目负责人是自己，提交的或未提交的已完成
end if
if oabusyuserlevelCode="BMJL" and oabusyuserdept="综合管理部" then
   sqlstr2="select * from reimlisttable where (type='A' and projectDept = "& "'" & oabusyuserdept & "'" & "and (stage =1 or stage=0 or stage=2 ))or (type='A' and dept <> "& "'" & oabusyuserdept & "'" & "and stage=13) or (type='B' and projectDept = "& "'" & oabusyuserdept & "'" & "and stage =2 ) or (type='B' and principal = "& "'" & oabusyusername & "'" & "and (stage =1 or stage =0) )"
end if
if oabusyuserlevelCode="CW" then
   sqlstr2="select * from  reimlisttable where  stage=6"
end if
if oabusyuserlevelCode="DSZ" and  oabusyname<>"陈秀万" then
   sqlstr2="select * from  reimlisttable where  stage=4"
end if
if oabusyuserlevelCode="DSZ" and  oabusyname="陈秀万" then 
   sqlstr2="select * from  reimlisttable where  stage=4 and relclaimant='陈秀万' "
end if
if oabusyuserlevelCode="CWZG" then
   sqlstr2="select * from reimlisttable where stage=3 or (type='A' and dept = "& "'" & oabusyuserdept & "'" & "and stage =1 or (claimant="&"'"&oabusyusername&"' and stage=0  ))"
end if
if oabusyuserlevelCode="ZSYG" then
   sqlstr2="select * from  reimlisttable where  stage=99"
end if
if oabusyuserlevelCode="CN" then
   sqlstr2="select * from reimlisttable where stage =5 or (type='A' and dept = "& "'" & oabusyuserdept & "'" & "and ((claimant="&"'"&oabusyusername&"' and stage=0)))"
end if
if oabusyuserlevelCode="GLY" then
   sqlstr2="select * from reimlisttable where stage =100 "
end if
res.open sqlstr2,cn,1,1

if (not res.eof and not res.bof) or (not rs.eof and not rs.bof) then
%>
<script language="vbscript">
MsgBox "有报销单或借支单未处理"
</script>
<%
'response.write("报销有问题需要处理")
end if
%>

<div align="center"><script src="count/mystat.asp"></script></div></div>
</body>
</html>

