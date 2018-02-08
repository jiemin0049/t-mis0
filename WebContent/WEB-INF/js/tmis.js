<!--
//**********************************判断数据项非空**************************************//
function isEmpty(inputStr){
      if(inputStr.length == 0){
      return true
      }
      return false
}

//************直接调用函数判断数据项为空

function IsEmpty(inputStr, name){
    var inputValue = form1[inputStr].value
    var inputForm  = form1[inputStr]
    if (isEmpty(inputValue)){
        alert(name + "不能为空！")
        inputForm.focus()
        return true
    }
    return false
}

//***********************************验证数据类型***************************************//

//************判断数据项是integer型

function isInteger(inputVal){
     inputStr = inputVal.toString()
     for(var i = 0;i < inputStr.length;i++){
       var oneChar = inputStr.charAt(i)
       if(oneChar < "0" || oneChar > "9"){
         return false
      }
     }
     return true
}

//************直接调用函数判断数据项是integer型

function IsInteger(inputStr, name){
    var inputValue = form1[inputStr].value
    var inputForm  = form1[inputStr]
    if (isEmpty(inputValue)){
        alert(name + "不能为空！")
        inputForm.focus()
        return false
    }else if (!isInteger(inputValue)){
        alert(name + "应为整数！")
        inputForm.focus()
        return false
    }
    return true
}

//************判断数据项是double型

function isDouble(inputVal){
     inputStr = inputVal.toString()
     oneDecimal = false
     for(var i = 0;i < inputStr.length;i++){
       var oneChar = inputStr.charAt(i)
       if(oneChar == "." && !oneDecimal){
         oneDecimal = true
         continue
       }
       if(oneChar < "0" || oneChar > "9"){
         return false
       }
     }
     return true
}

//************判断金额16.2型

function IsAmt (inputStr,name){
    var inputValue = form1[inputStr].value
    var inputStr1 = inputValue.toString()
    var inputForm  = form1[inputStr]
    if(isEmpty(inputValue)){
        alert(name + "不能为空！")
        inputForm.focus()
        return false
    }
    else if(!isDouble(inputValue)){
        alert(name + "输入项应为double型！")
        inputForm.focus()
        return false
    }
    var i = inputStr1.indexOf(".")
    if ( (i == -1 && inputStr1.length > 14 ) || i > 14 )
    {
        alert(name + "整数部分不能大于14位！")
        inputForm.focus()
        return false
    }else if ( i != -1 && (inputStr1.length - i - 1) > 2 )
    {
        alert(name + "小数部分不能多于2位！")
        inputForm.focus()
        return false
    }
    return true
}

//***********判断利率8.6型

function IsRate (inputStr,name){
    var inputValue = form1[inputStr].value
    var inputStr1 = inputValue.toString()
    var inputForm  = form1[inputStr]
    if(isEmpty(inputValue)){
        alert(name + "不能为空！")
        inputForm.focus()
        return false
    }
    else if(!isDouble(inputValue)){
        alert(name + "输入项应为double型！")
        inputForm.focus()
        return false
    }
    var i = inputStr1.indexOf(".")
    if ( (i == -1 && inputStr1.length > 2 ) || i > 2 )
    {
        alert(name + "整数部分不能大于2位！")
        inputForm.focus()
        return false
    }else if ( i != -1 && (inputStr1.length - i - 1) > 6 )
    {
        alert(name + "小数部分不能多于6位！")
        inputForm.focus()
        return false
    }
    return true
}

//************判断两个double型数据项大小，后一数据项比前一数据项大

function isMaxer(inputVal1,inputVal2){
     input1 = parseFloat(inputVal1)
     input2 = parseFloat(inputVal2)
     if (input1 >= input2){
       return false
     }else{
       return true
     }
}

