//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist{

    //max number of addresses which can be whitelisted
    uint8 public maxWhitelistedAddresses;

    //keep track of number of addresses whitelisted till now
    uint8 public numAddressesWhitelisted;

    mapping(address=>bool) public whitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public{
        require(!whitelistedAddresses[msg.sender] , "You are already in the whitelist");
        require(numAddressesWhitelisted < maxWhitelistedAddresses ,"No more whitelisted Address can add");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}