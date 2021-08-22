// SPDX-License-Identifier: UNLICENSED


// Payment contract 
// Token : DAI 
// Merchant : Admin

pragma solidity ^0.8.0 ;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol' ;

contract Payment{
    address public admin ;
    IERC20 public dai ;

    event paymentSuccess(
        address payer ,
        uint amount ,
        uint paymentID ,
        uint date
    ) ;

    constructor(address _admin , address _dai){
        admin = _admin ;
        dai = IERC20(_dai) ;
    }

    // Delegated Transfer : allowance mechanism
    function payment(uint _amount , uint _paymentID) external {
        dai.transferFrom(msg.sender, admin, _amount);
        emit paymentSuccess(msg.sender, _amount, _paymentID, block.timestamp);
    }
}