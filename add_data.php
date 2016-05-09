<?php
  require_once 'DocumentTraining.php';
  require_once 'DocumentPreprosessing.php';
  require_once 'AllTerms.php';

  if(isset($_POST['input'])){
    extract($_POST);
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
      $msg = "Berhasil Input Data";
    }   
  }
  else if(isset($_POST['add_data'])) {
    $target = NULL;
    if(isset($_FILES['text']) && is_uploaded_file($_FILES['text']['tmp_name'])) //cek jika telah upload file 
    {
      $filename  = basename($_FILES['text']['name']);
      $extension = pathinfo($filename, PATHINFO_EXTENSION);
      $source = $_FILES['text']['tmp_name'];
      
      if($extension === 'xls' || $extension === 'xlsx' || $extension === 'csv') //format file yang diperbolehkan
      {
        $dir = 'data-training';
        
        $target = $dir.'/'.$filename;
        move_uploaded_file($source, $target);
        
        /** Include path **/
        set_include_path(get_include_path() . PATH_SEPARATOR . 'vendor/');

        /** PHPExcel_IOFactory */
        include 'PHPExcel/IOFactory.php';
        
        set_time_limit(120);

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
          
          $data[] = array('title'=>$row['1'], 'class'=>$row['2'], 'abstract'=>$row['3']);
        }
        $n = count($data);
        $msc = microtime(true);
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
              $doc_inserted[] = $id_doc;
          }
        }
        $msc = microtime(true) - $msc;
        $msg = "Berhasil input data";
      }
      else
      {
        $err_msg = "Format file tidak diijinkan";
      }
    }
  }
?>
<!DOCTYPE html>
<html>
<head>
  <title>Tambah Data Training</title>
  <link href="assets/css/bootstrap.css" rel="stylesheet">
  <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

  <script type="text/javascript" src="assets/js/jquery-1.11.1.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

  <style type="text/css">
    .fileinput-button {
    position: relative;
    overflow: hidden;
    }
    .fileinput-button input {
      position: absolute;
      top: 0;
      right: 0;
      margin: 0;
      opacity: 0;
      -ms-filter: 'alpha(opacity=0)';
      font-size: 200px;
      direction: ltr;
      cursor: pointer;
    }

    /* Fixes for IE < 8 */
    @media screen\9 {
      .fileinput-button input {
        filter: alpha(opacity=0);
        font-size: 100%;
        height: 100%;
      }
    }
  </style>
  <script type="text/javascript" src="assets/js/jquery-1.11.1.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
</head>
<body>
  <nav class="navbar navbar-static-top navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">KNN-Classification</a>
        </div>
      </div>
    </nav>
    <div class="container" style="padding-top : 60px">
      <ul class="nav nav-tabs">
        <li><a href="index.php">Klasifikasi</a></li>
        <li class="active"><a href="#">Tambah Data Training</a></li>
      </ul>
      <div class="panel panel-default">
        <div class="panel-body">  
          <div class="container-fluid">
            <?php
              if(isset($msg)){
                echo '
                <div class="alert alert-info fade in">
                  <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong>'.$msg.'</strong>
                </div>';
              }else if(isset($err_msg)){
                echo '
                <div class="alert alert-danger fade in">
                  <a href="#" class="close" data-dismiss="alert">&times;</a>
                    <strong>'.$err_msg.'</strong>
                </div>';
              }
            ?>
            <div class="row">
              <div class="col-md-6">
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    Input Data
                  </div>
                  <div class="panel-body">
                    <form class="form-horizontal" role="form" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>"> 
                      <div class="form-group col-md-12">
                        <label class="control-label" for="class">Kelas </label>
                        <input type="text" class="form-control" name="class" id="class" placeholder="Tentukan Kelas">
                      </div>
                      <div class="form-group col-md-12">
                        <label class="control-label" for="title">Judul </label>
                        <input type="text" class="form-control" name="title" id="title" placeholder="Inputkan Judul">
                      </div>
                      <div class="form-group col-md-12">
                        <label class="control-label" for="content">Abstrak </label>
                        <textarea class="form-control" name="abstract" id="content" rows="10" placeholder="Inputkan abstrak yang akan diklasifikasi"></textarea>
                      </div>
                      <input type="submit" class="btn btn-primary"  name="input" value="Submit">
                      <input type="reset" class="btn btn-default" value="Reset">
                    </form>
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="panel panel-success">
                  <div class="panel-heading">
                    Atau input file data training dalam format excel
                  </div>
                  <div class="panel-body">
                    <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>" enctype="multipart/form-data">
                      <input type="file" name="text">
                      
                      <input type="submit" class="btn btn-success" name="add_data" value="Upload">
                    </form>
                  </div>
                </div>
                
                <?php
                  if(isset($doc_inserted)){
                    echo '
                    <div class="panel panel-danger">
                      <div class="panel-heading">
                      Keterangan
                      </div>
                      <div class="panel-body">';
                        $i = 0;
                        foreach ($doc_inserted as $key => $value) {
                          $i++;    
                        }
                        echo $i." Data telah ditambahkan<br>Waktu eksekusi yang diperlukan ".$msc." detik"."<br>";
                        foreach ($document->countClass() as $key => $value) {
                            extract($value);
                            echo "Kelas ".$class_name." : Jumlah data ".$count."<br>";
                        }
                        //print_r($maxCell);              
                      echo '
                      </div>
                    </div>';                      
                  }

                ?>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>