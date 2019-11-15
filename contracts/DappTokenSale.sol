pragma solidity >=0.4.21 <0.6.0;
import "./DappToken.sol";
contract DappTokenSale {
     address admin;
     DappToken public tokenContract;
     uint256 public tokenPrice;
     uint256 public tokenSold;
    constructor (DappToken _tokenContract,uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
        // Assign  an admin
        // Token Contract
        // Token Price

    }
    function buyTokens(uint256 _numberOfTokens) public payable{
        tokenSold -= _numberOfTokens;
        // Require that value is equal to tokens
        // Require that the contract has enough tokens
        // Require that a transfer is successfull
        // keep track of tokenSold
        // Trigger Sell Event


    }
}