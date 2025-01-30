// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 11 - Variáveis Globais no Solidity
contract GlobalVariables{

    // VARIÁVEIS GLOBAIS
    address public owner; // owner significa proprietário
    address public MyBlockHash;
    uint256 public difficulty;    
    uint256 public gasLimit;
    uint256 public number;
    uint256 public timestamp;
    uint256 public value;
    uint256 public nowOn;
    address public origin;
    uint256 public gasprice;
    bytes public callData;
    bytes4 public firstFour;

    /* A variável owner será atualizada pelo construtor. Na prática
    o endereço da conta do ponto remetente é pego e enviago para a variável
    proprietário. Ponto remetente significa quem implementou o contrato */
    constructor(){

        owner = msg.sender; 
        // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

        // hash do bloco - Ex: 0x94D76E24F818426ae84aa404140E8D5F60E10E7e 
MyBlockHash = block.coinbase; 

// valor da dificuldade - Ex: 71762765929000 
difficulty = block.difficulty;

gasLimit = block.gaslimit;

// Valor do número de bloco - Ex: 83  
number = block.number;        

// carimbo de data e hora - Ex: 1732716112 
timestamp = block.timestamp;  

// origem e honra  têm o mesmo endereço
//Ex: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 
origin = tx.origin;           

// preço Gas - Ex: 2 
gasprice = tx.gasprice;       

// dados da chamada - Ex: 0x 
callData = msg.data;          

// quatro primeiros números de compra - Ex: 0x00000000 
firstFour = msg.sig;

        // value = msg.value;
        // nowOn = msg.now;
    }
}