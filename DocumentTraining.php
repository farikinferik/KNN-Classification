<?php
    require_once 'Connection.php';

	
    class DocumentTraining extends Connection {

        public function addClass($name){
            try{
                $sql ="INSERT INTO class VALUES(NULL, :name)";
                $stmt = $this->conn->prepare($sql);
                $stmt->bindParam(':name', $name);
                $stmt->execute();
                $id = $this->conn->lastInsertId();
                if($id)
                    return $id;
                else 
                    return false;
            }catch(PDOException $e){
                echo "addClass :".$e->getMessage();
                return false;
            }
        }
        public function getClassId($name){
            try{
                $stmt = $this->conn->prepare("SELECT id_class FROM class WHERE class_name = :name");
                $stmt->bindParam(':name', $name);
                $stmt->execute();
                $id = $stmt->fetchColumn(0);
                return $id;
            }catch(PDOException $e){
                echo "getClassId : ".$e->getMessage();
                return false;
            }
        }
        public function addDoc($id_class, $title, $abstract, $content){
            try{
                $sql = "INSERT INTO document_training VALUES(NULL, :id_class, :title, :abstract, :content)";
                $stmt = $this->conn->prepare($sql);
                $stmt->execute(array(':id_class'=>$id_class,
                                    ':title'=>$title,
                                    ':abstract'=>$abstract,
                                    ':content'=>$content));
                $id = $this->conn->lastInsertId('id_doc');
                if($id)
                    return $id;
                else 
                    return false;
            }catch(PDOException $e){
                echo "addDoc : ".$e->getMessage();
                return false;
            }
        }
        public function generateTermFreq($id_doc, $terms){
            $count = array_count_values($terms);
            
            try{
                $sel_stmt = $this->conn->prepare("SELECT * FROM all_terms ORDER BY id_term ASC");
                $sel_stmt->execute();
                while($r = $sel_stmt->fetch(PDO::FETCH_ASSOC)) {
                    $result[] = $r;
                }
                foreach ($result as $key => $value) {
                    extract($value);
                    if(array_key_exists($term, $count)){
                        $freq = $count[$term];                        
                        $ins_stmt = $this->conn->prepare("INSERT INTO term_freq VALUES(NULL, :id_doc, :id_term, :freq)");
                        $ins_stmt->execute(array(':id_doc'=>$id_doc, ':id_term'=>$id_term, ':freq'=>$freq));
                    }

                }
                return true;
            }catch(PDOException $e){
                echo $e->getMessage();
                return false;
            }
        }
	}

?>