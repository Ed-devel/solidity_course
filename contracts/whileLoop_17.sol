// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 17 - While Loop no Solidity
contract WhileLoop {
    
    uint256[] data;
    uint8 k = 0;

    /* Ao Loops no contrato pode ter como consequencia esgotamento de taxa de gás
    no contrato, então não é uma boa ideia incluir loops. É importante evitar usar
    Loops nos contratos. É importante comparar as taxas de gás que estamos pagando
    ao executar loops. Isso pode ser feito no log de execução. */
    function loop() public returns(uint[] memory)
    {
        while (k < 5) 
        {
            k++;
            data.push(k);
        }
        
        return data;

        /* Saída da função no log de transação:
        decoded output	{ "0": "uint256[]: 1,2,3,4,5" } */
    }
}