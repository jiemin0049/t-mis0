<%
//*********定义用于控制全局的布尔型变量和错误信息变量及全局变量
    boolean bFlag  = true;
    String sErrMsg = ""; 
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 
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
    <script language="javascript">
  function check(){
    if (IsEmpty("MDUNITNAME","机构名称")){
           return false
    }else if (IsEmpty("UNITPARENT","上级机构号")){
           return false
    }else if (IsEmpty("UNITTELLERPRE","操作员号前缀")){
           return false
    }else{
           return true
        }
    }  
</script>
<script>var type =<c:out value="${unit.type}"/>
document.getElementById("hiddenField").value = type;
</script>
      <% if (bFlag){%>
      <form name="form1" method="post" action="W7313_04">
        <table border="0" cellspacing="0" cellpadding="4" align="center">
          <tr> 
            <td nowrap>机　构　号　： 
              <input type="text" readonly name="no" size="15" class="text" value="${unit.unitNr}">
            </td>
            <td nowrap>机构　名称　： 
              <input type="text" name="name" size="20" class="text" value="${unit.name}" maxlength="20">
            </td>
          </tr>
          <tr> 
            <td nowrap>级　　　别　： 
              <select name="clazz" class="select" size="1">
                <%
                org.jz.web.domain.Unit unit = (org.jz.web.domain.Unit)request.getAttribute("unit");
                String sUnitClass[]={"0-营业网点","1-分理处","2-支行","3-二级分支行","4-一级分支行","5-总行"};
                for ( int i=0; i<6;i++ ) {
                  out.println("<option value=\"" + i +"\"");
                  if ( i==Integer.parseInt(unit.getUnitClass() + "")) {
                    out.println("selected" );
                  }
                  out.println(">" +sUnitClass[i]+ "　</option>");
                }
        %>
               </select>
            </td>
            <td nowrap>上级机构号　： 
              <input type="text" name="parent" size="15" class="text" value="${unit.parent}" maxlength="11">
            </td>
          </tr>
          <tr> 
            <td width="0" nowrap>操作员号前缀： 
              <input type="text" name="tellerpre" size="15" class="text" value="${unit.tellerPrefix}" maxlength="2">
            </td>
            <td nowrap width="0">营业机构类型： 
              <select name="type" class="select" size="1">
                <%
                String sUnitType[]={"0-非网点","1-储蓄","2-会计","3-卡","4-综合","5-其它"};
                for ( int i=0; i<6;i++ ) {
                  out.println("<option value=\"" + i +"\"");
                  if ( i==Integer.parseInt(unit.getType() + "")) {
                    out.println("selected" );
                  }
                  out.println(">" +sUnitType[i]+ "　　　</option>");
                }
        %>
              </select>
            </td>
          </tr>
          <tr> 
            <td colspan="2" nowrap>备　　　注　： 
              <input type="text" name="description" size="30" class="text" value="${unit.description}" maxlength="30">
              <b></b></td>
          </tr>
          <tr> 
            <td colspan="2" width="0" nowrap> 
              <div align="center"> 
                <input type="submit" name="Submit4" value="确 定" class="button">
                　 
                <input type="reset" name="Submit22" value="重 置" class="button">
                　 
                <input type="button" name="Submit32" onClick="Back()" value="取 消" class="button">
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
