// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 9 - State Variables In Solidity | Reading, and Writing to a State Variable
contract StateVariables {
    
 /* Variáveis de estados sempre são declaradas no topo do contrato, após
 a declaração do nome do contrato:  "contract NomeDoContrato {" */

    // Essas duas variáveis de estado não têm valor
    string public myState;
    uint256 public myNum;

    string public defaltText = "Hey default text";
    uint256 public defaltNum = 5;

    /* A string abaixo será convertida em bytes: 0x686574206461756c6174 
    pois a variável foi declarada como bytes. Isso economiza taxa de memória */
    bytes public defaltByte  = "het daulat";

    /* Ao testar veremos que não há nenhum valor atribuído à essa variável.
    O valor representado será "0x" */
    bytes public defaltByteNo;

    // Ao testar esse contrato veremos que não há nenhum valor nesse array.
    uint256[] public myNumber;
    
    /* Há várias maneiras de alterar o valor das variáveis de estado.
    uma delas é através do construtor */
    // constructor(string memory _texto, uint256 _no){
    //     myState = _texto;
    //     myNum = _no;
    // }

    // Outra maneira de atualizar uma variável de estado é através de função
    function update(string memory _texto, uint256 _no) public {
        myState = _texto;
        myNum = _no;        
    }
}