pragma solidity >=0.4.21 <0.6.0;

contract DappToken {
  uint256 public totalSupply;

   constructor () public {
        totalSupply = 1000000;
    }

    // function DappTokenSupply () public {
    //     totalSupply = 1000000;
    // }
}