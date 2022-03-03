// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract CapitalReduction {

  address public minter;
  mapping (address => int[]) publicbalances;

  event Sent(addressfrom, addressto, uintamount);

  constructor() { minter = msg.sender; }

  function mint(addressreceiver, uintamount) public {
      require(msg.sender== minter);

    balances[receiver] += amount;
  }

  error InsufficientBalance(uintrequested, uintavailable);

  function send(addressreceiver, uintamount) public {
    if ( amount > balances[msg.sender] ) {
      revert InsufficientBalance({
        requested: amount,
        available: balances[msg.sender]
      });
    }
    balances[msg.sender] -= amount;
    balances[receiver] += amount;
    emit Sent(msg.sender, receiver, amount);
  }
}
