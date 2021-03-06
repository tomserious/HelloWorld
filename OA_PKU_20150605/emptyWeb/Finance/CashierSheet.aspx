﻿<%@ Page Language="C#" StyleSheetTheme="finance" MasterPageFile="~/Finance/User.master" AutoEventWireup="true" CodeFile="CashierSheet.aspx.cs" Inherits="Finance_CashierSheet" %>

<asp:Content ID="UserContent" ContentPlaceHolderID="UserContent" Runat="Server">
    
    <div  class="outTable">
        <div class="titlehead">出纳工作表</div>
        <table  class="firstTable">
            <tr>
                <td class="bold">经办人</td>
                <td class="diy"><input name="staffName" type="text" id="staffName" class="Text" runat="server"/></td>
                <td class="bold">部门</td>
                <td class="diy">
                    <asp:DropDownList ID="depList" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="bold">金额</td>
                <td class="diy"><input name="money" type="text" id="money" class="Text" runat="server"/></td>
            </tr>
            <tr>
                <td class="bold">科目编号</td>
                <td class="diy"><input name="summary" type="text" id="summary" class="Text" runat="server"/></td>
                <td class="bold">支出账号</td>
                <td class="diy">
                    <asp:DropDownList ID="accountList"  runat="server">
                    </asp:DropDownList>
                </td>
                <td class="bold">日期</td>
                <td class="diy"><input name="money" type="text" id="Text2" class="Text" runat="server"/></td>
            </tr>  
            <tr>
                <td class="bold">摘要</td>
                <td class="diy" colspan="5"><input name="money" type="text" id="Text1" class="Text" runat="server" style="height:190px;width:520px;"/></td>
                
            </tr>    
            

        </table>
        <asp:Button ID="Button1" text="确认" class="noSubmitButton"  runat="server" />
        <input type="reset" name="ResetForm" value="重填" id="ResetForm" class="Button" />
    </div>


</asp:Content>
