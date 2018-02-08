<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>menu</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="CSS/T-mis.css" type="text/css">
<link rel="stylesheet" href="dist/themes/default/style.min.css" />
</head>

<body bgcolor="#336699" text="#000000" leftmargin="0" topmargin="0"
	marginwidth="0" marginheight="0">
	<!-- 
	<div id="jstree">
		<ul>
			<li>Root node 1
				<ul>
					<li id="child_node_1">Child node 1</li>
					<li>Child node 2</li>
				</ul>
			</li>
			<li>Root node 2</li>
		</ul>
	</div>
 -->
	<!-- 
	<div id="using_json_22">[{ "id" : "ajson1", "parent" : "#",
		"text" : "Simple root node" }, { "id" : "ajson2", "parent" : "#",
		"text" : "Root node 2" }, { "id" : "ajson3", "parent" : "ajson2",
		"text" : "Child 1" }, { "id" : "ajson4", "parent" : "ajson2", "text" :
		"Child 2" }]</div>
 -->
	<div id="teller_menu">${tellerMenu}</div>

	<script src="js/jquery-2.0.3.js"></script>
	<!-- 5 include the minified jstree source -->
	<script src="dist/jstree.min.js"></script>
	<script>
    var menu = document.getElementById('teller_menu').innerHTML;
    var json_obj = jQuery.parseJSON(menu);
    //console.log(menu);

    $(function() {
      /*
      $('#jstree').jstree({
      	//"plugins" : [ "wholerow", "checkbox" ],
      	"core" : {
      		"multiple" : false
      	}
      });
       */
      var menuArray = [];
      $.each(json_obj, function(index, element) {
        var menu_element = {
          "id" : element.id,
          "parent" : element.parent,
          "text" : element.text,
          "url" : element.url
        };
        menuArray.push(menu_element);
      });

      $('#teller_menu').jstree({
        'core' : {
          "multiple" : false,
          'data' : menuArray
        },
      });

      $('#teller_menu').bind("select_node.jstree", function(e, data) {
        var url = data.instance.get_node(data.selected[0]).original.url;
        var jspEnd = url.substr(url.length - 4);
        if (".jsp" == jspEnd) {
          //console.log(url);
          var url_without_jsp= url.substr(0, url.length - jspEnd.length)
          console.log(url_without_jsp);
          console.log(window.parent.mainFrame);
          window.parent.mainFrame.location = url_without_jsp;
        }
      });
    });
  </script>
</body>
</html>
