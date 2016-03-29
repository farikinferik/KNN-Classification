<?php
	require 'DocumentTraining.php';
	require 'DocumentPreprosessing.php';
	require 'AllTerms.php';

	if(isset($_POST['input'])){
		extract($_POST);
		$document = new DocumentTraining();
		$id_class = $document->getClassId($class);
		
		if($id_class){
			$id_doc = $document->addDoc($id_class, $title, $content, $content);		
		} else {
			$id_class = $document->addClass($class);
			$id_doc = $document->addDoc($id_class, $title, $abstract, $content);
		}
		$docPrep = new DocumentPreprosessing($content);
		$terms = $docPrep->getDocPrep();

		$allterm = new AllTerms();
		
		$allterm->addTerm($terms);
		
		if($document->generateTermFreq($id_doc, $terms)){
			$msg = "Berhasil Input Data";
		}		
	}

	
?>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <script type="text/javascript" src="assets/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
</head>
  <body>
  	<div class="container">	
  		<header>
			<div class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<div class="container">
						<a class="navbar-brand">Klasifikasi K-NN</a>
					</div>
				</div>	
			</div>
		</header>
		<div class="container" style="padding-top : 100px">
		    <div class="row">
				<div class="col-md-6">
					<?php
			 			if(isset($msg)){
			 				echo '
			 				<div class="alert alert-info fade in">
			 					<a href="#" class="close" data-dismiss="alert">&times;</a>
							    <strong>'.$msg.'</strong>
							</div>';
						}
					?>								
				    <form class="form-horizontal" role="form" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
				    	<div class="form-group">
					    	<label class="control-label" for="class">Kelas </label>
					    	<input type="text" class="form-control" name="class" id="class" placeholder="Tentukan Kelas">
				    	</div>
				    	<div class="form-group">
					    	<label class="control-label" for="title">Judul </label>
					    	<input type="text" class="form-control" name="title" id="title" placeholder="Masukkan Judul">
				    	</div>
				    	<div class="form-group">
					    	<label class="control-label" for="abstract">Abstrak </label>
					    	<textarea class="form-control" name="abstract" id="abstract" rows="3" placeholder="Masukkan abstrak"></textarea>
				    	</div>
				    	<div class="form-group">
					    	<label class="control-label" for="content">Konten </label>
					    	<textarea class="form-control" name="content" id="content" rows="6" placeholder="Masukkan Teks yang akan diklasifikasi"></textarea>
				    	</div>
				    	<input type="submit" class="btn btn-primary"  name="input" value="Submit">
				    	<input type="reset" class="btn btn-default" value="Reset"></input>
				    </form>

	 				
				</div>
			</div>
		</div>
	</div>
	<script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
