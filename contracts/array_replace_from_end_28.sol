// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Vídeo 28 - Substituir Array do Fim 
   Como Substituir Array do FIM no Contrato Inteligente Solidity 

   Replace Array From End
   How To Replace Array From END In Solidity Smart Contract
*/

contract ArrayReplaceFromEnd {

    uint[] public arr;

    // A exclusão de um elemento cria uma lacuna na matriz
    // um truque para manter o array compacto é :
    // mova o último elemento para o local a ser excluído.
    /* Traz o valor do último elemento para o local do elemento
       a ser descartado, e remove o último elemento do array.*/

    function remove(uint index) public{
        
        // mover elemento para o último lugar e depois excluir
        arr[index] = arr[arr.length - 1];

        // remove o último elemento
        arr.pop();        
    }

    function test()public {
        
        arr = [1,2,3,4];

        remove(1);
        // [1,4,3]
        assert(arr.length == 3);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
        assert(arr[2] == 3);

        remove(2);
        // [1,4]
        assert(arr.length == 2);
        assert(arr[0] == 1);
        assert(arr[1] == 4);
    }
}