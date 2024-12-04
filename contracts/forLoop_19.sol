// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// For Loop no Solidity

contract ForLoop {
    
    uint256[] data;

    /* Função que executa um loop for(val inicial ; condição; incremento).
    Ao verificar o log ainda é possível perceber que a taxa de gás é muito
    alta.  */
    function loop()public returns(uint256[] memory){
        
        for (uint256 i = 0; i < 5; i++) 
        {
            data.push(i);
        }
        return data;
    }
    /*SAÍDA:
    decoded output	{ "0": "uint256[]: 0,1,2,3,4" }
    execution cost	118029 gas
    */

    /*É importante evitar ao máximo o uso de loop's nos contratos inteligentes.
    Isso pode a chave de gás. Caso seja realmente necessário o uso de loops,
    nunca adicionar dados dinâmicos. É importante definir os valores, para que
    no Loop seja seguido apenas esse intervalo pré-definidos. */
}