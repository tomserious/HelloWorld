<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%
Option Explicit
Response.Buffer = True
Response.Expires = 0
Response.Expiresabsolute = Now() - 1 
Response.AddHeader "pragma","no-cache" 
Response.AddHeader "cache-control","private" 
Response.CacheControl = "no-cache"
%>
<!--#include file="Connections/conn.asp" -->


<%
Rem Session("CRM_account") 用户帐号
Rem Session("CRM_name") 用户名
Rem Session("CRM_level") 用户等级

If Session("CRM_account") = "" Or Session("CRM_name") = "" Or Session("CRM_level") <= 0 Then Response.Redirect("login.asp")

Function getGroupName(gId)
    If gId = "" Then
	    getGroupName = ""
	Else
	    Dim rs
		Set rs = Server.CreateObject("ADODB.Recordset")
		rs.Open "Select * From baidu_group Where gId = " & gId,conn,3,1
		If rs.RecordCount <> 1 Then
		    getGroupName = ""
		Else
		    getGroupName = rs("gName")
		End If
		rs.Close
		Set rs = Nothing
	End If
End Function

Dim strNormal,strAdmin,strCounter,strToPrint
strNormal = strNormal & "        <tr>" & VBCrlf
strNormal = strNormal & "          <td width=""60"" align=""center"" bgcolor=""menu"">编号</td>" & VBCrlf
strNormal = strNormal & "          <td align=""center"" bgcolor=""menu"">公司名称</td>" & VBCrlf
strNormal = strNormal & "          <td align=""center"" bgcolor=""menu"">公司网址</td>" & VBCrlf
strNormal = strNormal & "          <td width=""80"" align=""center"" bgcolor=""menu"">地区</td>" & VBCrlf
strNormal = strNormal & "        </tr>" & VBCrlf

strAdmin = strAdmin & "        <tr>" & VBCrlf
strAdmin = strAdmin & "          <td width=""60"" align=""center"" bgcolor=""menu"">编号</td>" & VBCrlf
strAdmin = strAdmin & "          <td align=""center"" bgcolor=""menu"">公司名称</td>" & VBCrlf
strAdmin = strAdmin & "          <td align=""center"" bgcolor=""menu"">公司网址</td>" & VBCrlf
strAdmin = strAdmin & "          <td width=""80"" align=""center"" bgcolor=""menu"">地区</td>" & VBCrlf
strAdmin = strAdmin & "          <td width=""80"" align=""center"" bgcolor=""menu"">业务员</td>" & VBCrlf
strAdmin = strAdmin & "        </tr>" & VBCrlf

''strCounter = ""

If Session("CRM_level") = 9 Then
    strToPrint = strAdmin
Else
    strToPrint = strNormal
End If

Dim action
Dim arrList
action = Trim(Request("action"))
If action <> "" Then
    Session("CRM_action") = action
Else
    action = Session("CRM_action")
End If
Select Case action
Case "com"
    If Trim(Request("searchCom")) <> "" Then
        Session("CRM_keyWords") = Trim(Request("searchCom"))
	End If
	If Session("CRM_keyWords") = "" Then
	    arrList = listAll
	    strToPrint = strToPrint &  arrList(1)
	    strCounter = arrList(0)
	Else
	    arrList = searchCom
	    strToPrint = strToPrint &  arrList(1)
	    strCounter = arrList(0)
	End If
Case "url"
    If Trim(Request("searchUrl")) <> "" Then
        Session("CRM_keyWords") = Trim(Request("searchUrl"))
	End If
	If Session("CRM_keyWords") = "" Then
	    arrList = listAll
	    strToPrint = strToPrint &  arrList(1)
	    strCounter = arrList(0)
	Else
	    arrList = searchUrl
		strToPrint = strToPrint &  arrList(1)
	    strCounter = arrList(0)
	End If
Case "killSession"
    Session("CRM_keyWords") = ""
	Session("CRM_action") = ""
	Response.Redirect("listAll.asp")
Case Else
	arrList = listAll
	strToPrint = strToPrint & arrList(1)
	strCounter = arrList(0)
End Select

