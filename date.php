<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Lab1</title>
  <link href="style.css" rel="stylesheet">
</head>

<body>
    <table>
    <tr>
        <th>Name</th>
        <th>Income</th>
</tr>
</body>
</html>

<?php
    include('connect.php');
    if (isset($_POST["date"]))
    {
        $selectedDate = $_POST["date"];
        $sth = $dbh->prepare("SELECT name, date_start, time_start, cost FROM cars INNER JOIN rent ON ID_Cars=FID_Car WHERE :selectedDate BETWEEN date_start and date_end");
        $sth->execute(array(':selectedDate' => $selectedDate));

        echo "<h4>Доход с проката по состоянию на ".date ( 'd-m-Y h:i:s' , strtotime($selectedDate)). "</h4>";
        while ($table = $sth->fetch()) 
        {
            $name = $table['name'];
            $income = (strtotime($selectedDate) - strtotime($table["date_start"]."T".$table["time_start"]))/3600*$table["cost"];
            print "<tr> <td>$name</td> <td>$income</td> </tr>";
        }
  }
?>