// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 10 - Local Variables In Solidity

contract LocalVariables {
    uint256 public myNumber;
    
    /* Aqui é necessário incluir o 'pure' na declaração da function
    Se NÃO declarar o 'pure' será retornada a seguinte mensagem na IDE:
    Aviso: A mutabilidade do estado da função pode ser restrita a puro. */
    function local_p() public pure returns(uint256) {
                
        uint256 a = 256;        
        return a;
    }

    /* Função para variáveis locais
    A função não pode ser declarada como pura porque esta expressão
    (potencialmente) modifica a variável de estado. */
    function local() public returns(uint256) {
        /* Variáveis locais são definidas dentro do escopo da função.
        Elas só podem ser chamadas enquanto a função estiver em execução.
        Elas são usadas localmente na memória e NÃO na blockchain, enquanto
        as VARIÁVEIS DE ESTADO são alocadas na blockchain. */
        
        uint256 i = 256;
        myNumber = i;
        return myNumber;
    }

    /* Essa fução retornará três valores de três variáveis: myAddress, myNumber e i
    É possível visualizar esses três valores no log do debug da VM:
    
    decoded output	{
        "0": "address: 0x0000000000000000000000000000000000000001",
        "1": "uint256: 345",
        "2": "uint256: 390"
    }   */
    function local_a()public returns(address, uint256, uint256) {
        uint256 i = 345;
        myNumber = i;

        i += 45;
        address myAddress = address(1);

        return (myAddress, myNumber, i);        
    }
}
