// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// 7 - Solidity Data Types | Data Types in Solidity Smart Contracts
contract DataTypes {

    //Variável booleana por padrão <false>
    bool public key;
    bool public no = true;

    // -uint- Número inteiro não assinado podendo ser negativo ou positivo
    /* Os tipos uint têm os valores máximos suportados com o objetivo de
    economizar espaço de memória*/
    // uint8   - ranges 0 - 2 **   8 - 1 // 255
    // uint16  - ranges 0 - 2 **  16 - 1 // 65534
    // uint256 - ranges 0 - 2 ** 256 - 1 // 1,157920892×10⁷⁷

    /* Quando não há uma atribuição após declarar  -uint- então por padrão
    é equivalente a uint256*/
    uint8 public u8 = 1;
    uint  public u256 = 456;
    uint  public u = 123; // uint é um pseudônimo de uint256

    // NÚMEROS NEGATIVOS
    /*números negativos são permitidos para tipos int. Como uint,
    diferentes intervalos estão disponíveis para int8.*/

    // int256 ranges from -2 ** 255 - 1 to 2 ** 255 - 1 = 5,789604462e+76 , −5,789604462e+76
    // int128 ranges from -2 ** 127 - 1 to 2 ** 127 - 1 = 1,701411835+e32 , −1,701411835+e32

    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -1234;

    /* É possível adicionar min e max int.
    Sendo assim é possivem descobrir o valor máximo e mínimo da variável.
    Isso é útil para evitar overflow (estouro de memória.)*/
    
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    int8 public minInt8 = type(int8).min;
    int8 public maxInt8 = type(int8).max;

    // ARRAY

    /*No Solidity, os tipos de dados byte representam uma sequência de bytes,
    então geralmente há dois tipos de bytes.*/

    /*Temos dois tipos de array de bytes:
    Array de bytes com tamanho fixo, e array de bytes com tamano dinâmico*/

    /*Então, quando você define uma variável byte, no contrato inteligente
    ele representa uma matriz de bytes dinâmicos*/

    // bytes1 public a;
    // bytes1 public b;

    bytes1 public a = 0xb5; // [10110101]
    bytes1 public b = 0x56; // [01010110]

    /* Uma String é na verdade um array de bytes. Futuramente será usado
    a declaração acima para trabalhar com Array's*/

    // ADDRESS TYPES

    /*Se esse tipo de variável não for iniciado, o padrão é zero:
    0x0000000000000000000000000000000000000000*/

    address public hey; // hey 0x0000000000000000000000000000000000000000
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // VALOR PADRÃO

    /* No Solidity NÃO existe o conceito de NULO ou INDEFINIDO
    variáveis não inicializadas têm um valor pré-definido */

    bool    public  defaultBoll; // false
    uint    public  number;      // 0
    int     public  defaultInt;  // 0
    address public  defaultAddr; // 0x000000

    /* Esses conceitos relacionados a usar variáveis do tipo byte, address
    são importantes para otimizar o código e minimizar taxas nos smart
    contracts */ 
}
