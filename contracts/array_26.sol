// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 26 - Array Tutorial

contract Array {
    
    // Há várias maneiras de inicializar uma matriz
    uint[] public arr;
    uint[] public arr2 = [11, 22, 33];

    // Array de tamanho fixo, todos os elementos inicializados com 0.
    uint[10] public arrayTamanhoFixo;

    /* A função abaixo obtêm as informações de um array através do ID. 
    É passado o índice e é retornado o valor referente à esse
    índice. */
    function get(uint i)public view returns(uint) {
        return arr[i];
    }

    /* A função abaixo retorna um array inteiro. Mas isso deve ser
    evitado para arrays que tendem a crescer indefinidamente no número
    de elementos contidos nela. Essas arrays podem ser usadas para
    armazenar informações. Serão feitas transações e essas arrays nada
    mais são do que variáveis de estado. Sempre que é feita uma transação,
    sempre que se adiciona uma informação em uma matriz, é necessário
    pagar taxa de gás. Então NÃO é uma boa ideia criar matrizes infinitas
     em um contrato. Ao invés disso é interessante criar matrizes de tamanho
     fixo.  */
    function getArray()public view returns(uint[] memory) {
        return arr;
    }

    function push(uint i)public {
        // Acrescentar ao array
        // Isso aumentará o comprimento do array em 1.
        arr.push(i);   
    }

    /* A função abaixo é usada para remover 1 elemento do array.
    Para isso é utilizado o método pop, onde o último elemento da
    array é removido */
    function pop()public {
        // Remove o último elemento do array
        // Isso diminuirá o comprimento do array em 1
        arr.pop();
    }

    /* A função abaixo irá retornar o tamanho do array. Esse valor 
    é um inteiro do tipo uint. */
    function getLength()public view returns(uint) {
        return arr.length;
    }

    /* A função abaixo remove um elemento da matriz. Esse elemento
    é um valor especifico, onde informamos o ID. Se essa matriz for de
    tamanho específico, o tamanho dessa NÃO irá diminuir, esse valor
    apenas será resetado para o valor padrão que é zero e esse espaço
    continuará alocado na matriz. Se for uma matriz de tamanho 10 e
    for retirado um elemento, essa matriz continuará sendo de tamanho 10.*/
    function remove(uint index)public {
        // O delete não altera o comprimento do array.
        /* Ele redefine o valor no índice para seu valor padrão,
        neste caso 0 */

        delete arr[index];
    }

    /* A função abaixo é usada para chamar um exemplo externo e testar
    ele. */
    function examples() external pure {
        /* Cria array na memória, onde somente poderá ser criado com
        tamanho fixo.
        As vezes temos um array como uma variável direta e as vezes
        queremos criar uma cópia desse array para executar certas
        funções. Então se for ciar uma função na memória, ele deve
        conter um tamanho fixo, nunca dinâmico. É necessário definir
        o tamanho fixo desssa matriz. */

        uint[] memory a = new uint[](5);
    }
}