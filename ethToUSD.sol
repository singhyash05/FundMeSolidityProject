// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library ethToUSD{

    function getPrice() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int latestPrice ,,,) = priceFeed.latestRoundData();
        return uint256(latestPrice)*1e10;
    }

    //The latestRoundData() function from Chainlink's AggregatorV3Interface typically returns price values multiplied by 1e8, which means 8 decimal places are preserved.
    //so we have to multiply latest price with 10decimal places more so : latestPrice * 1e10;
    //we require 18decimals because in solidity msg.value by default it is in gwei
    
    function convert(uint256 ethAmount) public view returns(uint256){
        uint256 ethAmountinUSD= ((getPrice()*ethAmount))/1e18;
        return ethAmountinUSD;
    }
}