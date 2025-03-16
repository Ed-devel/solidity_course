// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/** Vídeo 39 - Visibilidade em solidity
    Como criar e usar visibilidade em Solidity */

/*  public   - qualquer contrato e conta podem chamar
    private  - apenas dentro do contrato que define a função
    internal - apenas dentro do contrato que herda um função internal
    external - apenas outros contratos e contas podem chamar   */

contract Base {
    
    // VARIÁVEIS DE ESTADO
    string public publicVar = "Minha variavel publica";
    string private privateVar = "Minha variavel privada";
    string internal internalVar = "Minha variavel interna";
    /* Variáveis ​​de estado não podem ser externas,então este código
    não será compilado. */
    // string external externalVar = "minha variável externa";

    /* Funções públicas podem ser chamadas
        - dentro deste contrato
        - dentro de contratos que herdam este contrato
        - por outros contratos e contas             */
    function publicFuntion() public pure returns(string memory ) {
        return "funcao publica chamada";
    }

    /* Função privada só pode ser chamada
        - dentro deste contrato
    Contratos que herdam este contrato não podem chamar esta função.*/
    function privateFuntion() private pure returns(string memory ) {
        return "funcao privada chamada";
    }

    function testPrivateFunction()public virtual pure returns (string memory) {
        return privateFuntion();
    }

    /* A função interna pode ser chamada
        - dentro deste contrato
        - dentro de contratos que herdam este contrato */
    function internalFuntion() internal pure returns(string memory ) {
        return "funcao interna chamada";
    }

    function testInternalFunction()public pure virtual returns (string memory) {
        return internalFuntion();
    }

    /* Funções externas só podem ser chamadas
        - por outros contratos e contas    */
    function externalFunction() external pure returns(string memory ) {
        return "funcao externa chamada";
    }

    /* Esta função não será compilada porque estamos tentando chamar
       uma função externa aqui. */
    // function testExternalFunction()external pure virtual returns (string memory) {
    //     return externalFunction();
    // }
}

contract Child is Base {

    /* Contratos herdados não têm acesso a funções e variáveis
    ​​de estado privadas. */
    // function testPrivateFunction()public pure override returns (string memory) {
    //     return privateFuntion();
    // }

    // A função interna pode ser chamada dentro de contratos filho.
    function testInternalFunction()public pure override returns (string memory) {
        return internalFuntion();
    }

    // function testExternalFunction()public pure returns (string memory) {
    //     return externalFunction();
    // }
}

/*
Funções e variáveis public
 - podem ser acessadas e chamadas por todos.
 - ficam visíveis no deploy

Funções e variáveis private
 - só podem ser chamadas dentro do contrato que foi criada
 - NÃO ficam visíveis no deploy
 - NÃO podem ser acessadas diretamente, apenas por funções no  mesmo
   contrato

Funções e variáveis internal
 - PODEM ser chamadas e acessadas no contrato em que foram criadas e
   nos contratos que herdaram esse.
 - NÃO  podem ser  chamadas ou acessadas  em contratos  externos, ou
   contas externas.
 - ficam visíveis no deploy dos contratos em que foram criadas e nos
   que herdaram

Funções e variáveis external
 - NÃO  podem ser chamadas no  contrato em que foram criadas nem nos
   contratos que herdaram esse.
 - SÓ podem ser chamados em contratos e contas externas.
 - FICAM visíveis no deploy , ou seja , podem ser testadas no deploy
   do contrato que foram criadas

-------------------------------------------------------------------
Outro vídeo relacionado à esse tema:

YOUTUBE
Solidity Tutorial | Visibility Modifiers - Public, External, Internal Private
Canal: EdRoh */