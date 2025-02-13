// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 32 - Solidity Structs | Como importar Solidity Structs

/* É possível criar  uma Struct em um arquivo separado  e depois importá-lo
em um contrato inteligente. Segue o exemplo abaixo para importar uma Struct
criada em um arquivo separado e importado no contrado abaixo: */

import "./structDeclaration_32.sol";

contract Todos {
    Todo[] public todos;
}
