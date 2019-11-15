pragma solidity >=0.4.21 <0.6.0;
import "./DappToken.sol";
contract DappTokenSale {
     address admin;
     DappToken public tokenContract;
     uint256 public tokenPrice;
     uint256 public tokenSold;
     event Sell(address _buyer,uint256 _amount);
    constructor (DappToken _tokenContract,uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice = _tokenPrice;
        // Assign  an admin
        // Token Contract
        // Token Price

    }
    // multiply
    function multiply(uint x,uint y) internal pure returns (uint z){
        require(y == 0 || (z = x * y)/ y == x);
    }
    function buyTokens(uint256 _numberOfTokens) public payable{
        require(msg.value == multiply(_numberOfTokens, tokenPrice));
        require(tokenContract.balanceOf(this) >= _numberOfTokens);
        require(tokenContract.transfer(msg.sender,_numberOfTokens));
        tokenSold += _numberOfTokens;
        // Require that value is equal to tokens
        // Require that the contract has enough tokens
        // Require that a transfer is successfull
        // keep track of tokenSold
        // Trigger Sell Event
        emit Sell(msg.sender,_numberOfTokens);

    }
}