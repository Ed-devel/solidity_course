// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 18 - Do while loop no Solidity

contract DoWhile{
    
    uint256[] data;
    uint8 j = 0;

    /* Nesse caso será usado o do{}while() . Podemos notar que o custo
    de execução por usar Loop é muito alto:
    execution cost	163227 gas
    Por isso é importante EVITAR Loop s   */
    function loop()public returns(uint256[] memory) {
        do {
            j++;
            data.push(j);
        } 
        while (j < 5);
        return data;
    }
    /* SAÍDA DA FUNÇÃO loop() :
    decoded output	{ "0": "uint256[]: 1,2,3,4,5" }
    */
}