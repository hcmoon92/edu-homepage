<html>
<head>
  <style>
  .role{
      font-size: small;
      color: #1aa;
  }   
  </style>
</head>
<body>
  <div id="orgchart1"></div>
  <div id="orgchart2"></div>
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
    google.charts.setOnLoadCallback(function() { initialize1('') });
    google.charts.setOnLoadCallback(function() { initialize2('') });

    function initialize1() {
      document.getElementById('orgchart1').innerHTML = "<i class='fa fa-spinner fa-spin fa-3x fa-fw'></i>";
      
      var dataSourceUrl = 'https://docs.google.com/spreadsheets/d/15Dx8NF_2_L4rRFz0sH599ahJFxWzPudZmW7CcTKSjsk/gviz/tq?tqx=out:json&tq&gid=0';

      // Tells it that the first row contains headers: 'Role', 'Reports To', 'Name'
      var query = new google.visualization.Query(dataSourceUrl + '&headers=1');

      // Send the query with a callback function.
      query.send(handleQueryResponse1);
    }

    function handleQueryResponse1(response) {
      // Called when the query response is returned.
      if (response.isError()) {
        alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
        return;
      }

      var raw_data = response.getDataTable();
      var data = new google.visualization.DataTable();

      data.addColumn('string', 'Entity');
      data.addColumn('string', 'ParentEntity');
      data.addColumn('string', 'ToolTip');

      // Loops through all rows and populates a new DataTable with formatted values for the orgchart
      var num_rows = raw_data.getNumberOfRows();
      for (var i = 0; i < num_rows; i++) {
        var role = raw_data.getValue(i, 0);
        var reportsTo = raw_data.getValue(i,1);
        var name = raw_data.getValue(i,2) != null ? raw_data.getValue(i,2) : '';

        data.addRows([[
          { v: role,
            f: "<div class='name'>" + name + "</div>" + "<div class='role'>" + role + "</div>"
          }, 
          reportsTo, 
          name]]);
      }

      // Loops through all rows and populates a new DataTable with formatted values for the orgchart
      var container = document.getElementById('orgchart1');
      var chart = new google.visualization.OrgChart(container);
      chart.draw(data, {allowHtml:true, 'size': 'large'});
    }      

    gid = '523538469';

    function initialize2() {
      document.getElementById('orgchart2').innerHTML = "<i class='fa fa-spinner fa-spin fa-3x fa-fw'></i>";

      var dataSourceUrl = 'https://docs.google.com/spreadsheets/d/15Dx8NF_2_L4rRFz0sH599ahJFxWzPudZmW7CcTKSjsk/gviz/tq?tqx=out:json&tq&gid='+gid;

      // Tells it that the first row contains headers: 'Role', 'Reports To', 'Name'
      var query = new google.visualization.Query(dataSourceUrl + '&headers=1');

      // Send the query with a callback function.
      query.send(handleQueryResponse2);
    }

    function handleQueryResponse2(response) {
      // Called when the query response is returned.
      if (response.isError()) {
        alert('Error in query: ' + response.getMessage() + ' ' + response.getDetailedMessage());
        return;
      }

      var raw_data = response.getDataTable();
      var data = new google.visualization.DataTable();

      data.addColumn('string', 'Entity');
      data.addColumn('string', 'ParentEntity');
      data.addColumn('string', 'ToolTip');

      // Loops through all rows and populates a new DataTable with formatted values for the orgchart
      var num_rows = raw_data.getNumberOfRows();
      for (var i = 0; i < num_rows; i++) {
        var role = raw_data.getValue(i, 0);
        var reportsTo = raw_data.getValue(i,1);
        var name = raw_data.getValue(i,2) != null ? raw_data.getValue(i,2) : '';

        data.addRows([[
          { v: role,
            f: "<div class='name'>" + name + "</div>" + "<div class='role'>" + role + "</div>"
          }, 
          reportsTo, 
          name]]);
      }

      // Loops through all rows and populates a new DataTable with formatted values for the orgchart
      var container = document.getElementById('orgchart2');
      var chart = new google.visualization.OrgChart(container);
      chart.draw(data, {allowHtml:true, 'size': 'large'});
    }    
    
          
  </script>
</body>
</html>