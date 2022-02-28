<?php

	class Database {
		private $dbHost = DB_HOST;
		private $dbUser = DB_USER;
		private $dbPass = DB_PASS;
		private $dbName = DB_NAME;
		private $dbHandler;
		private $error;

		// DATABASE CONNECTION
		function __construct() {
			$conn = 'mysql:host=' . $this->dbHost . ';dbname=' . $this->dbName;
			$options = array(
				PDO::ATTR_PERSISTENT => true,
				PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
			);

			try {
				$this->dbHandler = new PDO($conn, $this->dbUser, $this->dbPass, $options);
			} catch (PDOException $e) {
				$this->error = $e->getMessage();
				echo $this->error;
			}
		}

		// CHECK IF USER EXISTS
		public function do_users_exists($firstname, $lastname, $city, $mail, $birthdate, $genre, $hash, $hobby) {
			$qry = "SELECT * FROM member WHERE mail = '$mail' AND birthdate = '$birthdate' AND active LIKE 'TRUE'";
			$qry_if_exists = $this->dbHandler->query($qry);
			$qry_if_exists->execute();
			$result_if_exists = $qry_if_exists->fetchAll();

			if (empty($result_if_exists)) {
				$this->new_user($firstname, $lastname, $city, $mail, $birthdate, $genre, $hash, $hobby);
				return "User successfully created";
			} else {
				return 'Account already exists with this mail address. Please sign in.';
			}
			//}
			/*$sql = "SELECT * FROM member WHERE mail=`$mail`";
			print $this->dbHandler->exec($sql);*/
			// return true if user does exist into db
		}

		// ADD A NEW USER
		public function new_user($firstname, $lastname, $city, $mail, $birthdate, $genre, $hash, $hobby) {
			$sql = "INSERT INTO member (firstname, lastname, city, mail, birthdate, genre, active, password) VALUES ('$firstname','$lastname','$city','$mail','$birthdate','$genre','TRUE','$hash')";
			$this->dbHandler->exec($sql);

			// GET NEW USER'S ID
			$sql_id = "SELECT MAX(id) as max_id FROM member";
			$max_id = $this->dbHandler->query($sql_id);
			$max_id->execute();
			$result = $max_id->fetch(PDO::FETCH_ASSOC);
			$id = $result['max_id'];
			// ADD USER'S HOBBIES
			$sql_hobbies = "INSERT INTO hobbies (id_member, name) VALUES ('$id','$hobby')";
			$this->dbHandler->exec($sql_hobbies);
		}

		// USER LOGIN
		public function login_user($mail, $password) {
			// GET USER'S HASHED PASSWORD
			$sql_password = "SELECT id, password as password FROM member WHERE mail = '$mail' AND active LIKE 'TRUE'";
			$pw = $this->dbHandler->query($sql_password);
			$pw->execute();
			$result = $pw->fetch(PDO::FETCH_ASSOC);
			if (empty($result)) {
				return "No account found";
			}
			$hash = $result['password'];

			if (password_verify($password, $hash)) {
				session_start();
				$_SESSION['session_user_id'] = $result['id'];
				return "Success";
			} else {
				return "Invalid password";
			}

		}

		//CHECK IF USER HAS A SESSION
		public function is_connected() {
			session_start();
			if (isset($_SESSION['session_user_id'])) {
				return "Success";
			} else {
				return "Not connected";
			}
		}

		public function disconnect() {
			if (session_status() === PHP_SESSION_NONE) {
				session_start();
			}
			session_unset();
		}


		// DISPLAY USER'S DATAS
		public function user_datas($id) {
			$qry_datas = "SELECT firstname, lastname, city, mail, birthdate, genre, hobbies.name FROM member LEFT JOIN hobbies ON member.id = hobbies.id_member WHERE id = '$id' AND active LIKE 'TRUE'";
			$datas = $this->dbHandler->query($qry_datas);
			$datas->execute();
			$result = $datas->fetchAll(PDO::FETCH_ASSOC);

			if (empty($result)) {
				$this->disconnect();
				return NULL;
			} else {
				return $result[0];
			}
		}

		// UPDATE USER'S DATAS
		public function update_user_datas($id, $firstname, $lastname, $city) {
			$qry_datas = "UPDATE member SET firstname = '$firstname', lastname = '$lastname', city = '$city' WHERE id = '$id'";
			$updated_datas = $this->dbHandler->query($qry_datas);
			$updated_datas->execute();
			$updated_datas->fetchAll();
			return "Success";
		}


		// DELETE USER'S DATAS
		public function delete_user_account($id) {
			$qry_delete = "UPDATE member SET active = 'FALSE' WHERE id = '$id'";
			$delete_account = $this->dbHandler->query($qry_delete);
			$delete_account->execute();
			$delete_account->fetchAll();
			$this->disconnect();
			return "Success";
		}

	}
