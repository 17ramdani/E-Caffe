<?php
  include "connection/koneksi.php";
  ob_start();
  session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="assets/vendor/material-icon/css/material-design-iconic-font.min.css">
    <!-- Main css -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/register.css">
</head>
<body>

    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="post" id="signup-form" class="signup-form">
                        <h2 class="form-title">Create account</h2>
                        <div class="form-group">
                            <input type="text" class="form-input" name="nama_user" id="name" placeholder="Your Name"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="username" id="name" placeholder="Username"/>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="password" id="password" placeholder="Password"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Level Pengguna</label>
                            <div class="controls">
                                <select class="form-select" name="id_level">
                                    <!--<option value="1">Administrator</option>-->
                                    <option value="2">Waiter</option>
                                    <option value="3">Kasir</option>
                                    <option value="4">Owner</option>
                                    <option value="5">Pelanggan</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in Terms of service</a></label>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="kirim_daftar" id="submit" class="form-submit">Sign Up</button>
                        </div>
                    </form>
                    <?php
                    if(isset($_POST['kirim_daftar'])){
                        $nama_user = $_POST['nama_user'];
                        $username = $_POST['username'];
                        $password = $_POST['password'];
                        $id_level = $_POST['id_level'];
                        $status = 'nonaktif';
                        //echo "<br>";
                        //echo $nama_user . " || " . $username . " || " . $password . " || " . $id_level . " || " . $status;
                        //echo "<br></br>";
                        $query_daftar = "insert into tb_user values ('','$username','$password','$nama_user','$id_level','$status')";
                        $sql_daftar = mysqli_query($conn, $query_daftar);
                        if($sql_daftar){
                            header('location: loginuser.php');
                            $_SESSION['daftar'] = 'sukses';
                        }
                        }
                    ?>
                    <p class="loginhere">
                        Have already an account ? <a href="loginuser.php" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/js/register.js"></script>
</body>
</html>
<?php 
  ob_flush();
?>
