// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;


contract MultiSigWallet{
    address[] public owners;
    uint public numConfirmationsRequired;
    // mapping if an adress is a valid owner(not a duplicate)
    mapping(address => bool) isOwner;

    // Init constructor
    constructor(address[] memory _owners, uint _numConfirmationsRequired) {
        require(_numConfirmationsRequired > 0, 'number of confirmations must be greater than 0');
        for (uint i = 0; i < _owners.length; i++) {
            address _owner = _owners[i];
            require(!isOwner[_owner], "duplicate owner adressed detected");
            isOwner[_owner] = true;
            owners.push(_owner); 
        }
        require(_numConfirmationsRequired <= owners.length);       
    }
    
    // function submitTransaction() {};

    // function confirmTransaction() {};

    // function executeTransaction() {};

    // function revertTransaction() {};
}