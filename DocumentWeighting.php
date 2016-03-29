<?php
	require_once 'AllTerms.php';
	
	class DocumentWeighting extends AllTerms {
		protected $allTerms = array();

		//terms dari dokumen testing untuk dihitung bobotnya dengan dokumen training pada database
		protected $terms = array(); 
		protected $termsTestWeight = array();
		protected $termsTrainWeight = array();
		protected $idf = array();
		protected $n;


		public function setTerms($terms){
			$this->terms = $terms;
			$this->allTerms = $this->getAllTerms();
			$id = end($this->allTerms);
			$id = $id['id_term'] + 1;//memberikan id term pada term dokumen testing yang belum ada
			foreach ($this->terms as $key => $value) {
				if(!$this->in_array_r($key, $this->allTerms)){
					//menambahkan term pada data tsting ke seluruh term jika belum ada untuk perhitungan bobot
					$this->allTerms[] = array("id_term"=>$id ,"term"=> $key);
					$id++; 
 				}
			}
			$this->setN();
		}

		public function setN(){
			try{
				$n_stmt = $this->conn->prepare("SELECT COUNT(*) FROM document_training");
				$n_stmt->execute();

				//jumlah dokumen training + dokumen uji
				$this->n = $n_stmt->fetchColumn() + 1; 
				return true;
			}catch(PDOException $e){
				echo $e->getMessage();
			}
		}
		public function printTerms(){
			return $this->allTerms;
		}
		public function calcIdf(){
			try{				
				foreach ($this->allTerms as $key => $value) {
					extract($value);
					
					//mencari jumlah dokumen frekuwnsi dari data training
					$sel_stmt = $this->conn->prepare("SELECT COUNT(id_doc) AS df FROM term_freq WHERE id_term = :id_term"); 
					
					$sel_stmt->bindParam(':id_term', $id_term);
					$sel_stmt->execute();
					$result = $sel_stmt->fetch(PDO::FETCH_ASSOC);
					
					$df = $result['df']; 
					
					if(array_key_exists($term, $this->terms)){
						$df++; //dijumlah dengan dok testing
					}
					 
					$this->idf[$term] = log(($this->n/$df), 10);
					
				}
				return true;
			}catch(PDOException $e){
				echo $e->getMessage();
				return false;
			}
		}
		public function getAllDoc(){
			try{			
				$sel_stmt = $this->conn->prepare("SELECT id_doc FROM document_training ORDER BY id_doc ASC"); 
				$sel_stmt->execute();
				$data = $sel_stmt->fetchAll(PDO::FETCH_COLUMN);
		
				return $data;
			}catch(PDOException $e){
				echo $e->getMessage();
				return false;
			}
		}
		public function getTermsFreq($id_doc){
			try{			
				$sel_stmt = $this->conn->prepare("SELECT id_term, freq FROM term_freq WHERE id_doc = :id_doc ORDER BY id_term"); 
				$sel_stmt->bindParam(':id_doc', $id_doc);
				$sel_stmt->execute();
				$result = $sel_stmt->fetchAll(PDO::FETCH_ASSOC);
				$data = array();
				foreach ($result as $key => $value) {
					extract($value);
					$data[$id_term] = $freq;
				}
				return $data;
			}catch(PDOException $e){
				echo $e->getMessage();
				return false;
			}
		}
		public function getIdf(){
			return $this->idf;
		}
		public function calcTermsWeight(){
			try{				
				foreach ($this->allTerms as $key => $value) {
					extract($value);

					//mencari jumlah dokumen frekuwnsi dari data training
					$sel_stmt = $this->conn->prepare("SELECT id_doc, id_term, freq FROM term_freq WHERE id_term = :id_term"); 
					
					$sel_stmt->bindParam(':id_term', $id_term);
					$sel_stmt->execute();
					while($r = $sel_stmt->fetch(PDO::FETCH_ASSOC))
					{
						extract($r);
						if(isset($id_doc)){
							$this->termsTrainWeight[$id_doc][$term] = $freq * $this->idf[$term];								
						}
					}

					if(array_key_exists($term, $this->terms)){
						$tf_test = $this->terms[$term];
						$test_weight = $tf_test * $this->idf[$term];						
						$this->termsTestWeight[$term] = $test_weight;		
					}						
					
				}
				ksort($this->termsTrainWeight);
				return true;
			}catch(PDOException $e){
				echo $e->getMessage();
				return false;
			}	
		}
		public function getTermsTrainWeight(){
			return $this->termsTrainWeight;
		}
		public function getTermsTestWeight(){
			return $this->termsTestWeight;
		}
		
		//fungsi untuk mengecek value dalam array secara rekursif 
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