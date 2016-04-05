<?php
	require_once "Connection.php";
	class AllTerms extends Connection {

		public function getAllTerms(){
			try{			
				$stmt = $this->conn->prepare("SELECT * FROM all_terms ORDER BY id_term ASC");
				$stmt->execute();
				while($r = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $data[] = $r;
                }
				
				return $data;
			}catch(PDOException $e)
			{
				echo $e->getMessage();
				return false;
			}
		}
		public function addTerm($terms){
			try{
				$ins_stmt = $this->conn->prepare("INSERT IGNORE INTO all_terms SET term = ?");
				$this->conn->beginTransaction();
				foreach ($terms as $key => $value) {
					$ins_stmt->bindValue(1, $value, PDO::PARAM_STR);
					$ins_stmt->execute();
				}
				$this->conn->commit();

				return true;
			}catch(PDOException $e)
			{
				echo $e->getMessage();
				return false;
			}
		}
		public function getIdTerm($term){
			try{
				$sql = "SELECT * FROM all_term WHERE term = :term";
				$stmt = $this->conn->prepare($sql);
				$stmt->bindParam(':term', $term);
				$stmt->execute();
				$id = $stmt->fetchColumn();
				if($id)
					return $id;
				else
					return false;
			}catch(PDOException $e){
				echo $e->getMessage();
				return false;
			}
		}
		public function in_array_r($needle, $haystack, $strict = false){ 
			foreach ($haystack as $item ) {
				if(($strict ? $item === $needle : $item == $needle) || (is_array($item) && $this->in_array_r($needle, $item, $strict))){
					return true;
				}
			}
			return false;
		}
	}
?>