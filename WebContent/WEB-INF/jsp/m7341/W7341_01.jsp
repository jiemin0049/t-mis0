<%
    /*****************************************************
        编程人员：       张杰民
        完成日期：       2001-06-30
        修改日期：           
        主模块编号名称： FMKZZ动态菜单功能模块装载
        子交易名称：      
        本页面名称：        W7341_01.jsp
        后续页面名称：   W7341_02.jsp 或 W7341_03.jsp
        主要功能描述：
    *******************************************************/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<%
boolean bFlag = true;
String sErrMsg = "";
%>
<html>
<!-- #BeginTemplate "/Templates/yywh.dwt" --> 
<head>
<!-- #BeginEditable "doctitle" --> <title>增加功能项或菜单项</title> <!-- #EndEditable --> <meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
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
<td colspan="2" height="1"><table width="100%" border="0" cellspacing="0" cellpadding="0" height="1"> 
<tr>
<td valign="baseline" width="46%"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#E8E8E8" height="1"> 
<tr>
<td height="1"></td>
</tr></table></td>
<td width="25%" align="center"><b><font color="#4F4F4F">
<!-- #BeginEditable "title" -->增加功能项或菜单项<!-- #EndEditable --></font></b></td><td width="29%" valign="baseline"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#E8E8E8" height="1"> 
<tr> <td height="1"></td></tr>
</table></td></tr></table></td></tr> </table><table width="100%" border="0" cellpadding="0" cellspacing="0"> 
<tr> <td valign="top"> <!-- #BeginEditable "main" --> 
<SCRIPT LANGUAGE="JavaScript">
      <!--
// 判断输入是否正确 
function check(){
    if(IsEmpty("FUNID","功能号码")) {
        return false
      }
    else if(IsEmpty("FUNNAME","功能名称")){
        return false
      }
      else{
        return true
      }
}
function NextAction()
{
  if(document.form1.FUNTYPE.value=="1"){
    SubmitAction("W7341_02.jsp","1");
    }
  else{
    SubmitAction("W7341_03.jsp","1");
    }
}
//-->
      </script> 
<%if ( bFlag){%>

<FORM NAME="form1" METHOD="post" action="W7341_02">
        <TABLE WIDTH="400" BORDER="0" CELLSPACING="0" CELLPADDING="4" ALIGN="CENTER"><TR><TD NOWRAP><BR>功能号码：<B><INPUT TYPE="text" NAME="id" CLASS="text" SIZE="40" MAXLENGTH="11"></B></TD></TR><TR>
            <TD NOWRAP>功能名称：<INPUT TYPE="text" NAME="name" CLASS="text" SIZE="40" maxlength="40">
            </TD>
          </TR><TR>
            <TD NOWRAP>功能类型：<select name="type" class="select">
                <option selected value="0">0-其它</option>
                <option value="1">1-模块总目录</option>
              </select>
            </TD>
          </TR><TR><TD NOWRAP>功能描述：<B><INPUT TYPE="text" NAME="description" CLASS="text" SIZE="40" MAXLENGTH="100"></B></TD></TR><TR><TD NOWRAP>备　　注：<B><INPUT TYPE="text" NAME="FUNMEMO" CLASS="text" SIZE="40" MAXLENGTH="30"></B></TD></TR><TR><TD NOWRAP>
              <DIV ALIGN="CENTER"><input type="submit" name="Submit" value="下一步" class="button">
                　 
<input type="button" name="Submit2" value="取 消" class="button" onClick="doReplace()">
              </DIV>
            </TD></TR></TABLE></FORM>      
            <% } else { %>
            <%--
        ********下面是导入一个交易失败的页面的代码
        ********错误页面为：error.htm
        ********系统错误为：warning.htm
             --%>
      <!--%@ include file="../error.htm"   %-->
      <br>
      <center>
        <b><%=sErrMsg%></b>
      </center>
        <br>
      <center>
        <input type="button" name="back2" class="button" onClick="doReplace()" value="返 回">
        <br>
      </center><br>
      <% } %>
      <%-- **************可编辑区域结束****************** --%>
<!-- #EndEditable --></td><td valign="top" width="1" bgcolor="#E8E8E8"></td><td valign="top" width="20"></td></tr> 
<tr> <td valign="top" colspan="3" bgcolor="#E8E8E8"></td></tr> </table>
</body>
<!-- #EndTemplate -->
</html>

