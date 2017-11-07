pragma solidity ^0.4.6;

contract AddRecord {

 event Deposit(address from, uint value);


 function() payable {
        if (msg.value > 0)
            Deposit(msg.sender, msg.value);

 }

 struct 
   Record {
    bytes32 db_name;
    bytes32 table_name;
    bytes32 db_key_name;
    uint db_key_value;
    bytes32 db_op_type;
  }
  
//Record public record;

 Record [] public records;
 
 event AddRec(bytes32 newDb_name, bytes32 newTable_name, bytes32 newDb_key_name, uint newDb_key_value, bytes32 newDb_op_type);
 
 function addRec(bytes32 newDb_name, bytes32 newTable_name, bytes32 newDb_key_name, uint newDb_key_value, bytes32 newDb_op_type) {
 records.push(Record({db_name:newDb_name, table_name:newTable_name, db_key_name:newDb_key_name, db_key_value:newDb_key_value, db_op_type:newDb_op_type}));
 
 AddRec(newDb_name, newTable_name, newDb_key_name, newDb_key_value, newDb_op_type);
 }
  
 function getCount()
    public
    constant
    returns(uint Count)
 {
    return records.length;
 }
    
}
