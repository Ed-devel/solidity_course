// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 29 - Enum no Solidity

contract Enum {

    /* Solidity suporta Enums e eles são úteis para modelar a escolha e
    manter o controle de estado. 
    Enums podem ser declarados fora de um contrato.

    Enum é uma estrutura onde se pode manter o controle de todos 
    os dados que se queira especificar no contrato.  */

    // Exemplo de Enum que representa o status de envio
    /* Nesse exemplo é criado um contrato e nele será mantido o controle
    da modelagem de um determinado produto. Nele haverá vários dados como
    'pendente', 'cancelar', 'chegar', 'aceitar', 'rejeitar', etc. */
    enum Status {
        Pendente,
        Enviado,
        Aceito,
        Rejeitado,
        Cancelado
    }
    /* O VALOR PADRÃO é o PRIMEIRO elemento listado em definição do
    tipo, neste caso "Pendente" */

    /* A variável Status abaixo é do tipo Enum e foi criada no início do contrato
    acima. */
    Status public status;

    // função retorna uint 
    // Pendente  = 0
    // Enviado   = 1
    // Aceito    = 2
    // Rejeitado = 3
    // Cancelado = 4
    function get()public view returns(Status) {
        return status;
    }

    // Atualizar status passando uint como entrada
    function set(Status _status)public {
        status = _status;
    }

    /* Você pode atualizar para uma enumeração específica como a abaixo.
    O status vai pra esse 'cancelado', então se quiser cancelar todo pedido
    então podemos chamar esse método 'cancel()'. Por exemplo se o valor
    pradrão do Enum for 'pendente', então se chamar o método 'cancel()' 
    o valor padrão passa a ser 'cancelado' . */
    function cancel()public {
        status = Status.Cancelado;
        //cancelado é o último elemento do Enum
    }

    /* Se quisermos atualizar o valor padrão do Enum para 'aceitar' ou
    'rejeitar' então devemos passar o índice do status na função set().
    Isso atualizará o status.  */

    /* Quando deletamos um Enum, ele redefinirá o valor para 0.
    // delete redefine a enumeração para seu primeiro valor, 0*/
    function reset()public {
        delete status;
    }

    /* O Enum age como uma indexação, assim é possível acessar qualquer
    variável desses dados. Assim podemos fornecer esses índices. Nesse
    caso eles são 0,1,2,3 e 4. Com essa indexação podemos contruir uma 
    determinada lógica, exibir uma mensagem informando que a transação 
    foi aprovada ou rejeitada. Uma Strig enorme que podemos exibir pegando
    esses valores da indexação com base na Enumeração. */
}