<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%!
  //生成新的操作员号的函数
  public static String makeNewTellNumber(String oldTellNumber){
    int iTemp0 = Character.getNumericValue(oldTellNumber.charAt(0));
    int iTemp1 = Character.getNumericValue(oldTellNumber.charAt(1));

    //判断是否已经达到操作员号上限
    if(iTemp0 == 35 && iTemp1 == 9){
      return null;
    }
    
    if (0 <= iTemp1 && iTemp1 < 9){
      iTemp1 = iTemp1 + 1;
      return Character.forDigit(iTemp0, 36) + Integer.toString(iTemp1);
    }else{
      iTemp1 = 0;
      char cTemp0 = Character.forDigit((iTemp0 + 1), 36);
      return cTemp0 + Integer.toString(iTemp1);
    }
  }
%>

<%
    //判断标志和错误信息
    boolean bFlag = true;
    String sErrMsg = "";


    //////////////////////
    GloCheck gc =new GloCheck();
    bFlag=gc.doFuncCheck("seTeller","FYYWH-7321","0100",session);
    sErrMsg=gc.getRetMsg();
    String sTellerId=gc.getTellId();    //操作员代码
    String sUnitNo=gc.getTellUnitNo();  //机构号
    ////////////////////////

//for debug
//String sTellerId = "Aoot";                //输入操作员
//String sUnitNo = "431884300";         //机构号

    //初始化数据库连接类
    DBACCESS db = new DBACCESS();

  //判断操作员是否为管理员
  boolean bAdminFlag = false;

  if(bFlag && !sTellerId.equals("")){
    bAdminFlag = sTellerId.charAt(0) == 'a' || sTellerId.charAt(0) == 'A';
  }

  //取出需要的机构号
  Vector vAllUnits = null;

  if(bAdminFlag && bFlag){
    String sSqlString = "SELECT unitno, unitname FROM units WHERE unitclass NOT IN ('0', '1')";

    vAllUnits = db.executeQuery(sSqlString);
  
    if(vAllUnits == null){
            bFlag = false;
            sErrMsg = "查询子机构号失败";
            System.out.println("查询子机构号失败, W73211_01.jsp , wanghy");
        }else if(vAllUnits.size() == 0){
            bFlag = false;
            sErrMsg = "查询子机构号返回空";
            System.out.println("查询子机构号返回空, W73211_01.jsp , wanghy");
        }
  }

  //////////////////////////////////
  //如果不是管理员，则制作操作员号
  //////////////////////////////////

  //取出操作员号前缀
  Vector vTellerIdPrefix = null;

  if(!bAdminFlag && bFlag){
    String sSqlString = "SELECT unittellerpre FROM units WHERE unitno= '" + sUnitNo + "'";

    vTellerIdPrefix = db.executeQuery(sSqlString);
  
    if( vTellerIdPrefix == null){
            bFlag = false;
            sErrMsg = "查询操作员号前缀失败";
            System.out.println("查询操作员号前缀失败, W73211_01.jsp , wanghy");
        }else if( vTellerIdPrefix.size() == 0){
            bFlag = false;
            sErrMsg = "查询操作员号前缀返回空";
            System.out.println("查询操作员号前缀返回空, W73211_01.jsp , wanghy");
        }
  }

  //取出本机构最大的操作员号
  Vector vMaxTellerId = null;

  if(!bAdminFlag && bFlag){
    String sTellerPre = sTellerId.substring(0, 2);

    String sSqlString = "SELECT max(substr(tellid, 3, 2)) FROM tellers WHERE substr(tellid, 1, 2)= (select unittellerpre from units where unitno = '" + sUnitNo + "')";
 
/*
    String sSqlString = "SELECT max(substr(a.tellid, 3, 2)) FROM tellers a, units b WHERE " +
      "a.tellunitno = b.unitno AND  a.tellunitno = '" + sUnitNo + "' AND a.tellid <> 'A'";
*/
    vMaxTellerId = db.executeQuery(sSqlString);
  
    if( vMaxTellerId == null){
            bFlag = false;
            sErrMsg = "查询最大的操作员号失败";
            System.out.println("查询最大的操作员号失败, W73211_01.jsp , wanghy");
        }else if( vMaxTellerId.size() == 0){
            bFlag = false;
            sErrMsg = "查询最大的操作员号返回空";
            System.out.println("查询最大的操作员号返回空, W73211_01.jsp , wanghy");
        }
  }

  //产生新的操作员号
  String sNewTellId = "";

  if(!bAdminFlag && bFlag){
    String sTellerIdPrefix = (String)((Vector)vTellerIdPrefix.elementAt(0)).elementAt(0);
    String sMaxTellId = (String)((Vector)vMaxTellerId.elementAt(0)).elementAt(0);
    sNewTellId = sTellerIdPrefix + makeNewTellNumber(sMaxTellId);
  }
%>  

