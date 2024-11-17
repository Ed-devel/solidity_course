
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*Palavra chave <contract> para definir um contrato, seguido 
pelo nome do contrato escolhido pelo desenvolvedor. Por convenção
de código o nome do contrato deve iniciar com letra maiúscola.*/
contract MeuPrimeiroContrato {
    //string public hey = "Hey Daulat";
    //uint256 public no = 4;


    string public hey;
    uint256 public no;

    // constructor(string memory _hey, uint256 _no){
    //     hey = _hey;
    //     no = _no;
    // }


    function addInfo(string memory _hey, uint256 _no)public{
        hey = _hey;
        no = _no;
    }
}
