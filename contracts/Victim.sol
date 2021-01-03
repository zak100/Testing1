pragma solidity ^0.5.8;
contract Victim{
//https://medium.com/@JusDev1988/reentrancy-attack-on-a-smart-contract-677eae1300f2
//devon@nuclo.io
   function  withdraw() public{
      
      uint transferAmt = 1 ether;
      (bool success, ) = msg.sender.call.value(transferAmt)("");
      require(success);
   }
   function deposit() payable public {}
}
