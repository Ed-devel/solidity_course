// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Assert {    

    bool public result;

    function checkOverFlow(uint256 num_1, uint256 num_2)public pure returns(string memory, uint256) {
        
        uint256 sum = num_1 + num_2;

        if(sum < 0 || sum > 255)
            revert("It's OverFlow !"); 
        else 
            return("It's NOT OverFlow. ",sum );
    }
}

