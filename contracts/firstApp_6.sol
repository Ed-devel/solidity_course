// SPDX-License-Identifier: MIT

// 6 - NFT Counter Solidity Smart Contract | Increment & Decrement NFT Count

pragma solidity ^0.8.13;

contract NFTCount{

    uint public numberOfNFT;

    // Checar o número total de NFT's
    // <returns(uint256)> indica que a função retorn um valor do tipo uint
    function checkTotalNFT()public view returns(uint256) {
        return numberOfNFT;
    }

    // Esta função incrementa um número NFT
    function addNFT()public {
        numberOfNFT += 1;
    }

    // Esta função decrementa um número NFT
    function deleteNFT()public {
        numberOfNFT -= 1;
    }
}