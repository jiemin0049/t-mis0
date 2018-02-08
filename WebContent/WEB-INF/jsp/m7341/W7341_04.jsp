<%
	/*****************************************************
		编程人员：       张杰民
		完成日期：       2001-06-30
		修改日期：			
		主模块编号名称： FMKZZ动态菜单功能模块装载
		子交易名称：		
		本页面名称：		  W7341_04.jsp
		后续页面名称：	 
		主要功能描述：
	*******************************************************/
%>

<%@ page language="java" %>
<%@ page import ="tmis.pubs.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%@ page contentType="TEXT/HTML" %>

<%
//从上一页面得到操作员代码、机构号、系统工作日期

String sTellId=(String) request.getParameter("TELLID");	//操作员代码
String sTellUnitNo=(String) request.getParameter("TELLUNITNO");	//机构号
//String sWorkDate=(String) request.getParameter("WORKDATE");	//系统工作日期

String sFunId= (String) request.getParameter("FUNID");  //功能号
String sFunName= (String) request.getParameter("FUNNAME");  //功能标签
String sFunDescribe= (String) request.getParameter("FUNDESCRIBE");  //功能描述
String sFunMemo= (String) request.getParameter("FUNMEMO");  //备注
String sFunType= (String) request.getParameter("FUNTYPE");  //类型
String sFunParent= (String) request.getParameter("FUNPARENT");  //父菜单功能号
String sFunRelate= (String) request.getParameter("FUNRELATE");  //关联首页面

String sFunLayer="";
String sFatherLayer="";
String sErrMsg="";

String sSql1="";
boolean bFlag=true;

if (sTellId.equals("") || sTellUnitNo.equals("")) {
  bFlag=false;
	sErrMsg="数据传送不完整(sTellId,sTellUnitNo)。";  
}

if (bFlag && (sFunId.equals("") || sFunName.equals("") || sFunType.equals("") || sFunParent.equals("") )) {
  bFlag=false;
	sErrMsg="输入项未填写完整(功能号,功能名称,类型,父菜单功能号)。";
}

if(bFlag) {
  if (sFunType.equals("M") && !sFunRelate.equals("")){
    bFlag=false;
    sErrMsg="菜单项不能有关联页面.";
    //out.println("菜单项不能有关联页面.");
  }
  else if(sFunType.equals("F") && sFunRelate.equals("")){
    bFlag=false;
    sErrMsg="功能项应有关联页面.";
    //out.println("功能项应有关联页面.");
  }
}

if(bFlag) {
	//从(功能ID__功能名称)格式转换成(功能名称)
	int iPos=sFunParent.indexOf( "__", 0 );
	sFunParent=sFunParent.substring( 0, iPos );
  
  //得到父功能所在层
  DBACCESS db1=new DBACCESS();
  String sSqlLayer="SELECT funlayer FROM sysfunction WHERE funid='" +sFunParent + "'"; 

  //out.println(sSql + "<br>");
  Vector vTemp1=db1.executeQuery(sSqlLayer);
  
  if (vTemp1== null || vTemp1.size()==0 || vTemp1.size()>1){
	  bFlag=false;
	  sErrMsg="数据库操作错，未找到相应父功能或记录数多于一条.";
    //out.println(sErrMsg);
  }

  if ( bFlag )
	  sFatherLayer=(String)((Vector)vTemp1.elementAt(0)).elementAt(0);
}

if( bFlag ){
  
  sFunRelate.trim();
  sFunLayer=Integer.toString(Integer.parseInt(sFatherLayer)+1);

  sSql1="INSERT INTO sysfunction VALUES('" + sFunId + "','" + sFunName + "','" + sFunParent + "','" + sFunDescribe + "','";
  if (sFunType.equals("M")) 
  //菜单项
    sSql1 += sFunName + "','1','M','" + sFunLayer + "','','0','0','"+ sFunMemo + "')";
 else
  //功能项
    sSql1 += sFunRelate + "','1','F','" + sFunLayer + "','','0','0','"+ sFunMemo + "')";
}

if (bFlag){
 
  DBACCESS dbInsert=new DBACCESS(false);
  int iReturn=dbInsert.executeUpdate(sSql1);
  if( iReturn<= 0){
    bFlag=false;
    sErrMsg="插入sysfunction表出错。DB Error: " + iReturn;
    dbInsert.dbClose();
  }

  if(bFlag) {
    String sSql2="INSERT INTO tellfun VALUES('" + sTellId + "','" + sFunId + "','1111','0','" + sFunName + "','')";
    iReturn=dbInsert.executeUpdate(sSql2);
    if( iReturn<= 0){
      bFlag=false;
      sErrMsg="插入tellfun表出错。操作员("+ sTellId+ ")。DB Error: " + iReturn;
      dbInsert.dbClose();
    }
  }

  if(!sTellId.equals("Aoot")){
    if(bFlag) {
      String sSql3="INSERT INTO tellfun VALUES('Aoot','" + sFunId + "','1111','0','" + sFunName + "','')";
      iReturn=dbInsert.executeUpdate(sSql3);
      if( iReturn<= 0){
        bFlag=false;
        sErrMsg="插入tellfun表出错。操作员(Aoot)。DB Error: " + iReturn;
        dbInsert.dbClose();
      }
    }
  }

  if(bFlag){
		Log log = new Log();
		iReturn = log.writeLog(dbInsert, sTellId, "FYYWH-7341", "添加功能项或菜单项",0, request, "添加："+sFunId+"__"+sFunName);
		if( iReturn<=0 ){
			bFlag=false;
			sErrMsg="插入applog表出错。DB Error: " + iReturn;
			dbInsert.dbClose();
		}
  }

  if(bFlag) {
    dbInsert.executeCommit();
    dbInsert.dbClose();
  }
}

//整理菜单显示方式
if(bFlag){
  FunSpot fs = new FunSpot(sTellId);
  int iR = fs.setFunSpot();
  if(iR!=1){
    bFlag= false;
    sErrMsg="添加功能项或菜单项成功。<br><font color=\"#3300FF\">但整理菜单("+sTellId+")显示方式时出错(tellfun)。DB Error: " + iR+"。<br><font color=\"#F00000\">请通知系统管理员。";
  }
}

if(!sTellId.equals("Aoot")){
  if(bFlag){
    FunSpot fs = new FunSpot("Aoot");
    int iR = fs.setFunSpot();
    if(iR!=1){
      bFlag= false;
      sErrMsg="添加功能项或菜单项成功。<br><font color=\"#3300FF\">但整理菜单(Aoot)显示方式时出错(tellfun)。DB Error: " + iR+"。<br><font color=\"#F00000\">请通知系统管理员。";
    }
  }
}


%>

<html><!-- #BeginTemplate "/Templates/yywh.dwt" -->
<head>
<!-- #BeginEditable "doctitle" --> 
<title>增加功能项或菜单项</title>
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
      <table width="100%" border="0" cellspacing="0" cellpadding="4" align="center">
        <tr> 
          <td height="10"> 
            <%
                if ( bFlag ) {
							%>
            <%@ include file="../done.htm"%>
            <br>
            <br>
							<center>
							<b>功能模块装载成功</b><br><br>
							<input type="button" name="Submit3" value="返 回" class="button" onclick="doReplace('W7341_01.jsp')">
							</center>
              <%
							  }
							  else { 
							%>
							<%@ include file="../error.htm"%><br><br>
              <b><%=sErrMsg%></b><br>
              <br>
			  <center>
							<input type="button" name="Submit3" value="返 回" class="button" onclick="Back()">
							</center>
							<%
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
