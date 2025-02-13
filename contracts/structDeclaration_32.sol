// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 32 - Solidity Structs | Como declarar Solidity Structs

/* É possível criar uma Struct em um arquivo separado e depois importá-lo
em um contrato inteligente. Segue o exemplo abaixo: */

struct Todo{
    string texto;
    bool concluido;
}