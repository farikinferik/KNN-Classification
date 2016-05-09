<?php 
	$db = new PDO("mysql:host=localhost;dbname=knn_classification", 'root', '');

	// works regardless of statements emulation
	$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, 0);

	$sql = "
	SET FOREIGN_KEY_CHECKS = 0; 
	TRUNCATE document_training; 
	TRUNCATE all_terms;
	TRUNCATE term_freq;
	TRUNCATE class;
	SET FOREIGN_KEY_CHECKS = 1;
	";

	try {
	    $db->exec($sql);
	    $msg = "Berhasil Reset Data Training";
	    header("location:index.php");
	}
	catch (PDOException $e)
	{
	    echo $e->getMessage();
	    die();
	}

?>