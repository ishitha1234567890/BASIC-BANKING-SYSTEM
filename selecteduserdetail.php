<?php
include 'config.php';

if(isset($_POST['submit']))
{
    $from = $_GET['id'];
    $to = $_POST['to'];
    $amount = $_POST['amount'];

    $sql = "SELECT * from cust where id=$from";
    $query = mysqli_query($conn,$sql);
    $sql1 = mysqli_fetch_array($query); //Output of user from which the amount is to be transferred.

    $sql = "SELECT * from cust WHERE id=$to";
    $query = mysqli_query($conn,$sql);
    $sql2 = mysqli_fetch_array($query);

    // Negative value by user
    if (($amount)<0)
   {
        echo '<script type="text/javascript">';
        echo ' alert("Oops! Negative values cannot be transferred")'; 
        echo '</script>';
    }

    //Insufficient balance.
    else if($amount > $sql1['balance']) 
    {

        echo '<script type="text/javascript">';
        echo ' alert("Bad Luck! Insufficient Balance")';  
        echo '</script>';
    }
    // Check zero values
    else if($amount == 0){

         echo "<script type='text/javascript'>";
         echo "alert('Oops! Zero value cannot be transferred')";
         echo "</script>";
     }


    else {

                // Deducting amount from sender's account
                $newbalance = $sql1['balance'] - $amount;
                $sql = "UPDATE cust set balance=$newbalance where id=$from";
                mysqli_query($conn,$sql);


                // Adding amount to reciever's account
                $newbalance = $sql2['balance'] + $amount;
                $sql = "UPDATE cust set Balance=$newbalance where id=$to";
                mysqli_query($conn,$sql);

                $sender = $sql1['Name'];
                $receiver = $sql2['Name'];
                $sql = "INSERT INTO transaction(`sender`, `receiver`, `balance`) VALUES ('$sender','$receiver','$amount')";
                $query=mysqli_query($conn,$sql);

                if($query){
                     echo "<script> alert('Congrats! Transaction is Successful');
                                     window.location='transactions.php';
                           </script>";

                }

                $newbalance= 0;
                $amount =0;
        }

}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<header>
 <nav>
        <div class="logo">
          <img
            src="logo_small.png"
            alt="" width="50px" height="56px">
            </div>
    <div>
        <li>
          <a href="index.php">HOME</a>
        </li>
        <li>
          <a href="customers.php">CUSTOMERS</a>
        </li>
        

</div>
</nav>
</header>
    <meta charset="UTF-8">
    <meta Name="viewport" content="width=device-width, initial-scale=1.0">
    <h1>MONEY TRANSACTION</h1>
    <link rel="stylesheet"  href="money.css">
    </style>
</head>

<body >


	<div class="container">
            <?php
                include 'config.php';
                $sid=$_GET['id'];
                $sql = "SELECT * FROM  cust where id=$sid";
                $result=mysqli_query($conn,$sql);
                if(!$result)
                {
                    echo "Error : ".$sql."<br>".mysqli_error($conn);
                }
                
            $rows=mysqli_fetch_array($result);
                ?>
               
            <form method="post" Name="tcredit" class="tabletext" ><br>
        <div>
            <table>
                <tr>
                    <th class="text-center">id</th>
                    <th class="text-center">Name</th>
                    <th class="text-center">Email-Id</th>
                    <th class="text-center">Balane(in Rs.)</th>
                </tr>
                <tr>
                    <td class="py-2"><?php echo $rows['id'] ?></td>
                    <td class="py-2"><?php echo $rows['Name'] ?></td>
                    <td class="py-2"><?php echo $rows['Email-Id'] ?></td>
                    <td class="py-2"><?php echo $rows['balance'] ?></td>
                </tr>
            </table>
        </div>
        <br><br><br>
        <label><b>TRANSFER MONEY:</b><br></label>
       <br>
        <select  Name="to" class="form-control" required>
            <option value="" disabled selected>SEND TO:</option>
            <?php
                include 'config.php';
                $sid=$_GET['id'];
                $sql = "SELECT * FROM cust where id!=$sid";
                $result=mysqli_query($conn,$sql);
                if(!$result)
                {
                    echo "Error ".$sql."<br>".mysqli_error($conn);
                }
                while($rows = mysqli_fetch_assoc($result)) {
            ?>
                <option class="table" value="<?php echo $rows['id'];?>" >

                    <?php echo $rows['Name'] ;?> (Balance: 
                    <?php echo $rows['balance'] ;?> ) 

                </option>
            <?php 
                } 
            ?>
            <div>
        </select>
        <br>
        <br>
            <label><b>AMOUNT:</b></label>
            <input type="number" class="form-control" Name="amount" required>   
            <br><br>
                <div >
            <button class="btn1" Name="submit" type="submit" id="myBtn" >TRANSFER MONEY</button>
            </div>
        </form>
    </div>
    <footer>
            <p>ISHITHA RAWAT    SPARKS FOUNDATION</p>
    </footer>

</body>
</html>
