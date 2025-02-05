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

/*

" Chamando cada função, podemos ver que o public função usa 496 gás, enquanto
o external a função usa somente 261.
A diferença é que, em funções públicas, o Solidity copia imediatamente
argumentos de matriz para a memória, enquanto funções externas podem ler
diretamente do calldata. A alocação de memória é cara, enquanto a leitura
do calldata é barata.

A razão pela qual public as funções precisam escrever todos os argumentos
para a memória é que as funções públicas podem ser chamadas internamente,
o que na verdade é um processo totalmente diferente das chamadas externas.
As chamadas internas são executadas através de saltos no código, e os
argumentos da matriz são passados internamente por ponteiros para a memória.
Assim, quando o compilador gera o código para uma função interna, essa função
espera que seus argumentos estejam localizados na memória.

Para funções externas, o compilador não precisa permitir chamadas internas e,
portanto, permite que os argumentos sejam lidos diretamente do calldata,
salvando a etapa de cópia.

Quanto às melhores práticas, você deve usar external se você espera que a
função só será chamada externamente, e use public se você precisar chamar a
função internamente. Quase nunca faz sentido usar o this.f() padrão, pois
isso requer um real CALL para ser executado, o que é caro. Além disso, passar
matrizes através deste método seria muito mais caro do que passá-los internamente.

Você verá essencialmente benefícios de desempenho com external sempre que você
está chamando apenas uma função externamente, e passando em um monte de calldata
(por exemplo, grandes matrizes).

Exemplos para diferenciar:

público - todos podem acessar

externo - Não pode ser acessado internamente, apenas externamente

interno - somente este contrato e contratos derivados dele podem acessar

privado - pode ser acessado apenas a partir deste contrato "
(HESS, 2017)

----------------------------------------------------------------
REFERENCIA:

HESS, Tjaden 
Ethereum Stack Exchange 2017. external vs public best practices
[Acesso em 5 Feb 2025]. Disponível em:
https://ethereum.stackexchange.com/questions/19380/external-vs-public-best-practices
*/