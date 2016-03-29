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
				$sel_stmt = $this->conn->prepare("SELECT term 
						FROM all_terms");
				$sel_stmt->execute();
				while($r = $sel_stmt->fetch(PDO::FETCH_ASSOC)){
					$result[] = $r;
				}
				foreach ($terms as $key => $value) {
						$ins_stmt = $this->conn->prepare("INSERT IGNORE INTO all_terms SET term = :term");
						$ins_stmt->bindParam(':term', $value);
						$ins_stmt->execute();
				}
				
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
		/*
		public function generateTermWeight(){
			try{
				$idf = array();
				$n_stmt = $this->conn->prepare("SELECT COUNT(*) FROM document_training");
				$n_stmt->execute();
				$n = $n_stmt->fetchColumn();				
				
				foreach ($this->getAllTerms() as $key => $value) {
					extract($value);

					$sel_stmt = $this->conn->prepare("SELECT freq, COUNT(id_doc) AS df, id_doc FROM term_freq WHERE id_term = :id_term AND freq > 0");
					$sel_stmt->bindParam(':id_term', $id_term);
					$sel_stmt->execute();
					$result = $sel_stmt->fetch(PDO::FETCH_ASSOC);
					$tf = $result['freq'];
					$df = $result['df'] + 1; //dijumlah dengan doc dari data testing
					$id_doc = $result['id_doc'];
					$weight = $tf * log(($n/$df), 10);
					if($weight > 0){
						$ins_stmt = $this->conn->prepare("INSERT INTO term_weight VALUES(NULL, :id_doc, :id_term, :weight)");
						$ins_stmt->execute(array(':id_doc'=>$id_doc,
												':id_term'=>$id_term,
												':weight'=>$weight));

					}
				}
				return true;
			}catch(PDOException $e){
				echo $e->getMessage();
				return false;
			}	
		}*/
	}
?>