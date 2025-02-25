// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Vídeo 36 - Herança em Solidity
   Como criar herança em Solidity a partir de contrato parental

Solidity suporta herança múltipla. Os contratos podem herdar outros
contratos usando o is palavra-chave.

A função  que será  substituída  por um contrato infantil  deve ser
declarada como virtual.

A função  que substituirá uma  função pai deve usar a palavra-chave
override.

A ordem de herança é importante.

Tem de listar os contratos-mãe na ordem de “mais base-like” a “mais
derivada”.

 Grafo de herança
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A{
    function foo()public pure virtual returns(string memory){
        return "A";
    }
}

// Os contratos herdam outros contratos usando a palavra-chave 'is'.
contract B is A{
    // Override A.foo() 
    function foo() public pure virtual override returns(string memory)  
    {
        return "B";
    }
}

contract C is A{
    // Override A.foo()   
    function foo() public pure virtual override returns(string memory)  
    {
        return "C";
    }
}

// Os contratos podem herdar de vários contratos pais.
/* Quando uma função é chamada e definida várias vezes em contratos
diferentes , os contratos  pais são  pesquisados ​​da  direita para a
esquerda, e na forma primeiro mais fundo. */
contract D is B,C {
    // D.foo() returns "C"
    // já que C é o contrato pai mais à direita com a função foo()    
    function foo() public pure override(B,C) returns(string memory)  
    {
        return super.foo();
    }
}

contract E is C,B {
    // E.foo() returns "B"
    // já que B é o contrato pai mais à direita com a função foo()    
    function foo() public pure override(C,B) returns(string memory)  
    {
        return super.foo();
    }
}

/* A herança  deve ser  ordenada  de “mais semelhante à  base” para
“mais derivada”.
Trocar a ordem de A e B gerará um erro de compilação.*/
contract F is A,B {
    
    function foo() public pure override(A,B) returns(string memory)  
    {
        return super.foo();
    }
}
