<?php

class Webservice_Model extends CI_Model{
   
   function addRecord($records){
       $response = [];
       if(!empty($records)){
    
        $finalCollection = array(
            'transaction_reference' => (int)$records['reference'], 
            'account_number' => $records['accountNumber'], 
            'start_balance' => $records['startBalance'], 
            'mutation' => $records['mutation'], 
            'description' => $records['description'], 
            'end_balance' => $records['endBalance'], 
            'created_at' => date("Y-m-d H:i:s")
        );
        $result = $this->db->insert('record_description',$finalCollection);
        if(!empty($result)){
            $response['status'] = 200;
            $response['message'] = 'Data inserted success fully';
        }else{
            $response['status'] = 400;
            $response['message'] = 'Bad Request';
        }
       }else{
            $response['status'] = 400;
            $response['message'] = 'Bad Request';
       }

       return $response;
   }

   function checkDuplicate($refId){
    $checkDuplicate = $this->db->get_where('record_description', array('transaction_reference' => $refId))->result_array();
    if(empty($checkDuplicate)){
        return true;
    }else{
        return false;
    }
    
   }
}