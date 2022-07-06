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
        <th>Release Date</th>
        <th>Race</th>
</tr>
</body>
</html>

<?php
    include('connect.php');
    if (isset($_POST["vendor"]))
    { 
      $selectedVendor = $_POST["vendor"]; 
      $sth = $dbh->prepare("SELECT name, release_date, race FROM cars INNER JOIN rent ON ID_Cars=FID_Car WHERE :selectedVendor NOT BETWEEN date_start and date_end");
      $sth->execute(array(':selectedVendor' => $selectedVendor));

      echo "<h4>Автомобили ".$selectedVendor."</h4>";
      while ($table = $sth->fetch()) 
      {
          $name = $table['name'];
          $release_date = $table['release_date'];
          $race =  $table['race'];
          print "<tr> <td>$name</td> <td>$release_date</td> <td>$race</td> </tr>";
      }
  }
?>