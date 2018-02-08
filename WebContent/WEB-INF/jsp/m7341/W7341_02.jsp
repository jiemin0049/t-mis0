<%
    /*****************************************************
        编程人员：       张杰民
        完成日期：       2001-06-30
        修改日期：           
        主模块编号名称： FMKZZ动态菜单功能模块装载
        子交易名称：      
        本页面名称：        W7341_02.jsp
        后续页面名称：   
        主要功能描述：    增加模块总目录
    *******************************************************/
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% 
boolean bFlag = true;
String sErrMsg = "";
%>

<%
//从上一页面得到操作员代码、机构号、系统工作日期
String sTellId=(String) request.getParameter("TELLID"); //操作员代码
String sTellUnitNo=(String) request.getParameter("TELLUNITNO"); //机构号
//String sWorkDate= (String) request.getParameter("WORKDATE");  //系统工作日期

String sFunId= (String) request.getParameter("FUNID");  //功能号
String sFunName= (String) request.getParameter("FUNNAME");  //功能标签
String sFunDescribe= (String) request.getParameter("FUNDESCRIBE");  //功能描述
String sFunMemo= (String) request.getParameter("FUNMEMO");  //备注
//String sFunType= (String) request.getParameter("FUNTYPE");  //类型

String sFunLayer="";

/*
if(bFlag){
  //模块总目录
  DBACCESS dbInsert=new DBACCESS(false);
  String sSql1="INSERT INTO sysfunction VALUES('" + sFunId + "','" + sFunName + "','0','" + sFunDescribe + "','" + sFunName + "','1','M','0','','0','1','"+ sFunMemo + "')";
  
  int iReturn=dbInsert.executeUpdate(sSql1);
  if( iReturn< 0){
      bFlag=false;
        sErrMsg="插入sysfuntion表出错。DB Error: " + iReturn;
        //out.println("插入sysfuntion表出错。db err(sSql1)");
        dbInsert.dbClose();
  }
  
  if(bFlag) {
    String sSql2="INSERT INTO tellfun VALUES('" + sTellId + "','" + sFunId + "','1111','0','" + sFunName + "','')";
        iReturn=dbInsert.executeUpdate(sSql2);
    if( iReturn< 0){
      bFlag=false;
      sErrMsg="插入tellfun表出错("+sTellId+")。DB Error: " + iReturn;
      dbInsert.dbClose();
    }
  }

if(!sTellId.equals("Aoot")){
  if(bFlag) {
    String sSql3="INSERT INTO tellfun VALUES('Aoot','" + sFunId + "','1111','0','" + sFunName + "','')";
        iReturn=dbInsert.executeUpdate(sSql3);
    if( iReturn< 0){
      bFlag=false;
      sErrMsg="插入tellfun表出错(Aoot)。DB Error: " + iReturn;
      dbInsert.dbClose();
    }
  }
}
  
  if(bFlag) {
    dbInsert.executeCommit();
    dbInsert.dbClose();
  }
}
*/
%>

<html><!-- #BeginTemplate "/Templates/yywh.dwt" -->
<head>
<!-- #BeginEditable "doctitle" --> 
<title>增加功能项或菜单项</title>
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
          <td width="25%" align="center"><b><font color="#4F4F4F"><!-- #BeginEditable "title" -->增加功能项或菜单项<!-- #EndEditable --></font></b></td>
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
      <table width="400" border="0" cellspacing="0" cellpadding="4" align="center">
        <tr> 
          <td height="10">
              <%
                if ( bFlag ) {
                            %>
              <!--%@ include file="../done.htm"%-->
              <br>
              <br>
                            <center>
                            <b>功能模块总目录装载成功</b><br><br>
                            <input type="button" name="Submit3" value="返回" class="button" onclick="Back()">
                            </center>
              <%
                              }
                              else { 
                            %>
                            <!--%@ include file="../error.htm"%--><br><br>
                            <center><b><%=sErrMsg%></b><br>
                            <br>
                            <input type="button" name="Submit3" value="返回" class="button" onclick="Back()">
                            </center><%
                              }
                            %>
          </td>
        </tr>
      </table>
      <!-- #EndEditable --></td>
    <td valign="top" width="1" bgcolor="#E8E8E8"></td>
    <td valign="top" width="20"></td>
  </tr>
  <tr> 
    <td valign="top" colspan="3" bgcolor="#E8E8E8"></td>
  </tr>
</table> 
</body>
<!-- #EndTemplate --></html>

