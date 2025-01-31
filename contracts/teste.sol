// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract View {    

    uint256 NumA = 11;    
    uint256 NumB = 22;

    uint256 public NumC = 333;
    uint256 public NumD = 444;

    function printNums() public view returns(uint256, uint256){
        return(NumA, NumB);
    }    

    function calcProdTot() public pure returns(uint256 produto, uint256 total) {
        
        uint256 numA = 1;
        uint256 numB = 2;

        produto = numA * numB;
        total = numA + numB;

        return(produto, total);
    }

    function calcProdTotVarGlob() public view returns(uint256 produto, uint256 total) {

        produto = NumA * NumB;
        total = NumA + NumB;

        return(produto, total);
    }

    function calcProdTotVarGlobView() public returns(uint256 produto, uint256 total) {

        NumA = 1;
        NumB = 2;

        produto = NumA * NumB;
        total = NumA + NumB;

        return(produto, total);
    }

    function calcProdTotVarGlobPublc() public view returns(uint256 , uint256) {

        uint256 produto = NumC * NumD;
        uint256 total = NumC + NumD;

        return(produto, total);
    }
}