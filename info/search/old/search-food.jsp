<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
    <div style="margin: auto;width:30%;padding-top:50px">
        <form id="form1" name="form1" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder='Search by rollno...' id="roll_no"><br>
                <p align="center"><button type="submit" class="btn btn-primary btn-default" id="search">Submit</button>
                </p><br>
                <label for="city">Display city name of student:</label>
                <input type="text" class="form-control" placeholder='Name' id="name"><br><br>
            </div>
        </form>
    </div>
    <script>
    $(document).ready(function() {
        $("#search").click(function () {
            var roll_no = $('#roll_no').val();
            $.ajax({
                url: "fetch-food.jsp",
                type: 'POST',
                data: { roll_no: roll_no },
                success: function (data) {
                    $('#name').val(data);
                    //alert(data);
                }
            });

            return false; // stop reload
        });
    });
    </script>
</body>

</html>