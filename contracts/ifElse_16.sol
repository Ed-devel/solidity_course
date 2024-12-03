// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 16 - If, else no Solidity
contract IfElse {
    
    uint256 public myNum = 5;
    string public myString;

    /* Função com estrutura de seleção if, else, else if.  */
    function get(uint256 _num)public returns (string memory) {
        
        if(_num == 5){
            myString = "Valor de myNum igual 5";
        }else if(_num == 4){
            myString = "myNum igual 4";
        }else{
            myString = "myNum diferente de 4 ou 5";
        }
        return (myString);
    }

    /* Função com estrutura de seleção simplificada. A estrutura de código
    reduz muitas linhas de código quando comparada ao formato 'If Else'
    convencional. É similar ao javascript */
    function shortHand(uint256 _num)public returns (string memory) {
        return _num == 5? myString = "Igual a 5" : myString = "Diferente de 5"; 
    }
}