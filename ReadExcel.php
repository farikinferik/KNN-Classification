<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Read From Excel</title>

</head>
<body>

<form method="POST" action="" enctype="multipart/form-data">
	<input type="file" name="text">
	<br>
	<input type="submit" name="submit" value="Upload">
</form>
<?php

if(isset($_POST['submit'])) {
	
	$target = NULL;
	if(isset($_FILES['text']) && is_uploaded_file($_FILES['text']['tmp_name'])) //cek jika telah upload file 
	{
		$filename  = basename($_FILES['text']['name']);
		$extension = pathinfo($filename, PATHINFO_EXTENSION);
		$source = $_FILES['text']['tmp_name'];
		
		if($extension == 'xls' || $extension == 'xlsx' || $extension || 'csv') //format file yang diperbolehkan
		{
			$dir = 'data-training';
			
			$target = $dir.'/'.$filename;
			move_uploaded_file($source, $target);
			
			/** Include path **/
			set_include_path(get_include_path() . PATH_SEPARATOR . 'vendor/');

			/** PHPExcel_IOFactory */
			include 'PHPExcel/IOFactory.php';
			
			include 'DocumentTraining.php';
			include 'DocumentPreprosessing.php';
			include 'AllTerms.php';
			
			//set_time_limit(90);

			if($extension == 'xls'){
				$inputFileType = 'Excel5';				
			}else if($extension == 'xlsx'){
				$inputFileType = 'Excel2007';
			}else{
				$inputFileType = 'CSV';
			}

			$inputFileName = $target;

			$objReader = PHPExcel_IOFactory::createReader($inputFileType);

			$objPHPExcel = $objReader->load($inputFileName);

			$sheet = $objPHPExcel->setActiveSheetindex(0);
			$maxCell = $sheet->getHighestRowAndColumn();
			$sheetData = $sheet->rangeToArray('A2:'.$maxCell['column'].$maxCell['row']);
			foreach ($sheetData as $key => $row) {
				
				$data[] = array('title'=>$row['0'], 'class'=>$row['1'], 'abstract'=>$row['2']);
			}
			$n = count($data);
			foreach ($data as $key => $value) {
				extract($value);
				$document = new DocumentTraining();
				$id_class = $document->getClassId($class);
				
				if($id_class){
					$id_doc = $document->addDoc($id_class, $title, $abstract);		
				} else {
					$id_class = $document->addClass($class);
					$id_doc = $document->addDoc($id_class, $title, $abstract);
				}
				$docPrep = new DocumentPreprosessing($abstract);
				$terms = $docPrep->getDocPrep();

				$allterm = new AllTerms();
				
				$allterm->addTerm($terms);
				
				if($document->generateTermFreq($id_doc, $terms)){
					echo "Dokumen ".$id_doc." Berhasil diinput<br>";
				}
			}
		}
		else
		{
			echo "Gagal!";
		}
	}
}

?>
<body>
</html>
