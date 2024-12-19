// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 23 - Modificadores no Solidity | Como criar Modificadores no Solidity.(function_modifier_23.sol)


/** FUNCTION modifier

Notas Importantes:

-- Podemos modificar o nosso código que pode ser executado antes e
depois das chamadas de função. 

-- Geralmente é usado por três razões: 
acesso restrito, validação de entrada e proteção para reentrada.

Com isso podemos validar dados, com isso ajuda a prevenir qualquer
ataque de reentrada.
*/

contract FunctionModifier{
    address public owner; // proprietário
    uint256 public x = 10;
    bool public locked;

    constructor(){
        owner = msg.sender;
    }

    /* Esse modificador fará com que quem anexar esse modoficador
    apenas o proprietário do contrato inteligente pode chamar essa
    função */
    modifier onlyOwner(){

        /* Nesse require será verificado se o usuário que está
        chamando a função é seu proprietário, se for então executa
        a função. Caso não for o proprietário então será lançada
        a mensagem de erro. */
        require(msg.sender == owner, "Not owner !");

        /* O caracter ' _ ' é a denotação que indica que está tudo ok, 
        que temos que continuar a execução da outra função. Essa denotação
        é obrigatória. */
        _;
    }

        /* O modificador abaixo é usado para validar dados. */
        modifier validateData(address _addr){
            
            /* Verifica se o adderess é diferente de zero. Se for
            isso então será lançada a mensagem de erro.  */
            require( _addr != address(0), "Not valid adderess !" );
            _;
        }

        /* A função abaixo irá verificar o proprietário, onde vamos
        passar o endereço. Essa função irá mudar a propriedade do
        contrato. Serão chamados os modificadores 'onlyOwner' e
        'validateData'. Significa que somente o proprietário pode
        chamar a função. Se as condições forem atendidas, então será
        definido um novo proprietário. 
        Podemos usar esses modificadores como uma abstração, Ex:
        Imagine que temos uma declaração em que seja necessário utiliza-la
        em várias funções. Então pode-se fazer uma abstração dessa
        declaração como um modificador. Depois tudo que temos que fazer é 
        anexar esse odificador em cada função. Isso têm um poder enorme 
        pois vai nos salvar de vários bugs críticos. Vai evitar escrever
        vários contratos inteligentes longos com muito código, então vai
        economizar tempo e resolver vários problemas com bugs. 
         */
        function changeOwner( address _newOwner)public onlyOwner validateData (_newOwner){
            owner = _newOwner;

        }

        /* Esse modificador vai evitar a reentrada de contratos inteligentes,
        que é um ataque muito famoso nos contratos.  */
        modifier noReentrancy(){
            require(!locked, "No reentrancy !");
            locked = true;
            _;
            locked = false;
        }

        function decrement(uint256 i)public noReentrancy {
            x -= 1;

            if( i > 1 ){
                decrement(i-1);
            }
        }
}
