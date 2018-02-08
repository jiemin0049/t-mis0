<%
//*********定义用于控制全局的布尔型变量和错误信息变量及全局变量
    boolean bFlag  = true;
    String sErrMsg = ""; 
    String sSql    = "";
/*
//*********从上一页面得到传递的参数：
  String sTellId  = (String)request.getParameter("TELLID"); //取得操作员代码
  String sUnitNo  = (String)request.getParameter("UNITNO"); //取得本地机构号
  String sQUnitNo = (String)request.getParameter("QUNITNO"); //待查询机构号
    String sQUnitName = (String)request.getParameter("QUNITNAME"); //待查询机构名称

//防止绕过登录页面直接进入系统
if(sTellId==null){
    bFlag=false;
    sErrMsg="本页面不可以直接调用,请重新登录！";
  } 

if(bFlag){
    GloCheck gc =new GloCheck();
    bFlag=gc.doFuncCheck("seTeller","FYYWH-7311","1000",session);
    sErrMsg=gc.getRetMsg();
}
*/
if(bFlag){
//********初始化数据库连接类查询机构表
}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 程序员添加任何代码，只能在可编辑区域进行编辑或者<html>标记前，否则将破坏整个静态页面的模板管理！ --%>
<html>
<!-- #BeginTemplate "/Templates/yywh.dwt" --> 
<head>
<!-- #BeginEditable "doctitle" --> 
<title>机构管理查询</title>
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
          <td width="25%" align="center"><b><font color="#4F4F4F"><!-- #BeginEditable "title" -->机构管理查询<!-- #EndEditable --></font></b></td>
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
        <table border="0" cellspacing="0" cellpadding="4" align="center">
          <tr> 
            <td nowrap> 
              <table width="0" border="1" bordercolorlight="#000000" bordercolordark="#FFFFFF" cellspacing="0" cellpadding="4" align="center">
                <tr align="center"> 
                  <td bgcolor="#CACACA" nowrap> 
                    <div align="center">机构号</div>
                  </td>
                  <td bgcolor="#CACACA" nowrap> 
                    <div align="center">机构名称</div>
                  </td>
                  <td bgcolor="#CACACA" nowrap> 
                    <div align="center">级别</div>
                  </td>
                  <td bgcolor="#CACACA" nowrap> 
                    <div align="center">上级机构号</div>
                  </td>
                  <td bgcolor="#CACACA" nowrap> 
                    <div align="center">操作员号前缀</div>
                  </td>
                  <td bgcolor="#CACACA" nowrap> 
                    <div align="center">营业机构类型</div>
                  </td>
                  <td bgcolor="#CACACA" nowrap> 
                    <div align="center">备注</div>
                  </td>
                </tr>
                <%/*
                for(int i=0;i<vAllUnits.size();i++){
                    String sUnitNoTemp     = (String)((Vector)vAllUnits.elementAt(i)).elementAt(0);
                    String sUnitNameTemp   = (String)((Vector)vAllUnits.elementAt(i)).elementAt(1);
                    String sUnitClassTemp  = (String)((Vector)vAllUnits.elementAt(i)).elementAt(2);
                    String sUnitParentTemp = (String)((Vector)vAllUnits.elementAt(i)).elementAt(3);
                    String sUnitTellerPre  = (String)((Vector)vAllUnits.elementAt(i)).elementAt(4);
                    String sUnitTypeTemp   = (String)((Vector)vAllUnits.elementAt(i)).elementAt(5);
                    String sUnitMemoTemp   = (String)((Vector)vAllUnits.elementAt(i)).elementAt(6);
                    */
                %>
                <c:forEach var="unit" items="${unitList}">
                <tr align="center">
                  <td nowrap><c:out value="${unit.unitNr}"/></td>
                  <td nowrap><c:out value="${unit.name}"/></td>
                  <td nowrap><c:out value="${unit.unitClass}"/></td>
                  <td nowrap><c:out value="${unit.parent}"/></td>
                  <td nowrap><c:out value="${unit.tellerPrefix}"/></td>
                  <td nowrap><c:out value="${unit.type}"/></td>
                  <td nowrap><c:out value="${unit.description}"/>&nbsp;</td>
                </tr>
       <% //} %> 
       </c:forEach>
              </table>
            </td>
          </tr>
          <tr> 
            <td width="0" nowrap> 
              <div align="center"> 
                <input type="button" name="back2" onClick="doReplace('/webtmis/m7311/W7311_01.jsp')" value="返 回" class="button">
              </div>
            </td>
          </tr>
        </table>
      <% } else { %>
      <%-- 
********下面是导入一个交易失败的页面的代码
********成功页面为：done.htm
********错误页面为：error.htm
********系统错误为：warning.htm
 --%>
      <%--@ include file="../error.htm" --%>
      <br>
      <br>
      <center>
        <b><%=sErrMsg%></b><br>
        <br>
        <input type="button" name="back" onClick="Back()" value="返 回" class="button">
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
