<?php
	
	require 'Connection.php';
	require 'DocumentPreprosessing.php';
	require 'DocumentTesting.php'; 
	require 'AllTerms.php';
	require 'DocumentWeighting.php';
	require 'EucDistance.php'; 
	require 'Classification.php';

	session_start();
	$content = $_SESSION['content'];
	$allterms = new AllTerms();
	$termsAll = $allterms->getAllterms();

	$docTest = new DocumentPreprosessing($content);
	$docPrep = $docTest->getDocPrep();
	
	$docTest = new DocumentTesting();
	$docTest->calcTermFreq($docPrep);
	
	$doc = $docTest->getTerms();

	$docWeight = new DocumentWeighting();
	$docWeight->setTerms($doc);
	$docWeight->calcIdf();
	$docWeight->calcTermsWeight();

	$distance = array();
	foreach ($docWeight->getTermsTrainWeight() as $key => $value) {
		$eucDistance = new EucDistance();
		$distance[$key] = $eucDistance->calcDistance($docWeight->getTermsTestWeight(), $value);
		$termsDistance[$key] = $eucDistance->getTermsDistance();
		
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title>VSM</title>
	<link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <script type="text/javascript" src="assets/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<a href="test.php" class="btn btn-danger pull-right">Back</a>
				<h3 align="center">Vector Space Model</h3>
				<?php 
	 				echo '<div class="alert alert-info fade in">
					   	<a href="#" class="close" data-dismiss="alert">&times;</a>
					    <strong> Dokumen : <br>'.$content.' </strong>
					</div>';
					echo '<div class="table-responsive">';
					echo '<table class="table table-bordered table-condensed table-hover table-striped">
			    	<tr align="center" class="info">';
			    			echo '<th>ID</th>';
			    			echo '<th>Term</th>';
			    			echo '<th>Test</th>';
			    		foreach($docWeight->getAllDoc() as $id_doc){
							echo '<th>'.$id_doc.'</th>';	    			
			    		}
			    			echo '<th>IDF</th>';
			    			echo '<th>Test</th>';
			    		foreach($docWeight->getTermsTrainWeight() as $key => $value){
							echo '<th>'.$key.'</th>';	    			
			    		}
						foreach ($distance as $key => $value) {
							echo '<th>Jarak '.$key.'</th>';	
						}	
			    	echo '</tr>';
			    		
					foreach ($arr = $docWeight->printTerms() as $value) {
						extract($value);
						echo '<tr align="center">
						<td>'.$id_term.'</td>
						<td>'.$term.'</td>';
						
						//TF Dokumen Uji
						if(array_key_exists($term, $doc)){
							echo '<td>'.$doc[$term].'</td>';
						}else{
							echo '<td>0</td>';
						}
						
						//TF Dokumen Training
						foreach($docWeight->getAllDoc() as $id_doc){
							$docTrain = $docWeight->getTermsFreq($id_doc);
							if(array_key_exists($id_term, $docTrain))
								echo '<td>'.$docTrain[$id_term].'</td>';
							else 
								echo '<td>0</td>';
														    			
						}
						//IDF 
						$idf = $docWeight->getIdf();
						echo '<td>'.round($idf[$term], 3).'</td>';	

						//TF * IDF Dokumen Uji
						$testWeight = $docWeight->getTermsTestWeight();
						if(array_key_exists($term, $testWeight)){
							echo '<td>'.round($testWeight[$term], 3).'</td>';    				
						}else{
			    			echo '<td>0</td>';
						}

							//Bobot Dokumen
						foreach($docWeight->getTermsTrainWeight() as $key => $weight){
							
							if(array_key_exists($term, $weight))
								echo '<td>'.round($weight[$term], 3).'</td>';
							else 
								echo '<td>0</td>';
														    			
						}

						//Jarak dengan Euclidean Distance
						foreach ($termsDistance as $key => $value) {
							if(array_key_exists($term, $value))
								echo '<td>'.round($value[$term], 3).'</td>';
							else 
								echo '<td>0</td>';
						}
						echo '</tr>';
					}
					echo '</table>
					</div>';
					session_unset($_SESSION['content']);
					session_destroy();
				?>
			</div>
		</div>
	</div>
</body>
</html>