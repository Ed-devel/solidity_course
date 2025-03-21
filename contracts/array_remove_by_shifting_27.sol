// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Vídeo 27 - Array Remove By Shifting In Solidity
    How To Remove Array Element In Solidity

Remover do array por deslocamento
Como remover elemento do array em Solidity
 */

contract ArrayRemoveByShifting{

    // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []



    uint[] public arr;

    function remove(uint _index)public {
        require(_index < arr.length, "indice fora do limite do array");
        
        for(uint i = _index; i < arr.length - 1; i++ ){
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test()external  {
        arr = [1,2,3,4,5];

        remove(2);
        // [1,2,4,5]

        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        arr = [1];
        remove(0);
        // []

        assert(arr.length == 0);
    }
}

/*
Remover do array por deslocamento é importante, no caso quando se
cria um mapeamento aninhado e nele é mapeada uma matriz, então esse
conceito é muito importante. 
*/
