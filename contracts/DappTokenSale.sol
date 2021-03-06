pragma solidity >=0.4.21 <0.6.0;
import "./DappToken.sol";
contract DappTokenSale {
     address admin;
     DappToken public tokenContract;
     uint256 public tokenPrice;
     uint256 public tokensSold;
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
        require(y == 0 || (z = x * y) / y == x,'multiple failed');
    }
    function buyTokens(uint256 _numberOfTokens) public payable {
        require(msg.value == multiply(_numberOfTokens, tokenPrice),'equal failed for buyTokens');
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens,'check token contract balanceOf > numberoftokens');
        require(tokenContract.transfer(msg.sender, _numberOfTokens),'transfer failed for buy tokens');

        tokensSold += _numberOfTokens;

        emit Sell(msg.sender, _numberOfTokens);
    }
    // Ending Token DappTokenSale
    function endSale() public {
    // Require admin
    require(msg.sender == admin,'only admin can end token sale');
    require(tokenContract.transfer(admin,tokenContract.balanceOf(address(this))),'balance not transferring');
    selfdestruct(msg.sender);
    // Transfer remaining dapp tokens to admin
    // Destroy contract

    }
}