//************直接调用函数验证两个金额所有合法性
//************前者金额不能大于后者金额,State请传入1；后者金额必须大于前者金额，State请传入2

 function CompareAmt(beginAmt,baName,endAmt,eaName,State){
    var baValue = parseFloat(form1[beginAmt].value)
    var eaValue = parseFloat(form1[endAmt].value)
alert("传入参数为" + State)
     if (State != "1" && State != "2")
     {
         alert("最后一个参数请输入1或者2")
         return false
     }
     else if(!IsAmt(beginAmt,baName)){
         return false
     }
     else if (!IsAmt(endAmt,eaName))
     {
         return false
     }
     else if (State == "1" && baValue > eaValue)
     {
         alert(baName + "不能大于" + eaName)
         form1[beginAmt].focus()
         return false
     }
     else if (State == "2" && baValue >= eaValue)
     {
         alert(eaName + "必须大于" + baName)
         form1[beginAmt].focus()
         return false
     }
     else {
         return true
     }
 }

//************判断数据项为0

function isZero(inputStr){
    var inputVal = parseFloat(inputStr)
    if (inputVal == 0){
        return true
    }else{
        return false
    }
}

//***********************************验证日期的合法性************************************//

//*********判断输入项类型是否合法日期

function isCorrectDate(inputStr){
     if (inputStr.length != 8) {
       return false
     }
     for(var i = 0;i < 8;i++){
       var oneChar = inputStr.charAt(i)
       if(oneChar < "0" || oneChar > "9"){
         return false
       }
     }
    if (!isDate(inputStr)){
      return false
    }else{
      return true
    }
}
//*********判断是否闰年

function isRyear(inputInt){
      if (inputInt % 100 == 0 && inputInt % 400 == 0 || inputInt % 100 != 0 && inputInt % 4 == 0){
        return true
      }else{
        return false
      }
}
//*********判断日期是否合法

function isDate(inputStr){
      var year = parseFloat(inputStr.substring(0,4))
      var month = parseFloat(inputStr.substring(4,6))
      var day = parseFloat(inputStr.substring(6,8))
      if (month < 1 || month > 12 || day < 1 || day > 31 || year < 1000 || year > 2050){
        return false
      }
      else if ((month == 4 || month == 6 || month == 9 || month ==11) && (day > 30)){
        return false
      }
      else if (isRyear(year) && month == 2 && day > 29 || !isRyear(year) && month == 2 && day > 28){
        return false
      }else{
        return true
      }
}

//*********直接调用函数验证日期所有合法性

 function CheckDate(inputStr,name) {
    var inputValue = form1[inputStr].value
    var inputForm  = form1[inputStr]
    if(isEmpty(inputValue)){
        alert(name + "不能为空！")
        inputForm.focus()
        return false
    }
    else if(!isInteger(inputValue)){
        alert(name + "输入项应为整数！")
        inputForm.focus()
        return false
    }
    else if (!isCorrectDate(inputValue))
    {
        alert(name + "输入格式不合法！\n正确输入应为YYYYMMDD格式！")
        inputForm.focus()
        return false
    }
    else{
        return true
    }
 }

//*********发生日期不能大于终结日期*****(直接调用函数验证两个日期所有合法性)

 function CompareDate1(beginDate,bdName,endDate,edName){
    var bdValue = form1[beginDate].value
    var edValue = form1[endDate].value
     if(!CheckDate(beginDate,bdName)){
         return false
     }
     else if (!CheckDate(endDate,edName))
     {
         return false
     }
     else if (bdValue > edValue)
     {
         alert(bdName + "不能大于" + edName)
         form1[beginDate].focus()
         return false
     }
     else {
         return true
     }
 }

//*********终结日期必须大于发生日期*****(直接调用函数验证两个日期所有合法性)

 function CompareDate2(beginDate,bdName,endDate,edName){
    var bdValue = form1[beginDate].value
    var edValue = form1[endDate].value
     if(!CheckDate(beginDate,bdName)){
         return false
     }
     else if (!CheckDate(endDate,edName))
     {
         return false
     }
     else if (bdValue >= edValue)
     {
         alert(edName + "必须大于" + bdName)
         form1[beginDate].focus()
         return false
     }
     else {
         return true
     }
 }