<html>
<!-- #BeginTemplate "/Templates/yywh.dwt" --> 
<head>
<!-- #BeginEditable "doctitle" --> 
<title>增加操作员</title>
<!-- #EndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="/webhtml/CSS/T-mis.css" type="text/css">
<script language="JavaScript" src="/webhtml/js/tmis.js">
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="221" height="70"><img src="/webhtml/images/yywh.jpg" width="220" height="70"></td>
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
          <td width="25%" align="center"><b><font color="#4F4F4F"><!-- #BeginEditable "title" -->增加操作员<!-- #EndEditable --></font></b></td>
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
      <%
  if(bFlag){
%>
<SCRIPT LANGUAGE="JavaScript">
      <!--
// 判断输入是否正确 
function check(){
      if(IsEmpty("NEWTELLID", "操作员ID")) {
      return false
      }
      else if(IsEmpty("TELLNAME", "操作员姓名")){
        return false
      }
      else if(!IsAmt("TELLCASHLTD", "现金限额")){
        return false
      }
      else if(!IsAmt("TELLTRANLTD", "转帐限额")){
        return false
      }
      else if(IsEmpty("TELLCREATOR", "父操作员")){
        return false
      }
      else{
        return true
      }
}
      //-->
</SCRIPT>

      <form name="form1" method="post" action="W73211_02.jsp">
        <input type="hidden" name="TELLERID" value="<%=sTellerId%>">
        <input type="hidden" name="UNITNO" value="<%=sUnitNo%>">
        <table border="0" cellspacing="0" cellpadding="4" align="center" width="40%">
          <tr> 
            <td height="16" nowrap>操作员ID　　： 
              <%
  if(bAdminFlag){  
    out.println("<input type=\"text\" name=\"NEWTELLID\" size=\"15\" class=\"text\" maxlength=\"4\">");
  }else{
    out.println("<input type=\"text\" name=\"NEWTELLID\" size=\"15\" readonly value=\"" +
      sNewTellId + "\" class=\"text\" maxlength=\"4\">");
  }
%>
              　 
              <input type="checkbox" name="TELLSTARTFLAG" value="1" checked>
              立即启用 </td>
          </tr>
          <tr> 
            <td nowrap height="17">机构号　　　： 
              <%
      if(bAdminFlag){
    %>
              <select name="TELLUNITNO" class="select" size="1">
                <%
                    for (int j = 0 ; j < vAllUnits.size() ; j ++ ){
                      Vector vTemp = (Vector)vAllUnits.elementAt(j);

                      out.print("<option value=\"");
                      out.print((String)vTemp.elementAt(0));
                      out.print("\">");
                      out.print((String)vTemp.elementAt(0) + "-" + (String)vTemp.elementAt(1));
                      out.print("　　　</option>");
                    }
                                %>
              </select>
              <%
        }else{
          out.println("<input type=\"text\" name=\"TELLUNITNO\" readonly size=\"15\" value=\"" +
            sUnitNo + "\" class=\"text\" maxlengt\"6\">");
        }
     %>
            </td>
          </tr>
          <tr> 
            <td nowrap height="21">操作员姓名　： 
              <input type="text" name="TELLNAME" size="20" class="text" maxlength="20">
            </td>
          </tr>
          <tr> 
            <td nowrap height="19">部门名称　　： 
              <input type="text" name="TELLDEPT" size="20" class="text" maxlength="20">
            </td>
          </tr>
          <tr> 
            <td nowrap height="19">职　　务　　： 
              <select name="TELLCLASS" class="select" size="1">
                <option value="0">普通操作员</option>
                <option value="1">股/组级操作员　　　</option>
                <option value="2">正副科级</option>
                <option value="3">正副处级</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td nowrap height="12">岗位说明　　： 
              <input type="text" name="TELLSTATION" size="20" class="text" maxlength="20">
            </td>
          </tr>
          <tr> 
            <td nowrap height="17">现金限额　　： 
              <input type="text" name="TELLCASHLTD" size="20" class="text" value="0" maxlength="17">
              元人民币</td>
          </tr>
          <tr> 
            <td nowrap>转帐限额　　： 
              <input type="text" name="TELLTRANLTD" size="20" class="text" maxlength="17" value="0">
              元人民币 </td>
          </tr>
          <tr> 
            <td nowrap>上级主管ID　： 
              <input type="text" name="TELLPARENT1" size="6" class="text" maxlength="4">
              <input type="text" name="TELLPARENT2" size="6" class="text" maxlength="4">
              <input type="text" name="TELLPARENT3" size="6" class="text" maxlength="4">
            </td>
          </tr>
          <tr> 
            <td nowrap>父操作员　　： 
              <%
  if(bAdminFlag){
    out.println("<input type=\"text\" name=\"TELLCREATOR\" size=\"15\" class=\"text\" maxlength=\"4\" value=\"" + sTellerId + "\"> ");
  }else{
    out.println("<input type=\"text\" name=\"TELLCREATOR\" size=\"15\" readonly value=\"" +
      sTellerId + "\" class=\"text\"  maxlength=\"4\">");
  }
%>
            </td>
          </tr>
          <tr> 
            <td nowrap height="18">备　　注　　： 
              <input type="text" name="TELLMEMO" size="30" class="text" maxlength="30">
            </td>
          </tr>
          <tr> 
            <td nowrap>注：限额均为人民币，如有外币，请转换为人民币登记。</td>
          </tr>
          <tr> 
            <td nowrap> 
              <div align="center"> 
                <input type="button" name="Submit4" value="下一步" class="button" onClick="go()">
                　 
                <input type="reset" name="Submit22" value="重 置" class="button">
                　 
                <input type="button" name="Submit32" value="取 消" class="button" onClick="doReplace()">
              </div>
            </td>
          </tr>
        </table>
      </form>
      <% } else { %>
      <%--
********下面是导入一个交易失败的页面的代码
********错误页面为：error.htm
********系统错误为：warning.htm
             --%>
      <%@ include file="../error.htm"   %>
      <br>
      <center>
        <b><%=sErrMsg%></b>
      </center>
      <br>
      <center>  
        <input type="button" name="back2" class="button" onClick="doReplace()" value="返 回">
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
