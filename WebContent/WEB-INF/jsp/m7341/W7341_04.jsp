<%
	/*****************************************************
		�����Ա��       �Ž���
		������ڣ�       2001-06-30
		�޸����ڣ�			
		��ģ�������ƣ� FMKZZ��̬�˵�����ģ��װ��
		�ӽ������ƣ�		
		��ҳ�����ƣ�		  W7341_04.jsp
		����ҳ�����ƣ�	 
		��Ҫ����������
	*******************************************************/
%>

<%@ page language="java" %>
<%@ page import ="tmis.pubs.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%@ page contentType="TEXT/HTML" %>

<%
//����һҳ��õ�����Ա���롢�����š�ϵͳ��������

String sTellId=(String) request.getParameter("TELLID");	//����Ա����
String sTellUnitNo=(String) request.getParameter("TELLUNITNO");	//������
//String sWorkDate=(String) request.getParameter("WORKDATE");	//ϵͳ��������

String sFunId= (String) request.getParameter("FUNID");  //���ܺ�
String sFunName= (String) request.getParameter("FUNNAME");  //���ܱ�ǩ
String sFunDescribe= (String) request.getParameter("FUNDESCRIBE");  //��������
String sFunMemo= (String) request.getParameter("FUNMEMO");  //��ע
String sFunType= (String) request.getParameter("FUNTYPE");  //����
String sFunParent= (String) request.getParameter("FUNPARENT");  //���˵����ܺ�
String sFunRelate= (String) request.getParameter("FUNRELATE");  //������ҳ��

String sFunLayer="";
String sFatherLayer="";
String sErrMsg="";

String sSql1="";
boolean bFlag=true;

if (sTellId.equals("") || sTellUnitNo.equals("")) {
  bFlag=false;
	sErrMsg="���ݴ��Ͳ�����(sTellId,sTellUnitNo)��";  
}

if (bFlag && (sFunId.equals("") || sFunName.equals("") || sFunType.equals("") || sFunParent.equals("") )) {
  bFlag=false;
	sErrMsg="������δ��д����(���ܺ�,��������,����,���˵����ܺ�)��";
}

if(bFlag) {
  if (sFunType.equals("M") && !sFunRelate.equals("")){
    bFlag=false;
    sErrMsg="�˵�����й���ҳ��.";
    //out.println("�˵�����й���ҳ��.");
  }
  else if(sFunType.equals("F") && sFunRelate.equals("")){
    bFlag=false;
    sErrMsg="������Ӧ�й���ҳ��.";
    //out.println("������Ӧ�й���ҳ��.");
  }
}

if(bFlag) {
	//��(����ID__��������)��ʽת����(��������)
	int iPos=sFunParent.indexOf( "__", 0 );
	sFunParent=sFunParent.substring( 0, iPos );
  
  //�õ����������ڲ�
  DBACCESS db1=new DBACCESS();
  String sSqlLayer="SELECT funlayer FROM sysfunction WHERE funid='" +sFunParent + "'"; 

  //out.println(sSql + "<br>");
  Vector vTemp1=db1.executeQuery(sSqlLayer);
  
  if (vTemp1== null || vTemp1.size()==0 || vTemp1.size()>1){
	  bFlag=false;
	  sErrMsg="���ݿ������δ�ҵ���Ӧ�����ܻ��¼������һ��.";
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
  //�˵���
    sSql1 += sFunName + "','1','M','" + sFunLayer + "','','0','0','"+ sFunMemo + "')";
 else
  //������
    sSql1 += sFunRelate + "','1','F','" + sFunLayer + "','','0','0','"+ sFunMemo + "')";
}

if (bFlag){
 
  DBACCESS dbInsert=new DBACCESS(false);
  int iReturn=dbInsert.executeUpdate(sSql1);
  if( iReturn<= 0){
    bFlag=false;
    sErrMsg="����sysfunction�����DB Error: " + iReturn;
    dbInsert.dbClose();
  }

  if(bFlag) {
    String sSql2="INSERT INTO tellfun VALUES('" + sTellId + "','" + sFunId + "','1111','0','" + sFunName + "','')";
    iReturn=dbInsert.executeUpdate(sSql2);
    if( iReturn<= 0){
      bFlag=false;
      sErrMsg="����tellfun���������Ա("+ sTellId+ ")��DB Error: " + iReturn;
      dbInsert.dbClose();
    }
  }

  if(!sTellId.equals("Aoot")){
    if(bFlag) {
      String sSql3="INSERT INTO tellfun VALUES('Aoot','" + sFunId + "','1111','0','" + sFunName + "','')";
      iReturn=dbInsert.executeUpdate(sSql3);
      if( iReturn<= 0){
        bFlag=false;
        sErrMsg="����tellfun���������Ա(Aoot)��DB Error: " + iReturn;
        dbInsert.dbClose();
      }
    }
  }

  if(bFlag){
		Log log = new Log();
		iReturn = log.writeLog(dbInsert, sTellId, "FYYWH-7341", "��ӹ������˵���",0, request, "��ӣ�"+sFunId+"__"+sFunName);
		if( iReturn<=0 ){
			bFlag=false;
			sErrMsg="����applog�����DB Error: " + iReturn;
			dbInsert.dbClose();
		}
  }

  if(bFlag) {
    dbInsert.executeCommit();
    dbInsert.dbClose();
  }
}

//����˵���ʾ��ʽ
if(bFlag){
  FunSpot fs = new FunSpot(sTellId);
  int iR = fs.setFunSpot();
  if(iR!=1){
    bFlag= false;
    sErrMsg="��ӹ������˵���ɹ���<br><font color=\"#3300FF\">������˵�("+sTellId+")��ʾ��ʽʱ����(tellfun)��DB Error: " + iR+"��<br><font color=\"#F00000\">��֪ͨϵͳ����Ա��";
  }
}

if(!sTellId.equals("Aoot")){
  if(bFlag){
    FunSpot fs = new FunSpot("Aoot");
    int iR = fs.setFunSpot();
    if(iR!=1){
      bFlag= false;
      sErrMsg="��ӹ������˵���ɹ���<br><font color=\"#3300FF\">������˵�(Aoot)��ʾ��ʽʱ����(tellfun)��DB Error: " + iR+"��<br><font color=\"#F00000\">��֪ͨϵͳ����Ա��";
    }
  }
}


%>

<html><!-- #BeginTemplate "/Templates/yywh.dwt" -->
<head>
<!-- #BeginEditable "doctitle" --> 
<title>���ӹ������˵���</title>
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
          <td width="25%" align="center"><b><font color="#4F4F4F"><!-- #BeginEditable "title" -->���ӹ������˵���<!-- #EndEditable --></font></b></td>
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
							<b>����ģ��װ�سɹ�</b><br><br>
							<input type="button" name="Submit3" value="�� ��" class="button" onclick="doReplace('W7341_01.jsp')">
							</center>
              <%
							  }
							  else { 
							%>
							<%@ include file="../error.htm"%><br><br>
              <b><%=sErrMsg%></b><br>
              <br>
			  <center>
							<input type="button" name="Submit3" value="�� ��" class="button" onclick="Back()">
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
