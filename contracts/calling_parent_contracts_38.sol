// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* 
Vídeo 38 - Chamando contratos pais | palavra chave Super Solidity
           Super Keyword
           How To Create & Use Super Keyword In Solidity Contract

Árvore de Herança
   A
 /  \
B   C
 \ /
  D

Os contratos pai podem ser chamados diretamente ou usando
a palavra-chave super.
Ao usar a  palavra-chave super , todos os  contratos  pai
imediatos serão chamados.
*/

contract A {
    /* Isso é chamado  de evento. Você pode  emitir eventos  da sua
    função e eles são registrados no log de transações.
    No nosso caso, isso será útil para rastrear chamadas de função.
    */
    event Log(string message);

    function foo()public virtual {
        emit Log("A.foo chamada");
    }

    function bar()public virtual {
        emit Log("A.bar chamada");
    }    
}

contract B is A {

    function foo()public virtual override {
        emit Log("B.foo chamada");
        A.foo();
    }

    function bar()public virtual override {
        emit Log("B.bar chamada");
        super.bar();
    }        
}

contract C is A {

    function foo()public virtual override {
        emit Log("C.foo chamada");
        A.foo();
    }

    function bar()public virtual override  {
        emit Log("C.bar chamada");
        super.bar();
    }
}

contract D is B,C {
    /* Tente:
    - Chame D.foo e verifique os logs de transações.
      Embora  D  herde A, B  e  C, ele chamou  apenas C , portanto A
      também foi chamado.
    
    - Chame D.bar e verifique que nos logs de transações D chamou C,
      depois B e finalmente, A.

    Embora  super  tenha sido  chamado duas  vezes (por  B e C), ele
    chamou A apenas uma vez.                                 */
    function foo() public override(B,C){
        
        super.foo();
    }

    function bar()public override(B,C) {
        super.bar();
    }
}