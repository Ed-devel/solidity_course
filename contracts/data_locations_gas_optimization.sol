// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Vídeo YouTube: Solidity - Data Locations + Gas Optimisation Techniques
   Canal: Uncle Aaroh   */

/* Existem quatro tipos de armazenamento (Localização de Dados)
no Solidity: storage, memória, stack e chamada de dados.     */

contract DataLocations {
    
    /*
    STORAGE (Hard Drive)
    Modificável: Sims
    Persistente: Sim
    Escopo     : Global
    Gás        : 102985  */

    uint256[] b; // Declaração implícida de armazenamento

    /* Nafunção abaixo percebemos que com storage, o custo de gás foi
    muito alto. Custou 102985 */
    function xicaraStorage()public returns(uint256[] memory) {
        
        /* Na dclaração abaixo o local dos dados para a variável
        deve ser: "storage", "memory" ou "calldata"  
        uint256[] storage a; // Declaração explícita */

        b.push(1);
        b.push(2);        

        return b;
    }

    /*
    MEMORY ( RAM )
    Modificável: Sim
    Persistente: Não
    Escopo     : Function
    Gás        : 27472  */

    /* Usando memory como mostra a função abaixo, ao invés de declarar
    a Array fora, como variável de estado , aqui é declarada dentro da
    função, ela foi criada no argumento da mesma. */
    function xicaraMemory(uint256[] memory c)public returns (uint[] memory) {
        return c;
    }

    /*
    STACK (cache)
    Modificável: Sim
    Persistente: Não
    Escopo     : Function
    Gás        : 24652  */

    /* Em Solidity quando se declara variáveis dentro da Function isso
    significa que  o local de dados  é chamado de Stack (pilha). Porém
    a pilha têm muitas limitações, como exemplo só podemos ter 1024 de
    armazenamento . Com  Stack há pouca  diferença  no custo do gás em
    relação à memory. */
    function xicaraStack()public returns (uint256) {
        uint256 a = 1; 
        return a;
    }

        /*
    CALLDATA
    Modificável: Não
    Persistente: Não
    Escopo     : Function
    Gás        : 25856 */

    /* Call Data é similar à memory. Chamada de Dados são udados apenas para
    chamadas externas. Na função É necessário diditar 'external' ao invés de
    'public'. Podemos notar  que a taxa  de gás é muito similar à Memory e a
    Stack, mas têm uma enorme diferença em relação ao armazenamento. */
    function xicaraCallData(uint256[] calldata c)external  returns (uint[] calldata) {
        return c;
    }
}