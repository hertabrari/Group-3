<!DOCTYPE html>
<html lang="en">
<?php require 'dbconn.php';
require 'header.php';
?>
<body>
	<?php require 'navbar.php' ;	?>
	<div id="mySidenav" class="sidenav">
	<a href="dashboard.php" id="dashboard">Go Home<span class="glyphicon glyphicon-home"></span></a>
  <a href="view_tickets.php" id="view">View Tickets<span class="glyphicon glyphicon-qrcode"></span></a>
  <a href="cancelTicket.php" id="cancel">Cancel Tickets<span class="glyphicon glyphicon-remove-circle"></span></a>
  <a href="index.php" id="profile">Your Profile<span class="glyphicon glyphicon-user"></span></a>
	</div>
	<div class="container">
		<div class="alert alert-success">
		  <strong>Your ticket is ready! </strong> 
		</div>
	</div>
	<?php
	require 'db_init.php';
	$userID = $_SESSION['UserID'];
	$bid = $_GET['bid'];
	$seat = $_GET['seat'];
	$sql_instance="SELECT * FROM busDB.seat_matrix JOIN busDB.routes ON busDB.seat_matrix.RID = busDB.routes.RID WHERE Passenger=".$userID." AND BID=".$bid." AND SeatNo=".$seat.";";
	$result = $conn->query($sql_instance);
	$row = $result->fetch_assoc();
	$qr_pass = '<<Projectworlds Digital Ticket>><Journey Date - '.$row['BusDate'].'><Route ID - '.$row['RID'].'><Seat Number - '.$row['SeatNo'].'><Passenger ID - '.$row['Passenger'].'><<Projectworlds!>>';
	echo '<center><div class="container-fluid">
					<div class="card bg-info text-white" style="width:30%">
						<br><br>
						<center><img class="card-img-top" src="qr_gen.php?id='.$qr_pass.'" alt="Card image"><center>
					  <div class="card-body">
					    <center><h3 class="card-title">ETMS Digital Ticket</h3>
					    <h4 class="card-text">Journey Date - '.$row['BusDate'].'</h4>
							<h4 class="card-text">Route ID - '.$row['RID'].' </h4>
							<h4 class="card-text">Departure at - <strong> '.$row['STime'].' </strong>  from <strong> '.$row['Src'].' </strong></h4>
							<h4 class="card-text">Arrival at - <strong> '.$row['DTime'].' </strong>  near <strong> '.$row['Dst'].' </strong></h4>
							<h4 class="card-text">Seat Number - <strong> '.$row['SeatNo'].' </strong></h4>
							<h4 class="card-text">Passenger ID - '.$row['Passenger'].' </h4>
							<br><br>
					  </div>
					</div>
				</div></center>'

	?>

	<?php require 'footer.php' ?>

</body>
