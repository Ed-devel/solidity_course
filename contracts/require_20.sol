// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 20 - Require Error Handler In Solidity | Require Statement

contract Require{

    bool public teste;

    /* No escopo da função será feita uma verificação de condição para que
    seja retornada uma String. Essa condição é realizada através da função
    'require()', onde as condições serão escritas entre parênteses, como
    argumentos.  */
    function checkInput(uint256 _input)public pure returns(string memory) {
        
        require(_input >= 0, "invalid unit8");
        require(_input <= 255, "invalid unit8");

        return "Input is Uint8";
    }
    /* É importante comparar a taxa de gás de todas as declarações de tratamento
    de erro, depois verificar qual delas está custando mais caro. Nisso é possível
    perceber que o 'required()' é a melhor opção.  */


    /* Na função abaixo , caso a condição falhe, isso ocorre caso digitar
    um número par no argumento da função, então a transação é recompensada.
    */
    function odd(uint256 _input)public pure returns(bool) {
        
        require( _input % 2 != 0);
        return true;
    }    
}

