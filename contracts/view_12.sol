// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 12 - View In Solidity
contract View{

    /* Se NÃO houver a palavra reservada 'públic' da declaração das variáveis de 
    estado, então NÃO poderemos ver os valores nos testes e no Log, porém é possível
    acessa-las ou atualizar seus valores através das funções. Para visualizar seus
    valores é necessário declarar a palavra reservada 'public. '*/
    uint256 Num1 = 2;
    uint256 Num2 = 7;

    uint256 public Num3 = 2;
    uint256 public Num4 = 7;    

    /* Usando a View para checar a variável de estado. Aqui usamos a palavra
    chave 'view' para checar o valor das variáveis de estado acima. É possível
    ver os valores na saída da função mas NÃO diretamente  nas variáveis de
    estado pois elas não estão declaradas como 'public' */
    // function getResults() public view returns(uint256, uint256){
    //     return (Num1, Num2);
    // }

    /* Também podemos fazer calculos internos com uso da palavra chave 'view'. */
    function getResults() public view returns( uint256 product, uint256 total){

        uint256 num1 = 20;
        uint256 num2 = 30;

        product = num1 * num2;
        total = num1 + num2;

        return(product, total);
    }

    /* Na função abaixo os valores das variáveis de estado são acessados para que
    efetuar cálculos locais. Para acessar os valores das variáveis de estado é
    necessário usar a palavra chave 'view'. */
    function getResultsCalcs() public view returns( uint256 product, uint256 total){

        product = Num1 * Num2;
        total = Num1 + Num2;

        return(product, total);
    }

    /* Na função abaixo o valor das variáveis de estado estão sendo atualizados.
    Porém NÃO é permitido usar a palavra chave 'view' pos essa só é usada para
    que a função possa ver (receber) os valores das variáveis de estado e não
    modificá-los. É possível fazer alterações nos valores de variáveis localmente,
    mão NÃO nas variáveis de estado. */
    function getResultsUp() public returns( uint256 product, uint256 total){

        Num1 += 5;
        Num2 += 7;

        product = Num1 * Num2;
        total = Num1 + Num2;

        return(product, total);        
    }
    /* Não é possível ver os valores de retorno da função acima , mas é possível
    visualiza-los no log do terminal do Remix:

    decoded output	{
        "0": "uint256: product 98",
        "1": "uint256: total 21"
    }
    */

    /* Na função abaixo foi declarada a palavra chave 'view' porque os
    valores das variáveis de estado NÃO estão sendo atualizados, apenas 
    acessados. É possível visualizar os valores de saída pois tanto a função
    como as variáves de estado acessadas estão declaradas como públic. Na
    assinatura da função, ao declarar returns( uint256, uint256) não foi
    informado o nome das variáveis de saída, então foi necessário 
    informar o tipo e o nome das variáveis locais no escopo da função.
    Ex: 'uint256 product = Num3 * Num4;' */
    function getResultsUpPub() public view returns( uint256, uint256){

        uint256 product = Num3 * Num4;
        uint256 total = Num3 + Num4;

        return (product, total);
    }

    /* RESUMINDO: Se a função for apenas acessar os valores das variáveis de estado
    então é interessante usar 'view' para que possamos ver os resultados da saída.
    Porém se for atualizar os valores delas então NÃO usar 'view' */
}