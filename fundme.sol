// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./ethToUSD.sol";

contract fundMe{
    using ethToUSD for uint256;
    address manager;
    address[] funders;
    mapping(address=>uint256) fundersToFund;
    constructor(){
        manager=msg.sender;
    }
    //20 dollars minimum you can fund
    uint256 public constant minimumAmountinUSD = 20 * 1e18;

    //we are considering msg.value > minimumamount in USD** so msg.value we have convert it in DOLLARS
    function fund() payable public  {
        require((ethToUSD.convert(msg.value))>=minimumAmountinUSD,"Minumum amount you can pay is 20 dollars");
        funders.push(msg.sender);
        fundersToFund[msg.sender]=msg.value;
    }

    function withdrawFunds() public payable onlyOwner{
        payable(msg.sender).transfer(address(this).balance);
        //now we have to clear funders array
        for(uint256 i=0;i<funders.length;i++){
            address funder = funders[i];
            fundersToFund[funder]=0;
        }
        funders = new address[](0);
    }

    function getEthAmountInUsd(uint256 ethers) public view returns(uint256){
        return ethToUSD.convert(ethers);
    }

    modifier onlyOwner{
        _;
        require(msg.sender==manager, "You are not the manager");
    }
    
    receive() external payable {
        fund();
     }
    fallback() external payable {
        fund();
     }
}