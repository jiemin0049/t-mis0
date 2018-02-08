
<%
  //*********定义用于控制全局的布尔型变量和错误信息变量及全局变量
			boolean bFlag = true;
			String sErrMsg = "";
			String sTellId = "";
			String sUnitNo = "";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 程序员添加任何代码，只能在可编辑区域进行编辑或者<html>标记前，否则将破坏整个静态页面的模板管理！ --%>
<html>
<!-- #BeginTemplate "/Templates/yywh.dwt" -->
<head>
<!-- #BeginEditable "doctitle" -->
<title>机构增加</title>
<!-- #EndEditable -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../CSS/T-mis.css" type="text/css">
<script language="JavaScript" src="../js/tmis.js">
  function check() {
    return true;
  }
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="221" height="70"><img src="../images/yywh.jpg"
				width="220" height="70"></td>
			<td width="412" height="69" valign="baseline">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" height="1">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					height="1">
					<tr>
						<td valign="baseline" width="46%">
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								bgcolor="#E8E8E8" height="1">
								<tr>
									<td height="1"></td>
								</tr>
							</table>
						</td>
						<td width="25%" align="center"><b><font color="#4F4F4F">
									<!-- #BeginEditable "title" -->机构增加<!-- #EndEditable -->
							</font></b></td>
						<td width="29%" valign="baseline">
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								bgcolor="#E8E8E8" height="1">
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
						<td height="10"></td>
					</tr>
				</table> <!-- #BeginEditable "main" --> <%-- **************可编辑区域开始****************** --%>
				<script language="javascript">
          function check() {
            if (IsEmpty("QUNITNO", "机构号")) {
              return false
            } else if (IsEmpty("QUNITNAME", "机构名称")) {
              return false
            } else if (IsEmpty("UNITPARENT", "上级机构号")) {
              return false
            } else if (IsEmpty("UNITTELLERPRE", "操作员号前缀")) {
              return false
            } else {
              return true
            }
          }
        </script> <%
   if (bFlag) {
 %>
				<form name="form1" action="W7312_02" method="post">
					<table border="0" cellspacing="0" cellpadding="4" align="center"
						height="0">
						<tr>
							<td width="0" nowrap>机 构 号 ： <input type="text" name="no"
								size="15" class="text" maxlength="11">
							</td>
							<td nowrap>
								<p>
									机构 名称 ： <input type="text" name="name" size="20" class="text"
										maxlength="20">
								</p>
							</td>
						</tr>
						<tr>
							<td width="0" nowrap>操作员号前缀： <input type="text"
								name="tellerpre" size="15" class="text" maxlength="2">
							</td>
							<td nowrap>上级机构号 ： <input type="text" name="parent"
								size="15" class="text" maxlength="11">
							</td>
						</tr>
						<tr>
							<td width="0" nowrap>级 别 ： <select name="clazz"
								class="select" size="1">
									<option>0-营业网点</option>
									<option>1-分理处</option>
									<option>2-支行</option>
									<option>3-二级分支行</option>
									<option>4-一级分支行</option>
									<option>5-总行</option>
							</select>
							</td>
							<td nowrap>营业机构类型： <select name="type" class="select"
								size="1">
									<option>0-非网点</option>
									<option>1-储蓄</option>
									<option>2-会计</option>
									<option>3-卡</option>
									<option>4-综合</option>
									<option>5-其它</option>
							</select>
							</td>
						</tr>
						<tr>
							<td colspan="2" nowrap>备 注 ： <input type="text"
								name="description" size="30" class="text" maxlength="30">
								<b></b></td>
						</tr>
						<tr>
							<td colspan="2" width="0" nowrap>
								<div align="center">
									<input type="submit" name="Submit4" value="确 定" 										class="button"> <input type="reset" name="Submit22"
										value="重 置" class="button"> <input type="button"
										name="Submit32" value="取 消" onClick="doReplace()"
										class="button">
								</div>
							</td>
						</tr>
					</table>
				</form> <%
   } else {
 %> <%-- 
********下面是导入一个交易失败的页面的代码
********成功页面为：done.htm
********错误页面为：error.htm
********系统错误为：warning.htm
 --%> <br> <br>
				<center>
					<b><%=sErrMsg%></b><br> <br> <input type="button"
						name="back" onClick="doReplace()" value="返 回" class="button">
				</center> <br> <%
   }
 %> <%-- **************可编辑区域结束****************** --%> <!-- #EndEditable -->
			</td>
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
