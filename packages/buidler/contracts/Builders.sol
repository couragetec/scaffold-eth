// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.7.0;

import "@nomiclabs/buidler/console.sol";

contract Builders {

    address public controller;

    constructor() public {
      controller = msg.sender;
    }

    event BuilderUpdate( address indexed builder, bool isBuilder );

    mapping(address => bool) public isBuilder;

    function builderUpdate(address builder, bool update) public {
        console.log("UPDATE",builder,update);
        require( msg.sender==controller, "updateBuilder: not controller");
        require( builder!=address(0), "updateBuilder: zero address");
        isBuilder[builder] = update;
        emit BuilderUpdate(builder,isBuilder[builder]);
    }

}