//************发生日期不能大于终结日期,State请传入1；终结日期必须大于发生日期State请传入2

 function CompareDate(beginDate,bdName,endDate,edName,State){
//alert("传入参数为" + State)
     if (State != "1" && State != "2")
     {
         alert("最后一个参数请输入1或者2")
         return false
     }
    if(State == "1" && !CompareDate1(beginDate,bdName,endDate,edName)){
         return false
    }
    else if (State == "2" && !CompareDate2(beginDate,bdName,endDate,edName))
    {
        return false
    }
    else {
         return true
    }
 }

//*************************************验证时间的合法性****************************************//

//************判断输入项类型是否合法时间

function isCorrectTime(inputStr){
     if (inputStr.length != 4) {
       return false
     }
     for(var i = 0;i < inputStr.length;i++){
       var oneChar = inputStr.charAt(i)
       if(oneChar < "0" || oneChar > "9"){
         return false
       }
     }
    if (!isTime(inputStr)){
      return false
    }else{
      return true
    }
}

//************判断时间是否合法

function isTime(inputStr){
      var hour = parseFloat(inputStr.substring(0,2))
      var minute = parseFloat(inputStr.substring(2,4))
//      var second = parseFloat(inputStr.substring(4,6))
//      if (hour < 0 || hour > 24 || minute < 0 || minute > 59 || second < 0 || second > 59){
      if (hour < 0 || hour > 24 || minute < 0 || minute > 59){
           return false
      }
      else if(hour == 24 && minute > 0) {
           return false
      }
      else{
           return true
      }
}

//*********直接调用函数验证时间所有合法性

 function CheckTime(inputStr,name) {
    var inputValue = form1[inputStr].value
    var inputForm  = form1[inputStr]
    if(isEmpty(inputValue)){
        alert(name + "不能为空！")
        inputForm.focus()
        return false
    }
    else if(!isInteger(inputValue)){
        alert(name + "输入项应为整数！")
        inputForm.focus()
        return false
    }
    else if (!isCorrectTime(inputValue))
    {
        alert(name + "输入类型不合法！\n正确输入应为HHMM格式！")
        inputForm.focus()
        return false
    }
    else{
        return true
    }
 }

//************起始时间不能大于截止时间,State请传入1；截止时间必须大于起始时间，State请传入2

 function CompareTime(beginTime,bdName,endTime,edName,State){
//alert("传入参数为" + State)
    var bdValue = form1[beginTime].value
    var edValue = form1[endTime].value
     if (State != "1" && State != "2")
     {
         alert("最后一个参数请输入1或者2")
         return false
     }
     else if(!CheckTime(beginTime,bdName)){
         return false
     }
     else if (!CheckTime(endTime,edName))
     {
         return false
     }
     else if (State == "1" && bdValue > edValue)
     {
         alert(bdName + "不能大于" + edName)
         form1[beginTime].focus()
         return false
     }
     else if (State == "2" && bdValue >= edValue)
     {
         alert(edName + "必须大于" + bdName)
         form1[beginTime].focus()
         return false
     }
     else {
         return true
     }
 }


//***********************************提交表单的验证 ************************************//

//************修改确认按钮

function ModifyAction(URL,State){
    //alert("ModifyAction(URL,State)函数时\n如果State不传参数将不对表单进行验证\n如果State传入参数为1表示需要验证表单");
    if(URL == null || URL ==""){
        if(confirm("你确认修改该选择项？")){
            window.document.form1.SELECTBUTTON.value="0";
            document.form1.submit();
        }
    }else if (URL == 1){
        if(check()){
            if(confirm("你确认修改该选择项？")){
                window.document.form1.SELECTBUTTON.value="0";
                document.form1.submit();
            }
        }
    }else if (URL != 1 && (State == null || State == "")){
        if(confirm("你确认修改该选择项？")){
            window.document.form1.action = URL;
            document.form1.submit();
        }
    }else if (URL != 1 && State == 1){
        if(check()){
            if(confirm("你确认修改该选择项？")){
                window.document.form1.action = URL;
                document.form1.submit();
            }
        }
    }
    }


//************删除确认

