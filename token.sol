// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract CapitalReduction {

  address public minter;
  mapping (address => int32[]) publicbalances;

  event Sent(address from, address to, uint amount);

  constructor() { minter = msg.sender; }

  function arrayContains(int32[] storage arr, int elem) internal returns(bool) {
    if (arr.length == 0) {
        return false;
    } else if (arr[arr.length - 1] == elem) {
        return true;
    } else {
        arrayContains(arr.pop, elem);
    }
  }

  function mint(address receiver, uint amount) public {
      require(msg.sender == minter);

    publicbalances[receiver].push( amount );
  }

  error InsufficientBalance(uint requested, uint available);

//   function send(address receiver, uint amount) public {
//     if ( amount > balances[msg.sender] ) {
//       revert InsufficientBalance({
//         requested: amount,
//         available: balances[msg.sender]
//       });
//     }
//     balances[msg.sender] -= amount;
//     balances[receiver] += amount;
//     emit Sent(msg.sender, receiver, amount);
//   }
}
