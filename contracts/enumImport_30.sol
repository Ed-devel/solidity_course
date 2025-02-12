// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 30 - Declaração e importação de Enum's

/* Em Solidity é possível criar um contrato separado da interface
do Enum. As vezes o contrato é muiro extenso, ou então o Enum pode
ser reaproveitado em outros contratos. Sendo assim é viável criar
o Enum em um único arquivo e o contrato criado em outro separado.
A partir daí é só importar o Enum no arquivo do contrato. */

// Arquivo que contém o Enum Status sendo importado
import "./enumDeclaration_30.sol";

contract Enum {
    Status public status;    
}
