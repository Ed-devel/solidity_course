
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Video 13 - Pure in solidity

contract Pure {

    uint num1 = 4;
    uint num2 = 10;

    /* Com a palavra chave 'pure' declarada na função, só é possível acessar
    as variáveis locais no escopo desta. Não é permitido acessar as variáveis
    de estado, pois para isso é necessário usar a palavra chave 'view'.
    Com 'pure' é possível acessar as variáveis locais, fazer cálculos, etc...,
    porém tudo dentro do escopo da função. O 'pure' torna a função restrita */
    function getData() public pure returns(uint256, uint256, uint256, uint256 ){

        uint256 muNum1 = 30;
        uint256 muNum2 = 50;

        uint256 product = muNum1 * muNum1;
        uint256 total = muNum2 + muNum2;

        return ( muNum1, muNum2, product, total);
    }

    /* CONCLUSÃO: só usar o 'pure' caso NÃO for acessar variáveis de estado.
    Assim a função se tornará restrita. */
}