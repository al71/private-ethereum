pragma solidity ^0.4.8;

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
    
 function getLastRec() constant returns(bytes32 _db_name, bytes32 _table_name, bytes32 _db_key_name, uint _db_key_value, bytes32 _db_op_type) {
        if(records.length < 1) throw;
        _db_name = records[records.length-1].db_name;
        _table_name = records[records.length-1].table_name;
        _db_key_name = records[records.length-1].db_key_name;
        _db_key_value = records[records.length-1].db_key_value;
        _db_op_type = records[records.length-1].db_op_type;
 }

 function getRec(uint index) constant returns(bytes32 _db_name, bytes32 _table_name, bytes32 _db_key_name, uint _db_key_value, bytes32 _db_op_type) {
        if(records.length < 1 || index > records.length) throw;
        _db_name = records[index].db_name;  
        _table_name = records[index].table_name;  
        _db_key_name = records[index].db_key_name;
        _db_key_value = records[index].db_key_value;
        _db_op_type = records[index].db_op_type;
 }

 function kill(address _to) {
    suicide(_to);
 }
}
