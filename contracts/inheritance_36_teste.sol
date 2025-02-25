// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Vídeo 36 - Herança em Solidity - Testes   

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

    function nome()public pure virtual returns(string memory){
        return "Nome A";
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

contract G is A{
    
    function nome_contrato() public pure returns(string memory)  
    {
        return "Nome G";
    }
}

contract H is A,C {
    
    function foo() public pure override(A,C) returns(string memory)  
    {
        return super.foo();
    }
}