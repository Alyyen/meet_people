<?php
	require_once('database.php');
	require_once('config.php');

	// COOKIES x FIREFOX
	setcookie('monCookie', 'maValeur', array(
		'expires' => time() + 60 * 60 * 24 * 30,
		'path' => '/',
		//'domain' => '.',
		'secure' => true,
		'httponly' => false,
		'samesite' => 'None',
	));

	switch ($_POST['whatDoIDo']) {
		case "subscription":
			$object = new Database();
			$firstname = $_POST['data']['firstname'];
			$lastname = $_POST['data']['lastname'];
			$city = $_POST['data']['city'];
			$birthdate = $_POST['data']['birthdate'];
			$mail = $_POST['data']['mail'];
			$password = $_POST['data']['password'];
			$hash = password_hash($password, PASSWORD_DEFAULT);
			$genre = $_POST['data']['genre'];
			$hobby = $_POST['data']['hobbies'];

			$created = $object->do_users_exists($firstname, $lastname, $city, $mail, $birthdate, $genre, $hash, $hobby);

			if ($created == "User successfully created") {
				session_start();
				echo json_encode(array("status" => 'Subscription success', "data_received" => $_POST['data'], "firstname received" => $firstname, "session" => $_SESSION));
			} else {
				header("HTTP/1.0 404 Not Found");
				die(json_encode(array("status" => 'error')));
			}
			break;
		case "login":
			$object = new Database();

			$mail = $_POST['data']['login_mail'];
			$password = $_POST['data']['login_password'];

			$logged = $object->login_user($mail, $password);
			if ($logged === "Success") {
				echo json_encode(array("status" => 'success', "data_received" => $_POST['data']));
			} else {
				header("HTTP/1.0 404 Not Found");
				die(json_encode(array("status" => 'error', "data_received" => $_POST['data'], "error_message" => $logged)));
			}
			break;
		case "user_connected_check":
			$object = new Database();
			$connection_check = $object->is_connected();
			if ($connection_check === "Success") {
				echo json_encode(array("status" => 'success', "isConnected" => true));
			} else {
				header("HTTP/1.0 404 Not Found");
				die(json_encode(array("status" => 'error', "isConnected" => false)));
			}
			break;
		case "logOut":
			$object = new Database();
			$object->disconnect();
			echo json_encode(array("status" => 'success', "isConnected" => false));
			break;
		case "profile":
			session_start();
			$id = $_SESSION['session_user_id'];
			$object = new Database();
			$get_user_datas = $object->user_datas($id);

			if ($get_user_datas != NULL) {
				echo json_encode(array("status" => 'Profile success', "id" => $id,
					"datas" => $get_user_datas));
			} else {
				header("HTTP/1.0 404 Not Found");
				die(json_encode(array("status" => 'error')));
			}
			break;
		case "profile_view":
			session_start();
			$object = new Database();
			$id = $_SESSION['session_user_id'];
			$get_user_datas = $object->user_datas($id);
			if ($get_user_datas != NULL) {
				echo json_encode(array("status" => 'Profile success', "id" => $id,
					"datas" => $get_user_datas));
			} else {
				header("HTTP/1.0 404 Not Found");
				die(json_encode(array("status" => 'error')));
			}
			break;
		case "profile_update":
			session_start();
			$object = new Database();
			$id = $_SESSION['session_user_id'];
			$firstname = $_POST['data']['firstname'];
			$lastname = $_POST['data']['lastname'];
			$city = $_POST['data']['city'];
			$update_user_datas = $object->update_user_datas($id, $firstname, $lastname, $city);
			if ($update_user_datas == "Success") {
				echo json_encode(array("status" => 'Profile success'));
			} else {
				header("HTTP/1.0 404 Not Found");
				die(json_encode(array("status" => 'error')));
			}
			break;
		case "profile_delete":
			session_start();
			$object = new Database();
			$id = $_SESSION['session_user_id'];
			$delete_user = $object->delete_user_account($id);
			if ($delete_user == "Success") {
				echo json_encode(array("status" => 'Profile successfully deleted'));
			} else {
				header("HTTP/1.0 404 Not Found");
				die(json_encode(array("status" => 'error')));
			}
			break;
	}