<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html>
<head>
  <style>
  .role{
      font-size: small;
      color: #a0f;    
  }   
  .name{
      font-size: small;
      color: #a00;
  }   
  .nodeClass {
    vertical-align: top; /* here */
  }
  </style>
</head>
<body>
  <div id="orgchart1"></div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script>
    $.urlParam = function(name){
        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
        if (results==null) {
            return null;
        }
        return decodeURI(results[1]) || 0;
    }
  var gid = $.urlParam('gid');
  if (gid == null) gid = '0';
  console.log(gid);  

  </script>

  <script type="text/javascript">
    google.charts.load('current', {'packages' : ['orgchart', 'table']});
    google.charts.setOnLoadCallback(function() { initialize(gid, 'orgchart1') });

    function initialize(gid, divChart) {
      
      var dataSourceUrl = 'https://docs.google.com/spreadsheets/d/15Dx8NF_2_L4rRFz0sH599ahJFxWzPudZmW7CcTKSjsk/gviz/tq?tqx=out:json&tq&gid='+gid;

      // Tells it that the first row contains headers: 'Role', 'Reports To', 'Name'
      var query = new google.visualization.Query(dataSourceUrl + '&headers=1');

      // Send the query with a callback function.
      query.send( function(response) {
        // Called when the query response is returned.
        if (response.isError()) {
          alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
          return;
        }

        var raw_data = response.getDataTable();
        var data = new google.visualization.DataTable();

        data.addColumn('string', 'reportsTo');
        data.addColumn('string', 'role');
        data.addColumn('string', 'name');

        // Loops through all rows and populates a new DataTable with formatted values for the orgchart
        var num_rows = raw_data.getNumberOfRows();
        for (var i = 0; i < num_rows; i++) {
          var role = raw_data.getValue(i, 1);
          var reportsTo = raw_data.getValue(i,0);
          var name = raw_data.getValue(i,2) != null ? raw_data.getValue(i,2) : '';

          // org chart 는 role, report, name 순으로 들어가야함. moon
          data.addRows([[
            { v: role,
              f: "<div class='name'>" + name + "</div>" + "<div class='role'>" + role + "</div>"
            }, 
            reportsTo, 
            name]]);
        }

        // Loops through all rows and populates a new DataTable with formatted values for the orgchart
        var container = document.getElementById(divChart);
        var chart = new google.visualization.OrgChart(container);
        chart.draw(data, {allowHtml:true, 'size': 'large'});
      })
    }      
  </script>
</body>
</html>