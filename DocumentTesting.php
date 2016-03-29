<?php
	require "DocumentTraining.php";
	
	class DocumentTesting {
		protected $terms = array();

		public function calcTermFreq($terms){
			
            $count = array_count_values($terms);
            $this->terms = $count;
		}
		public function getTerms(){
			return $this->terms;
		}

	}
?>