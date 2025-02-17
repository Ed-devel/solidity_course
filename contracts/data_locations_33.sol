// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Vídeo 33 - Data Location In Solidity | How Solidity Data Locations
- Storage, Memory and Calldata */

/* Existem  três tipos  diferntes  de localização  de dados em  Solidity:
armazenamento, memória e chamada de dados. (Storage, Memory and Calldata)

storage - a variável é uma variável de estado  (armazenado no blockchain)

memory - variável  está na  memória  e existe apenas enquanto uma  função
está sendo chamada.

calldata - localização de dados especiais que contém argumentos de função
*/

contract DataLocations {

    uint[] public arr;
    mapping(uint => address) map;
    
    struct MyStruct {
        uint foo;
    }

    mapping(uint => MyStruct) myStructs;

    function f() public {
        // chamar _f com variáveis ​​de estado
        _f(arr, map, myStructs[1] );

        // obtém uma estrutura de um mapeamento
        MyStruct storage myStruct = myStructs[1];

        // cria uma estrutura na memória
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
                 uint[] storage _arr,
                 mapping(uint => address) storage _map,
                 MyStruct storage _myStruct
                )internal {
        // faça algo com variáveis ​​de armazenamento
    }

    /* Queremos retornar a matriz inteira que definimos , por isso estamos
    definindo esse tipo uint e a memória , pois queremos retornar os dados
    na  memória . Usaremos  esses  dados  que  não  queremos  armazenar na
    blockchain, mas queremos usa-los para executar certas tags no contrato
    inteligente . Essa é uma prática muito  comum quando  se trabalha  com
    contrato  inteligente real. É criada  uma cópia  de todos os  dados de
    armazenamento e pode executar em determinada função, pode simplesmente
    executa-la na função. */
    function g(uint[] memory _arr) public returns (uint[] memory){
        // faça algo com array da memória
    }

    function h(uint[] calldata _arr) external {
        // faça algo com o array calldata (chamada de dados)
    }

    /* É muito importante ter muita  cautela e precisão nos dados que se
    deseja armazenar no blockchain porque cada dados custa ether , então
    é necessário  ter precaução em  relação ao que se está  pagando para 
    para implantar o contrato. É importante aprender sobre a memória que
    é possível criar, copiar e ainda executar certas tarefas usando essa
    Array. É possível  fazer a mesma  coisa com chamada de  dados, mas o
    armazenamento é um conceito importante. */
}