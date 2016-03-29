<?php
	class Connection {
		protected $host="localhost";
		protected $user="root";
		protected $db="knn_classification";
		protected $pass="";
		protected $conn;

		function __construct(){
			$this->conn = new PDO("mysql:host=".$this->host.";dbname=".$this->db, $this->user, $this->pass);
			$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		}
	}
?>