Function searchCom()
    Dim rs,strOut(2)
	Dim intTotalRecords,intTotalPages,intCurrentPage,intPageSize
	intCurrentPage = CInt(ABS(Request("pageNum")))
    If Not IsNumeric(intCurrentPage) Or intCurrentPage <= 0 Then intCurrentPage = 1
    intPageSize = 10
	
	Set rs = Server.CreateObject("ADODB.Recordset")
	If Session("CRM_level") = 9 Then
	    rs.Open "Select * From baidu_client Where cCompany Like '%" & Session("CRM_keyWords") & "%' Order By cId Desc",conn,3,1
	Else
	    If Session("CRM_level") = 2 Then
			rs.Open "Select * From baidu_client Where cCompany Like '%" & Session("CRM_keyWords") & "%' And cLocal = '" & getGroupName(Session("CRM_group")) & "' Order By cId Desc",conn,3,1
		Else
	        rs.Open "Select * From baidu_client Where cCompany Like '%" & Session("CRM_keyWords") & "%' And cUser = '" & Session("CRM_name") & "' Order By cId Desc",conn,3,1
		End If
	End If
	intTotalRecords = rs.RecordCount
    rs.PageSize = intPageSize
    intTotalPages = rs.PageCount
    If intCurrentPage > intTotalPages Then intCurrentPage = intTotalPages
    If intTotalRecords > 0 Then rs.AbsolutePage = intCurrentPage
    strOut(0) = strOut(0) & "共 " & intTotalRecords & " 条记录 "
    strOut(0) = strOut(0) & "共 " & intTotalPages & " 页 "
    strOut(0) = strOut(0) & "当前第 " & intCurrentPage & " 页 "
    If intCurrentPage <> 1 And intTotalRecords <> 0 Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=1""><<首页</a> "
    Else
        strOut(0) = strOut(0) & "<<首页 "
    End If
    If intCurrentPage > 1 Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intCurrentPage - 1 & """><上一页</a> "
    Else
        strOut(0) = strOut(0) & "<上一页 "
    End If
    If intCurrentPage < intTotalPages Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intCurrentPage + 1 & """>下一页></a> "
    Else
        strOut(0) = strOut(0) & "下一页> "
    End If
    If intCurrentPage <> intTotalPages Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intTotalPages & """>尾页>></a>"
    Else
        strOut(0) = strOut(0) & "尾页>>"
    End If
	
	Dim k
	k = 0
	Do While Not rs.BOF And Not rs.EOF
	    k = k + 1
	    strOut(1) = strOut(1) & "        <tr>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td align=""center"">" & rs("cId") & "</td>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td><a href=""view.asp?cId=" & rs("cId") & """>" & rs("cCompany") & "</a></td>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td><a href=""http://" & rs("cHomepage") & """ target=""_blank"">" & rs("cHomepage") & "</td>" &  VBCrlf
	    strOut(1) = strOut(1) & "        <td>" & rs("cArea") & "</td>" & VBCrlf
		If Session("CRM_level") = 9 Then
	        strOut(1) = strOut(1) & "        <td>" & rs("cUser") & "</td>" & VBCrlf
		End If
	    strOut(1) = strOut(1) & "        </tr>" & VBCrlf
		If k >= intPageSize Then Exit Do
		rs.MoveNext
	Loop
	rs.Close
	Set rs = Nothing
	searchCom = strOut
End Function

