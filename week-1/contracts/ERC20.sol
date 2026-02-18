// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiquifyToken {

    //META DATA

    string public name = "Liquify Token";
    string public symbol = "LQFT";
    uint8 public decimals = 18;

    //State Variables
    uint256 public totalSupply;

    //Mapping owner address to token count
    mapping(address => uint256) public balanceOf;

    //Mapping owner address to spender address to amount allowed
    mapping(address => mapping(address => uint256 )) public allowance;

    //Events
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(uint256 _initialSupply) {
        //Mint all tokens to the deployer initally
        //We multiply by 10^decimals because solidity doesnt handle decimals
        totalSupply = _initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply;
    }
}
