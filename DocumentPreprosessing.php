<?php
    require 'vendor/autoload.php';
    class DocumentPreprosessing {
        protected $docPrep;

        public function __construct($doc){
            $docPrep = $this->tokenize($doc);
            $docPrep = $this->stopWordRemover($docPrep);
            $docPrep = $this->stemmer($docPrep);
            $this->docPrep = explode(" ", $docPrep);
        }
        public function tokenize($doc){
            $doc = strtolower($doc);
            $doc = str_replace(",", " ", $doc);
            $doc = str_replace(".", " ", $doc);
            $doc = str_replace("'", " ", $doc);
            $doc = str_replace("!", " ", $doc);
            $doc = str_replace("?", " ", $doc);
            $doc = str_replace("/", " ", $doc);            
            $doc = str_replace('"', '', $doc); 
            $doc = str_replace("  ", " ", $doc);
            return $doc;
        }
        public function stopWordRemover($doc)
        {
            $stopwordFactory = new \Sastrawi\StopwordRemover\StopwordRemoverFactory();
            $stopword  = $stopwordFactory->createStopWordRemover();
            return $stopword->remove($doc);
        }
        public function stemmer($doc){
            $stemmerFactory = new \Sastrawi\Stemmer\StemmerFactory();
            $stemmer  = $stemmerFactory->createStemmer();
            return $stemmer->stem($doc);
        }
        public function getDocPrep(){
            return $this->docPrep;
        }
    }
?>