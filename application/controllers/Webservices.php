<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Webservices extends CI_Controller {

	var $apiUrl = '';
	public function index() {
	$finalCollection=[];
	$failedCollection=[];
	$this->load->model("Webservice_Model","Webservice_Model");
	$finalCollection=array_merge($this->readXML(),$this->readCSV(','));
	
		foreach ($finalCollection as $key => $data) {
			if($this->Webservice_Model->checkDuplicate($data['reference']) && $this->endBalanceValidation($data)){

				$this->Webservice_Model->addRecord($data);
			}else{
				$failedCollection[]= $data;
			}
			
		}

		// echo "<pre>";
		// print_r($failedCollection);
		$this->htmlCollection($failedCollection);
	}

	public function readXML(){
		$doc = new DOMDocument();
		$xmlDataCollection=[];
		foreach (glob($_SERVER['DOCUMENT_ROOT']."/assets/xml/*.xml") as $filename) {
			$xmlCollection=simplexml_load_file($filename);
			$jsonCollection = json_encode($xmlCollection);
			$arrayCollection = json_decode($jsonCollection,TRUE);
			foreach ($arrayCollection['record'] as $key =>  $value) {
				$reference = $xmlCollection->record[$key]->attributes();
				$xmlDataCollection[] = array(
				'reference'  =>  (string) $reference['reference'],
				'accountNumber'  =>  $value['accountNumber'],
				'startBalance'  =>  $value['startBalance'],
				'mutation'  =>  $value['mutation'],
				'description' => $value['description'], 
				'endBalance'  =>  $value['endBalance'],
				);
			}
		}


		return $xmlDataCollection; 
	}

	function readCSV($delimiter){
		foreach (glob($_SERVER['DOCUMENT_ROOT']."/assets/csv/*.csv") as $filename) {
			if(!file_exists($filename) || !is_readable($filename)) return FALSE;
				$header = NULL;
				$data = array();
				if (($handle = fopen($filename, 'r')) !== FALSE ) {
					while (($row = fgetcsv($handle, 1000, $delimiter)) !== FALSE){   
					if(!$header) {
						$row = array_map('lcfirst', $row);
						$header=str_replace(' ', '', $row);
					}else{
						
						$data[] = array_combine($header, $row);
					
					}
				}
				fclose($handle);
			}
			if(file_exists($filename)) @unlink($filename);
		}
	
		return $data;
	}

	
	function endBalanceValidation($data){
		$mutation = $sBalance = $eBalance = $totalBalance = 0;
		$sBalance = (float)$data['startBalance'];
		$eBalance =(float)$data['endBalance'];
		$mutation=(float)$data['mutation'];
		$totalBalance = $sBalance + $mutation;

		if((string)$totalBalance == (string)$eBalance){
			return true;
		}else{
			return false;
		}
			
	}

	function abs_diff($v1, $v2) {
		$diff = $v1 - $v2;
		return $diff;
	}

	function htmlCollection($data){
		echo '<html><head><style>table {font-family: arial, sans-serif;border-collapse: collapse;width: 100%;}td, th {border: 1px solid #dddddd;text-align: left;padding: 8px;}tr:nth-child(even) {background-color: #dddddd;}</style></head><body><h2 style="text-align:center;">Failed Transaction</h2><table><tr><th style="text-align:center;">REFERENCE NO</th><th style="text-align:center;">DESCRIPTION</th></tr>';
			foreach ($data as $key => $value) {
				echo '<tr><td  style="text-align:center;">'.$value['reference'].'</td><td style="text-align:center;">'.$value['description'].'</td>';
			}

		 echo '</body></html>';
 	}

}
