// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/* Vídeo 25. Solidity Mapping | How To Use & Create Solidity Mapping Smart Contract
             Mapeamento Solidity. Como usar e criar mapeamento solitidy em contratos
             inteligentes
*/

/*
Mapeamento permite rastrear dados em contratos inteligentes .
Para criar um mapeameno é necessário definir uma palavra chave. 
É necessário definir o tipo de chave e o tipo de valor. O tipo de
chave pode ser construído com qualquer tipo: pode ser uma compra,
pode ser uma string, pode ser qualquer outro contrato. O tipo de
valor pode ser apenas mapping ou matriz. Há os Mapeamentos instantâneos
e mapeamento aninhado.
Mappeamentos são criados com a sintaxe:   mapping(keyType => valueType)
*/

// Mapeamento instantâneo
contract Mapping {

    // Mapeamento de endereço para uint

    /*O mapeamento abaixo é público e conterá um banco de endereço
    cada um com dados. Ele contém todos os IDs identificados por
    endereços. */
    mapping(address => uint) public myMap;     
    
    /* Na função abaixo informamos o endereço do usuário e é retornado
    o ID desse usuário específico, que está contido no Mapeamento. */
    function get(address _addr) public view returns(uint){
        return myMap[_addr];
    }

    /* A função abaixo é usada para adicionar um novo usuário no mapping.
    É informado o endereço desse usuário e o seu respectivo ID. */
    function set(address _addr, uint _i) public {
        myMap[_addr] = _i;
    }

    /* A função abaixo remove o usuário do mapeamento. É necessário
    informar a palavra-chave, que é o endereço do usuário a ser
    removido. */
    function remove(address _addr)public {
        delete myMap[_addr];
    }
}

// Mapeamento aninhado
contract NestedMapping{

    /* Será criado um mapeamento de endereço para outro mapeamento.
    Informaremos o endereço de um usuário que conterá um mapeamento
    específico relacionado à esse usuário. Cada usuário terá um mapeamento
    específico cuja palavra-chave é um ID que contêm um valor booleano.
    OBS: Tradução nested = aninhado */
    
    mapping(address => mapping(uint => bool) ) public nested;

    /* Na função abaixo são informados o endereço do usuário e o respectivo
    ID, então serão retornados dados de um usuário, neste caso  um valor
    booleano. */
    function get(address _addr, uint _i)public view returns(bool) {

        /*OBSERVAÇÃO: Você pode obter valores de um mapeamento aninhado
        mesmo quando ele não está inicializado.*/
        return nested[_addr][_i];
    }
    /* Com a função acima estamos verificando se o endereço que estamos
    fornecendo está realmente lá no nosso mapeamento, seja ele aninhado
    ou não. */

    /* Na função abaixo definiremos um novo usuário, informando como
    parâmetros de entrada um endereço, um ID de usuário e um valor
    booleano, que inicialmente é false, então no momento da configuração
    ele definiremos como verdadeiro. */
    function set(address _addr1, uint _id, bool _boolean)public {
        nested[_addr1][_id] = _boolean;
    }

    /* Na função abaixo podemos remover os dados de um usuário,
    onde são informados o endereço e o número do ID. */
    function remove(address _addr1, uint _i)public {
        delete nested[_addr1][_i];        
    }
}
