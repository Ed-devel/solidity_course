// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 21 - Assert Error Handler In Solidity | Assert Statement

contract AssertStatement{

    bool public result;
    
    /* É sempre interessante verificar a taxa de gás na execução do
    contrato, para compara com outras alternativas de tratamento de
    erro */

    /* Na função abaixo é usado o 'assert'. Caso a condição NÃO seja
    atendida então a execução do bloco é interrompida. Se for atendida
    então as demais linhas no escopo da função são executadas. */
    function checkOverFlow(uint256 _num1, uint256 _num2)public{
        uint256 sum = _num1 + _num2;
        assert( sum <= 255);
        result = true;
    }

    function getResult()public view returns(string memory) {
        if(result == true)
            return "No Overflow";
        else 
            return "Overflow exist";
    }
}

