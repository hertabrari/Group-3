<!DOCTYPE html>
<html lang="en">
  <?php
      require 'dbconn.php';
      require 'header.php';
  ?>
<body>
	<?php
    require 'navbar.php';
    require 'db_init.php';
    $userID = $_SESSION['UserID'];
    $bid = $_GET['bid'];
    $seat = $_GET['seat'];
    $sql_start="SET AUTOCOMMIT = OFF; START TRANSACTION;";
    $result = $conn->query($sql_start);
    $sql_instance="UPDATE busDB.seat_matrix SET Passenger = NULL WHERE Passenger=".$userID." AND BID=".$bid." AND SeatNo=".$seat.";";
    $sql_seat="UPDATE busDB.bus_instances SET Seats_Left = Seats_Left + 1 WHERE BID=".$bid.";";
    if(($conn->query($sql_instance) == TRUE)&&($conn->query($sql_seat) == TRUE))
    {
      $sql_commit = "COMMIT;";
      $result = $conn->query($sql_commit);
     
      header('Location: cancelTicket.php?alert=1');
    }
    else
    {
      echo $conn->error;
      $sql_rollback = "ROLLBACK;";
      $result = $conn->query($sql_rollback);
      echo 'Sorry, there was a problem ';
    }
  ?>
</body>
