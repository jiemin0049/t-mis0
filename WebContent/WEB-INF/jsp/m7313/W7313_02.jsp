<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//*********定义用于控制全局的布尔型变量和错误信息变量及全局变量
    boolean bFlag  = true;
    String sErrMsg = ""; 
%>

 
<%-- 程序员添加任何代码，只能在可编辑区域进行编辑或者<html>标记前，否则将破坏整个静态页面的模板管理！ --%>
<html>
<!-- #BeginTemplate "/Templates/yywh.dwt" --> 
<head>
<!-- #BeginEditable "doctitle" --> 
<title>机构修改</title>
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
          <td width="25%" align="center"><b><font color="#4F4F4F"><!-- #BeginEditable "title" -->机构修改<!-- #EndEditable --></font></b></td>
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
<SCRIPT LANGUAGE="JavaScript">
     function check(){
       if(form1.MDUNITNO.length == null)
        {
            if(!document.form1.MDUNITNO.checked) {
              alert("请选择一个机构进行修改!");
              return false;
             }
            else {
              return true;
            }
        }
        else{
          for(var i = 0 ; i < form1.MDUNITNO.length ; i ++){
            if(document.form1.MDUNITNO[i].checked) {
            return true;
            }
          }
              alert("请选择一个机构进行修改!");
        }
      }
</SCRIPT>
            <% if (bFlag){%>
      <form name="form1" method="post" action="W7313_03">
        <table border="0" cellspacing="0" cellpadding="4" align="center">
          <tr> 
            <td nowrap> 
              <table width="0" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="4" align="center">
                <tr align="center"> 
                  <td width="48" bgcolor="#CACACA" nowrap> 
                    <div align="center">机构号</div>
                  </td>
                  <td width="48" bgcolor="#CACACA" nowrap> 
                    <div align="center">机构名称</div>
                  </td>
                </tr>
              <c:forEach var="unit" items="${unitList}">          
                                <tr align="center"> 
                  <td nowrap> 
                    <table border="0" cellspacing="0" cellpadding="0">
                                            <tr> 
                        <td nowrap> 
                          <input type="radio" name="MDUNITNO" value="<c:out value="${unit.unitNr}"/>">
                        </td>
                        <td nowrap width="100" align="center"><c:out value="${unit.unitNr}"/></td>
                      </tr>
                    </table>
                  </td>
                  <td nowrap align="left"><c:out value="${unit.name}"/>&nbsp;</td>
                </tr>
                        </c:forEach>
              </table>
            </td>
          </tr>
          <tr> 
            <td nowrap> 
              <div align="center">
                <input type="submit" name="back22" value="修 改" class="button">
                　
                <input type="button" name="back2" onClick="Back()" value="取 消" class="button">
              </div>
            </td>
          </tr>
        </table>
      </form>
      <% } else { %>
      <%-- 
********下面是导入一个交易失败的页面的代码
********成功页面为：done.htm
********错误页面为：error.htm
********系统错误为：warning.htm
 --%>
      <--%@ include file="../error.htm" %-->
      <br>
      <br>
      <center>
        <b><%=sErrMsg%></b><br>
        <br>
        <input type="button" name="back" onClick="Back()" value="返 回" class="button">
      </center><br>
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
