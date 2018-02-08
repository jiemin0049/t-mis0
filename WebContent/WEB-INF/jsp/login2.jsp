<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>泰利特科技-WEB应用系统框架平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="CSS/T-mis.css" type="text/css">
<SCRIPT type="text/javaScript">
var xmlhttp;
function loadXMLDoc(url)
{
xmlhttp=null;
if (window.XMLHttpRequest)
  {// code for Firefox, Opera, IE7, etc.
  xmlhttp=new XMLHttpRequest();
  }
else if (window.ActiveXObject)
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
if (xmlhttp!=null)
  {
  xmlhttp.onreadystatechange=state_Change;
  xmlhttp.open("GET",url,true);
  
  xmlhttp.send(null);
  
  }
else
  {
  alert("Your browser does not support XMLHTTP.");
  }
}

function state_Change()
{
  alert(xmlhttp.readystate);
if (xmlhttp.readyState==4)
  {// 4 = "loaded"
  if (xmlhttp.status==200 || xmlhttp.status==0)
    {// 200 = "OK"
    alert(xmlhttp.status);
    alert("response test is --" + xmlhttp.responseText);
    
    document.getElementById('T1').innerHTML="Hello Ajax";
    }
  else
    {
    alert("Problem retrieving data:" + xmlhttp.statusText);
    }
  }
}
<!--
function ss(){
document.form1.TELLID.focus()
}

function checknn(fieldname,fieldvalue){
 if (fieldvalue.length==0){
   alert(fieldname+"²»ÄÜÎª¿Õ");
   return false;
 }
 return true;
}



function check(){
 if (!checknn("ÓÃ»§Ãû³Æ",document.form1.TELLID.value)){
   document.form1.TELLID.focus();
  return false;
  }
 if (!checknn("¿ÚÁî",document.form1.TELLPASSWD.value)){
   document.form1.TELLPASSWD.focus();
 return false;
 } 
 return true;
}

function Go() {
	if(event.keyCode==13){
		if(check()){
			document.form1.submit();
	   }
	}
}
function down() {
	if(form1.TELLID.value.length==4){
		form1.TELLPASSWD.focus();
	}
}
function Enter() {
	if(form1.TELLID.value.length==4 && form1.TELLPASSWD.value.length==6)
	{
	//go();
	}
}
function go() {
		if(check()){
			document.form1.submit();
	   }
}

function popupPage() {
var page = "/webtmis/m9999/W9999_01.jsp";
windowprops
="height=300,width=380,location=no,scrollbars=no,status=no,menubars=no,toolbars=no,resizable=no";
window.open(page, "Popup", windowprops);
}

function popupPage1() {
var page = "/webtmis/m9998/W9998_01.jsp";
windowprops
="height=300,width=380,location=no,scrollbars=no,status=no,menubars=no,toolbars=no,resizable=no";
window.open(page, "Popup", windowprops);
}

//-->
</SCRIPT>

</head>

<body bgcolor="#CCCCCC" text="#000000" leftmargin="0" topmargin="0" onload= "ss()" onkeydown = "Go()" onkeyup="down(),Enter()">
<table  width="100%" border="0" cellspacing="0" cellpadding="0" align="center" height="100%">
  <tr>
    <td valign="middle" align="center" >
      <table width="780" border="0" cellspacing="0" cellpadding="0" height="455" background="images/kuangjia.jpg" bgcolor="#FFFFFF" align="center">
        <tr> 
          <td valign="top" height="240">&nbsp;</td>
        </tr>
        <tr> 
          <td valign="bottom" align="right"> 
            <form name="form1" method="post" action="<c:url value="loginCheck2.html"/>">
              <table width="700" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="147" height="29">&nbsp;</td>
                  <td width="119" height="29">&nbsp; </td>
                  <td width="94" height="29">&nbsp; </td>
                  <td width="340" height="29">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                              <input type="text" name="id" size="4" maxlength="4" class="shouye">
                  </td>
                </tr>
                <tr> 
                  <td width="147">&nbsp;</td>
                  <td width="119" height="30">&nbsp;</td>
                  <td width="94">&nbsp;</td>
                  <td width="340">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                  <input type="password" name="password" size="6" maxlength="6" class="shouye">
                  </td>
                </tr>
                <tr> 
                  <td width="147" height="10">&nbsp;</td>
                  <td width="119" height="10">&nbsp;</td>
                  <td width="94" height="10">&nbsp;</td>
                  <td width="340" height="10">&nbsp; </td>
                </tr>
                <tr> 
                  <td width="147">&nbsp;</td>
                  <td width="119">&nbsp;</td>
                  <td width="94">&nbsp;</td>
                  <td width="340"> 
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="21%"><a href="javascript:go();"><img src="images/spacer.gif" width="69" height="20" border="0"></a></td>
                        <td width="30%" align="right"><a href="javascript:popupPage1()"><img src="images/spacer.gif" width="66" height="20" border="0"></a></td>
                        <td width="30%" align="right"><a href="javascript:popupPage()"><img src="images/spacer.gif" width="68" height="20" border="0"></a></td>
                        <td width="19%">&nbsp;<input type="submit" value="登录" /></td>
                        <div id="T1" style="border:1px solid black;height:40;width:300;padding:5"></div><br/>
                         <button onclick="loadXMLDoc('/testAjax.txt')">Click</button>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
            </form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<script type="text/javascript">  
    function addUser(){  
        var form = document.forms[1];  
        form.action = "/m7321/add_test";  
        form.method="post";  
        form.submit();
    }  
</script>
<h1>添加用户</h1>  
    <form action="" name="userForm">  
        姓名：<input type="text" name="userName">  
        年龄：<input type="text" name="age">  
        <input type="button" value="添加" onclick="addUser()">  
    </form>    
</body>
</html>
