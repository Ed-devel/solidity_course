// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Vídeo 22 - Revert Error Handler In Solidity | Revert Statement
// Reverter manipulador de erro em Solidity | Declaração Revert

contract RevertStatements{

    /**Na função abaixo é usado o 'revert', onde é feita uma verificação
    com com 'if' e, caso seja atendida, o revert é executado para lhe dar
    com o erro e o bloco é interrompido. Aparece uma mensagem no log de execução:
    revert:

	' The transaction has been reverted to the initial state.
    Reason provided by the contract: "Overflow Exist !". '
    
    Na maioria dos contratos que já existem em diferentes blockchains,
    o 'revert' NÃO é usado porque ele é limitado, pois necessário verificar
    as condições com base na declaração 'if else' . São usadas várias linhas
    de código desnecessárias. para usar a palavra chave 'revert'. */
    function checkOverFlow(uint256 _num1, uint256 _num2)public view returns(string memory, uint256){
        uint256 sum = _num1 + _num2;
        
        if(sum <= 0 || sum > 255)
            revert("Overflow Exist !");
        else
            return("No Overflow !", sum);
    }

    /* É importante entender sobre o 'revert' porém é recomendado que esse
    NÃO seja usado. Ao invés disso usar o 'required' . */
}