Function searchUrl()
    Dim rs,strOut(2)
	Dim intTotalRecords,intTotalPages,intCurrentPage,intPageSize
	intCurrentPage = CInt(ABS(Request("pageNum")))
    If Not IsNumeric(intCurrentPage) Or intCurrentPage <= 0 Then intCurrentPage = 1
    intPageSize = 10
	
	Set rs = Server.CreateObject("ADODB.Recordset")
	If Session("CRM_level") = 9 Then
	    rs.Open "Select * From baidu_client Where cHomepage Like '%" & Session("CRM_keyWords") & "%' Order By cId Desc",conn,3,1
	Else
	    If Session("CRM_level") = 2 Then
			rs.Open "Select * From baidu_client Where cHomepage Like '%" & Session("CRM_keyWords") & "%' And cLocal = '" & getGroupName(Session("CRM_group")) & "' Order By cId Desc",conn,3,1
		Else
	        rs.Open "Select * From baidu_client Where cHomepage Like '%" & Session("CRM_keyWords") & "%' And cUser = '" & Session("CRM_name") & "' Order By cId Desc",conn,3,1
		End If
	End If
	intTotalRecords = rs.RecordCount
    rs.PageSize = intPageSize
    intTotalPages = rs.PageCount
    If intCurrentPage > intTotalPages Then intCurrentPage = intTotalPages
    If intTotalRecords > 0 Then rs.AbsolutePage = intCurrentPage
    strOut(0) = strOut(0) & "共 " & intTotalRecords & " 条记录 "
    strOut(0) = strOut(0) & "共 " & intTotalPages & " 页 "
    strOut(0) = strOut(0) & "当前第 " & intCurrentPage & " 页 "
    If intCurrentPage <> 1 And intTotalRecords <> 0 Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=1""><<首页</a> "
    Else
        strOut(0) = strOut(0) & "<<首页 "
    End If
    If intCurrentPage > 1 Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intCurrentPage - 1 & """><上一页</a> "
    Else
        strOut(0) = strOut(0) & "<上一页 "
    End If
    If intCurrentPage < intTotalPages Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intCurrentPage + 1 & """>下一页></a> "
    Else
        strOut(0) = strOut(0) & "下一页> "
    End If
    If intCurrentPage <> intTotalPages Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intTotalPages & """>尾页>></a>"
    Else
        strOut(0) = strOut(0) & "尾页>>"
    End If
	
	Dim k
	k = 0
	Do While Not rs.BOF And Not rs.EOF
	    k = k + 1
	    strOut(1) = strOut(1) & "        <tr>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td align=""center"">" & rs("cId") & "</td>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td><a href=""view.asp?cId=" & rs("cId") & """>" & rs("cCompany") & "</a></td>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td><a href=""http://" & rs("cHomepage") & """ target=""_blank"">" & rs("cHomepage") & "</td>" &  VBCrlf
	    strOut(1) = strOut(1) & "        <td>" & rs("cArea") & "</td>" & VBCrlf
		If Session("CRM_level") = 9 Then
	        strOut(1) = strOut(1) & "        <td>" & rs("cUser") & "</td>" & VBCrlf
		End If
	    strOut(1) = strOut(1) & "        </tr>" & VBCrlf
		If k >= intPageSize Then Exit Do
		rs.MoveNext
	Loop
	rs.Close
	Set rs = Nothing
	strOut(0) = "共 条记录 共 页 当前第 页 &lt;&lt;首页 &lt;上一页 下一页&gt; 尾页&gt;&gt;"
	searchUrl = strOut
End Function

