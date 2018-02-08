<%@ page language="java" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.lang.*" %>
<%@ page contentType="TEXT/HTML" %>
<html>
<head>
<title>top</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="CSS/T-mis.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function MakeArrayday(size) {
this.length = size;
for(var i = 1; i <= size; i++) {
this[i] = "";
}
return this;
}
function MakeArraymonth(size) {
this.length = size;
for(var i = 1; i <= size; i++) {
this[i] = "";
}
return this;
}
function funClock() {
if (!document.layers && !document.all)
return;
var runTime = new Date();
var hours = runTime.getHours();
var minutes = runTime.getMinutes();
var seconds = runTime.getSeconds();
var dn = "AM";
if (hours >= 12) {
dn = "PM";
hours = hours - 12;
}
if (hours == 0) {
hours = 12;
}
if (minutes <= 9) {
minutes = "0" + minutes;
}
if (seconds <= 9) {
seconds = "0" + seconds;
}
movingtime = hours + ":" + minutes + ":" + seconds + " " + dn;
if (document.layers) {
document.layers.clock.document.write(movingtime);
document.layers.clock.document.close();
}
else if (document.all) {
clock.innerHTML = movingtime;
}
setTimeout("funClock()", 1000)
}
window.onload = funClock;
//  End -->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="100%" border="0" cellpadding="0" cellspacing="0" height="80">
  <tr> 
    <td width="51" rowspan="2"><img src="images/log1.jpg" width="160" height="80"></td>
    <td valign="top" height="53"><img src="images/banner.jpg" width="580" height="53"></td>
  </tr>
  <tr> 
    <td valign="bottom"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr valign="bottom"> 
          <td width="10"><font color="#336699"></font> </td>
          <td width="65"> 
            <div align="right"><font color="#FFCC99" size="-7">° </font><font color="#336699">Teller 
              </font></div>
          </td>
          <td width="70"><font color="#336699">&nbsp;[</font>${teller.id}<font color="#336699">]</font></td>
          <td width="75"> 
            <div align="right"><font color="#FFCC99" size="-7">° </font><font color="#336699"></font><font color="#336699">Unit Name</font></div>
          </td>
          <td width="100"><font color="#336699">&nbsp;[</font>${unitName}<font color="#336699">]</font></td>
          <td width="60"> 
            <div align="right"><font color="#FFCC99" size="-7">° </font><font color="#336699"></font><font color="#336699">Date</font></div>
          </td>
          <td width="80"><font color="#336699">&nbsp;[</font>${date}<font color="#336699">]</font></td>
          <td width="60"> 
            <div align="right"><font color="#FFCC99" size="-7">° </font><font color="#336699"></font><font color="#336699">Time</font></div>
          </td>
          <td><font color="#336699">&nbsp;[</font><span id=clock style="position:relative;"></span><font color="#336699">]</font></td>
        </tr>
        <tr> 
          <td colspan="9" height="2" bgcolor="#E8E8E8"></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
