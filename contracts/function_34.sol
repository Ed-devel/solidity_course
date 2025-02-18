// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 34 - Funções Solidity | Como Criar Funções em Solidity Smart Contract

contract Function{
    
    // As funções podem retornar vários valores.
    function retornaMuitos()public pure returns(uint256, bool, uint256){
        return (1, true, 2);
    }

    // Os valores de retorno podem ser nomeados.
    function nomeada()public pure returns (uint256 x, bool b, uint256 y){
        return(1, true, 2);
    }

    // Os valores de retorno podem ser atribuídos ao seu nome.
    // Neste caso, a declaração return pode ser omitida.
    function atribuida()public pure returns(uint256 x, bool b, uint256 y) {
        x = 1;
        b = true;
        y = 2;
    }

    /* Use atribuição de desestruturação ao chamar outra função que
    retorna vários valores. */
    function atribuicaoDesestruturacao()
        public
        pure 
        returns (uint256, bool, uint256, uint256, uint256){
        
        (uint256 i, bool b, uint256 j) = retornaMuitos();
        
        // Os valores podem ser omitidos.
        (uint256 x, , uint256 y) = (4,5,6);

        return (i,b,j,x,y);
    }

    // Não é possível usar o mapa para entrada ou saída

    /* É possível usar Array como entrada no argumento da função.

    OBSERVAÇÃO:
     No 'Deployed Contracts' , ao informar a Array  de entrada, é necessário
     digitar os valores entre colchetes, com elementos separados por vírgula
     e deve haver um espaço entre cada vírgula e os valores.
     Exemplo:
     [ 0 , 11 , 22 , 33 , 44 , 55 ] */ 
    function arrayInput(uint256[] memory _arr)public {
        arr = _arr;
    }

    // Essa Array pode ser usada na saída da função
    uint256[] public arr ;

    function arrayOutput()public view returns (uint256[] memory) {
        // É possível usar Array na saída da função
        return arr;
    }
}

// Chamada de função com entrada de chave-valor
contract XYZ {

    function funcaoMuitosInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c )public pure returns(uint256) {
        
        return (x+y+z);
    }
    
    function chamadaFuncao()external pure returns(uint256){
        /* Na chamada da função , se for informar os valores  dos argumentos
        de entrada de forma direta, esses devem ser digitados na mesma ordem
        sequencial em que os argumentos foram declarados na função.*/
        return funcaoMuitosInputs(1, 2, 3, address(0), true, "c");
    }

    function chamadaFuncaoValorChave() external pure returns(uint256){
        
        /* Ao chamar a função passando or argumentos em forma de chave-valor
        NÃO HÁ  necessidade de digitar  os valores namesma ordem  sequencial
        em que eles foram declarados na função. */
        return funcaoMuitosInputs({
                    a: address(0),
                    b: true,
                    c: "c",
                    x: 1,
                    y: 2,
                    z: 3
                });
    }
}
