<?php

include "connection/koneksi.php";
session_start();
if (isset($_SESSION['username'])) {
	header('location: beranda.php');
} else {

?>

	<!DOCTYPE html>
	<html lang="en">

	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/css/login.css">
		<title>Login User</title>
	</head>

	<body>
		<div class="container py-5 ">
			<div class="row d-flex justify-content-center align-items-center " style="border-radius: 1rem;">
				<div class="col col-xl-10" style="border-radius: 1rem;">
					<div class="card shadow-lg" style="border-radius: 1rem;">
						<div class="row g-0">
							<div class="col-md-6 col-lg-5 d-none d-md-block">
								<img src="assets/img/login.png" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
							</div>
							<div class="col-md-6 col-lg-7 d-flex align-items-center">
								<div class="card-body p-4 p-lg-5 text-black shadow" style="background: #d6d6d6; border-radius: 1rem;">

									<form method="POST">
										<?php
										if (isset($_SESSION['eror'])) {
										?>
											<div class='alert alert-danger'>
												<span>
													<center>Mungkin Akun Anda Salah Atau Belum Divalidasi</center>
												</span>
											</div>
										<?php
											unset($_SESSION['eror']);
										}
										?>
										<div class="d-flex align-items-center mb-3 pb-1">
											<span class="h1 fw-bold mb-0">Login</span>
										</div>

										<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

										<div class="form-outline mb-4">
											<label class="form-label" for="form2Example17">Username</label>
											<input type="text" id="form2Example17" name="username" class="form-control form-control-lg" placeholder="Username" />
										</div>

										<div class="form-outline mb-4">
											<label class="form-label" for="form2Example27">Password</label>
											<input type="password" id="form2Example27" name="password" class="form-control form-control-lg" placeholder="Password" />
										</div>

										<div class="pt-1 mb-4">
											<input type="submit" value="Login" name="login" class="btn btn-warning">
										</div>
										<?php
										if (isset($_SESSION['username'])) {
										?>
											<div class="text-center w-full">
												<a class="txt1" href="logout.php">
													Log Out
													<i class="fa fa-long-arrow-right"></i>
												</a>
											</div>
											<?php

											?>

										<?php
										}
										?>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php
		if (isset($_REQUEST['login'])) {
			$arr_level = array();
			$c_level = mysqli_query($conn, "select * from tb_level");

			while ($r = mysqli_fetch_array($c_level)) {
				array_push($arr_level, $r['nama_level']);
			}
			foreach ($arr_level as $kontens) {
				//echo $kontens." || ";
			}
			$username = $_REQUEST['username'];
			$password = $_REQUEST['password'];

			$akun = mysqli_query($conn, "select * from tb_user natural join tb_level");
			echo mysqli_error($conn);
			while ($r = mysqli_fetch_array($akun)) {
				if ($r['username'] == $username and $r['password'] == $password and $r['status'] == 'aktif') {
					$_SESSION['username'] = $username;
					$_SESSION['id_user'] = $r['id_user'];
					$_SESSION['level'] = $r['id_level'];
					if (isset($_SESSION['eror'])) {
						unset($_SESSION['eror']);
					}
					header('location: beranda.php');
					//echo "<br>";
					//echo $r['username'] . " || " . $r['password'] . " || " . $r['id_level'] . " || " . $r['nama_level'];
					//echo "<br></br>";
					break;
				} else {
					$_SESSION['eror'] = 'salah';
					header('location: loginuser.php');
				}
			}
		}
		?>
		<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="template/masuk/vendor/jquery/jquery-3.2.1.min.js"></script>
		<!--===============================================================================================-->
		<script src="template/masuk/vendor/bootstrap/js/popper.js"></script>
		<script src="template/masuk/vendor/bootstrap/js/bootstrap.min.js"></script>
		<!--===============================================================================================-->
		<script src="template/masuk/vendor/select2/select2.min.js"></script>
		<!--===============================================================================================-->
		<script src="template/masuk/js/main.js"></script>
	</body>

	</html>
<?php
}
?>