<%
    /*****************************************************
        编程人员：       张杰民
        完成日期：       2001-06-30
        修改日期：           
        主模块编号名称： FMKZZ动态菜单功能模块装载
        子交易名称：      
        本页面名称：        W7341_03.jsp
        后续页面名称：    W7341_04.jsp
    主要功能描述：    模块分目录或功能项
    *******************************************************/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String sErrMsg="";
boolean bFlag=true;
/*
if(bFlag){
  //模块分目录或功能项
  DBACCESS dbQuery=new DBACCESS();
  String sSql="SELECT A.funid, A.funname, A.funlayer FROM sysfunction A, tellfun B WHERE A.funtype='M' AND B.tftellid='"+ sTellId+ "' AND B.tffunid=A.funid ORDER BY funid";
  
  vTemp=dbQuery.executeQuery(sSql);
  if (vTemp.size()==0 || vTemp== null){
    bFlag=false;
    sErrMsg="查询数据库出错,或未找到父功能列表.";
    //out.println("查询数据库出错,或未找到父功能列表.");
  }
  else{
    Vector v1=new Vector();
    for (int i=0;i<vTemp.size();i++){
      v1=(Vector)vTemp.elementAt(i);
      sFatherFunId=(String)v1.elementAt(0);
      sFatherFunName=(String)v1.elementAt(1);
      //sFunLayer=(String)v1.elementAt(2);
      //功能号-功能名称
      vInstList.addElement(sFatherFunId+"__"+sFatherFunName);
      //out.println( i +". " + (String)vInstList.elementAt(i) + "<br>");
    }
  }
}
*/
%>

<html>
<!-- #BeginTemplate "/Templates/yywh.dwt" --> 
<head>
<!-- #BeginEditable "doctitle" --> <title>增加功能项或菜单项</title> <!-- #EndEditable --> <meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<link rel="stylesheet" href="../CSS/T-mis.css" type="text/css"> <script language="JavaScript" src="../js/tmis.js">
</script> 
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0"> <tr> <td width="221" height="70"><img src="../images/yywh.jpg" width="220" height="70"></td><td width="412" height="69" valign="baseline">&nbsp;</td></tr> 
<tr> <td colspan="2" height="1"> <table width="100%" border="0" cellspacing="0" cellpadding="0" height="1"> 
<tr> <td valign="baseline" width="46%"> <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#E8E8E8" height="1"> 
<tr> <td height="1"></td></tr> </table></td><td width="25%" align="center"><b><font color="#4F4F4F"><!-- #BeginEditable "title" -->增加功能项或菜单项<!-- #EndEditable --></font></b></td><td width="29%" valign="baseline"> 
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#E8E8E8" height="1"> 
<tr><td height="1"></td></tr> </table></td></tr> </table></td></tr></table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
<tr> <td valign="top"> <!-- #BeginEditable "main" --> 
<SCRIPT LANGUAGE="JavaScript">
      <!--
// 判断输入是否正确 

function check(){

  var i=getSelectedButton(document.form1.FUNTYPE);

    if(isEmpty(document.form1.FUNRELATE.value) && (document.form1.FUNTYPE[i].value=="F") ) {
        alert("功能项必须有相关页面!")
        document.form1.FUNRELATE.focus()
        return false
      }
    else if(!isEmpty(document.form1.FUNRELATE.value) && (document.form1.FUNTYPE[i].value=="M") ){
        alert("菜单项不能有关联页面!")
        document.form1.FUNRELATE.focus()
        return false
      }
      else{
        return true
      }
}

function getSelectedButton(buttonGroup){
  for(var i=0;i<buttonGroup.length;i++){
    if(buttonGroup[i].checked){
      return i;
    }
  }
  return 0;
}

//-->
</script> 

<FORM NAME="form1" METHOD="post" ACTION="W7341_04">
        <TABLE WIDTH="400" BORDER="0" CELLSPACING="0" CELLPADDING="4" ALIGN="CENTER">
          <TR>
            <TD NOWRAP>功能号码：<b>
              <input type="text" name="FUNID" class="readonlytext" size="40" readonly maxlength="11" value="${function.id}">
              </b></TD>
          </TR>
          <TR> 
            <TD NOWRAP>功能名称：
              <input type="text" name="FUNNAME" class="readonlytext" size="40" readonly maxlength="40" value="${function.name}">
            </TD>
          </TR>
          <TR> 
            <TD NOWRAP>父 功 能： 
              <SELECT NAME="FUNPARENT" CLASS="select">
                <%
                java.util.List functionList = (java.util.List)request.getAttribute("parentSelect");
                if(bFlag){
                    for (int j = 0 ; j < functionList.size() ; j ++ ) {
                      org.jz.web.domain.SysFunction sysFun = (org.jz.web.domain.SysFunction)functionList.get(j);
                      out.println("<option>"+sysFun.getId() + "_" + sysFun.getName()+ "</option>");
                }
                 }
                %>
              </SELECT>
            </TD>
          </TR>
          <TR> 
            <TD NOWRAP>功能类型： 
              <input type="radio" name="FUNTYPE" value="F" checked>
              F-功能项 
              <input type="radio" name="FUNTYPE" value="M">
              M-菜单项 </TD>
          </TR>
          <TR> 
            <TD NOWRAP>关联首页：<B> 
              <INPUT TYPE="text" NAME="FUNRELATE" CLASS="text" SIZE="40" MAXLENGTH="100">
              </B></TD>
          </TR>
          <TR> 
            <TD NOWRAP> 
              <DIV ALIGN="CENTER">
                <input type="button" onClick="go()" name="Submit" value="确 定" class="button">
                　 
                <input type="button" onClick="go()" name="Submit1" value="返 回" class="button">
              </DIV>
            </TD>
          </TR>
        </TABLE>
</FORM>
<!-- #EndEditable --></td><td valign="top" width="1" bgcolor="#E8E8E8"></td><td valign="top" width="20"></td></tr> 
<tr> <td valign="top" colspan="3" bgcolor="#E8E8E8"></td></tr> </table>
</body>
<!-- #EndTemplate -->
</html>
