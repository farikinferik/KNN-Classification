<?php
	class EucDistance {
		protected $distance = array();
		public function calcDistance($termsWeight1, $termsWeight2){
			
			foreach ($termsWeight1 as $key => $value) { //perbandingan term yang ada pada doc1 dan tidak ada pada doc2 dan sebaliknya
				if(array_key_exists($key, $termsWeight2)){
					$this->distance[$key] = pow(($termsWeight1[$key] - $termsWeight2[$key]), 2);	
				}else{
					$this->distance[$key] = pow(($termsWeight1[$key] - 0), 2);
				}
			}
			foreach ($termsWeight2 as $key => $value) {
				if(array_key_exists($key, $termsWeight1)){
					$this->distance[$key] = pow(($termsWeight2[$key] - $termsWeight1[$key]), 2);	
				}else{
					$this->distance[$key] = pow(($termsWeight2[$key] - 0), 2);
				}
			}
			return sqrt(array_sum(array_values($this->distance)));
						
		}
		public function getTermsDistance(){
			return $this->distance;
		}
	}
?>