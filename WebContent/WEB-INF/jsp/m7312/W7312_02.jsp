<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
//*********定义用于控制全局的布尔型变量和错误信息变量及全局变量
    boolean bFlag  = true;
    String sErrMsg = ""; 
    String sSql    = "";
    String sResult = "";
  int iSqlResult,iSqlcode;
%>
 
<%-- 程序员添加任何代码，只能在可编辑区域进行编辑或者<html>标记前，否则将破坏整个静态页面的模板管理！ --%>
<html>
<!-- #BeginTemplate "/Templates/yywh.dwt" --> 
<head>
<!-- #BeginEditable "doctitle" --> 
<title>机构增加</title>
<!-- #EndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../CSS/T-mis.css" type="text/css">
<script language="JavaScript" src="../js/tmis.js">
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="221" height="70"><img src="../images/yywh.jpg" width="220" height="70"></td>
    <td width="412" height="69" valign="baseline">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="2" height="1"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="0" height="1">
        <tr> 
          <td valign="baseline" width="46%"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#E8E8E8" height="1">
              <tr> 
                <td height="1"></td>
              </tr>
            </table>
          </td>
          <td width="25%" align="center"><b><font color="#4F4F4F"><!-- #BeginEditable "title" -->机构增加<!-- #EndEditable --></font></b></td>
          <td width="29%" valign="baseline"> 
            <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#E8E8E8" height="1">
              <tr> 
                <td height="1"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td valign="top"> 
      <table width="100%" border="0" cellspacing="0" cellpadding="4">
        <tr> 
          <td height="10"> </td>
        </tr>
      </table>
      <!-- #BeginEditable "main" --> 
      <%-- **************可编辑区域开始****************** --%>
      <% if (bFlag){%>
      <%-- ********下面是导入一个交易成功页面的代码 --%>
      <br>
      <center>
        <b>${unitno}, 机构增加成功。<font></b> 
      </center>
      <br>
      <center>
        <input type="button" name="back" class="button" onClick="doReplace('/m7312/W7312_01.jsp')" value="返 回">
      </center>
      <br>
      <% } else { %>
      <%--
********下面是导入一个交易失败的页面的代码
********错误页面为：error.htm
********系统错误为：warning.htm
             --%>
      <br>
      <center>
        <b><%=sErrMsg%></b>
      </center>
      <br>
      <center>
        <input type="button" name="back" class="button" onClick="Back()" value="返 回">
      </center>
      <br>
      <% } %>
      <%-- **************可编辑区域结束****************** --%>
      <!-- #EndEditable --></td>
    <td valign="top" width="1" bgcolor="#E8E8E8"></td>
    <td valign="top" width="20"></td>
  </tr>
  <tr> 
    <td valign="top" colspan="3" bgcolor="#E8E8E8"></td>
  </tr>
</table>
</body>
<!-- #EndTemplate -->
</html>
