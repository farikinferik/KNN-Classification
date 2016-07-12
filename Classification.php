<?php
	require_once "Connection.php";
	class Classification extends Connection {
		protected $k; 
		public function classifyAsItIs($docDistances){
			asort($docDistances); //sorting dari kecil ke besar
			$count = count($docDistances);
			foreach ($docDistances as $key => $value){
             	$id_doc = $key;
                $stmt = $this->conn->prepare("SELECT class_name FROM class WHERE id_class = (SELECT id_class FROM document_training WHERE id_doc = :id_doc)");
                $stmt->bindParam(':id_doc', $id_doc);
                $stmt->execute();
                $allClasses[] = $stmt->fetchColumn(0);
            }
            if($this->k >= $count){
            	$this->k = 3;  	
            }

            $k = $this->k;

            if($k > $this->k){
    			$this->k = $k;
    		}
        	$kClasses  = array_slice($allClasses, 0, $k, true); 
            $classes = array_count_values($kClasses);
            $max = max($classes);
            $class = array_search($max, $classes);
            
            return $class;
		}
		public function classify($docDistances){
			asort($docDistances); //sorting dari kecil ke besar
			$count = count($docDistances);
			foreach ($docDistances as $key => $value){
             	$id_doc = $key;
                $stmt = $this->conn->prepare("SELECT class_name FROM class WHERE id_class = (SELECT id_class FROM document_training WHERE id_doc = :id_doc)");
                $stmt->bindParam(':id_doc', $id_doc);
                $stmt->execute();
                $allClasses[] = $stmt->fetchColumn(0);
            }
            if($this->k >= $count){
            	$this->k = 3;  	
            }

            $k = $this->k;

            $similar = 0;
        	do{
        		if($k > $this->k){
        			$this->k = $k;
        		}
            	$kClasses  = array_slice($allClasses, 0, $k, true); 
	            $classes = array_count_values($kClasses);
	            $max = max($classes);
	            $class = array_search($max, $classes);
	            

	            //mencari kemungkinan kelas max yang jumlahnya sama
	            $count = array();
	            foreach ($classes as $key => $value) {
	            	
	            	if($value == $max){
	            		array_push($count, $value);
	            	}
	            }
	            $similar = count($count);//jika jumlahnya lebih dari 1 maka ada jumlah yang sama
	            
	            $k += 2;
            }while((count(array_unique($kClasses)) == $this->k) && ($count >= $this->k) || ($similar > 1) && ($count >= $this->k));

            
            return $class;
		}
		public function setK($k){
			$this->k = $k;
		}
		public function getK(){
			return $this->k;
		}
		public function getClass($id_doc){

			$sel_stmt = $this->conn->prepare("SELECT class_name FROM class WHERE id_class = (SELECT id_class FROM document_training WHERE id_doc = :id_doc)"); 
					
			$sel_stmt->bindParam(':id_doc', $id_doc);
			$sel_stmt->execute();
			return $sel_stmt->fetchColumn();
		}
	}
?>