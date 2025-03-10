// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* 37 - Sombreamento de variáveis de estado herdadas . 
        Shadowing Inherited State Variables         */

/* Ao contrário das funções , as variáveis de estado NÃO podem ser
substituídas declarando-as novamente no contrato filho.
Vamos aprender como substituir corretamente as variáveis de estado
herdadas. */

contract A {

    string public nome = "Contrato A";

    function getNome()public view returns(string memory ) {
        return nome;
    }    
}

/* O sombreamento não é permitido no Solidity 0.6. Isso não compilará.
Será  retornada uma mensagem de  erro informando que essa  variável já
foi declarada no contrato herdado.*/
// contract B is A {

//     string public nome = "Contrato B";    
// }

contract C is A {
    /* Esta é a maneira correta de substituir variáveis ​​de estado herdadas.
    Elas  NÃO  são declaradas , mas  sim chamadas  dentro do construtor  no
    Contrato Filho. Aqui elas são atualizadas com um novo valor. */
    constructor() {
        nome = "Contract C";
    }

        // C.getName returns "Contract C"
}
