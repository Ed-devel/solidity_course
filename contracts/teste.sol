// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Require {    

    
    function verifica8bytes(int256 _num)public pure returns(string memory){

        require(_num < 128, "It's not int8");        
        require(_num >= -128, "It's not int8");

        return "is int8";
    }

    function verificaImpar(uint256 _input)public pure returns(bool){

        require(_input % 2 != 0);
        return true;
    }
}