Function listAll()
    Dim rs,strOut(2)
	Dim intTotalRecords,intTotalPages,intCurrentPage,intPageSize
	intCurrentPage = CInt(ABS(Request("pageNum")))
    If Not IsNumeric(intCurrentPage) Or intCurrentPage <= 0 Then intCurrentPage = 1
    intPageSize = 10

	Set rs = Server.CreateObject("ADODB.Recordset")
	If Session("CRM_level") = 9 Then
	    rs.Open "Select * From baidu_client Order By cId Desc",conn,3,1
	Else
	    If Session("CRM_level") = 2 Then
	        rs.Open "Select * From baidu_client Where cLocal = '" & getGroupName(Session("CRM_group")) & "' Order By cId Desc",conn,3,1
		Else
	        rs.Open "Select * From baidu_client Where cUser = '" & Session("CRM_name") & "' Order By cId Desc",conn,3,1
		End If
	End If
	intTotalRecords = rs.RecordCount
    rs.PageSize = intPageSize
    intTotalPages = rs.PageCount
    If intCurrentPage > intTotalPages Then intCurrentPage = intTotalPages
    If intTotalRecords > 0 Then rs.AbsolutePage = intCurrentPage
    strOut(0) = strOut(0) & "共 " & intTotalRecords & " 条记录 "
    strOut(0) = strOut(0) & "共 " & intTotalPages & " 页 "
    strOut(0) = strOut(0) & "当前第 " & intCurrentPage & " 页 "
    If intCurrentPage <> 1 And intTotalRecords <> 0 Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=1""><<首页</a> "
    Else
        strOut(0) = strOut(0) & "<<首页 "
    End If
    If intCurrentPage > 1 Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intCurrentPage - 1 & """><上一页</a> "
    Else
        strOut(0) = strOut(0) & "<上一页 "
    End If
    If intCurrentPage < intTotalPages Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intCurrentPage + 1 & """>下一页></a> "
    Else
        strOut(0) = strOut(0) & "下一页> "
    End If
    If intCurrentPage <> intTotalPages Then
        strOut(0) = strOut(0) & "<a href=""?pageNum=" & intTotalPages & """>尾页>></a>"
    Else
        strOut(0) = strOut(0) & "尾页>>"
    End If
	
	Dim k
	k = 0
	Do While Not rs.BOF And Not rs.EOF
	    k = k + 1
	    strOut(1) = strOut(1) & "        <tr>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td align=""center"">" & rs("cId") & "</td>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td><a href=""view.asp?cId=" & rs("cId") & """>" & rs("cCompany") & "</a></td>" & VBCrlf
	    strOut(1) = strOut(1) & "        <td><a href=""http://" & rs("cHomepage") & """ target=""_blank"">" & rs("cHomepage") & "</td>" &  VBCrlf
	    strOut(1) = strOut(1) & "        <td>&nbsp;" & rs("cArea") & "</td>" & VBCrlf
		If Session("CRM_level") = 9 Then
	        strOut(1) = strOut(1) & "        <td>" & rs("cUser") & "</td>" & VBCrlf
		End If
	    strOut(1) = strOut(1) & "        </tr>" & VBCrlf
		If k >= intPageSize Then Exit Do
		rs.MoveNext
	Loop
	rs.Close
	Set rs = Nothing
	listAll = strOut
End Function
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="Author" content="http://www.web87.9126.com">
<meta name="Date" content="2003-08">
<title>销售管理系统</title>
<link href="myStyle.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
<!--
function showHideHead(strSrc)
{
	var strFile = strSrc.substring(strSrc.lastIndexOf("/"),strSrc.length);
    if (strFile == "/arrow_up.gif"){
	    oHead.style.display = "none";
		oHeadCtrl.src = "images/arrow_down.gif";
		oHeadCtrl.alt = "显示头部";
		oHeadBar.title = "显示头部";		
	}
	else {
	    oHead.style.display = "block";
		oHeadCtrl.src = "images/arrow_up.gif";
		oHeadCtrl.alt = "隐藏头部";
		oHeadBar.title = "隐藏头部";
	}
}

if (this.location.href == top.location.href){
    top.location.href = "";
}

function ftnCom()
{
    if (document.searchComForm.searchCom.value == ""){
	    alert("请输入要查询的公司名称。");
		document.searchComForm.searchCom.focus();
		return false;
	}
}

function ftnUrl()
{
    if (document.searchUrlForm.searchUrl.value == ""){
	    alert("请输入要查询的公司网址。");
		document.searchUrlForm.searchUrl.focus();
		return false;
	}
}
-->
</script>
</head>

<body >
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr id="oHead" style="display: block;">
    <td height="1" valign="top"> 
      <table width="778" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="5"><img src="images/null.gif" width="1" height="1"></td>
        </tr>
      </table>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="menu">
        <tr> 
          <td align="left" background='images/tab_top_background_runner.gif'> <table width="5" border="0" align="left" cellpadding="0" cellspacing="0">
            <tr>
              <td><img src="images/null.gif" width="1" height="1"></td>
            </tr>
          </table>
          <table onclick="window.location.replace('listAll.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="left">
            <tr > 
              <td><img src="images/tab_on_left.gif" width="16" height="24"></td>
              <td background="images/tab_on_middle.gif">查看所有数据</td>
              <td><img src="images/tab_on_right.gif" width="16" height="24"></td>
            </tr>
          </table>
          <table onclick="window.location.replace('addData.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="left">
            <tr>   
              <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
              <td background="images/tab_off_middle.gif">添加数据</td>
              <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
            </tr>
          </table>	  
          <table onclick="window.location.replace('advanceSearch.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
              <td background="images/tab_off_middle.gif">高级搜索</td>
              <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
            </tr>
          </table>
          <table onclick="window.location.replace('dataForm.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
              <td background="images/tab_off_middle.gif">数据报表</td>
              <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
            </tr>
          </table>
          <table onclick="window.location.replace('exportData.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
              <td background="images/tab_off_middle.gif">数据导出</td>
              <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
            </tr>
          </table>
<% If Session("CRM_level") = 9 Then %>
          <table onclick="window.location.replace('transData.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
              <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
              <td background="images/tab_off_middle.gif">数据转移</td>
              <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
            </tr>
          </table>
          <table onclick="window.location.replace('manageUser.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="left">
              <tr> 
                <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
                <td background="images/tab_off_middle.gif">用户管理</td>
                <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
              </tr>
            </table>
			<table onclick="window.location.replace('system_level.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="left">
              <tr> 
                <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
                <td background="images/tab_off_middle.gif">系统设置</td>
                <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
              </tr>
            </table>
<% End If %>
            <table onclick="window.location.replace('logout.asp')" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="right">
              <tr>    
              <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
              <td background="images/tab_off_middle.gif">注销</td>
              <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
            </tr>
          </table>
            <table onclick="window.location.reload();" style="cursor: hand;" border="0" cellspacing="0" cellpadding="0" align="right">
              <tr> 
                <td><img src="images/tab_off_left.gif" width="16" height="24"></td>
                <td background="images/tab_off_middle.gif">刷新</td>
                <td><img src="images/tab_off_right.gif" width="16" height="24"></td>
              </tr>
            </table></td>
      </tr>
    </table>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr> 
        <td height="5"><img src="images/null.gif" width="1" height="1"></td>
      </tr>
      <tr>
        <td bgcolor="#999999">&nbsp;</td>
      </tr>
    </table>
    <table width="100%" border="0" cellpadding="5" cellspacing="0" bgcolor="#FFFFFF">
      <tr> 
        <td width="40" align="right">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <form name="searchComForm" method="post" action="?action=com" onSubmit="return ftnCom();">
	  <tr>
        <td>按公司名称搜索： 
              <input name="searchCom" type="text" id="searchCom" size="24" maxlength="36" <% If Session("CRM_keyWords") <> "" And Session("CRM_action") = "com" Then Response.Write("value=""" & Session("CRM_keyWords") & """") %> onFocus="this.value='';">
              <input name="Search" type="submit" id="Search" value="搜索"></td>
      </tr></form>
     </table></td>
    </tr>
    <tr> 
      <td width="40" align="right">&nbsp;</td>
      <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <form name="searchUrlForm" method="post" action="?action=url" onSubmit="return ftnUrl();">
		  <tr>
            <td>按公司网址搜索： 
              <input name="searchUrl" type="text" id="searchUrl" size="24" maxlength="36" <% If Session("CRM_keyWords") <> "" And Session("CRM_action") = "url" Then Response.Write("value=""" & Session("CRM_keyWords") & """") %> onFocus="this.value='';">
              <input name="Submit" type="submit" id="Submit" value="搜索"></td>
          </tr></form>
        </table></td>
    </tr>
  </table>
    </td>
  </tr>
  <tr>
    <td height="16" align="center" bgcolor="#999999" id="oHeadBar" style="cursor: hand;" title="隐藏头部" onClick="return showHideHead(document.all.oHeadCtrl.src);"> 
      <img src="images/arrow_up.gif" alt="隐藏头部" width="16" height="16" align="absmiddle" id="oHeadCtrl">&nbsp;</td>
    </td>
  </tr>
  <tr>
    <td valign="top" bgcolor="#FFFFFF" style="padding: 10px;"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>
            <% = strCounter %>
          </td>
          <td align="right">[<a href="?action=killSession">返回全部列表</a>]</td>
        </tr>
      </table> 
      <table width="100%" align="center" border="1" cellpadding="3" cellspacing="0" bordercolor="#DCDCDC" bordercolordark="#FFFFFF"><% = strToPrint %>
      </table></td>
  </tr>
  <tr>
    <td height="16" align="right" bgcolor="#999999"><a href="#top"><img src="images/arrow_up.gif" alt="返回顶部" width="16" height="16" border="0" align="absmiddle"></a>&nbsp;</td>
	</td>
  </tr>
</table>
</body>
</html>