function DeleteAction(URL,State){
//alert("传入参数为" + State)
//  alert("调用DeleteAction(URL,State)函数时\n如果State不传参数将不对表单进行验证\n如果State传入参数为1表示要验证表单");
    if(URL == null || URL ==""){
        if(confirm("你确认删除该选择项？？")){
            window.document.form1.SELECTBUTTON.value="1";
            document.form1.submit();
        }
    }else if (URL == 1){
        if(check()){
            if(confirm("你确认删除该选择项？？")){
                window.document.form1.SELECTBUTTON.value="1";
                document.form1.submit();
            }
        }
    }else if (URL != 1 && (State == null || State == "")){
        if(confirm("你确认删除该选择项？")){
            window.document.form1.action = URL;
            document.form1.submit();
        }
    }else if (URL != 1 && State == 1){
        if(check()){
            if(confirm("你确认删除该选择项？")){
                window.document.form1.action = URL;
                document.form1.submit();
            }
        }
    }
}
//************提交到指定页面

function SubmitAction(URL,State){
//alert("传入参数为" + State)
//  alert("调用SubmitAction(URL,State)函数时\n如果State不传参数将不对表单进行验证\n如果State传入参数为1表示需要要验证表单");
    if(URL == null || URL ==""){
        document.form1.submit();
    }else if (URL == 1){
        go();
    }else if (URL != 1 && (State == null || State == "")){
        window.document.form1.action = URL;
        document.form1.submit();
    }else if (URL != 1 && State == 1){
        window.document.form1.action = URL;
        go();
    }
}
//************页面提交一次之后按钮失效

var bOnce = true;
function OnceSubmitCheck(){
    if(bOnce){
        if(check()){
            if(confirm("处理数据需要一些时间！请耐心等候！\n您确定将提交本页？")){
                bOnce = false;
                document.form1.submit();
            }
        }
    }

}

//************不需要验证表单的
function OnceSubmit(){
    if(bOnce){
        if(confirm("处理数据需要一些时间！请耐心等候！\n您确定将提交本页？")){
            bOnce = false;
            document.form1.submit();
        }
    }

}

//************提交表单一次后按钮失效

function OnceSubmitState(URL,State){
alert("传入参数为" + State)
    if(URL == null || URL ==""){
        if(bOnce){
            if(confirm("处理数据需要一些时间！请耐心等候！\n您确定将提交本页？")){
                bOnce = false;
                document.form1.submit();
            }
        }
    }else if (URL == 1){
        if(bOnce){
            if(check()){
                if(confirm("处理数据需要一些时间！请耐心等候！\n您确定将提交本页？")){
                    bOnce = false;
                    document.form1.submit();
                }
            }
        }
    }else if (URL != 1 && (State == null || State == "")){
        window.document.form1.action = URL;
        if(bOnce){
            if(confirm("处理数据需要一些时间！请耐心等候！\n您确定将提交本页？")){
                bOnce = false;
                document.form1.submit();
            }
        }
    }else if (URL != 1 && State == 1){
        window.document.form1.action = URL;
        if(bOnce){
            if(check()){
                if(confirm("处理数据需要一些时间！请耐心等候！\n您确定将提交本页？")){
                    bOnce = false;
                    document.form1.submit();
                }
            }
        }
    }
}


//************返回到WorkArea
 function toWorkArea() {
     if(confirm("您确认将返回Tmis系统首页吗？")){
        location.replace("/webtmis/MainMenu/WorkArea.jsp");
     }
 }


 //************返回到任意页面(URL为要返回的页面)
 function doReplace(URL) {
    if(URL == null){
         if(confirm("您确认将返回Tmis系统首页吗？")){
            location.replace("/webtmis/MainMenu/WorkArea.jsp");
         }
    }else{
        location.replace(URL);
    }

 }

//************返回上一页
 function Back() {
     history.back();
 }

//************提交表单
function go() {
     if(check()){
        document.form1.submit();
     }
 }

//************打开一个新窗口

function openNewWindow(URL) {
    var page = URL;
    windowprops = "height=350,width=500,location=no,scrollbars=yes,status=no,menubars=no,toolbars=no,resizable=yes";
    window.open(page, "Popup", windowprops);
//  self.moveTo(0,0);
}

//************打印窗口
function Print(){
    window.print();
}
//-->