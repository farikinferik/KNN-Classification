<?php
  require 'Connection.php';
  require 'DocumentPreprosessing.php';
  require 'DocumentTesting.php'; 
  require 'AllTerms.php';
  require 'DocumentWeighting.php';
  require 'EucDistance.php'; 
  require 'Classification.php';
  
  if(isset($_POST['test'])){
    session_start();
    extract($_POST);

    $_SESSION['content'] = $content;

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

    }
    asort($distance);
    $classific =  new Classification();
    $classific->setK($k);
    $result = $classific->classify($distance);
  }
  
?>
<!DOCTYPE html>
<html>
<head>
	<title>Klasifikasi K-NN</title>
  <link href="assets/css/bootstrap.css" rel="stylesheet">
  <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

  <script type="text/javascript" src="assets/js/jquery-1.11.1.js"></script>
  <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>

  <style type="text/css">
    .spinner {
      width: 100px;
    }
    .spinner input {
      text-align: right;
    }
    .input-group-btn-vertical {
      position: relative;
      white-space: nowrap;
      width: 1%;
      vertical-align: middle;
      display: table-cell;
    }
    .input-group-btn-vertical > .btn {
      display: block;
      float: none;
      width: 100%;
      max-width: 100%;
      padding: 8px;
      margin-left: -1px;
      position: relative;
      border-radius: 0;
    }
    .input-group-btn-vertical > .btn:first-child {
      border-top-right-radius: 4px;
    }
    .input-group-btn-vertical > .btn:last-child {
      margin-top: -2px;
      border-bottom-right-radius: 4px;
    }
    .input-group-btn-vertical i{
      position: absolute;
      top: 0;
      left: 4px;
    }
    .table tbody tr > td.success {
      background-color: #ebcccc !important;
    }
    .table-hover tbody tr:hover > td.success {
      background-color: #faf2cc !important;
    }
  </style>
  <script type="text/javascript">
    $(document).ready(function(){
      (function ($) {
        $('.spinner .btn:first-of-type').on('click', function() {
          $('.spinner input').val( parseInt($('.spinner input').val(), 10) + 2);
        });

        $('.spinner .btn:last-of-type').on('click', function() {
    
          var value = $('.spinner input').val();
          if(value >= 5){
            $('.spinner input').val( parseInt($('.spinner input').val(), 10) - 2);  
          }
        });
      })(jQuery);
    });
  </script>

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
        <li class="active"><a href="#">Classify</a></li>
        <li><a href="add_data.php">Add Data Training</a></li>
      </ul>
      <div class="panel panel-default">
        <div class="panel-body">  
          <div class="container" id="classify">
            <div class="row">
              <?php
                if(isset($msg)){
                  echo '
                  <div class="alert alert-info fade in">
                    <a href="#" class="close" data-dismiss="alert">&times;</a>
                      <strong>'.$msg.'</strong>
                  </div>';
                }
              ?>  
              <div class="col-md-6">
                  <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                    <label for="k">Tentukan Nilai K</label>
                    <div class="input-group spinner">
                      <input type="text" class="form-control" value="3" name="k" id="k">
                      <div class="input-group-btn-vertical">
                        <button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>
                        <button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>
                      </div>
                    </div>
                    <label for="content">Teks </label>
                    <textarea class="form-control"  rows="10" name="content" id="content"></textarea>
                    <input type="submit" class="btn btn-danger" name="test" value="Uji">
                  </form>
              </div>
              <div class="col-md-6">
                
                  <?php
                    if(isset($result)){
                      echo '
                      <div class="panel panel-primary">
                        <div class="panel-heading">
                          Hasil perhitungan jarak
                        </div>
                        <div class="panel-body">      
                          <ul class="nav nav-tabs">
                            <li class="active"><a href="#">Result</a></li>
                            <li><a href="vsm.php" target="_blank">Trace</a></li>
                          </ul>
                          <div class="alert alert-success fade in">
                              <a href="#" class="close" data-dismiss="alert">&times;</a>
                              <strong> Kelas : '.$result.' </strong>
                          </div>
                          <div class="alert alert-info fade in">
                              <a href="#" class="close" data-dismiss="alert">&times;</a>
                              <strong> Jumlah K : '.$classific->getK().' </strong>
                          </div>';
                          echo '<table class="table table-bordered">
                                <tr>
                                  <th>ID Dokumen</th>
                                  <th>Jarak</th>
                                  <th>Kelas</th>
                                </tr>';
                          $i = $classific->getK();
                          foreach ($distance as $key => $value) {     
                              if($i > 0){
                                echo '<tr>
                                <td>'.$key.'</td>
                                <td>'.$value.'</td>
                                <td class="success">'.$classific->getClass($key).'</td>
                                </tr>';                   
                              }
                              $i--;
                          }
                          echo '</table>
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
      </div>
    </div>
	  <script src="assets/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>