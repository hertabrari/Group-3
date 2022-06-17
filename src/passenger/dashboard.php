<!DOCTYPE html>
<html lang="en">
<?php
require 'header.php';
?>
<body>
<style>
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }

    .glyphicon.glyphicon-send {
    font-size: 150px;
    }

    .glyphicon.glyphicon-bookmark {
    font-size: 150px;
    }

    .glyphicon.glyphicon-remove-circle {
    font-size: 150px;
    }

    .glyphicon.glyphicon-list-alt {
    font-size: 150px;
    }

    .glyphicon.glyphicon-user {
    font-size: 150px;
    }

    .glyphicon.glyphicon-edit {
    font-size: 150px;
    }
    .glyphicon.glyphicon-bullhorn {
    font-size: 150px;
    }
    .glyphicon.glyphicon-qrcode {
    font-size: 150px;
    }
  </style>
<?php require 'navbar.php';require 'seatPopulate.php'; ?>



</div><br><br>
<div class="container-fluid bg-3 text-center">

  <h2><i class="fas fa-ticket-alt"></i>&nbsp;Ticket Window&nbsp;<i class="fas fa-ticket-alt"></i></h2><br>
  <div class="row">
    <div class="col-sm-3">
      <h3>Book Ticket</h3><br>
      <button type = "button" class = "btn btn-link btn-block">
        <a href="bookTicket.php"><span class="glyphicon glyphicon-send"></span></a>
      </button>

    </div>
    <div class="col-sm-3">
      <h3>View Ticket</h3><br>
      <button type = "button" class = "btn btn-link btn-block">
        <!--<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">-->
        <a href="view_tickets.php"><span class="glyphicon glyphicon-qrcode"></span></a>
      </button>
    </div>
    <div class="col-sm-3">
      <h3>Cancel Ticket</h3><br>
      <button type = "button" class = "btn btn-link btn-block">
        <a href="cancelTicket.php"><span class="glyphicon glyphicon-remove-circle"></span></a>
      </button>
    </div>
    <div class="col-sm-3">
      <h3>Weekly Bus Schedule</h3><br>
      <button type = "button" class = "btn btn-link btn-block">
        <a href="schedule.php"><span class="glyphicon glyphicon-list-alt"></span></a>
      </button>
    </div>
  </div>
</div><br><br>



<div class="container-fluid bg-3 text-center">
 
  <div class="col-sm-3">
      <h3>Your Profile</h3><br>
      <button type = "button" class = "btn btn-link btn-block">
        <a href="profile.php"><span class="glyphicon glyphicon-user"></span></a>
      </button>
    </div>
  
  <div class="row">
    <div class="col-sm-3">
      <h3>About ETMS</h3><br>
      <button type = "button" class = "btn btn-link btn-block">
        <a href="../aboutus.php"><span class="glyphicon glyphicon-bookmark"></span></a>
      </button>
    </div>
    
   
  </div>
</div><br><br>

<?php require 'footer.php';?>

</body>
</html>
